#!/usr/bin/env python3

from requests import get as getUrl
import argparse
from rss_parser import Parser as RSSParser
from sys import exit
from os import path
from os import sep
from os import getuid
from os import mkdir
from time import sleep
from tempfile import gettempdir
from datetime import datetime
import re
from shutil import which
import logging
from logging.handlers import RotatingFileHandler

done_file = path.expanduser('~') + sep + '.local' + sep + 'rssmonkey.downloaded'

# Logging setup
if getuid() == 0:
    logpath = '/var/log/rssmonkey.log'
else:
    logpath = path.expanduser('~') + sep + '.local' + sep + 'share' + sep + 'rssmonkey.log'

logger = logging.getLogger('rssmonkey')
logger.setLevel(logging.INFO)
logformatter = logging.Formatter('%(asctime)s - %(message)s')
loghandler = RotatingFileHandler(logpath, maxBytes=400000, backupCount=10)
loghandler.setFormatter(logformatter)
logger.addHandler(loghandler)

def logPrint(level, message):
    logmessage = '{} - {}'.format(level.upper(), message).replace('/n', '')
    print(message)
    if level == 'info':
        logger.info(logmessage)
    elif level == 'warning':
        logger.warning(logmessage)
    elif level == 'error':
        logger.error(logmessage)
    elif level == 'fatal':
        logger.fatal(logmessage)

# If calling directly then invoke parser
def parserInit():
    global args
    parser = argparse.ArgumentParser(description='RSS to Torrent filter')
    parser.set_defaults(refresh=360, cacheexpiry=360)
    parser.add_argument('--include', nargs='*', help='Positive strings to match. Separate by spaces with quotations for phrases.', type=str)
    parser.add_argument('--exclude', nargs='*', help='Negative strings to match. Separate by spaces with quotations for phrases.  Will remove a match if any are matched. Use quotation marks to pair strings of more words.', type=str)
    parser.add_argument('--watch', help='Send the torrent to a designed watch folder', type=str)
    parser.add_argument('--transmission', help='Send the torrent to client via transmission API. Specify the server and port with hostname:port', type=str)
    parser.add_argument('--andsearch', action='store_true', help='Use AND boolean logic for positives matches, i.e. both have to be present for a match.')
    parser.add_argument('--orsearch', action='store_true', help='Use or logic for matches')
    parser.add_argument('--ignorecase', action='store_true', help='Ignore case')
    parser.add_argument('--ignorepunctuation', action='store_true', help='Ignore punctuation')
    parser.add_argument('--matchcompleted', action='store_true', help='Process files regardless of whether or not they are already downloaded.')
    parser.add_argument('--cacherss', action='store_true', help='Cache last RSS query')
    parser.add_argument('--cacheexpiry', type=int, help='Refresh RSS feed cache after x seconds')
    parser.add_argument('--verbose', action='store_true')
    parser.add_argument('--daemon', action='store_true', help='Run as a daemon.')
    parser.add_argument('--refresh', type=int, help='Time in seconds to wait between refreshes in daemon mode. Defaults to 5 minutes.')
    parser.add_argument('--dry', help='Do not download or send torrents to client...!', action='store_true')
    parser.add_argument('--onmatch', help=r'Run this command when a torrent is matched, e.g. to trigger a notification. Use __title to reference a title.', type=str)
    parser.add_argument('--feedurl', help='RSS feed URL to parse', type=str)
    args = parser.parse_args()

    if not args.watch and not args.transmission:
        exit('Please specify a watch folder or a torrent API end point.')

    if not path.isdir(args.watch):
        exit('Please specify a valid watch folder. {} does not exist!'.format(args.watch))

    if not args.include:
        exit('At least one include statement must be specified!')

    if not args.andsearch and not args.orsearch:
        args.orsearch = True
        print('No search type specified.  Assuming an or search!')

    if args.transmission:
        if not shutil.which('transmission-remote'):
            logPrint('fatal', 'Could not find transmission-remote in path. Exiting.'); exit()
        try:
            hostname = args.transmission.split(':')[0]
        except IndexError:
            print('Unable to deterime hostname for transmission.  Please pass the argument in the format of hostname:port, e.g. 127.0.0.1:9091')
        try:
            port = int(args.transmission.split(':')[1])
        except IndexError:
            print('Unable to deterime the port for transmission.  Please pass the argument in the format of hostname:port, e.g. 127.0.0.1:9091\nAssuming the port is 9091, which is the default.')
            port = 9091

def getUrlBase(url):
    ''' Returns the domain name for a given feed, used for creating domain specific logging '''
    baseurl = re.findall('http[s]?://[A-Za-z0-9\.]*', url)[0]
    domain = re.sub(r'http[s]?://', '', baseurl)
    return domain

def getFeed(url):
    baseurl = re.findall('http[s]?://[A-Za-z0-9\.]*', url)[0]
    domain = re.sub(r'http[s]?://', '', baseurl)
    savefile = gettempdir() + sep + '{}.last'.format(domain)

    def saveFeed(text, savefile):
        global lasttime
        with open(savefile, 'w') as f:
            f.write(text)
        lasttime = datetime.now()

    def loadFeed(savefile):
        with open(savefile, 'r') as f:
            lines = []
            for line in f.readlines():
                lines.append(line.rstrip())
            text = "\n".join(lines)
        return text

    def dlFeed(url, savefile):
        r = getUrl(url)
        saveFeed(r.text, savefile)
        return r.text

    # Get date time object from old file, and if not existing just assume it was a long time ago
    if path.exists(savefile):
        m_time = path.getmtime(savefile)
        lasttime = datetime.fromtimestamp(m_time)
    else:
        lasttime = datetime(1970,1,1)

    if args.cacherss:
        nowtime = datetime.now()
        deltatime = nowtime - lasttime
        elapsed = deltatime.total_seconds()
        if elapsed > args.cacheexpiry:
            print('Redownloading from {} as beyond cache expiry time!'.format(domain))
            text = dlFeed(url, savefile)
        else:
            print('Returned from cache at {} FOR {}!'.format(savefile, domain))
            text = loadFeed(savefile)
    else:
        text = dlFeed(url, savefile)

    return text

def addToDownloaded(url):
    if alreadyDownloaded(url):
        return True

    try:
        f = open(done_file, 'a')
        line = '{}\n'.format(url)
        f.write(line); f.close
    except FileNotFoundError:
        print('Could not open {} for writing.'.format(done_file))
        return False
    except OSError as E:
        print('Generic error\n{}'.format(e))
        return False
    else:
        return True

def alreadyDownloaded(url):
    if args.matchcompleted:
        return False
    if not path.exists(done_file):
        print('No previous downloads file found.  Assuming all file are to be downloaded!')
        return False

    f = open(done_file, 'r')
    for line in f.readlines():
        if url in line:
            f.close()
            return True
    f.close()
    return False


def sendToClient(url, title):
    def sendNotification(title):
        import subprocess
        command = args.onmatch.split()
        # Find title index
        titleindex = None
        for index, string in enumerate(command):
            if "__title" in string:
                titleindex = index
        if titleindex != None:
            command[titleindex] = command[titleindex].replace('__title', '"{}"'.format(title))

        print(" ".join(command))
        try:
            subprocess.call(command)
        except FileNotFoundError as F:
            print(F)
        except ChildProcessError as E:
            print(E); print(E.output)
        except Exception as E:
            print(E)

    def getTorrentFile(url, dirbase, title):
        local_filename = dirbase + sep + title + '.torrent'
        print('Downloading torrent file to {}'.format(local_filename))

        # COOKIES!
        # Get just the site name, without the domain for purpose of the cookie import
        domain_base = getUrlBase(url).split('.')[0]
        logPrint('info', 'Domain base for cookies: {}'.format(domain_base))
        try:
            import cookies
        except:
            logPrint('info', 'Failed to import cookie file. Does it exist? Not using cookies.')
            cookies_imported = False
        else:
            cookies_imported = True
            print('Cookie found for {}'.format(domain_base))

        if cookies:
            if cookies.sites.get(domain_base, None) == None:
                logPrint('info', 'Cookies module imported, but unable to file appropriate dictionary entry for {}'.format(domain_base))
                cookies_imported = False

        # Matches for site specific overrides
        match domain_base:
            case 'filelist':
                import sites.filelist
                url = sites.filelist.handler(url)
                logPrint('info', 'SITE SPECIFIC OVERRIDE ACTIVATED: {}'.format(domain_base))

        if not cookies_imported:
            r = getUrl(url, stream=True)
        else:
            r = getUrl(url, stream=True, cookies=cookies.sites[domain_base])

        logPrint('info', 'URL for Matched Torrent: {}'.format(url))

        with open(local_filename, 'wb') as f:
            for chunk in r.iter_content(chunk_size=1024):
                if chunk: # filter out keep-alive new chunks
                    f.write(chunk)
        return local_filename

    def transmissionMethod():
        torrent_path = getTorrentFile(url, gettempdir(), title)
        subprocess_list = ['transmission-remote', args.transmission, '-a', torrent_path]
        # If args.watch is passed with transmission method then actually download to here
        printLog('warning', 'Reminder to self: CHANGE THE SYNTAX OF WATCH TO E.G. ENDPOINT, since it serves dual purpose!')
        if args.watch:
            subprocess_list.extend('-w', args.watch)
        printLog('info', 'monkeygrab.py: passing the command {}'.format(subprocess_list))
        try:
            subprocess.call(subprocess_list)
        except ChildProcessError as E:
            printLog('fatal', E)

    def watchMethod(url, title):
        if args.verbose: print('Using watch folder method with {} as the destination'.format(args.watch))
        torrent_path = getTorrentFile(url, args.watch, title)

    if not args.dry and args.watch:
        watchMethod(url, title)
    if not args.dry and args.transmission:
        transmissionMethod()

    if args.onmatch:
        sendNotification(title)

def puncFilter(title):
    if args.ignorecase:
        title = title.lower()
        args.include = [i.lower() for i in args.include]
        if args.exclude != None:
            args.exclude = [i.lower() for i in args.exclude]
    if args.ignorepunctuation:
        puncs = ['.', '-', '_', ',']
        for punc in puncs:
            title = title.replace(punc, '')
            args.include = [i.replace(punc, ' ') for i in args.include]
            if args.exclude != None:
                args.exclude = [i.replace(punc, ' ') for i in args.exclude]
    return title

def doesItMatchAnd(title):
    title = puncFilter(title)

    matched = True
    for positive_string in args.include:
        if positive_string not in title:
            matched = False
            break

    if not matched:
        return False

    # Behaves like an OR search for the excluded
    if args.exclude:
        for negative_string in args.exclude:
            if negative_string in title:
                #print('NEGATIVE STRING {} FOUND'.format(negative_string))
                return False

    return True

def doesItMatchOr(title):
    title = puncFilter(title)

    matched = False
    for positive_string in args.include:
        if positive_string in title:
            matched = True
            break

    if args.exclude:
        for negative_string in args.exclude:
            if negative_string in title:
                matched = False

    return matched

def parseRSS(text):
    rss = RSSParser.parse(text)
    urls = []; titles = []
    for item in rss.channel.items:
        title = item.title.content
        url = item.content.link.content

        if args.andsearch:
            matched =  doesItMatchAnd(title)
        else:
            matched = doesItMatchOr(title)

        if matched:
            if not alreadyDownloaded(url):
                titles.append(title)
                urls.append(url)
                #logPrint('info', getUrlBase(url))
                logPrint('info', 'Matched!: \n Item: {}\n Link: {}\n'.format(title, url))
            else:
                if args.verbose: print('{} has already been downloaded!'.format(title))
    return urls, titles

def main():
    parserInit()

    def Loop():
        # Print run info
        def printInfo():
            #print('\nStarting filter run..')
            print('Include filter: {}'.format(args.include))
            print('Exclude filter: {}'.format(args.exclude))
            print('AndSearch: {}'.format(args.andsearch))
            print('OrSearch: {}'.format(args.orsearch))

        printInfo()

        # Get raw feed
        if args.verbose: logPrint('info', 'Grabbing rss feed...', end='')
        text = getFeed(args.feedurl)

        # Parse RSS to get URLs and match items
        urls, titles = parseRSS(text)

        # Send URLs to download method
        if len(urls) > 0:
            counter = 1
            for title, url in zip(titles, urls):
                logPrint('info', '\nSending URL {} of {} to client!'.format(counter, len(titles)))
                counter += 1
                sendToClient(url, title)
                addToDownloaded(url)
        print()

    if args.daemon:
        while True:
            Loop(); sleep(args.refresh)
    else:
        Loop()


if __name__ == '__main__':
    main()

