#!/usr/bin/env python3

# REST call format
# GET http://[IP address]:32400/library/sections/[Library ID]/refresh?path=[Folder]&X-Plex-Token=[PlexToken]

from requests import get

def handler(folder: str, library_id: int, ip: str="127.0.0.1", port: int=32400, token=None) -> bool:
    ''' Folder to refresh '''
    url = f"http://{ip}:{port}/library/sections/{library_id}/refresh?path={folder}"
    if token != None:
        url += f"&X-Plex-Token={token}"
    print(f"Calling plex with URL {url}")
    get(url)

handler('/BT/sports', 17)
