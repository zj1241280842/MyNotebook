# 练习23：打印出如下图案（菱形）:
#
#    *
#   ***
#  *****
# *******
#  *****
#   ***
#    *
for i in range(5):
    print()
    for j in range(4-i):
        print(' ',end='')
    for k in range(2*i-1):
        print('*',end='')

for i in range(3):
    print()
    for j in range(i+1):
        print(' ',end='')
    for k in range(5-2*i):
        print('*',end='')