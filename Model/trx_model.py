from Tools import Database as db


def select_trx_out_list():
    """
    Select all in transaction from database
    :return:
    """
    result = db.select("select serial_tong, "
                       "NAMA_MERK, username, nama_vessel, tgl_transaksi "
                       "from transaction_list where tipe_transaksi = 'out'")
    return result


def select_trx_in_list():
    """
    Select all in transaction from database
    :return:
    """
    result = db.select(
        "select serial_tong, NAMA_MERK, username, tgl_transaksi from transaction_list where tipe_transaksi = 'in'")
    return result


def select_by_date(date, trx_type):
    """
    Select all in transaction from database
    :param date: Date to select
    :param trx_type: Type of transaction
    :return: List of data
    """
    result = db.select(
        "select serial_tong, NAMA_MERK, username, tgl_transaksi from transaction_list where tipe_transaksi = '{}' and "
        "date(tgl_transaksi) = '{}'".format(trx_type, date))
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
