T = int(input())

for _ in range(T):
    r, s = map(str, input().split())
    string = ""
    for i in s:
        string += i*int(r)
    print(string)
