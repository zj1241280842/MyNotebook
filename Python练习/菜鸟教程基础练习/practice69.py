# 练习69：有n个人围成一圈，顺序排号。从第一个人开始报数（从1到3报数），凡报到3的人退出圈子，问最后留下的是原来第几号的那位。
n=int(input('一共有多少个人：'))
num=[]
for i in range(n):
    num.append(i+1)
m=0
i=0
k=0
while m<n-1:
    if num[i]!=0:
        k+=1
    if k==3:
        k=0
        num[i]=0
        m+=1
    i+=1
    if i==n:
        i=0

i=0
while num[i]==0:
    i+=1
print(num[i])