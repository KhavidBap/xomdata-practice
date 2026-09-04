# Xom Data · How many cells is each column missing
# Problem: https://xomdata.com/practice/pd-missing-count
# Solved: 2026-09-04

import pandas as pd


def missing_by_column(table):
    return table.isna().sum()
