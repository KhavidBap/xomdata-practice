# Xom Data · Longest common prefix
# Problem: https://xomdata.com/practice/py-longest-common-prefix
# Solved: 2026-09-03

def longest_common_prefix(arr):
    if not arr: return ""
    arr.sort()
    first = arr[0]
    last = arr[-1]
    minLength = min(len(first), len(last))
    i = 0
    while i < minLength and first[i] == last[i]:
        i += 1
    return first[:i]
    pass
