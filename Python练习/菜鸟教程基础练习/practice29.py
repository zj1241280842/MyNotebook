# 练习29：给一个不多于5位的正整数，要求：一、求它是几位数，二、逆序打印出各位数字
num = list(input('输入一个最多5位的数字:'))
print(len(num))
num.reverse()
for i in range(len(num)):
    print(num[i], end='')