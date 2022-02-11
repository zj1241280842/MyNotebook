import matplotlib.pyplot as plt
import numpy as np

fig,a =  plt.subplots(2,2)
x = np.arange(1,5)

a[0][0].plot(x,x*x) #绘制平方函数
a[0][0].set_title('square')

a[0][1].plot(x,np.sqrt(x)) #绘制平方根图像
a[0][1].set_title('square root')

a[1][0].plot(x,np.exp(x)) #绘制指数函数
a[1][0].set_title('exp')

a[1][1].plot(x,np.log10(x)) #绘制对数函数
a[1][1].set_title('log')
plt.show()
