import Tools.Database as db


# Function to get all vessel from the database
def select_active():
    """
    Select all active vessels from database to show in table
    :return: List of all vessels"""
    result = db.select(
        "SELECT * FROM vessel_list;"
    )
    return result


def get_vessel_by_id(id):
    """
    Get vessel by id
    :param id: Vessel id
    :return: Vessel data
    """
    conn = None
    cur = None

    try:
        conn = db.create_connection()
        cur = conn.cursor()
        cur.execute("SELECT * FROM vessel where id = %s", (id,))
        rows = cur.fetchall()
        return rows
    except Exception as e:
        print(e)
    finally:
        if conn is not None:
            conn.close()
        elif cur is not None:
            cur.close()


def insert_vessel(name, company_id):
    """
    Insert new vessel into database
    :param name: Vessel name
    :param company_id: Company id
    :return:
    """
    result = db.insert_update(
        "INSERT INTO vessel (name, id_company) VALUES (%s, %s)", (name, company_id)
    )
    return result
