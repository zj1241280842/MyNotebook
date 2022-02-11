# 练习66：输入3个数a,b,c，按大小顺序输出
x=int(input('请输入一个整数:\n'))
y=int(input('请输入一个整数:\n'))
z=int(input('请输入一个整数:\n'))
if(x > y):
    x,y = y,x;
if(x > z):
    x,z = z,x
if(y>z):
    y,z=z,y
print((x,y,z))