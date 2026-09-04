# Xom Data · Clean up a hand-typed city column
# Problem: https://xomdata.com/practice/pd-clean-text
# Solved: 2026-09-04

import pandas as pd


def clean_city(table, column):
    result = table.copy()
    result[column] = result[column].str.strip().str.title()
    return result
