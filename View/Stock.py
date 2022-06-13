from bullet import SlidePrompt, Input
from consolemenu import ConsoleMenu
from consolemenu.items import FunctionItem
from tabulate import tabulate

from Model import trx_model, stock_model
from Model.merk_model import select
from Model.vessel_model import select_active
from Tools.Template import *
from View import Login


def stock_menu():
    """
    Stock Menu
    """
    menu = ConsoleMenu("Stock Menu", "Select an option")

    # Add items
    menu.append_item(FunctionItem("Manage Stock", manage_stock))
    menu.append_item(FunctionItem("View Stocks", view_table))
    # menu.append_item(FunctionItem("Edit Stock", edit_stock))
    # menu.append_item(FunctionItem("Delete Stock", delete_stock))

    # Show menu
    menu.show()


def manage_stock():
    """
    Manage stock
    """
    manage_option = bullet_menu(
        "What do you want to do?", ["Stock In", "Stock Out"], return_index=True
    )

    if manage_option[1] == 0:
        stock_in()
    elif manage_option[1] == 1:
        stock_out()


def stock_in():
    """
    Stock i4n
    """
    admin_id = Login.user_id
    merk_list = select()

    merk_choice = bullet_menu(
        "Select merk: ", [i[1] for i in merk_list], return_index=True
    )

    input_prompt = SlidePrompt(
        [Input("Enter Tong Serial number: ", word_color=colors.foreground["yellow"])]
    )

    serial_number = input_prompt.launch()[0][1]
    fk_merk = merk_list[merk_choice[1]][0]
    print(fk_merk)

    res, insert_id = stock_model.insert_stock_in((fk_merk, serial_number))

    if res:
        trx_model.insert_in([insert_id, admin_id, "in"])
        print("Stock added successfully")
        input("Press enter to continue")
    else:
        print("Stock not added")
        input("Press enter to continue")


def stock_out():
    """
    Stock out
    """
    stock_list = stock_model.select_stock()
    vessel_list = select_active()

    if stock_list is None or vessel_list is None:
        print("No stock or vessel available.\nPlease add stock or vessel first\n")
        input("Press enter to continue")
        return

    stock_option = []
    for i in stock_list:
        menu_option = "Tong Serial Number: " + i[1] + " - Merk: " + i[2]
        stock_option.append(menu_option)

    stock_choice = bullet_menu(
        "Select stock to use: ",
        stock_option,
        return_index=True,
    )
    vessel_choice = bullet_menu(
        "Used on Vessel: ",
        [i[2] for i in vessel_list],
        return_index=True,
    )

    fk_stock = stock_list[stock_choice[1]][0]
    fk_vessel = vessel_list[vessel_choice[1]][0]

    res = stock_model.update_stock((fk_stock,))

    if res:
        trx_model.insert_out([fk_stock, Login.user_id, fk_vessel, "out"])
        print("Stock out successfully")
        input("Press enter to continue")
    else:
        print("Stock out failed")
        input("Press enter to continue")


def view_table():
    """
    View table
    """
    stock_list = stock_model.select_stock()

    print(
        tabulate(
            stock_list,
            headers=["Tong Serial", "Merk", "Serial Number"],
            tablefmt="fancy_grid",
        )
    )
    input("Press enter to continue")
