T = int(input())

for test_case in range(T):
    H, W, N = map(int, input().split())

    floor = N%H
    room_num = N//H + 1

    if N%H == 0:
        floor = H
        room_num = N//H

    print((floor*100) + room_num)