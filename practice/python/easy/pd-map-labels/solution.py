# Xom Data · Turn status codes into words people read
# Problem: https://xomdata.com/practice/pd-map-labels
# Solved: 2026-09-04

import pandas as pd


def label_status(orders, labels):
    result = orders.copy()
    result["status_label"] = result["status"].map(labels)
    return result
