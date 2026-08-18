# Xom Data · Branch leading on revenue
# Problem: https://xomdata.com/practice/py-best-branch
# Solved: 2026-08-18

def best_branch(branches):
    if branches == {}: return None
    else:
        val = ''
        max = float('-inf')
        for key in branches:
            if branches[key] > max:
                max = branches[key]
                val = key
        return val
    pass
