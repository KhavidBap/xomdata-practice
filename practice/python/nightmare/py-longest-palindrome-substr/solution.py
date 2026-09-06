# Xom Data · Longest palindromic substring
# Problem: https://xomdata.com/practice/py-longest-palindrome-substr
# Solved: 2026-09-06

def longest_palindrome(s):
    if not s: return ""
    n = len(s)
    start, maxLen = 0, 1
    for i in range(n):
        for j in range(2):
            low, high = i, i + j
            while low >= 0 and high < n and s[low] == s[high]:
                currLen = high - low + 1
                if currLen > maxLen:
                    start = low
                    maxLen = currLen
                low -= 1
                high += 1
    return s[start:start + maxLen]
    pass
