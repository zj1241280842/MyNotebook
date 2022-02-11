# 练习25：求1+2!+3!+...+20!的和。
s=0
n=1
for i in range(1,21):
    n*=i
    s+=n
print(s)