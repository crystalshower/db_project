import Tools.Database as db


def select():
    """
    Select all active merk from database
    :return: List of all merk
    """
    result = db.select("SELECT * "
                       "FROM merk_fuel "
                       "where merk_active_status = 1")
    return result


def insert(data):
    """
    Insert new stock into database
    :param data: List of data to insert
    :return: True if success, False if failed
    """
    sql = "INSERT INTO stock (id_merk, serial_tong)" \
          "VALUES (%s, %s);"
    result = db.insert_update(sql, data)
    return result