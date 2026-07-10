# Xom Data · Mask phone number
# Problem: https://xomdata.com/practice/py-mask-phone
# Solved: 2026-07-10

def mask_phone(phone):
    if len(phone) <= 3:
        return phone
    return "*" * (len(phone) - 3) + phone[-3:]
