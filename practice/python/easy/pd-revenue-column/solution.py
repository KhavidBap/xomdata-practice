# Xom Data · Add the line total to each order
# Problem: https://xomdata.com/practice/pd-revenue-column
# Solved: 2026-09-04

import pandas as pd


def add_revenue(orders):
    result = orders.copy()
    result["revenue"] = result["quantity"] * result["unit_price"]
    return result
