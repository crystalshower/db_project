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
    Insert new merk into database
    :param data: List of data to insert
    :return: True if success, False if failed
    """
    sql = "INSERT INTO merk_fuel (nama_merk) " \
          "VALUES (%s);"
    result = db.insert_update(sql, data)
    return result


def update(data):
    """
    Update merk in database
    :param data: List of data to update
    :return: True if success, False if failed
    """
    sql = "UPDATE merk_fuel " \
          "SET nama_merk = %s" \
          "WHERE id_merk = %s;"
    result = db.insert_update(sql, data)
    return result


def soft_delete(data):
    """
    Soft delete merk in database
    :param data: List of data to update
    :return: True if success, False if failed
    """
    sql = "UPDATE merk_fuel " \
          "SET merk_active_status = 0 " \
          "WHERE id_merk = %s;"
    result = db.insert_update(sql, data)
    return result
