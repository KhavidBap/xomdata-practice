# Xom Data · Top K largest elements
# Problem: https://xomdata.com/practice/py-top-k
# Solved: 2026-07-20

def top_k(numbers, k):
    numbers.sort(reverse=True)
    return numbers[:k]
    pass
