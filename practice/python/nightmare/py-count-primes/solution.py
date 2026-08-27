# Xom Data · Count primes less than N
# Problem: https://xomdata.com/practice/py-count-primes
# Solved: 2026-08-27

def isPrime(n):
  if n <= 1:
    return False
  if n == 2 or n == 3:
    return True
  if n % 2 == 0 or n % 3 == 0:
    return False
  i = 5
  while i*i<=n:
    if n % i == 0 or n % (i + 2) == 0:
      return False
    i += 6
  return True

def count_primes(n):
    res = 0
    for i in range(1, n):
        res += (1 if isPrime(i) else 0)
    return res
    pass
