import Tools.Database as db


def login(username, password):
    """
    :param username:
    :param password:
    :return:
    """
    sql = "select * from admin where username = '%s' and password = '%s'" % (username, password)
    result = db.select(sql)
    return result
