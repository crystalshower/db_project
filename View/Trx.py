from consolemenu import ConsoleMenu
from consolemenu.items import FunctionItem
from tabulate import tabulate
from Tools import Template, csv

from Model import trx_model


def trx_menu():
    menu = ConsoleMenu("Transaction Menu", "Select an option")
    menu.append_item(FunctionItem("View Transaction", view_table))
    # menu.append_item(FunctionItem("Filter Transaction", export_trx))
    menu.append_item(FunctionItem("Export Transaction", export_trx))
    menu.show()


def view_table():
    view_option = Template.bullet_menu(
        "What do you want to see?", ["Stock In", "Stock Out"], return_index=True
    )
    if view_option[1] == 0:
        view_table_in()
    elif view_option[1] == 1:
        view_table_out()


def view_table_in():
    trx_list = trx_model.select_trx_in_list()
    print(tabulate(trx_list, headers=["Serial Tong", "Merk", "Admin"], tablefmt="fancy_grid"))
    input("Press enter to continue")


def view_table_out():
    trx_list = trx_model.select_trx_out_list()
    print(tabulate(trx_list, headers=["Serial Tong", "Merk", "Admin", "Vessel Name"], tablefmt="fancy_grid"))
    input("Press enter to continue")


def export_trx():
    filter_option = Template.bullet_menu(
        "What do you want to filter?", ["Stock In", "Stock Out"], return_index=True
    )
    if filter_option[1] == 0:
        trx_in = trx_model.select_trx_in_list()
        header = ["Serial Tong", "Merk", "Admin"]
        csv.create_csv(header, trx_in)
    elif filter_option[1] == 1:
        trx_out = trx_model.select_trx_out_list()
        header = ["Serial Tong", "Merk", "Admin", "Vessel Name"]
        csv.create_csv(header, trx_out)
