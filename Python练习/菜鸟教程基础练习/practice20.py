#练习20：
# 一球从100米高度自由落下，每次落地后反跳回原高度的一半；再落下，求它在第10次落地时，共经过多少米？第10次反弹多高？
long = 100
sum = 100
for i in range(2, 11):
    sum = sum + long
    long = long / 2
    print("第%d次，经过%f米，反弹高度为%f" % (i, sum, long/2))