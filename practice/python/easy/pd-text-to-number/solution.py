# Xom Data · The amount column arrived as text with commas
# Problem: https://xomdata.com/practice/pd-text-to-number
# Solved: 2026-09-04

import pandas as pd


def amounts_to_number(table, column):
    result = table.copy()
    result[column] = result[column].str.replace(",", "").astype(int)
    return result
