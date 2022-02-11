if __name__ == "__main__":
    N = 10
    # input data
    print('请输入10个数字')
    l = []
    for i in range(N):
        l.append(int(input('输入一个数字:')))
    for i in range(N):
        print(l[i])

    # 排列10个数字
    for i in range(N - 1):
        min = i
        for j in range(i + 1, N):
            if l[min] > l[j]: min = j
        l[i], l[min] = l[min], l[i]
    print('排列之后：')
    for i in range(N):
        print(l[i])