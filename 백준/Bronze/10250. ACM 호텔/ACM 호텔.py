T = int(input())

for test_case in range(T):
    H, W, N = map(int, input().split())

    cnt = 0

    for i in range(1,W+1):
        for j in range(1,H+1):
            floor = j * 100
            cnt += 1
            if cnt == N:
                print(floor+i)
