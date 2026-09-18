# Xom Data · Game of life
# Problem: https://xomdata.com/practice/py-game-of-life
# Solved: 2026-09-18

def game_of_life(mat):
    m, n = len(mat), len(mat[0])
    nextGen = [[0]*n for _ in range(m)]
    directions = [
        (0,1), (1,0), (0,-1), (-1,0),
        (1,1), (-1,-1), (1,-1), (-1,1)
    ]
    for i in range(m):
        for j in range(n):
            live = 0
            for dx, dy in directions:
                x, y = i + dx, j + dy
                if 0 <= x < m and 0 <= y < n and mat[x][y] == 1: live += 1
            if mat[i][j] == 1 and (live < 2 or live > 3): nextGen[i][j] = 0
            elif mat[i][j] == 0 and live == 3: nextGen[i][j] = 1
            else: nextGen[i][j] = mat[i][j]
    return nextGen
    pass
