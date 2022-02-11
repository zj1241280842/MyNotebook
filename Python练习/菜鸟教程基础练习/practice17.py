# 练习17：输入一行字符，分别统计出其中英文字母、空格、数字和其它字符的个数。
s=input('请输入一串字符：')
number=0
zimu=0
space=0
other=0
for i in s:
    if i.isalpha():
        zimu+=1
    elif i.isspace():
        space+=1
    elif i.isdigit():
        number+=1
    else:
        other+=1
print('zimu=%d,space=%d,number=%d,other=%d'%(zimu,space,number,other))