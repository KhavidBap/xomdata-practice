# Xom Data · Order tags by length then alphabetically
# Problem: https://xomdata.com/practice/py-sort-length-alpha
# Solved: 2026-09-11

def order_tags(tags):
    tags.sort(key=lambda s: (len(s), s))
    return tags
    pass
