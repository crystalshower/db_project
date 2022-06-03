from consolemenu import ConsoleMenu
from consolemenu.items import FunctionItem
from bullet import SlidePrompt, Input, colors
from tabulate import tabulate

from View.Template import bullet_menu

import Model.merk_model as merk_model

def merk_menu():
    """
    Merk Menu
    """
    merk_menu = ConsoleMenu("Merk Menu", "Select an option")

    # Add items
    merk_menu.append_item(FunctionItem("Add Merk", add_merk))
    merk_menu.append_item(FunctionItem("View Merks", view_table))
    merk_menu.append_item(FunctionItem("Edit Merk", edit_merk))
    merk_menu.append_item(FunctionItem("Delete Merk", delete_merk))

    # Show menu
    merk_menu.show()


def add_merk():
    """
    Add new merk
    """
    input_prompt = SlidePrompt(
        [Input("Enter merk name: ", word_color=colors.foreground["yellow"])]
    )
    merk_name = input_prompt.launch()[0][1]

    res = merk_model.insert([merk_name,])
    if res:
        print("{} added successfully".format(merk_name))
        input("Press enter to continue")
    else:
        print("Merk not added")
        input("Press enter to continue")


def view_table():
    """
    View all merks
    """
    merk_list = [[i[1], i[2]] for i in merk_model.select()]
    print(tabulate(merk_list, headers=["Merk Name", "Date Added"], tablefmt="fancy_grid"))
    input("Press enter to continue")


def edit_merk():
    """
    Edit merk
    """
    rows = merk_model.select()
    choices_merk = bullet_menu(
        "Select merk to edit: ", [i[1] for i in rows], return_index=True
    )
    new_merk_name = SlidePrompt(
        [Input("Enter new merk name: ", word_color=colors.foreground["green"])]
    )
    new_merk_name = new_merk_name.launch()[0][1]
    res = merk_model.update([new_merk_name, rows[choices_merk[1]][0]])
    if res:
        print("Merk updated successfully")
        input("Press enter to continue")
    else:
        print("Merk could not be updated")
        input("Press enter to continue")


def delete_merk():
    """
    Delete merk
    """
    rows = merk_model.select()
    choices_merk = bullet_menu(
        "Select merk to delete: ", [i[1] for i in rows], return_index=True
    )
    res = merk_model.soft_delete([rows[choices_merk[1]][0]])
    if res:
        print("Merk deleted successfully")
        input("Press enter to continue")
    else:
        print("Merk could not be deleted")
        input("Press enter to continue")
