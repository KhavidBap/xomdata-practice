# Xom Data · Match a CSV line to its column names
# Problem: https://xomdata.com/practice/py-csv-line-record
# Solved: 2026-09-18

def to_record(header, line):
    val = line.split(',')
    return {col: val[i] if i < len(val) else '' for i, col in enumerate(header)}
    pass
