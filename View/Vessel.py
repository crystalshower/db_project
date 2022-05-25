import Model.vessel_model as vessel_model
from consolemenu import ConsoleMenu
from consolemenu.items import FunctionItem


def vessel_menu():
    vessel_menu = ConsoleMenu("Vessel Menu", "Select an option")

    # Add items
    vessel_menu.append_item(FunctionItem("Add Vessel", add_vessel))
    # vessel_menu.append_item(FunctionItem("View Vessels", view_vessels))
    # vessel_menu.append_item(FunctionItem("Edit Vessel", edit_vessel))
    # vessel_menu.append_item(FunctionItem("Delete Vessel", delete_vessel))

    # Show menu
    vessel_menu.show()


def add_vessel():

    vessel_model.add_vessel()