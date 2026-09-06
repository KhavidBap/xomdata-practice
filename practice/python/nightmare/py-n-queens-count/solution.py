# Xom Data · N-Queens
# Problem: https://xomdata.com/practice/py-n-queens-count
# Solved: 2026-09-06

def count_queens(n):
    def solve(row, cols, diags1, diags2):
        if row == n: return 1
        count = 0
        for col in range(n):
            diag1 = row - col
            diag2 = row + col
            if col not in cols and diag1 not in diags1 and diag2 not in diags2:
                count += solve(row + 1, cols | {col}, diags1 | {diag1}, diags2 | {diag2})
        return count
    return solve(0, set(), set(), set())
    pass
