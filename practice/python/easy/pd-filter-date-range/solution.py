# Xom Data · Orders within a date range
# Problem: https://xomdata.com/practice/pd-filter-date-range
# Solved: 2026-08-18

import pandas as pd


def orders_between(orders, start, end):
    orders = orders[(orders['order_date'] >= start) & (orders['order_date'] <= end)]
    return orders
