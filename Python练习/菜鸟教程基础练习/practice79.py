# 练习79：字符串排序。
list1=[]
str1=input('请输入第一个字符串：')
str2=input('请输入第二个字符串：')
str3=input('请输入第三个字符串：')
list1.extend([str1,str2,str3])
# list1.sort()
# print(list1)
list2=sorted(list1)
print('排序后的字符串为：')
for item in list2:
    print(item)