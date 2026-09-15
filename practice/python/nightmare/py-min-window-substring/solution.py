# Xom Data · Minimum window substring
# Problem: https://xomdata.com/practice/py-min-window-substring
# Solved: 2026-09-15

def min_window(s, p):
    len1, len2 = len(s), len(p)
    if len1 < len2: return ""
    countP, countS = [0] * 256, [0] * 256
    for char in p: countP[ord(char)] += 1
    start, start_idx = 0, -1
    min_len = float('inf')
    count = 0
    for j in range(len1):
        countS[ord(s[j])] += 1
        if countP[ord(s[j])] != 0 and countS[ord(s[j])] <= countP[ord(s[j])]: count += 1
        if count == len2:
            while countS[ord(s[start])] > countP[ord(s[start])] or countP[ord(s[start])] == 0:
                if countS[ord(s[start])] > countP[ord(s[start])]: countS[ord(s[start])] -= 1
                start += 1
            length = j - start + 1
            if min_len > length:
                min_len = length
                start_idx = start
    if start_idx == -1: return "-1"
    return s[start_idx:start_idx + min_len]
    pass
