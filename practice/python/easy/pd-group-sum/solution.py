# Xom Data · Revenue per city
# Problem: https://xomdata.com/practice/pd-group-sum
# Solved: 2026-09-04

import pandas as pd


def revenue_by_city(orders):
    return orders.groupby("city")["amount"].sum().sort_index()
