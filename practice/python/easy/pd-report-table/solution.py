# Xom Data · Turn the raw table into something you can send
# Problem: https://xomdata.com/practice/pd-report-table
# Solved: 2026-08-18

import pandas as pd

def report_table(raw):
    col = raw.rename(columns={'rev': 'revenue', 'cty':'city'})
    srt = col.sort_values(by=['revenue', 'city'], ascending=[False, True]).reset_index()
    return srt[['city', 'revenue']]
