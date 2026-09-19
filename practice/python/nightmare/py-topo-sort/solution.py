# Xom Data · Lexicographically smallest topological sort
# Problem: https://xomdata.com/practice/py-topo-sort
# Solved: 2026-09-19

import heapq

def topo_order(n, edges):
    graph = [[] for _ in range(n)]
    indegree = [0] * n
    for u, v in edges:
        graph[u].append(v)
        indegree[v] += 1
    heap = []
    for i in range(n):
        if indegree[i] == 0: heapq.heappush(heap, i)
    res = []
    while heap:
        u = heapq.heappop(heap)
        res.append(u)
        for v in graph[u]:
            indegree[v] -= 1
            if indegree[v] == 0: heapq.heappush(heap, v)
    return res
