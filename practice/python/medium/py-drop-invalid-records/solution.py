# Xom Data · Drop records missing a required field
# Problem: https://xomdata.com/practice/py-drop-invalid-records
# Solved: 2026-09-18

def keep_valid(rows, required):
    res = []
    for row in rows:
        flag = True
        for field in required:
            if field not in row:
                flag = False
                break
            val = row[field]
            if val is None:
                flag = False
                break
            if isinstance(val, str) and val.strip() == "":
                flag = False
                break
        if flag: res.append(row)
    return res
    pass
