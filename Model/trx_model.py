from Tools import Database as db


def select_trx():
    """
    Select all transaction from database
    :return: List of all stock
    """
    result = db.select("SELECT * "
                       "FROM transaction")
    return result


def insert_in(data):
    """
    Insert new transaction into database
    :param data: List of data to insert
    :return: True if success, False if failed
    """
    sql = "INSERT INTO transaksi (id_stock, id_admin, tipe_transaksi)" \
          "VALUES (%s, %s, %s);"
    result = db.insert_update(sql, data)
    return result


def insert_out(data):
    """
    Insert new transaction into database
    :param data: List of data to insert
    :return: True if success, False if failed
    """
    sql = "INSERT INTO transaksi (id_stock, id_admin, id_vessel, tipe_transaksi)" \
          "VALUES (%s, %s, %s, %s);"
    result = db.insert_update(sql, data)
    return result
