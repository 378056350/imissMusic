from django.db import connection, transaction


"""
Rawqueryset对象增加len()方法
Attributes:
    query: sql查询结果
"""
def add_len_to_raw_query(query):
    from django.db.models.query import RawQuerySet
    def __len__(self):
      from django.db import connection
      sql = 'select count(*) from (%s) as newsql' % query.raw_query
      with connection.cursor() as cursor:
        cursor.execute(sql)
        row = cursor.fetchone()
      return row[0]
    setattr(RawQuerySet, '__len__', __len__)


"""
执行除查询外其他SQL语句
Attributes:
    sql: sql语句
Return:
    True: 执行成功
    False: 执行失败
"""
def execute_sql_operating(sql):
    print(sql)
    try:
        cursor = connection.cursor()
        cursor.execute(sql)
        row = cursor.fetchone()
        return True
    except Exception:
        return False

