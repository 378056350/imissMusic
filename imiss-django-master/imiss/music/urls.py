#!usr/bin/python
# -*- coding:UTF-8 -*-

from django.conf.urls import url
from django.urls import path
from .views import *

urlpatterns = [
    # # 获取首页
    # path('getHomeRequest.action', get_home_request),
    # # 每日推荐
    # path('getRecommendSongRequest.action', get_recommend_song_request),
    # # 歌单列表
    # path('getSheetListRequest.action', get_sheet_list_request),
    # # 歌单列表
    # path('getSheetRequest.action', get_sheet_request),
    # # 排行榜列表
    # path('getRankListRequest.action', get_rank_list_request),
    #
    #
    #
    # # 查看我的歌单
    # path('selectSheetRequest.action', get_mysheet_request),
    # # 创建我的歌单
    # path('createMySheetRequest.action', create_mysheet_request),
    # # 删除我的歌单
    # path('deleteMySheetRequest.action', delete_mysheet_request),
    # # 编辑我的歌单
    # path('updateSheetRequest.action', update_mysheet_request),
    # # 添加歌曲到我的歌单
    # path('insertMySheetSongRequest.action', add_mysheet_song_request),
    # # 删除歌曲到我的歌单
    # path('deleteMySheetSongRequest.action', delete_mysheet_song_request),
    #
    #
    #
    #
    # # 音乐资源
    # path('getResourceRequest.action', get_resource_request)
]