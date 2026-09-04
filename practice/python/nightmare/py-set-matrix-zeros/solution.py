# Xom Data · Set matrix zeroes
# Problem: https://xomdata.com/practice/py-set-matrix-zeros
# Solved: 2026-09-04

def set_zeroes(mat):
    if not mat: return 0
    n, m = len(mat), len(mat[0])
    rows, cols = [False] * n, [False] * m
    for i in range(n):
        for j in range(m):
            if mat[i][j] == 0:
                rows[i], cols[j] = True, True
    for i in range(n):
        for j in range(m):
            if rows[i] or cols[j]: mat[i][j] = 0
    return mat
    pass
