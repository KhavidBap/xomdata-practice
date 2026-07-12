# Xom Data · Digit frequency
# Problem: https://xomdata.com/practice/py-digit-frequency
# Solved: 2026-07-12

def digit_frequency(number):
    dic = {}
    for num in str(number):
        dic[num] = dic.get(num, 0) + 1
    return dic
    pass
