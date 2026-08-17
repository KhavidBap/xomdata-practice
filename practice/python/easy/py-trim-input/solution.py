# Xom Data · Clean up stray spaces in a list of names
# Problem: https://xomdata.com/practice/py-trim-input
# Solved: 2026-08-17

def clean_names(raw_list):
    lst = []
    for item in raw_list: lst.append(item.strip())
    return lst
