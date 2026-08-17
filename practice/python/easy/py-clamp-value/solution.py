# Xom Data · Pull a sensor reading back into range
# Problem: https://xomdata.com/practice/py-clamp-value
# Solved: 2026-08-17

def clamp(value, low, high):
    return (low if value < low else (high if value > high else value))
