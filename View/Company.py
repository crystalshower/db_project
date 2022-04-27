from consolemenu import ConsoleMenu
from consolemenu.items import FunctionItem

import Model.company_model as company_model


def company_menu():
    menu = ConsoleMenu("Company", "Select an option")

    menu.append_item(FunctionItem("Add Company", add_company))
    menu.append_item(FunctionItem("View Company", view_company))
    menu.append_item(FunctionItem("Delete Company", delete_company))
    menu.append_item(FunctionItem("Exit", exit))

    menu.show()


def add_company():
    data = [input("Company Name: "), input("Company Address: ")]
    if company_model.insert_company(data):
        print("Company added successfully")
    else:
        print("Company could not be added")
        