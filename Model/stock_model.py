import logging
import Tools.Database as db


def select_stock():
    """
    Select all active stock from database
    :return: List of all stock
    """
    result = db.select("SELECT * "
                       "FROM stock_list")
    return result


def insert(data):
    """
    Insert new stock into database
    :param data: List of data to insert
    :return: True if success, False if failed
    """
    sql = "INSERT INTO stok_fuel (id_merk, serial_tong)" \
          "VALUES (%s, %s);"
    result = db.insert_update(sql, data)
    return result


def insert_stock_in(data):
    """
    Insert new stock into database
    :param data: List of data to insert
    :return: True if success, False if failed
    """
    try:
        conn = db.create_connection()
        cursor = conn.cursor()
        sql = "INSERT INTO stok_fuel (id_merk, serial_tong)" \
              "VALUES (%s, %s);"
        cursor.execute(sql, data)
        conn.commit()   
        last_row = cursor.lastrowid
        return True, last_row
    except Exception as err:
        logging.error(err)
        return False, None
