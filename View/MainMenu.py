from consolemenu import ConsoleMenu
from consolemenu.items import FunctionItem

import Model.admin_model as admin_model
import Tools.encryption as encryption

user_logged = ""


def menu_before_login():
    menu = ConsoleMenu("Vessel Management System", "Please select an option")
    login_page = FunctionItem("Login", login)
    menu.append_item(login_page)
    menu.show()


def login():
    print("Enter your username and password")
    username = input("Username: ")
    password = input("Password: ")
    hashed_password = encryption.hash_password(password)
    login_data = admin_model.login(username, hashed_password)
    if login_data:
        print("Login successful")
        global user_logged
        user_logged = username
        menu_after_login()
    else:
        print("Login failed")


def menu_after_login():
    """
    Main menu for the application after login
    """
    menu = ConsoleMenu("Vessel Management System", "Welcome," + user_logged)
    company_page = FunctionItem("Company", "Company management")
    vessel_page = FunctionItem("Vessel", "Manage vessels")
    trx_page = FunctionItem("Transaction", "Manage transactions")
    menu.append_item(company_page)
    menu.append_item(vessel_page)
    menu.append_item(trx_page)
    menu.show()
