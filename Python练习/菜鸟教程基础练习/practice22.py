# 练习22：两个乒乓球队进行比赛，各出三人。甲队为a,b,c三人，乙队为x,y,z三人。已抽签决定比赛名单。有人向队员打听比赛的名单。a说他不和x比，c说他不和x,z比，请编程序找出三队赛手的名单。
n=['a','b','c']
m=[]
for i in range(3):
    if n[i]!='a' and n[i]!='c':
        m.insert(i,'x')
    elif n[i]!='c':
        m.insert(i,'z')
    else:
        m.insert(i,'y')

print('a--%s, b--%s, c--%s' %(m[0], m[1], m[2]))