# Xom Data · Split a paragraph into sentences
# Problem: https://xomdata.com/practice/py-split-sentences
# Solved: 2026-08-19

def split_sentences(text):
    if text == "": return []
    else:
        res = []
        s = ""
        for i in range(len(text)):
            if text[i] not in ('.', '?', '!'): s = s + text[i]
            else:
                s = s + text[i]
                res.append(s.strip())
                s = ""
        if s != "": res.append(s.strip())
        return res
    pass
