lst = [1,2,3,4,5,6,7,8]
reverse_list = list(reversed(lst))

lst2 = list(map(int,input().split()))

if lst == lst2:
    print("ascending")
elif reverse_list == lst2:
    print("descending")
else:
    print("mixed")