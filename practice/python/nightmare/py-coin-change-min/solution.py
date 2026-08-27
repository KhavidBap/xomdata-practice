# Xom Data · Coin change
# Problem: https://xomdata.com/practice/py-coin-change-min
# Solved: 2026-08-27

def minimum_coins(i, sum, coins):
    if sum == 0: return 0
    if sum < 0 or i == len(coins): return float('inf')
    take = float('inf')
    if coins[i] > 0:
        take = minimum_coins(i, sum - coins[i], coins)
        if take != float('inf'):
            take += 1
    no = minimum_coins(i + 1, sum, coins)
    return min(take, no)

def min_coins(coins, amount):
    res = minimum_coins(0, amount, coins)
    return res if res != float('inf') else -1
    pass
