import matplotlib.pyplot as plt
import numpy as np
import math

x = np.arange(0, math.pi*2, 0.05)
fig = plt.figure() #生成画布对象
ax = fig.add_axes([0.1, 0.1, 0.8, 0.8]) #添加绘图区域
y = np.sin(x)
ax.plot(x, y)
ax.set_xlabel('angle') #设置x轴标签
ax.set_title('sine')
ax.set_xticks([0,2,4,6])
ax.set_xticklabels(['zero','two','four','six']) #设置x轴刻度标签
ax.set_yticks([-1,0,1]) #设置y轴刻度
plt.show()