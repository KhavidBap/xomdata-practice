# Xom Data · Flag the customers who spent a lot this year
# Problem: https://xomdata.com/practice/pd-flag-threshold
# Solved: 2026-09-04

import pandas as pd
import numpy as np


def flag_big_spenders(customers, threshold):
    result = customers.copy()
    result["tier"] = result["spend"].apply(
        lambda x: "VIP" if x >= threshold else "Regular"
    )
    return result
