# Xom Data · Class leaderboard
# Problem: https://xomdata.com/practice/py-sort-score-name
# Solved: 2026-09-15

def rank_students(records):
    dic = {}
    for key, value in records: dic[key] = value
    dic = {k: v for k, v in sorted(dic.items(), key=lambda item: (-item[1], item[0]))}
    return [key for key in dic]
    pass
