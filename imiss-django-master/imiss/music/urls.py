#!usr/bin/python
# -*- coding:UTF-8 -*-

from django.conf.urls import url
from django.urls import path
from .views import *

urlpatterns = [
    # 受欢迎歌曲
    path('getPopularRequest.action', get_popular_request),
    # 歌单列表
    path('getSheetRequest.action', get_sheet_request),
    # 通过歌单找歌曲
    path('getSongsWithSheetRequest.action', get_songs_with_sheet_request),
    # 歌曲
    path('getSongRequest.action', get_song_request),
    # 获取资源
    path('getResourceRequest.action', get_resource_request),
    # 分享成功
    path('insertShareRequest.action', insert_share_request),
]