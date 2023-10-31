#!/usr/bin/env python3

from re import findall

def handler(url):
    # FileList needs cookies file and to transpose the url
    #  https://filelist.io/details.php?id={}&hit=1
    #  -> https://filelist.io/download.php?id={}
    id = findall(r"id=[0-9]{1,9}", url)[0].replace('id=', '')
    new_format = "https://filelist.io/download.php?id={}".format(id)
    return new_format

