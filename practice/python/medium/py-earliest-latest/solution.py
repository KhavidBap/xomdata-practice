# Xom Data · Earliest and latest date in the ledger
# Problem: https://xomdata.com/practice/py-earliest-latest
# Solved: 2026-08-19

def date_span(dates):
    if dates == []: return None
    else:
        dates.sort()
        return (dates[0], dates[-1])
    pass
