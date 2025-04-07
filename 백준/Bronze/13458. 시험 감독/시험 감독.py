N = int(input())

test_room = list(map(int, input().split()))
head, support = map(int, input().split())

cnt = 0

for value in test_room:
    cnt += 1
    remain = value - head
    if remain > 0:
        if remain % support:
            cnt += (remain // support) + 1
        else:
            cnt += (remain // support)

print(cnt)