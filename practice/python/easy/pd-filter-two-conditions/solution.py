# Xom Data · Large orders from one sales channel
# Problem: https://xomdata.com/practice/pd-filter-two-conditions
# Solved: 2026-09-04

import pandas as pd


def channel_orders(orders, channel, min_amount):
    return orders[(orders["channel"] == channel) & (orders["amount"] >= min_amount)]
