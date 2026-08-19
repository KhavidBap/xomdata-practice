# Xom Data · Turn a table's rows into columns
# Problem: https://xomdata.com/practice/py-transpose-matrix
# Solved: 2026-08-19

def transpose(table):
    if table == []: return []
    else:
        res = []
        for i in range(len(table[0])): res.append([lst[i] for lst in table])
        return res
    pass
