import csv
import tkinter as tk
from tkinter import filedialog


def create_csv(header, data):
    """
    Create csv file from data.
    :param data:
    :return:
    """
    root = tk.Tk()
    root.withdraw()

    # file dialog to save file as csv
    filename = filedialog.asksaveasfilename(filetypes=[("CSV", "*.csv")],
                                            defaultextension=".csv")
    with open(filename, 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(header)
        writer.writerows(data)
