from django.shortcuts import render
from imiss.category.model_tool import *
from imiss.category.sql_tool import *
from .models import *


"""
返回受欢迎歌曲
"""
def get_popular_request(request):
    # 歌曲
    SQL = "SELECT * FROM Song"
    RESULT = Song.objects.raw(SQL)
    datas = []
    for n in RESULT:
        data = n.__dict__
        del data['_state']
        datas.append(data)
    # 音乐个数
    popular_count = Song.objects.count()
    # 返回数据
    return response_data(200, "成功", {
        "song": datas,
        "popular_count": popular_count
    })


"""
获取所有歌单
"""
def get_sheet_request(request):
    SQL = "SELECT * FROM Sheet"
    RESULT = Sheet.objects.raw(SQL)
    datas = []
    for n in RESULT:
        data = n.__dict__
        del data['_state']
        datas.append(data)
    # 返回数据
    return response_data(200, "成功", datas)


"""
通过歌单找歌曲
"""
def get_songs_with_sheet_request(request):
    # 获取歌曲通过歌单
    SQL = "SELECT * FROM Song_Sheet WHERE sheet_id = 1 ORDER BY number"
    RESULT = Song_Sheet.objects.raw(SQL)
    datas = []
    for n in RESULT:
        song = n.song.__dict__
        del song['_state']
        datas.append(song)
    # 返回数据
    print(datas)
    return response_data(200, "成功", datas)


"""
获取歌曲
"""
def get_song_request(request):
    data = Song.objects.get(id = 1)
    del data['_state']
    return response_data(200, "成功", data)


"""
获取资源
"""
def get_resource_request(request):
    data = Resource.objects.get(id = 1)
    data = data.__dict__
    del data['_state']
    return response_data(200, "成功", data)


"""
分享歌曲
"""
def insert_share_request(request):
    # 分享个数+1
    listenNumber = Song.objects.get(id = 1).listenNumber + 1;
    SQL = "UPDATE Song SET listenNumber = %s WHERE id = 1" %(listenNumber)
    execute_sql_operating(SQL)
    # 最新的分享个数
    number = Song.objects.get(id = 1).listenNumber
    return response_data(200, "成功", {"number": number})










