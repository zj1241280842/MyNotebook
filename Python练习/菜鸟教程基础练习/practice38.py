# 练习38：：求一个3*3矩阵主对角线元素之和。
A = {}
for i in range(3):
    for j in range(3):
        A[i,j] = int(input('Enter a number:'))
diag = []
print(A.keys())
for m in A.keys():
    if m[0] == m[1]:
        diag.append(A[m])
print(sum(diag))

a = []
sum = 0.0
for i in range(3):
    a.append([])
    for j in range(3):
        a[i].append(float(input("input num:\n")))
for i in range(3):
    sum += a[i][i]
print(sum)