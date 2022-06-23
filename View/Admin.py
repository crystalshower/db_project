from bullet import SlidePrompt, Input, colors
from consolemenu import ConsoleMenu
from consolemenu.items import FunctionItem
from tabulate import tabulate

from Model import admin_model
from View import Login


def admin_menu():
    menu = ConsoleMenu("Admin", "Select an option")
    menu.append_item((FunctionItem("Change account password", change_password)))
    if Login.user_id == 1:
        menu.append_item((FunctionItem("Add Admin", add_admin)))
        # menu.append_item((FunctionItem("Edit Other Admin", edit_company)))
        menu.append_item((FunctionItem("View Admin", view_admin)))
        # menu.append_item((FunctionItem("Delete Admin", delete_company)))
    menu.show()


def add_admin():
    """
    Add admin
    :return:
    """
    add_form = SlidePrompt(
        [
            Input("Enter new admin username: ", word_color=colors.foreground["green"]),
            Input("Enter new admin password: ", word_color=colors.foreground["green"]),
        ]
    )
    result = add_form.launch()
    data = [result[0][1], result[1][1]]
    print(data)
    if admin_model.insert(data):
        print("Admin added successfully")
    else:
        print("Admin could not be added")


def view_admin():
    """
    View admin
    :return:
    """
    rows = admin_model.select_all_active()
    print(tabulate(rows, headers=["ID", "Username", "Password"], tablefmt="fancy_grid"))
    input("Press enter to continue")


def change_password():
    pass
