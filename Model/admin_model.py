import Tools.Database as db
import Tools.encryption as enc


def login(username, password):
    """
    :param username:
    :param password:
    :return:
    """
    sql = "select * from admin where username = '%s' and password = '%s'" % (username, password)
    result = db.select(sql)
    return result


def insert(data):
    """
    :param username:
    :param password:
    :return:
    """
    hashed_password = enc.hash_password(data[1])
    sql = "insert into admin(username, password) values('%s', '%s')"
    result = db.insert_update(sql, (data[0], hashed_password))
    return result


def select_all_active():
    """
    Select all active admin
    :return: 
    """
    sql = "select * from admin where active_status = 1"
    result = db.select(sql)
    return result
