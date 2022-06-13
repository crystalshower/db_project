from bullet import colors, SlidePrompt, Input, Bullet, YesNo
from consolemenu import ConsoleMenu
from consolemenu.items import FunctionItem
from prettytable import PrettyTable
from tabulate import tabulate

from Model.company_model import select_all_companies
from Model.vessel_model import select_active
from Tools.Database import insert_update
from View.Template import bullet_menu


def vessel_menu():
    """
    Vessel Menu
    :return:
    """
    vessel_menu = ConsoleMenu("Vessel Menu", "Select an option")

    # Add items
    vessel_menu.append_item(FunctionItem("Add Vessel", add_vessel))
    vessel_menu.append_item(FunctionItem("View Vessels", view_table))
    vessel_menu.append_item(FunctionItem("Edit Vessel", edit_vessel))
    vessel_menu.append_item(FunctionItem("Delete Vessel", delete_vessel))

    # Show menu
    vessel_menu.show()


def add_vessel():
    """
    Add new vessel
    :return:
    """
    company_list = select_all_companies()
    input_prompt = SlidePrompt(
        [Input("Enter vessel name: ", word_color=colors.foreground["yellow"])]
    )
    choices = Bullet(
        prompt="Select company owner: ",
        choices=[i[1] for i in company_list],
        word_color=colors.foreground["green"],
        return_index=True,
    )

    vessel_name = input_prompt.launch()[0][1]
    company_index = choices.launch()[1]
    company_id = company_list[company_index][0]

    sql = "INSERT INTO vessel (nama_vessel, id_company) VALUES (%s, %s)"
    res = insert_update(sql, (vessel_name, company_id))
    if res:
        print("{} added successfully".format(vessel_name))
        input("Press enter to continue")
    else:
        print("Vessel not added")
        input("Press enter to continue")


# Unused code
def view_vessels():
    """
    View all vessels
    :return:
    """
    rows = select_active()

    # Show rows using prettytable
    table = PrettyTable()
    table.field_names = ["Vessel Name", "Company Owner", "Date Added"]

    for i in rows:
        table.add_row([i[2], i[6], i[3]])
    print(table)
    input("Press enter to continue")


def view_table():
    """
    View table using tabulate
    :param:
    :return:
    """
    rows = [[i[2], i[6], i[3]] for i in select_active()]
    print(
        tabulate(
            rows,
            headers=["Vessel Name", "Company Owner", "Date Added"],
            tablefmt="fancy_grid",
        )
    )
    input("Press enter to continue")


def edit_vessel():
    """
    Edit vessel
    :return:
    """
    rows = select_active()
    choices_vessel = bullet_menu(
        "Select vessel to edit: ", [i[2] for i in rows], return_index=True
    )
    choices_edit = bullet_menu(
        "Select field to edit: ", ["Vessel Name", "Company Owner"], return_index=True
    )

    if choices_edit[1] == 0:
        input_prompt = SlidePrompt(
            [Input("Enter vessel name: ", word_color=colors.foreground["yellow"])]
        )
        vessel_name = input_prompt.launch()[0][1]
        sql = "UPDATE vessel SET nama_vessel = %s WHERE id_vessel = %s"
        res = insert_update(sql, (vessel_name, rows[choices_vessel[1]][0]))
        if res:
            print("Vessel name updated successfully")
            input("Press enter to continue")
        else:
            print("Vessel name not updated")
            input("Press enter to continue")
    elif choices_edit[1] == 1:
        company_list = select_all_companies()
        choices = Bullet(
            prompt="Select company owner: ",
            choices=[i[1] for i in company_list],
            word_color=colors.foreground["green"],
            return_index=True,
        )
        company_index = choices.launch()[1]
        company_id = company_list[company_index][0]
        sql = "UPDATE vessel SET id_company = %s WHERE id_vessel = %s"
        res = insert_update(sql, (company_id, rows[choices_vessel[1]][0]))
        if res:
            print("Company owner updated successfully")
            input("Press enter to continue")
        else:
            print("Company owner not updated")
            input("Press enter to continue")


def delete_vessel():
    """
    Delete vessel
    :return:
    """
    rows = select_active()
    choices_vessel = bullet_menu(
        "Select vessel to delete: ", [i[2] for i in rows], return_index=True
    )
    confirm_delete = YesNo(
        prompt="Are you sure you want to delete {}? ".format(rows[choices_vessel[1]][2])
    )
    if confirm_delete.launch():
        sql = "UPDATE vessel SET vs_active_status = 0, vs_tanggal_dihapus = now() WHERE id_vessel = %s"
        print(rows[choices_vessel[1]][0])
        res = insert_update(sql, ((rows[choices_vessel[1]][0]),))
        if res:
            print("Vessel deleted successfully")
            input("Press enter to continue")
        else:
            print("Vessel not deleted")
            input("Press enter to continue")
