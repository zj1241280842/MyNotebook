# 练习26：利用递归方法求5!
def f(n):
    if n==0:
        sum=1
    else:
        sum=n*f(n-1)
    return sum
print(f(0))