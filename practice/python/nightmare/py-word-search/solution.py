# Xom Data · Word search
# Problem: https://xomdata.com/practice/py-word-search
# Solved: 2026-09-06

def findMatch(mat, word, x, y, wIdx):
    wLen = len(word)
    n, m = len(mat), len(mat[0])
    if wIdx == wLen: return True
    if x < 0 or y < 0 or x >= n or y >= m: return False
    if mat[x][y] == word[wIdx]:
        temp = mat[x][y]
        mat[x][y] = '#'
        res = (findMatch(mat, word, x - 1, y, wIdx + 1) or findMatch(mat, word, x + 1, y, wIdx + 1) or findMatch(mat, word, x, y - 1, wIdx + 1) or findMatch(mat, word, x, y + 1, wIdx + 1))
        mat[x][y] = temp
        return res
    return False

def exists(mat, word):
    wLen = len(word)
    n, m = len(mat), len(mat[0])
    if wLen > n * m: return False
    for i in range(n):
        for j in range(m):
            if mat[i][j] == word[0]:
                if findMatch(mat, word, i, j, 0): return True
    return False
    pass
