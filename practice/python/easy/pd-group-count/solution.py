# Xom Data · How many orders each staff member closed
# Problem: https://xomdata.com/practice/pd-group-count
# Solved: 2026-09-04

import pandas as pd


def orders_per_staff(orders):
    result = orders["staff"].value_counts().sort_index()
    result.name = None
    return result
