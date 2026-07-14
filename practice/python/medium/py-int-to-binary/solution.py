# Xom Data · Convert a number to binary
# Problem: https://xomdata.com/practice/py-int-to-binary
# Solved: 2026-07-14

def to_binary(number):
    res = ''
    while number != 0:
        res = res + str(number % 2)
        number //= 2
    return 0 if res == '' else res[::-1]
    pass
