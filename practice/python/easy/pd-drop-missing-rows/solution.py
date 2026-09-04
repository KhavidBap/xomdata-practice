# Xom Data · Drop rows missing required information
# Problem: https://xomdata.com/practice/pd-drop-missing-rows
# Solved: 2026-09-04

import pandas as pd


def drop_incomplete(table, required):
    return table.dropna(subset=required)
