# Xom Data · Finish all courses (course schedule)
# Problem: https://xomdata.com/practice/py-course-schedule
# Solved: 2026-09-15

from collections import deque

def can_finish(n, prerequisites):
    graph = [[] for _ in range(n)]
    inDegree = [0] * n
    for dest, src in prerequisites:
        graph[src].append(dest)
        inDegree[dest] += 1
    q = deque()
    for i in range(n):
        if inDegree[i] == 0: q.append(i)
    while q:
        node = q.popleft()
        for child in graph[node]:
            inDegree[child] -= 1
            if inDegree[child] == 0: q.append(child)
    for i in range(n):
        if inDegree[i] != 0: return False
    return True
    pass
