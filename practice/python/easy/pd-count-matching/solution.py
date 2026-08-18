# Xom Data · Count the orders that missed the promise
# Problem: https://xomdata.com/practice/pd-count-matching
# Solved: 2026-08-18

import pandas as pd


def late_count(orders, promised_days):
    orders = orders[orders['delivery_days'] > promised_days]
    return orders['order_id'].count()
