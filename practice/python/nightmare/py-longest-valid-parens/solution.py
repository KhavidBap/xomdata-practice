# Xom Data · Longest valid parentheses
# Problem: https://xomdata.com/practice/py-longest-valid-parens
# Solved: 2026-08-27

def longest_valid(s):
    st = []
    st.append(-1)
    maxLen = 0
    for i in range(len(s)):
        if s[i] == '(': st.append(i)
        else:
            st.pop()
            if not st: st.append(i)
            else: maxLen = max(maxLen, i - st[-1])
    return maxLen
    pass
