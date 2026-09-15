# Xom Data · String compression
# Problem: https://xomdata.com/practice/py-run-length
# Solved: 2026-09-15

def run_length_encode(text):
    if not text: return ""
    word = list(text)
    res = ""
    cur = word[0]
    cnt = 1
    for i in range(1, len(word)):
        if word[i] == cur: cnt += 1
        else:
            res = res + cur + str(cnt)
            cur = word[i]
            cnt = 1
    res = res + cur + str(cnt)
    return res
    pass
