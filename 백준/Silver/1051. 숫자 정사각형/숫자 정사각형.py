n, m = map(int, input().split())

# graph =[[] for i in range(n+1)]
graph = []

for i in range(n):
    graph.append(list(map(int, input())))

max_square = 1  # 최소 정사각형은 한칸.

for i in range(n):
    for j in range(m):
        for l in range(1, min(n - i, m - j)):
            if graph[i][j] == graph[i + l][j] == graph[i][j + l] == graph[i + l][j + l]:
                max_square = max(max_square, (l + 1) ** 2)


print(max_square)