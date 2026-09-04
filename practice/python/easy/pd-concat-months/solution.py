# Xom Data · Merge two months into one table
# Problem: https://xomdata.com/practice/pd-concat-months
# Solved: 2026-09-04

import pandas as pd


def combine_months(first, second):
    return pd.concat([first, second], ignore_index=True)
