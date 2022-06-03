from consolemenu import ConsoleMenu
from consolemenu.items import FunctionItem
from bullet import SlidePrompt, Input, colors

from View.Template import *
from Tools.Database import *
from Model.merk_model import select


def stock_menu():
    """
    Stock Menu
    """
    menu = ConsoleMenu("Stock Menu", "Select an option")

    # Add items
    menu.append_item(FunctionItem("Add Stock", add_stock))
    # menu.append_item(FunctionItem("View Stocks", view_table))
    # menu.append_item(FunctionItem("Edit Stock", edit_stock))
    # menu.append_item(FunctionItem("Delete Stock", delete_stock))

    # Show menu
    menu.show()


def add_stock():
    """
    Add new stock
    """
    merk_list = [i[1] for i in select()]

    merk_choice = bullet_menu(
        "Select merk: ", merk_list, return_index=True
    )

    input_prompt = SlidePrompt(
        [
            Input("Enter Tong Serial number: ", word_color=colors.foreground["yellow"])
        ]
    )

    serial_number = input_prompt.launch()[0][1]
    merk = merk_choice[1]

    sql = "INSERT INTO stock (serial_number, merk_id) VALUES (%s, %s);"
    res = insert_update(sql, [serial_number, merk])

    if res:
        print("Stock added successfully")
        input("Press enter to continue")
    else:
        print("Stock not added")
        input("Press enter to continue")
    


    
