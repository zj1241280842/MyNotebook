# 练习89：某个公司采用公用电话传递数据，数据是四位的整数，在传递过程中是加密的，加密规则如下：每位数字都加上5,然后用和除以10的余数代替该数字，再将第一位和第四位交换，第二位和第三位交换。
num=input("请输入一个四位整数:")
List=[]
for i in range(0,len(num)):
    a=(int(num[i])+5)%10
    List.append(a)
print("".join('%s' %s for s in List[::-1]))