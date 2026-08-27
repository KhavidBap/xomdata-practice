# Xom Data · Single number
# Problem: https://xomdata.com/practice/py-single-number
# Solved: 2026-08-27

def single_number(numbers):
    for num in numbers:
        cnt = 0
        for check in numbers:
            if num == check: cnt += 1
        if cnt % 2 == 1: 
            return num
            break
    pass
