# rssmonkey

## Overview 
RSS Parser designed for automation download of torrents with RSS with torrent sites.  Capable of monitoring an RSS feed and filtering torrents according to specified filters and sending them to torrent clients.  Supports addition of handlers for custom behaviours that will depend on the site being, as well as integration that extend functionality and handling of downloaded files. 

## Rationale
Why did I make this when services like Sonarr/Radarr exist? While these kind of services they do work well have the additional overhead of needing a server configuration. 
Furthermore, RSSMonkey provides a generic site agostic interface for downloads and can work with a wider array of sites of feeds.  This also allows for the kind of content that be otherwise difficult to match due to poor organisational standard, e.g. niche content, sports, adult content, software.  This tool was originally designed to supplement transmission, which doesn't have its own RSS parser as e.g. qbittorrent. 

### Basic description
 monkeygrab.py - Responsible for grabbing feeds, filtering them and sending to the torrent client and calling any additional integrations.  This is capable of performing all tasks standalone, but is driven entirely by command line arguments and does not support e.g. saved configuration and filter options.  Use monkeygrab.py --help to see a description of all the available parameters. 
 monkeysee.py - This can be called and it will run, either once, or in a loop to grab RSS feeds.  It will read your configurations without any further input required and pass these to monkeygrab.py accordingly.  To configure monkeysee.py you need to set up the 'options' or 'filters' files, by default in ~/.config/rssmonkey/filters and ~/.config/rssmonkey.options.  To see the format just run monkeygrab.py once and it will populate these files with a template of options.  
 rssmonkey - To be added: GUI version of this tool

### Features
RSS parsing and filtering
Addition to torrent client via watch folders and transmission API
Can run standalone via CLI or as a daemon using configuration files
Extensible with custom site integrations and endpoint integration (e.g. to push a downloaded file to plex)
Supports custom cookies on a per website basis

### Roadmap
Add qbittorrent handling
Add more sites for custom handling 
Test transmission API call method for torrent addition 
Add modern customtkinter interface

### Custom sites with overrides
filelist

### Custom integrations
plex (sends information to plex to add content)

# Requirements
customtkinter (if using GUI configuration)
python3.6+
