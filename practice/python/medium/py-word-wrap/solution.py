# Xom Data · Wrap a description for a narrow box
# Problem: https://xomdata.com/practice/py-word-wrap
# Solved: 2026-09-15

def wrap_text(text, width):
    if not text: return []
    words = text.split()
    lines = []
    cur = words[0]
    for word in words[1:]:
        if len(cur) + 1 + len(word) <= width: cur += " " + word
        else:
            lines.append(cur)
            cur = word
    lines.append(cur)
    return lines
