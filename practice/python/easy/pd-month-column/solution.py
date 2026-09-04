# Xom Data · Add a month column from the order date
# Problem: https://xomdata.com/practice/pd-month-column
# Solved: 2026-09-04

import pandas as pd


def add_month(orders):
    result = orders.copy()
    result["month"] = pd.to_datetime(result["order_date"]).dt.strftime("%Y-%m")
    return result
