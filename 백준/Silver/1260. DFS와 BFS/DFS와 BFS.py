from collections import deque

node, line, v = map(int, input().split())

graph = [[] for _ in range(node + 1)]


for _ in range(line):
    a, b = map(int,input().split())
    graph[a].append(b)
    graph[b].append(a)

visited = [False] * (node + 1)
visited2 = visited.copy()


def dfs(v):
    visited[v] = True
    print(v, end = ' ')
    for nx in sorted(graph[v]):
        if not visited[nx]:
            dfs(nx)

def bfs(v):
    queue = deque([v])
    visited2[v] = True

    while queue:
        value = queue.popleft()
        print(value, end = ' ')

        for nx in sorted(graph[value]):
            if not visited2[nx]:
                queue.append(nx)
                visited2[nx] = True

dfs(v)
print()
bfs(v)