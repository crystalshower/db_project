from bullet import SlidePrompt, Input, colors, Bullet
from consolemenu import ConsoleMenu
from consolemenu.items import FunctionItem

import Model.company_model as company_model


def company_menu():
    menu = ConsoleMenu("Company", "Select an option")

    menu.append_item(FunctionItem("Add Company", add_company))
    # menu.append_item(FunctionItem("Edit Company", edit_company))
    menu.append_item(FunctionItem("View Company", view_company))
    # menu.append_item(FunctionItem("Delete Company", delete_company))
    # menu.append_item(FunctionItem("Exit", exit))

    menu.show()


def add_company():
    add_form = SlidePrompt(
        [
            Input("Enter new company name: ",
                  word_color=colors.foreground["green"]),
            Input("Enter new company address: ",
                  word_color=colors.foreground["green"])
        ]
    )
    result = add_form.launch()

    data = [result[0][1], result[1][1]]
    print(data)
    if company_model.insert_company(data):
        print("Company added successfully")
    else:
        print("Company could not be added")


def view_company():
    # Convert mysql data to list
    company_list = company_model.select_all_companies()
    for company in company_list:
        print(company)
