# 练习12：判断101-200之间有多少个素数，并输出所有素数。
l = []
for i in range(101,200):
    for j in range(2,i-1):
        if i%j ==0:
            break
    else:
        l.append(i)
print(l)
print("总数为：%d" % len(l))