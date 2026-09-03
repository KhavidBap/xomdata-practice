# Xom Data · Pascal's triangle
# Problem: https://xomdata.com/practice/py-pascal-triangle
# Solved: 2026-09-03

def binomial(n, k):
    res = 1
    if k > n - k:
        k = n - k
    for i in range(k):
        res *= (n - i)
        res //= (i + 1)
    return res

def pascal(n):
    mat = []
    for row in range(n):
        arr = []
        for i in range(row + 1):
            arr.append(binomial(row, i))
        mat.append(arr)
    return mat
    pass
