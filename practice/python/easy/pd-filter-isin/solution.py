# Xom Data · Keep only the cities we are watching
# Problem: https://xomdata.com/practice/pd-filter-isin
# Solved: 2026-08-18

import pandas as pd


def only_cities(orders, cities):
    orders = orders[orders['city'].isin(cities)]
    return orders
