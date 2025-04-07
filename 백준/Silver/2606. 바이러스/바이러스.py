node = int(input())
line = int(input())

graph = [[] for _ in range(node+1)]

for _ in range(line):
    a, b = map(int,input().split())
    graph[a].append(b)
    graph[b].append(a)

visited = [False] * (node + 1)

virus_count = 0

def dfs(v):
    global virus_count
    visited[v] = True
    virus_count += 1

    for i in graph[v]:
        if not visited[i]:
            dfs(i)

dfs(1)
print(virus_count-1)