import Tools.Database as db


def select_all_companies():
    """
    Select all active companies from database
    :return: List of all companies
    """
    result = db.select("SELECT * FROM company where comp_active_status = 1")
    return result


def insert_company(data):
    """
    Insert a new company into database
    :param company_name: Name of the company
    :param company_address: Address of the company
    :return: True if insert was successful, False if not
    """
    sql = "INSERT INTO company (company_name, alamat) VALUES (%s, %s)", data[0], data[1]
    result = db.insert_update(sql)
    return result
