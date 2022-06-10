from bullet import SlidePrompt, Input
from consolemenu import ConsoleMenu
from consolemenu.items import FunctionItem
from tabulate import tabulate

import Model.company_model as company_model
from Tools.Database import insert_update
from Tools.Template import *


def company_menu():
    menu = ConsoleMenu("Company", "Select an option")

    menu.append_item(FunctionItem("Add Company", add_company))
    menu.append_item(FunctionItem("Edit Company", edit_company))
    menu.append_item(FunctionItem("View Company", view_company))
    menu.append_item(FunctionItem("Delete Company", delete_company))

    menu.show()


def add_company():
    """
    Add company
    :return:
    """
    add_form = SlidePrompt(
        [
            Input("Enter new company name: ", word_color=colors.foreground["green"]),
            Input("Enter new company address: ", word_color=colors.foreground["green"]),
        ]
    )
    result = add_form.launch()

    data = [result[0][1], result[1][1]]
    print(data)
    if company_model.insert_company(data):
        print("Company added successfully")
    else:
        print("Company could not be added")


def edit_company():
    """
    Edit company
    :return:
    """
    rows = company_model.select_all_companies()
    choices_company = bullet_menu(
        "Select company to edit: ", [i[1] for i in rows], return_index=True
    )
    what_edited = bullet_menu(
        "What do you want to edit?", ["Company Name", "Company Address"], return_index=True
    )
    if what_edited[1] == 0:
        new_name = SlidePrompt(
            [Input("Enter new company name: ", word_color=colors.foreground["green"])]
        )
        result = new_name.launch()
        sql = "UPDATE company SET company_name = %s WHERE id_company = %s;"
        res = insert_update(sql, (result[0][1], rows[choices_company[1]][0]))
        if res:
            print("Company name updated successfully")
            input("Press enter to continue")
        else:
            print("Company name could not be updated")
            input("Press enter to continue")
    elif what_edited[1] == 1:
        new_address = SlidePrompt(
            [Input("Enter new company address: ", word_color=colors.foreground["green"])]
        )
        result = new_address.launch()
        sql = "UPDATE company SET alamat = %s WHERE id_company = %s;"
        res = insert_update(sql, (result[0][1], rows[choices_company[1]][0]))
        if res:
            print("Company address updated successfully")
            input("Press enter to continue")
        else:
            print("Company address could not be updated")
            input("Press enter to continue")


def view_company():
    """
    View table using tabulate
    :param:
    :return:
    """
    rows = [[i[1], i[2], i[3]] for i in company_model.select_all_companies()]
    print(
        tabulate(
            rows,
            headers=["Vessel Name", "Company Owner", "Date Added"],
            tablefmt="fancy_grid",
        )
    )
    input("Press enter to continue")


def delete_company():
    """
    Delete company
    :return:
    """
    rows = company_model.select_all_companies()
    choices_company = bullet_menu(
        "Select company to delete: ", [i[1] for i in rows], return_index=True
    )
    confirm_delete = yesno("Are you sure you want to delete this company?")

    if confirm_delete:
        sql = "UPDATE company SET comp_active_status = 0, comp_tanggal_dihapus = now() WHERE id_company = %s;"
        print(rows[choices_company[1]][0])
        res = insert_update(sql, ((rows[choices_company[1]][0]),))
        if res:
            print("Company deleted successfully")
            input("Press enter to continue")
        else:
            print("")
            input("Press enter to continue")
