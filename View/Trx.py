from bullet import SlidePrompt, Input, colors
from consolemenu import ConsoleMenu
from consolemenu.items import FunctionItem
from tabulate import tabulate

from Model import trx_model
from Tools import Template, csv


def trx_menu():
    menu = ConsoleMenu("Transaction Menu", "Select an option")
    menu.append_item(FunctionItem("View Transaction", view_transaction))
    menu.append_item(FunctionItem("View by date", view_by_date))
    menu.append_item(FunctionItem("Export Transaction", export_trx))
    menu.show()


def view_transaction():
    view_option = Template.bullet_menu(
        "What do you want to see?", ["Stock In", "Stock Out"], return_index=True
    )
    if view_option[1] == 0:
        view_table_in()
    elif view_option[1] == 1:
        view_table_out()


def view_by_date():
    """
    View transaction by date
    """
    date_form = SlidePrompt(
        [
            Input("Enter date (yyyy-mm-dd): ",
                  word_color=colors.foreground["yellow"])
        ]
    )
    view_option = Template.bullet_menu(
        "What do you want to see?", ["Stock In", "Stock Out"], return_index=True
    )
    result = date_form.launch()

    if view_option[1] == 0:
        trx_list = trx_model.select_by_date(result[0][1], "in")
        print(tabulate(trx_list, headers=["Serial Tong", "Merk", "Admin", "Tanggal Transaksi"], tablefmt="fancy_grid"))
        input("Press enter to continue")
    elif view_option[1] == 1:
        trx_list = trx_model.select_by_date(result[0][1], "out")
        print(tabulate(trx_list, headers=["Serial Tong", "Merk", "Admin", "Vessel Name", "Tanggal Transaksi"],
                       tablefmt="fancy_grid"))
        input("Press enter to continue")


def view_table_in():
    trx_list = trx_model.select_trx_in_list()
    print(tabulate(trx_list, headers=["Serial Tong", "Merk", "Admin", "Tanggal Transaksi"], tablefmt="fancy_grid"))
    input("Press enter to continue")


def view_table_out():
    trx_list = trx_model.select_trx_out_list()
    print(tabulate(trx_list, headers=["Serial Tong", "Merk", "Admin", "Vessel Name", "Tanggal Transaksi"],
                   tablefmt="fancy_grid"))
    input("Press enter to continue")


def export_trx():
    filter_option = Template.bullet_menu(
        "What data do you want to export?", ["Stock In", "Stock Out"], return_index=True
    )
    if filter_option[1] == 0:
        trx_in = trx_model.select_trx_in_list()
        header = ["Serial Tong", "Merk", "Admin"]
        csv.create_csv(header, trx_in)
    elif filter_option[1] == 1:
        trx_out = trx_model.select_trx_out_list()
        header = ["Serial Tong", "Merk", "Admin", "Vessel Name"]
        csv.create_csv(header, trx_out)
