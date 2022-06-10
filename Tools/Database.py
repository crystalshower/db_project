import configparser
import logging

import mysql.connector


def read_config(filename):
    """
    Read config file
    :param filename:
    :return: void"""
    config = configparser.ConfigParser()
    config.read(filename)
    return config


def create_connection():
    """
    Create connection to mysql database
    :return: Conn
    """
    try:
        config = read_config('db_config.ini')
        connection = mysql.connector.connect(
            host=config['mysql']['host'],
            user=config['mysql']['user'],
            passwd=config['mysql']['password'],
            database="fuel_db"
        )
        if connection.is_connected():
            logging.info("Connected to MySQL database")
        return connection
    except mysql.connector.Error as err:
        logging.error(err)
        return None


def connection_test():
    """
    Test connection to mysql database
    :return: void
    """
    connection = create_connection()
    if not connection.is_connected():
        logging.error("Connection to database failed")
        raise SystemExit


def select(query):
    """
    Select data from mysql database
    :param query:
    :return:
    """
    connection = create_connection()
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        logging.info(cursor.statement)
        records = cursor.fetchall()
        if checck_rs(records):
            return None
        return records
    except mysql.connector.Error as err:
        logging.error(err)
        return None
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            logging.info("MySQL connection is closed")


def insert_update(query, values):
    """
    Insert or update data to mysql database
    :param query: Query to execute
    :param values: Values to insert
    :return: True if success, False if failed
    """
    connection = create_connection()
    cursor = connection.cursor()
    try:
        cursor.execute(query, values)
        logging.info(cursor.statement)
        connection.commit()
        return True
    except mysql.connector.Error as err:
        logging.error(err)
        return False
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            logging.info("MySQL connection is closed")


def checck_rs(rs):
    """
    Check if result set is empty
    :param rs: Result set
    :return: True if empty, False if not
    """
    if rs is None or len(rs) == 0:
        return True
    return False
