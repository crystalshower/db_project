import Tools.Database as db


# Function to get all vessel from the database
def select_active():
    conn = None
    cur = None

    try:
        conn = db.create_connection()
        cur = conn.cursor()
        cur.execute("SELECT * FROM vessel where active = 1")
        rows = cur.fetchall()
        return rows
    except Exception as e:
        print(e)
    finally:
        if conn is not None:
            conn.close()
        elif cur is not None:
            cur.close()


def get_vessel_by_id(id):
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
