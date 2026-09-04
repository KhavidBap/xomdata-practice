# Xom Data · Rotting oranges
# Problem: https://xomdata.com/practice/py-rotting-oranges
# Solved: 2026-09-04

def isSafe(i, j, n, m):
    return 0 <= i < n and 0 <= j < m

def oranges_rotting(mat):
    n = len(mat)
    m = len(mat[0])
    changed = False
    elapsedTime = 0
    directions = [[1, 0], [0, 1], [-1, 0], [0, -1]]
    while True:
        for i in range(n):
            for j in range(m):
                if mat[i][j] == elapsedTime + 2:
                    for dir in directions:
                        x = i + dir[0]
                        y = j + dir[1]
                        if isSafe(x, y, n, m) and mat[x][y] == 1:
                            mat[x][y] = mat[i][j] + 1
                            changed = True
        if not changed: break
        changed = False
        elapsedTime += 1
    for i in range(n):
        for j in range(m):
            if mat[i][j] == 1: return -1
    return elapsedTime
    pass
