# Xom Data · Fill the blanks of one column with a default
# Problem: https://xomdata.com/practice/pd-fill-missing
# Solved: 2026-09-04

import pandas as pd


def fill_missing(table, column, value):
    result = table.copy()
    result[column] = result[column].fillna(value)
    return result
