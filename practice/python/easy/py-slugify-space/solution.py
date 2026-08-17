# Xom Data · Turn a title into a friendly URL part
# Problem: https://xomdata.com/practice/py-slugify-space
# Solved: 2026-08-17

def to_slug(title):
    x = title.lower()
    return x.replace(' ', '-')
