# Xom Data · The best-selling products
# Problem: https://xomdata.com/practice/pd-sort-top-n
# Solved: 2026-08-18

import pandas as pd


def top_products(products, n):
    products = products.sort_values(by=['sold', 'name'], ascending=[False, True]).reset_index(drop=True)
    return products[:n]
