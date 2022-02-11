#第一种 Matplotlib 自动设置
import matplotlib.pyplot as plt
import numpy as np

fig = plt.figure()
a1 = fig.add_axes([0,0,1,1]) #添加绘图区域
x = np.arange(1,10) #准备数据
a1.plot(x, np.exp(x)) #绘制函数图像
a1.set_title('exp') #添加题目
plt.show()