# Xom Data · Majority element
# Problem: https://xomdata.com/practice/py-majority-element
# Solved: 2026-08-27

def majority(numbers):
    for i in range(len(numbers)):
        cnt = 0
        for j in range(len(numbers)):
            if numbers[i] == numbers[j]: cnt += 1
        if cnt > len(numbers) // 2: return numbers[i]
    return None
    pass
