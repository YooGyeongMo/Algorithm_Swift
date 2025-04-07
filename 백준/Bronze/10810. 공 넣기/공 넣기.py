N, M = map(int,input().split())
ball_num = [0] * N

for _ in range(M):
    i, j, k = map(int,input().split())
    for x in range(i-1,j):
        ball_num[x] = k

for i in range(len(ball_num)):
    print(ball_num[i], end=" ")