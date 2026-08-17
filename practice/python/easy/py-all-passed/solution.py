# Xom Data · Did the whole team clear the first round
# Problem: https://xomdata.com/practice/py-all-passed
# Solved: 2026-08-17

def all_passed(scores, pass_mark):
    if scores == []: return True
    else:
        check = True
        for item in scores:
            if item < pass_mark: check = False
        return check
