# Xom Data · Bring the customer name into the order table
# Problem: https://xomdata.com/practice/pd-merge-lookup
# Solved: 2026-09-04

import pandas as pd


def attach_customer_name(orders, customers):
    result = orders.merge(
        customers[["customer_id", "name"]],
        on="customer_id",
        how="inner",
        sort=False
    )
    return result.reset_index(drop=True)
