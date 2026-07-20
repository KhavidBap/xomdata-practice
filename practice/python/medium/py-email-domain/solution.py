# Xom Data · Extract domain from email
# Problem: https://xomdata.com/practice/py-email-domain
# Solved: 2026-07-20

def get_domain(email):
    for i in range(len(email)):
        if email[i] == '@':
            return email[i+1:]
            break
    pass
