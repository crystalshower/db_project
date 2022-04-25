import mysql.connector
import configparser


# Read config using configparser
def read_config(filename):
    config = configparser.ConfigParser()
    config.read(filename)
    return config


# Get connection from mysql database
def get_connection(db_name):
    try:
        config = read_config('db_config.ini')
        print(config['mysql']['host'])
        connection = mysql.connector.connect(
            host=config['mysql']['host'],
            user=config['mysql']['user'],
            passwd=config['mysql']['passwd'],
            database=db_name
        )
        return connection
    except mysql.connector.Error as err:
        print("Error: {}".format(err))
        return None
