a = int(input())
b = int(input())
c = int(input())

sum_value = str(a*b*c)

dic = {str(i):0 for i in range(10)}

for i in sum_value:
    dic[i] += 1

for i in range(10):
    print(dic[str(i)])