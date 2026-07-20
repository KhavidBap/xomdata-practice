# Xom Data · Move zeroes
# Problem: https://xomdata.com/practice/py-move-zeros
# Solved: 2026-07-20

def move_zeros(numbers):
    res = []
    z = 0
    for num in numbers:
        if num == 0: z += 1
        else: res.append(num)
    res = res + ([0] * z)
    return res
    pass
