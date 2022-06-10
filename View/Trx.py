from consolemenu import ConsoleMenu
from consolemenu.items import FunctionItem


def trx_menu():
    menu = ConsoleMenu("Transaction Menu", "Select an option")
    menu.append_item(FunctionItem("View Transaction", view_table))
    menu.append_item(FunctionItem("Transaction Report", view_table))
    menu.show()
