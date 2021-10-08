#!/usr/bin/python3

import requests
import sys
from bs4 import BeautifulSoup as bs
import regex as re
import os
import json

def sanitize(link):
    if link[:2] == "//":
        link = link[2:]
    if link[:7] in ["http://", "https://"]:
        return link
    return f"http://{link}"

def panic(s):
    print(s)
    exit(1)

resp = requests.get(sys.argv[1])
if resp.status_code != 200:
    panic(f"error downloader videso, status {resp.status_code}")

page = bs(resp.text, "html.parser")
title = page.find("h1").text.replace("\n", "").replace("\"", "").replace("'", "").replace("\r", "")
links = [sanitize(l.attrs["src"]) for l in page.find_all("iframe") if "allowfullscreen" in l.attrs ]

fil = re.compile("<video (.|\n)*? />")
ex = re.compile("/(\d+)\.mp4$")
kl = re.compile("^play\((\[(?:.|\n)+?\])")
ls = re.compile("<script .*? src=[\"'](https?://n\d+\.hqwo\.cc/.*?)['\"](?:></script>)|(?:/>)")
down = None

data = {}
for l in links:
    print(l)
    resp = requests.get(l)
    if resp.status_code != 200:
        panic(f"c'ant requst {link}")
    txt = resp.text.encode().decode("unicode-escape")
    # get from js 
    video = [bs(s, "html.parser").source for s in fil.findall(txt)]
    # get from list
    if not video:
        l = ls.findall(txt)
        if not l:
            panic("error cant find anny video")
        r = requests.get(sanitize(l[0]))
        txt = r.text.encode().decode("unicode-escape")
        if r.status_code != 200:
            panic(f"c'ant request {l}")
        jf = kl.findall(txt)[0].replace("\n", "").replace("\\n", "")
        video = json.loads("{\"data\": %s }" % jf)['data']
    

    def width(el):
        if isinstance(el, dict):
            return el['q']
        return int(fil.findall(el.attrs["src"])[0])
    video.sort(key=width, reverse=True)
    video = video[0]
    if isinstance(video, dict):
        data['url'] = video['file']
        data['size'] = video['q']
    else:
        video = video.attrs
        data['url'] = sanitize(video['src'])
        data['size'] = video['title']

print(f"download vide \"{title}\" in \"{data['size']}\"")
os.system(f"wget --show-progress -O \"{title}\" {data['url']}")
