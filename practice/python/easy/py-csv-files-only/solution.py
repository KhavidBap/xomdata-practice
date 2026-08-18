# Xom Data · Pick the data files out of a download folder
# Problem: https://xomdata.com/practice/py-csv-files-only
# Solved: 2026-08-18

def csv_files(names):
    res = []
    for name in names:
        if name[-4:] == '.csv': res.append(name)
    return res
    pass
