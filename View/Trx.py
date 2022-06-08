from consolemenu import ConsoleMenu
from consolemenu.items import FunctionItem
from bullet import SlidePrompt, Input, colors
from tabulate import tabulate

from Tools.Template import *


def trx_menu():
    menu =  ConsoleMenu("Transaction Menu", "Select an option")
    menu.append_item(FunctionItem("View Transaction", view_table))
    menu.append_item(FunctionItem("Transaction Report", view_table))
    menu.show()