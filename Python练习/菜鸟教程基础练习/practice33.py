# 练习33：按逗号分隔列表
numbers=list(range(1,9))
for i in numbers:
    if(i==numbers[-1]):
        print(i)
    else:
        print(i,end=',')