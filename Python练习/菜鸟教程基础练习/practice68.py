# 练习68：有 n 个整数，使其前面各数顺序向后移 m 个位置，最后 m 个数变成最前面的 m 个数
from collections import deque
n=int(input('整数n有多少个：'))
m=int(input('你想往后移动几位？'))
L=[]
for i in range(n):
    num=int(input('请输入数字：'))
    L.append(num)
print(L)
f=deque(L)
f.rotate(m)
print(list(f))