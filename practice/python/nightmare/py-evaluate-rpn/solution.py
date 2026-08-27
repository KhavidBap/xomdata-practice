# Xom Data · Evaluate reverse polish notation
# Problem: https://xomdata.com/practice/py-evaluate-rpn
# Solved: 2026-08-27

def eval_rpn(tokens):
    st = []
    for token in tokens:
        if token[0].isdigit() or (len(token) > 1 and token[0] == '-'):
            st.append(int(token))
        else:
            v1 = st.pop()
            v2 = st.pop()
            if token == '+':
                st.append(v2 + v1)
            if token == '-':
                st.append(v2 - v1)
            if token == '*':
                st.append(v2 * v1)
            if token == '/':
                sign = -1 if (v2 < 0) != (v1 < 0) else 1
                st.append(sign * (abs(v2) // abs(v1)))
    return st.pop()
    pass
