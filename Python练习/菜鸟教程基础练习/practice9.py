# 练习9：暂停一秒输出
import time
my={1:'one',2:'two'}
for key,value in dict.items(my):
    print(key,value)
    time.sleep(1)