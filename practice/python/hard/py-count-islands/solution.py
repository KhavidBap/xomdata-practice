# Xom Data · Number of islands
# Problem: https://xomdata.com/practice/py-count-islands
# Solved: 2026-09-03

def isSafe(grid, r, c, visited):
    n = len(grid)
    m = len(grid[0])
    return (0 <= r < n and 0 <= c < m and grid[r][c] == 1 and not visited[r][c])

def dfs(grid, r, c, visited):
    visited[r][c] = True
    dr = [-1, 1, 0, 0]
    dc = [0, 0, -1, 1]
    for k in range(4):
        nr = r + dr[k]
        nc = c + dc[k]
        if isSafe(grid, nr, nc, visited):
            dfs(grid, nr, nc, visited)

def count_islands(grid):
    if not grid:
        return 0
    n = len(grid)
    m = len(grid[0])
    visited = [[False for _ in range(m)] for _ in range(n)]
    islands = 0
    for i in range(n):
        for j in range(m):
            if grid[i][j] == 1 and not visited[i][j]:
                dfs(grid, i, j, visited)
                islands += 1
    return islands
    pass
