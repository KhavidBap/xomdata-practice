# Xom Data · Rename columns to match the report
# Problem: https://xomdata.com/practice/pd-rename-columns
# Solved: 2026-08-18

import pandas as pd


def rename_columns(table, mapping):
    col = table.rename(columns=mapping)
    return col
