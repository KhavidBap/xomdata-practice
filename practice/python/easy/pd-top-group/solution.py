# Xom Data · The city that brought in the most
# Problem: https://xomdata.com/practice/pd-top-group
# Solved: 2026-09-04

import pandas as pd


def best_city(orders):
    total = orders.groupby("city")["amount"].sum()
    return total.sort_values(ascending=False).index[0]
