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


def insert(username, password):
    """
    :param username:
    :param password:
    :return:
    """
    hashed_password = enc.hash_password(password)
    sql = "insert into admin(username, password) values('%s', '%s')" % (username, hashed_password)
    result = db.insert_update(sql)
    return result
