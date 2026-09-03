# Xom Data · Largest rectangle in histogram
# Problem: https://xomdata.com/practice/py-largest-rectangle
# Solved: 2026-09-03

def largest_rectangle(heights):
    if not heights: return 0
    n = len(heights)
    st = []
    res = 0
    for i in range(n):
        while st and heights[st[-1]] >= heights[i]:
            tp = st.pop()
            width = i if not st else i - st[-1] - 1
            res = max(res, heights[tp] * width)
        st.append(i)
    while st:
        tp = st.pop()
        width = n if not st else n - st[-1] - 1
        res = max(res, heights[tp] * width)
    return res
    pass
