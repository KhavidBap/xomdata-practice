# Xom Data · Remove a column that must not leave the company
# Problem: https://xomdata.com/practice/pd-drop-column
# Solved: 2026-08-18

import pandas as pd


def drop_column(table, column):
    if column in table.columns: table = table.drop(column, axis=1)
    return table
