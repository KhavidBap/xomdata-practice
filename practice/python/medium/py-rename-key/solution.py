# Xom Data · Rename a field across every record
# Problem: https://xomdata.com/practice/py-rename-key
# Solved: 2026-08-19

def rename_key(rows, old, new):
    if rows == []: return []
    else:
        res = []
        for row in rows:
            dict = {}
            for col in row:
                if col != old: dict[col] = row[col]
                else: dict[new] = row[old]
            res.append(dict)
        return res
    pass
