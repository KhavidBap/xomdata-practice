# Xom Data · Check palindrome
# Problem: https://xomdata.com/practice/py-palindrome
# Solved: 2026-07-11

def is_palindrome(text):
    return text.lower() == text[::-1].lower()
    pass
