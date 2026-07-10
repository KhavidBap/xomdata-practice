# Xom Data · Sum of digits in the code
# Problem: https://xomdata.com/practice/py-digit-sum
# Solved: 2026-07-10

def digit_sum(number):
    return sum(list(map(int, list(str(number)))))
    pass
