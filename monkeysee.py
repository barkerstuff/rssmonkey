#!/usr/bin/env python3

from os import path
from os import sep
from os import mknod
from os import makedirs
from sys import exit
import subprocess
import argparse
import re

parser = argparse.ArgumentParser()
parser.add_argument('--dry', action='store_true', help='Do not download the torrent file or send to the download client.')
parser.add_argument('--watch', action='store_true', help='Use the watch folder method to add downloads')
parser.add_argument('--daemon', action='store_true', help='Constantly refresh the given feed(s) at a specified interval. Defaults to 15 minutes.')
parser.add_argument('--verbose', action='store_true', help='Provide extra runtime feedback.')
parser.add_argument('--refresh', type=int, help='Overrides the default refresh interval in daemon mode.  This should be specified in seconds.')
parser.add_argument('--ignorecompleted', action='store_true', help='Do not ignore files that have already been downloaded.')
args = parser.parse_args()

filterfile = path.expanduser('~') + sep + '.config' + sep + 'rssmonkey' + sep + 'filters'
optfile = path.expanduser('~') + sep + '.config' + sep + 'rssmonkey' + sep + 'options'

def parseOpts():
    def makeFilterFile():
        base = path.dirname(optfile)
        if not path.isdir(base):
            try:
                makedirs(base)
            except PermissionError:
                exit('Failed to make {}.  Please ensure you have write permissions to this directory.'.format(base))

        exampletext = '''# Set the watch folder where to pick up torrents (applies to watch mode)
#watch = /path/to/watchdir
#
# Time in seconds between refreshes in daemon mode
refresh = 360
#
# Daemon mode (monkeysee will continue to check RSS feeds on every x seconds and not exit)
daemon = True
#
# Cache RSS requests (this prevents monkeysee from making a new RSS request for each filter)
cacherss = True
# After X seconds (set by cache expiry below) then a new feed will be obtained rather than using the cache
cacheexpiry = 350
#
# Torrent add method - options are 'watch', 'transmission'
# Watch will merely send a torrent to a watch folder to be picked up by the client
# Transmission will send a torrent to transmission using transmission-remote
addmethod = "watch"
#
# Add feeds below in the following format:
# rss feedname url
#rsssource myfeedname = "http://your/rss/feed/here"
#rsssource myotherfeed = "http://my.other/feed"
#
# Script to run after adding a torrent. __title will be replaced with the actual title
onmatch = "command here"
'''
        with open(optfile, 'w') as f:
            f.write(exampletext)

    if not path.isfile(optfile):
        makeFilterFile()
        exit('No options file found. Making an example at {}'.format(optfile))

    class globalOpts:
        def __init__(self, cacherss=True, cacheexpiry=350, daemon=True, addmethod="watch", watch='/watch', feeds={}, onmatch=None):
            self.cacherss = cacherss
            self.cacheexpiry = cacheexpiry
            self.addmethod = addmethod
            self.watch = watch
            self.daemon = True
            self.feeds = feeds
            self.onmatch = onmatch

    f = open(optfile, 'r')

    feeds = {}; oncomplete = None
    for line in f.readlines():
        # Parse options
        if '#' in line[0]:
            continue
        cacherss = True if 'cacherss' in line.lower() and 'true' in line.lower() else False
        daemon = True if 'daemon' in line.lower() and 'true' in line.lower() else False
        if 'cacheexpiry' in line.lower():
            try:
                cacheexpiry = re.findall(r'[0-9]+', line)[0]
                cacheexpiry = int(cacheexpiry)
            except IndexError:
                cacheexpiry = 350
                print('Failed to parse cacheexpiry option. Please ensure it is in the format cacherss = NUMBER')
            except Exception as E:
                print(E)
        if 'addmethod' in line.lower():
            if 'watch' in line.lower():
                addmethod = 'watch'
            elif 'transmission' in line.lower():
                addmethod = 'transmission'
        if 'watch' in line.lower():
            watch = line.split('=')[1].lstrip().rstrip()
        if 'onmatch' in line.lower():
            onmatch = line.split('=')[1].lstrip().rstrip().lstrip('"').rstrip('"')
        if 'rsssource' in line.lower():
            fields = line.lower().split()
            feeds[fields[1]] = fields[2].lstrip('"').rstrip('"')

    Options = globalOpts(cacherss=cacherss, cacheexpiry=cacheexpiry, daemon=daemon, addmethod=addmethod, watch=watch, feeds=feeds, onmatch=onmatch)
    return Options

def parseFilters():
    def makeFilterFile():
        base = path.dirname(optfile)
        if not path.isdir(base):
            try:
                makedirs(base)
            except PermissionError:
                exit('Failed to make {}.  Please ensure you have write permissions to this directory.'.format(base))

        exampletext = '''
            # Name, Include, Exclude, rssfeed, Mode
            # examplefilter, "Include This String" IncludeThisWord/AndThisWord, "Exclude This Phrase" ExcludeThisWord
            #
            # GameOfThrones, "Game Of Thrones"/1080, 720, https://url.example/feed, and
            #  The above will find an RSS item with "Game of Thrones" and 720p in them, and will exclude any match with 720 in it.  The fin
        '''
        with open(filterfile, 'w') as f:
            f.write(exampletext)

    if not path.isfile(filterfile):
        makeFilterFile()
        exit('No configuration file found. Making an example at {}'.format(filterfile))

    class ParsedObj:
        def __init__(self, name, include, exclude, url, andsearch, orsearch):
            self.name = name
            self.include = include
            self.exclude = exclude
            self.url = url
            self.andsearch = andsearch
            self.orsearch = orsearch
        def __repr__(self):
            return repr(self.name)

    parsed_filters = []

    f = open(filterfile, 'r')
    for line in f.readlines():
        # Parse filters
        if '#' in line[0]:
            continue
        if ',' in line:
            name = line.split(',')[0].lstrip().rstrip()
            include = line.split(',')[1].lstrip().rstrip()
            exclude = line.split(',')[2].lstrip().rstrip()
            url = line.split(',')[3].lstrip().rstrip().lstrip('"').rstrip('"')

            # Fall back if no mode specified
            try:
                mode = line.split(',')[4].lstrip().rstrip()
            except IndexError:
                print('Could not determine whether the {} filter uses an \'OR\' or \'AND\' method. Assuming AND.'.format(name))
                mode = 'and'

            # Set bools to pass to functions to mimic the args. arguments taken by monkeygrab
            if mode == 'or':
                andsearch = False; orsearch=True
            else:
                orsearch = False; andsearch=True

            # Process the filters back into list format
            if include != None:
                include = include.split(' ')
            exclude = exclude.split(' ')

            # Now remove the extraneous quotations
            include = [i.replace('"', '') for i in include]
            if include != None:
                exclude = [i.replace('"', '') for i in exclude]

            parsed_filters.append(ParsedObj(name=name, include=include, exclude=exclude, url=url, andsearch=andsearch, orsearch=orsearch))

    if len(parsed_filters) == 0:
        print('No filter found.  Please add some to {}'.format(filterfile))
    return parsed_filters

def buildSubProcess(fltr, Options):
    subprocess_list = ['monkeygrab.py']

    # Caching options
    if Options.cacherss:
        subprocess_list.append('--cacherss')
        subprocess_list.append(fltr.cacheexpiry)

    # Add the filters
    subprocess_list.append('--include')
    subprocess_list.extend(fltr.include)
    if fltr.exclude[0] != '':
        subprocess_list.append('--exclude')
        subprocess_list.extend(fltr.exclude)

    # Add search method
    if fltr.andsearch:
        subprocess_list.append('--andsearch')
    elif fltr.orsearch:
        subprocess_list.append('--orsearch')
    else:
        subprocess_list.append('--andsearch')

    # Add completion method
    if Options.onmatch != None:
        subprocess_list.extend(['--onmatch', Options.onmatch])

    # Add RSS feed
    subprocess_list.append('--url')
    subprocess_list.append(Options.feeds[fltr.url])

    exit(subprocess_list)

def main():

    parsed_filters = parseFilters()
    Options = parseOpts()

    while True:
        for fltr in parsed_filters:
            print('Querying {}'.format(fltr))
            subprocess_list = buildSubProcess(fltr, Options)
        if not args.daemon:
            exit()
        else:
            sleep(args.refresh)


if __name__ == '__main__':
    main()