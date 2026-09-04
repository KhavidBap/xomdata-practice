# Xom Data · Gas station
# Problem: https://xomdata.com/practice/py-gas-station
# Solved: 2026-09-04

def can_complete(gas, cost):
    n = len(gas)
    totalGas, currGas = 0, 0
    startIdx = 0
    for i in range(n):
        currGas += gas[i] - cost[i]
        totalGas += gas[i] - cost[i]
        if currGas < 0:
            currGas = 0
            startIdx = i + 1
    if totalGas < 0: return -1
    return startIdx
    pass
