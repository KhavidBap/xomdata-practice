# Xom Data · Trim the table down for a report
# Problem: https://xomdata.com/practice/pd-pick-columns
# Solved: 2026-08-18

import pandas as pd


def pick_columns(table, columns):
    return table[columns]
