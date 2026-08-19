# Xom Data · Distance between two dates
# Problem: https://xomdata.com/practice/py-days-between
# Solved: 2026-08-19

from datetime import datetime

def days_between(a, b):
    return int(abs(datetime.fromisoformat(a).timestamp() - datetime.fromisoformat(b).timestamp()) / 86400)
    pass
