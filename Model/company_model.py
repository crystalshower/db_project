import Tools.Database as db


def select_all_companies():
    """
    Select all active companies from database
    :return: List of all companies
    """
    result = db.select("SELECT * "
                       "FROM company "
                       "where comp_active_status = 1")
    return result


def insert_company(data):
    """
    Insert new company into database
    :param data: Dictionary with company data
    """
    sql = "INSERT INTO company (company_name, alamat)" \
          "VALUES ('{}', '{}')".format(data[0], data[1])
    result = db.insert_update(sql)
    return result

def update_company(id, data):
    """
    Update company data
    :param id: Company id
    :param data: Dictionary with company data
    """
    sql = "UPDATE company " \
          "SET company_name = '{}', alamat = '{}' " \
          "WHERE id_company = {}".format(data[0], data[1], id)
    result = db.insert_update(sql)
    return result
