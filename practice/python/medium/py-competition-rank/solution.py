# Xom Data · Assign ranks with ties to runners
# Problem: https://xomdata.com/practice/py-competition-rank
# Solved: 2026-09-18

def ranks(scores):
    res = {}
    rank = 1
    for score in sorted(set(scores), reverse=True):
        res[score] = rank
        rank += scores.count(score)
    return [res[score] for score in scores]
    pass
