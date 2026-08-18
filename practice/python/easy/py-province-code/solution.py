# Xom Data · Take the province code off a file reference
# Problem: https://xomdata.com/practice/py-province-code
# Solved: 2026-08-18

def province_code(code):
    if len(code) <= 3: return code
    else: return code[:3]
    pass
