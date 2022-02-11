# 练习46:求输入数字的平方，如果平方运算后小于 50 则退出。
while True:
    a = int(input('请输入一个数字:'))
    if a*a<50:
        print('平方数小于50')
        break
    else:
        print(a,'的平方数是',a*a)
        continue