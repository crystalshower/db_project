from consolemenu import ConsoleMenu
from consolemenu.items import FunctionItem
from bullet import SlidePrompt, Input, colors
from tabulate import tabulate

from Tools.Template import *
from Model.merk_model import select
from Model import trx_model, stock_model
from Model.vessel_model import select_active
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
        trx_model.insert([insert_id, admin_id, "in"])
        print("Stock added successfully")
        input("Press enter to continue")
    else:
        print("Stock not added")
        input("Press enter to continue")


def stock_out():
    """
    Stock out
    """
    stock_list = select_stock()
    vessel_list = select_active()

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


def view_table():
    """
    View table
    """
    stock_list = select_stock()
    print(stock_list)

    print(
        tabulate(
            stock_list,
            headers=["Tong Serial", "Merk", "Serial Number"],
            tablefmt="fancy_grid",
        )
    )
    input("Press enter to continue")
