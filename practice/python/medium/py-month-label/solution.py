# Xom Data · Month label for a report heading
# Problem: https://xomdata.com/practice/py-month-label
# Solved: 2026-09-15

def month_label(ym):
    month = list(ym.split('-'))
    print(month)
    mnth = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
    return ' '.join([mnth[int(month[1]) - 1], month[0]])
    pass
