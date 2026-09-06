# Xom Data · Partition labels
# Problem: https://xomdata.com/practice/py-partition-labels
# Solved: 2026-09-06

def partition_labels(s):
    last = [-1] * 26
    for i in range(len(s)): last[ord(s[i]) - ord('a')] = i
    res = []
    start, end = 0, -1
    for i in range(len(s)):
        end = max(end, last[ord(s[i]) - ord('a')])
        if i == end:
            res.append(i - start + 1)
            start = i + 1
    return res
    pass
