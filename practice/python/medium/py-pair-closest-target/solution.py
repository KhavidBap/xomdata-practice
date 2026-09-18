# Xom Data · Pair of items closest to the voucher limit
# Problem: https://xomdata.com/practice/py-pair-closest-target
# Solved: 2026-09-18

def closest_pair(prices, target):
    if len(prices) < 2: return None
    best, max_diff = None, float('inf')
    for i in range(len(prices)):
        for j in range(i + 1, len(prices)):
            total = prices[i] + prices[j]
            diff = abs(total - target)
            if (diff < max_diff or (diff == max_diff and total < best)):
                max_diff = diff
                best = total
    return best
    pass
