from bullet import colors, SlidePrompt, Input, Password
from consolemenu import ConsoleMenu
from consolemenu.items import FunctionItem

import Model.admin_model as admin_model
import Tools.encryption as encryption
from View.Company import company_menu
from View.Merk import merk_menu
from View.Stock import stock_menu
from View.Trx import trx_menu
from View.Vessel import vessel_menu

user_logged = ""
user_id = None


def menu_before_login():
    menu = ConsoleMenu("Vessel Management System", "Please select an option")
    login_page = FunctionItem("Login", login)
    menu.append_item(login_page)
    menu.show()


def login():
    """
    Login page
    """
    while True:
        print("Vessel Fuel Management System")
        login_form = SlidePrompt(
            [
                Input("Enter your username: ",
                      word_color=colors.foreground["yellow"]),
                Password("Enter your password: ",
                         word_color=colors.foreground["green"])
            ]
        )
        result = login_form.launch()

        username = result[0][1]
        password = result[1][1]
        hashed_password = encryption.hash_password(password)
        login_data = admin_model.login(username, hashed_password)

        if login_data:
            print("Login successful")
            global user_logged
            user_logged = username

            global user_id
            user_id = login_data[0][0]
            menu_after_login()
        else:
            print("Login failed")


def menu_after_login():
    """
    Main menu for the application after login
    """
    menu = ConsoleMenu("Vessel Management System", "Welcome, " + user_logged)
    company_page = FunctionItem("Company", company_menu)
    vessel_page = FunctionItem("Vessel", vessel_menu)
    merk_page = FunctionItem("Merk", merk_menu)
    stock_page = FunctionItem("Stock", stock_menu)
    trx_page = FunctionItem("Transaction", trx_menu)
    # admin_page = FunctionItem("Admin", admin_menu)
    menu.append_item(company_page)
    menu.append_item(vessel_page)
    menu.append_item(merk_page)
    menu.append_item(stock_page)
    menu.append_item(trx_page)
    # menu.append_item(admin_page)
    menu.show()
