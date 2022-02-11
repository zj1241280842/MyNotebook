# 练习67：输入数组，最大的与第一个元素交换，最小的与最后一个元素交换，输出数组。
n=int(input('有多少个数字:'))
a=[]
for i in range(n):
    a.append(int(input('请输入一个数字:')))
for i in range(len(a)):
    if a[i]==max(a):
        a[0],a[i]=a[i],a[0]
for i in range(len(a)):
    if a[i]==min(a):
        a[-1],a[i]=a[i],a[-1]
print(a)