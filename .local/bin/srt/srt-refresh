#!/usr/bin/env python

from datetime import timedelta

from babelfish import Language
from subliminal import download_best_subtitles, region, save_subtitles, scan_videos

# configure the cache
region.configure('dogpile.cache.dbm', arguments={'filename': 'cachefile.dbm'})

# scan for videos newer than 2 weeks and their existing subtitles in the current folder
videos = scan_videos('.', age=timedelta(weeks=2))

# download best subtitles
subtitles = download_best_subtitles(videos, {Language('eng'), Language('fra')})

# save them to disk, next to the video
for v in videos:
    save_subtitles(v, subtitles[v])