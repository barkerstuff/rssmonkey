#!/bin/bash

refreshtime=500
sleeptime=600

function runit {
    # BTN
    /opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include WWE SmackDown 1080 --ignorepunctuation --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_wrestling
    /opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include WWE Raw 1080 --ignorepunctuation --andsearch --ignorecase --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_wrestling
    /opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include WWE PPV 1080 --ignorepunctuation --andsearch --ignorecase --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_wrestling
    /opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "All Elite Wrestling" 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_wrestling
    /opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include AEW 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_wrestling
    /opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include UFC 1080 --exclude prelims night contender --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_wrestling
    /opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include Ultimate Fighting Championship 1080 --exclude prelims night contender --ignorecase --ignorepunctuation --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_wrestling
    /opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "Manchester United" 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "Real Madrid" 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "Manchester Utd" 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "Man United" 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "Man Utd" 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "Man City" 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    #/opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "Newcastle United" 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    #/opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "Newcastle Utd" 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    #/opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "Manchester Utd" 1080 --ignorepunctuation --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "Manchester City" 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    #/opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include Tottenham Premier 1080 --ignorepunctuation --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    #/opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include Tottenham EPL 1080 --ignorepunctuation --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    #/opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include Arsenal Premier 1080 --ignorepunctuation --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    #/opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include Arsenal EPL 1080 --ignorepunctuation --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    #/opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include Chelsea Premier 1080 --ignorepunctuation --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    #/opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include Chelsea EPL 1080 --ignorepunctuation --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    #/opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include Barnsley 1080 --ignorepunctuation --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "Champions League" Newcastle 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "Champions League" Chelsea 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "Champions League" Arsenal 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://broadcasthe.net/feeds.php?feed=torrents_all&user=1522001&auth=457f478a5bdcb3cd6df17ed2e45f78a0&passkey=q2dgrwz6p3fuupdjd98cv67k2s2clayf&authkey=0d6ac34feea2e0f63595be79d12dfb78" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include UCL Newcastle 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports

    # FL
    /opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "Manchester United" 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "Real Madrid" 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "Man United" 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "Man Utd" 1080 --ignorepunctuation --andsearch --ignorecase --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "Manchester" 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "Man City" 1080 --ignorepunctuation --andsearch --ignorecase --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    #/opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "Newcastle United" 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    #/opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "Newcastle Utd" 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "Manchester City" 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    #/opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include Tottenham Premier 1080 --ignorepunctuation --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    #/opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include Tottenham EPL 1080 --ignorepunctuation --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/waktch/watch_sports
    #/opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include Arsenal Premier 1080 --ignorepunctuation --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    #/opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include Arsenal EPL 1080 --ignorepunctuation --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    #/opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include Chelsea Premier 1080 --ignorepunctuation --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    #/opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include Chelsea EPL 1080 --ignorepunctuation --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include Barnsley 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "Champions League" Newcastle 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "Champions League" Chelsea 1080 --ignorecase --ignorepunctuation --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "Champions League" Arsenal 1080 --ignorecase --ignorepunctuation --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include UCL Newcastle 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include UCL Chelsea 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include UCL Arsenal 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include UCL Tottenham 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "Real Madrid" 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include "West Ham" Europa 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include International England 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include FIFA England 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include Liverpool Europa 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
    /opt/rssmonkey/rungrab --feedurl "https://filelist.io/rss.php?USERNAME=rotationalvelociraptor&passkey=3e08d3d6db11130de887424cd3d12254" --onmatch "/home/jase/bin/notify-history-client -t 192.168.87.3 -R 192.168.87.7 192.168.87.2 -m __title" --include Brighton Europa 1080 --ignorepunctuation --ignorecase --andsearch --cacherss --cacheexpiry $refreshtime --watch /home/jase/watch/watch_sports
}

if [[ $1 == 'daemon' ]]; then
    while true; do runit; sleep $sleeptime; done
else
    echo "daemon - pass this argument to run in daemon mode"
    runit
fi
