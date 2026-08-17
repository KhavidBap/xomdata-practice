# Xom Data · Ticket price by age
# Problem: https://xomdata.com/practice/py-ticket-price
# Solved: 2026-08-17

def ticket_price(age):
    return (0 if age < 6 else (50000 if age <= 17 else (100000 if age <= 59 else 50000)))
    pass
