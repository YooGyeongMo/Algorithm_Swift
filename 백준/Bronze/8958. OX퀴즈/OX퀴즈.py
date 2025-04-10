T = int(input())

for _ in range(T):
    string = input()
    cnt = 0
    sum_value = 0
    for i in range(len(string)):
        if string[i] == 'O':
            cnt += 1
            sum_value += cnt
        elif string[i] == 'X':
            cnt = 0
    print(sum_value)