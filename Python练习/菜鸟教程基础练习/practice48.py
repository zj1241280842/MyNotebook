# 练习48：数字比较。
a = int(input("请输入a变量的值: "))
b = int(input("请输入b变量的值: "))
if a>b:
    print('%d 大于 %d' % (a,b))
elif a==b:
    print('%d 等于 %d' % (a,b))
else:
    print('%d 小于 %d' % (a,b))