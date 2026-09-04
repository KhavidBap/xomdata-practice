# Xom Data · Average order value per sales channel
# Problem: https://xomdata.com/practice/pd-group-mean-round
# Solved: 2026-09-04

import pandas as pd


def average_order_value(orders):
    return orders.groupby("channel")["amount"].mean().round(2).sort_index()
