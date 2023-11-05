#!/usr/bin/env python3


def handler(url, chunkIt, local_filename, username='', password='', method='requestsession'):
    urlbase = 'https://filelist.io'
    from re import findall
    # FileList needs cookies file and to transpose the url
    #  https://filelist.io/details.php?id={}&hit=1
    #  -> https://filelist.io/download.php?id={}
    id = findall(r"id=[0-9]{1,9}", url)[0].replace('id=', '')
    new_format = f"{urlbase}/download.php?id={id}"

    if method == 'requestsession':
        print('Request session method!')
        import requests
        from bs4 import BeautifulSoup
        url = f"{urlbase}/login.php"
        posturl = f"{urlbase}/takelogin.php"
        headers = {'user-agent': 'Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/118.0'}
        form = {"username": "{}".format(username),
                        "password": "{}".format(password),
                        "unlock": "1",
                        "returnto": r"%2F"}

        with requests.Session() as s:
            r = s.get(url, headers=headers)
            soup = BeautifulSoup(r.content, 'html5lib')
            # The validator changes with every login, so need to grab it for the POST!
            form["validator"] = soup.find('input', attrs={'name': 'validator'})['value']
            r = s.post(posturl, data=form, headers=headers)

            t = s.get(new_format, stream=True)
            local_filename = chunkIt(t, local_filename)

        return new_format
    else:
        return new_format

