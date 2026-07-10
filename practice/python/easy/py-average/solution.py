# Xom Data · Average score by subject
# Problem: https://xomdata.com/practice/py-average
# Solved: 2026-07-10

def average_score(scores):
    return (0 if len(scores) == 0 else round(sum(scores) / len(scores), 2))
    pass
