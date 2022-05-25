import mysql.connector
import configparser
import logging


# Read config using configparser
def read_config(filename):
    config = configparser.ConfigParser()
    config.read(filename)
    return config


# Get connection from mysql database
def create_connection():
    try:
        config = read_config('db_config.ini')
        connection = mysql.connector.connect(
            host=config['mysql']['host'],
            user=config['mysql']['user'],
            passwd=config['mysql']['password'],
            database="fuel_db"
        )
        if connection.is_connected():
            print("Connected to MySQL database")
        return connection
    except mysql.connector.Error as err:
        logging.error(err)
        return None


def connection_test():
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
        return records
    except mysql.connector.Error as err:
        logging.error(err)
        return None
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            logging.info("MySQL connection is closed")


# Insert data into mysql database
def insert_update(query):
    connection = create_connection()
    cursor = connection.cursor()
    try:
        cursor.execute(query)
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
