# Xom Data · Voting winner
# Problem: https://xomdata.com/practice/py-vote-winner
# Solved: 2026-09-15

def vote_winner(votes):
    dic = {}
    for key in votes:
        dic[key] = dic.get(key, 0) + 1
    print(dic)
    dic = {k: v for k, v in sorted(dic.items(), key=lambda item: (-item[1], item[0]))}
    print(dic)
    res = list(dic)[0]
    return res
    pass
