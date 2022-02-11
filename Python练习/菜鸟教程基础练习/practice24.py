# 练习24：有一分数序列：2/1，3/2，5/3，8/5，13/8，21/13...求出这个数列的前20项之和。
a=2
b=1
s=0
for i in range(1,20):
    s+=a/b
    t=a
    a=a+b
    b=t
    print(a,'/',b)
print(s)