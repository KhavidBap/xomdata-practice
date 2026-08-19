# Xom Data · Row totals and column totals of a table
# Problem: https://xomdata.com/practice/py-row-col-sums
# Solved: 2026-08-19

def row_col_sums(table):
    if table == []: return ([], [])
    else:
        row = []
        col = []
        for lst in table: row.append(sum(lst))
        for i in range(len(table[0])): col.append(sum([lst[i] for lst in table]))
        return (row, col)
    pass
