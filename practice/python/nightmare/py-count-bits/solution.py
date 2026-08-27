# Xom Data · Counting bits
# Problem: https://xomdata.com/practice/py-count-bits
# Solved: 2026-08-27

def bits(n):
    cnt = 0
    while n:
        cnt += n & 1
        n >>= 1
    return cnt

def count_bits(n):
    res = [0]
    for i in range(1, n + 1):
        res.append(bits(i))
    return res
    pass
