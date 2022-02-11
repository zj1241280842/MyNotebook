# 练习47：两个变量值互换
a = int(input("请输入a变量的值: "))
b = int(input("请输入b变量的值: "))
t=a
a=b
b=t
print("a=%s b=%s" % (a, b))