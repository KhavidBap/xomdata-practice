# Xom Data · Unique paths with obstacles
# Problem: https://xomdata.com/practice/py-unique-paths-obstacles
# Solved: 2026-09-04

def uniquePaths(i, j, grid):
    r, c = len(grid), len(grid[0])
    if i == r or j == c: return 0
    if grid[i][j] == 1: return 0
    if i == r - 1 and j == c - 1: return 1
    return uniquePaths(i + 1, j, grid) + uniquePaths(i, j + 1, grid)

def unique_paths(grid):
    return uniquePaths(0, 0, grid)
    pass
