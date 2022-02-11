from matplotlib import pyplot as plt
import numpy as np
import math
x = np.arange(0, math.pi*2, 0.05)
y = np.sin(x)
fig = plt.figure() #使用 figure() 创建一个空白画布
ax = fig.add_axes([0,0,1,1]) # add_axes() 将 axes 轴域添加到画布中
ax.plot(x,y) #调用 axes 对象的 plot() 方法，对 x 、 y 数组进行绘图操作
ax.set_title("sine wave") #设置标题
ax.set_xlabel('angle') #设置横轴标签
ax.set_ylabel('sine') #设置纵轴标签
plt.show()