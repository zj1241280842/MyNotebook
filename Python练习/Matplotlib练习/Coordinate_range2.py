#第二种：自定义设置
import matplotlib.pyplot as plt
import numpy as np

fig = plt.figure()
a1 = fig.add_axes([0,0,1,1])
x = np.arange(1,10)
a1.plot(x, np.exp(x),'r')
a1.set_title('exp')
a1.set_ylim(0,10000) #设置y轴
a1.set_xlim(0,10) #设置x轴
plt.show()