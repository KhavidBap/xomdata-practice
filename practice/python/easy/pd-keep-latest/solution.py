# Xom Data · Keep the latest status of each order
# Problem: https://xomdata.com/practice/pd-keep-latest
# Solved: 2026-09-04

import pandas as pd


def keep_latest(events, key):
    return events[~events.duplicated(key, keep="last")]
