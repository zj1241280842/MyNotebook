# 练习73：反向输出一个链表。
ptr = []
for i in range(5):
    num = int(input('please input a number:\n'))
    ptr.append(num)
ptr.reverse()
print(ptr)