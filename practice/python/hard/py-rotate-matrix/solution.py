# Xom Data · Rotate image
# Problem: https://xomdata.com/practice/py-rotate-matrix
# Solved: 2026-09-03

def rotate_90(mat):
    n = len(mat)
    res = [[0] * n for _ in range(n)]
    for i in range(n):
        for j in range(n):
            res[j][n - i - 1] = mat[i][j]
    return res
    pass
