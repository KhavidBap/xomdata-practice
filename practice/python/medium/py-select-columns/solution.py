# Xom Data · Pick the columns to export from a record table
# Problem: https://xomdata.com/practice/py-select-columns
# Solved: 2026-08-19

def select_columns(rows, columns):
    if rows == []: return []
    else:
        res = []
        for row in rows:
            dict = {}
            for col in columns:
                if col in row: dict[col] = row[col]
            res.append(dict)
        return res
    pass
