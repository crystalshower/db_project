import Model.vessel_model as vessel_model


def show_vessel(vessel_id):
    vessel = vessel_model.get_vessel(vessel_id)
    return vessel
