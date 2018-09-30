from django.db import models
from imiss.category.model_tool import *

# 歌曲
class Song(models.Model):
    name = models.CharField(max_length=20, verbose_name="歌名")
    author = models.CharField(max_length=20, verbose_name="作者")
    big_img = models.ImageField(upload_to=user_directory_path, verbose_name="大图", null=True, blank=True)
    small_img = models.ImageField(upload_to=user_directory_path, verbose_name="小图", null=True, blank=True)
    introduction = models.CharField(max_length=20, verbose_name="介绍")
    detail = models.CharField(max_length=20, verbose_name="详情")
    likeNumber = models.IntegerField(verbose_name="喜欢人数")
    listenNumber = models.IntegerField(verbose_name="听歌人数")
    shareNumber = models.IntegerField(verbose_name="分享人数")
    # 输出
    def __str__(self):
        return "%s" % self.name
    class Meta:
        db_table = 'Song'


# 歌单
class Sheet(models.Model):
    name = models.CharField(max_length=20, verbose_name="歌单")
    img = models.ImageField(upload_to=user_directory_path, verbose_name="图片", null=True, blank=True)

    # 输出
    def __str__(self):
        return "%s" % self.name
    class Meta:
        db_table = 'Sheet'


# 歌曲-歌单
class Song_Sheet(models.Model):
    song = models.ForeignKey(Song, blank=True, null=True, on_delete=models.CASCADE, verbose_name="歌曲外键")
    sheet = models.ForeignKey(Sheet, blank=True, null=True, on_delete=models.CASCADE, verbose_name="歌单外键")
    number = models.IntegerField(verbose_name="当前歌曲在歌单的排行")

    class Meta:
        db_table = 'Song_Sheet'


# 资源
class Resource(models.Model):
    lrc = models.FileField(upload_to=user_directory_path, verbose_name="歌词")
    mp3 = models.FileField(upload_to=user_directory_path, verbose_name="音乐")
    song = models.ForeignKey(Song, blank=True, null=True, on_delete=models.CASCADE, verbose_name="歌曲外键")
    # 输出
    def __str__(self):
        return "%s" % self.song.name
    class Meta:
        db_table = 'Resource'


# 分享
class Share(models.Model):
    title = models.CharField(max_length=20, verbose_name="标题")
    detail = models.CharField(max_length=20, verbose_name="详情")
    img = models.CharField(max_length=20, verbose_name="图片")
    url = models.CharField(max_length=20, verbose_name="跳转链接")
    # 输出
    def __str__(self):
        return "%s" % self.title
    class Meta:
        db_table = 'Share'