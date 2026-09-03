# Xom Data · Valid nested parentheses
# Problem: https://xomdata.com/practice/py-valid-brackets
# Solved: 2026-09-03

def is_valid(s):
    st = []
    for c in s:
        if c == '(' or c == '{' or c == '[':
            st.append(c)
        elif c == ')' or c == '}' or c == ']':
            if not st: return False 
            top = st[-1]
            if ((c == ')' and top != '(') or
                (c == '}' and top != '{') or
                (c == ']' and top != '[')):
                return False
            st.pop() 
    return not st 
    pass
