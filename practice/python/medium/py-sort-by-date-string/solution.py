# Xom Data · Order applications by submission date
# Problem: https://xomdata.com/practice/py-sort-by-date-string
# Solved: 2026-09-15

def by_date(records):
    if not records: return []
    dic = {}
    for key, date in records:
        day = list(date.split('/'))
        num = int(''.join([day[2], day[1], day[0]]))
        dic[key] = num
    dic = {k: v for k, v in sorted(dic.items(), key=lambda item: (item[1], item[0]))}
    res = []
    for key in dic: res.append(key)
    return res
    pass
