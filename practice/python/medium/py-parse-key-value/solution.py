# Xom Data · Read a config string into a lookup table
# Problem: https://xomdata.com/practice/py-parse-key-value
# Solved: 2026-09-11

def parse_config(text):
    result = {}
    for part in text.split(';'):
        part = part.strip()
        if not part: continue
        key, value = part.split('=')
        result[key.strip()] = value.strip()

    return result
