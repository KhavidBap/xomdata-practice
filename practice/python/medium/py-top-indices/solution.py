# Xom Data · Positions of the highest readings
# Problem: https://xomdata.com/practice/py-top-indices
# Solved: 2026-09-11

def top_indices(values, n):
    indexed = list(enumerate(values))
    indexed.sort(key=lambda x: (-x[1], x[0]))
    return [idx for idx, _ in indexed[:n]]
