# Xom Data · Max area of island
# Problem: https://xomdata.com/practice/py-max-area-island
# Solved: 2026-09-19

def max_area(grid):
    if not grid or not grid[0]:
        return 0
    rows = len(grid)
    cols = len(grid[0])
    max_size = 0
    for r in range(rows):
        for c in range(cols):
            if grid[r][c] == 1:
                stack = [(r, c)]
                grid[r][c] = 0
                size = 0
                while stack:
                    x, y = stack.pop()
                    size += 1
                    for dx, dy in [(1, 0), (-1, 0), (0, 1), (0, -1)]:
                        nx = x + dx
                        ny = y + dy
                        if (0 <= nx < rows and 0 <= ny < cols and grid[nx][ny] == 1):
                            grid[nx][ny] = 0
                            stack.append((nx, ny))
                max_size = max(max_size, size)
    return max_size
