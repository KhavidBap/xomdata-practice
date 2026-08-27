# Xom Data · Gray code
# Problem: https://xomdata.com/practice/py-gray-code
# Solved: 2026-08-27

def gray_code(n):
    if n == 0: return [0]
    res = [0, 1]
    for i in range(2, n + 1):
        size = len(res)
        for j in range(size - 1, -1, -1):
            res.append(res[j] | (1 << (i - 1)))
    return res
    pass
