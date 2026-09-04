# Xom Data · Sales summary table by city
# Problem: https://xomdata.com/practice/pd-group-agg-table
# Solved: 2026-09-04

import pandas as pd


def sales_summary(orders):
    return (
        orders.groupby("city")
        .agg(orders=("order_id", "count"),
             revenue=("amount", "sum"))
        .reset_index()
        .sort_values("city")
        .reset_index(drop=True)
    )
