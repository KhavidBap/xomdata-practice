# Xom Data · Median of a list
# Problem: https://xomdata.com/practice/py-median
# Solved: 2026-07-12

def median(numbers):
    numbers.sort()
    return (numbers[len(numbers) // 2] if len(numbers) % 2 == 1 else round((numbers[len(numbers) // 2] + numbers[len(numbers) // 2 - 1]) / 2, 2))
    pass
