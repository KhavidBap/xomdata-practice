# Xom Data · Group anagrams
# Problem: https://xomdata.com/practice/py-anagram-groups
# Solved: 2026-09-03

def isAnagram(a, b):
    return sorted(a) == sorted(b)

def group_anagrams(arr):
    n = len(arr)
    visited = [False] * n
    res = []
    for i in range(n):
        if visited[i]:
            continue
        group = [arr[i]]
        visited[i] = True
        for j in range(i + 1, n):
            if not visited[j] and isAnagram(arr[i], arr[j]):
                group.append(arr[j])
                visited[j] = True
        res.append(group)
    return res
    pass
