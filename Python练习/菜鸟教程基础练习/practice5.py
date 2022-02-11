# 练习5：输入三个整数x,y,z，请把这三个数由小到大输出
x=int(input('请输入一个整数:\n'))
y=int(input('请输入一个整数:\n'))
z=int(input('请输入一个整数:\n'))
if(x > y):
    x,y = y,x;
if(x > z):
    x,z = z,x
if(y>z):
    y,z=z,y
print('x=',x ,'y=',y,'z=',z)