# Xom Data · Generate spiral matrix
# Problem: https://xomdata.com/practice/py-spiral-generate
# Solved: 2026-09-04

def generate_spiral(n):
    res = [[0] * n for _ in range(n)]
    x = 1
    for layer in range(n // 2):
        for j in range(layer, n - layer - 1):
            res[layer][j] = x
            x += 1
        for i in range(layer, n - layer - 1):
            res[i][n - layer - 1] = x
            x += 1
        for j in range(n - layer - 1, layer, -1):
            res[n - layer - 1][j] = x
            x += 1
        for i in range(n - layer - 1, layer, -1):
            res[i][layer] = x
            x += 1
    if n % 2 != 0: res[n // 2][n // 2] = x
    return res
    pass
