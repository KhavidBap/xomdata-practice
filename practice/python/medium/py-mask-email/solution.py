# Xom Data · Mask emails in the log
# Problem: https://xomdata.com/practice/py-mask-email
# Solved: 2026-09-15

def mask_email(email):
    mail = list(email.split('@'))
    print(mail)
    text = mail[0][:2] + '*' * (len(mail[0]) - 2)
    print(text)
    return '@'.join([text, mail[1]])
    pass
