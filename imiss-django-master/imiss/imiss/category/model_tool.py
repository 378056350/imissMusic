import uuid
import os

# 管理平台上传图片
def user_directory_path(instance, filename):
    ext = filename.split('.')[-1]
    filename = '{}.{}'.format(uuid.uuid4().hex[:10], ext)
    str = os.path.join("music", filename)
    return str


# 保存APP上传的图片
def upload_image(f, song):
    file_name = song
    baseDir = os.path.dirname(os.path.abspath("personico"))
    jpgdir = os.path.join(baseDir, 'media')
    filename = os.path.join(jpgdir, file_name)
    print(filename)
    fobj = open(filename, 'wb')
    for chrunk in f.chunks():
        fobj.write(chrunk)
    fobj.close()


# 返回数据封装
def response_data(status, message, data):
    return {
        "status": status,
        "message": message,
        "data": data,
    }