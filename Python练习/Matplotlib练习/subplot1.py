#如果新建的子图与现有的子图重叠，那么重叠部分的子图将会被自动删除
import matplotlib.pyplot as plt
plt.plot([1,2,3])
#现在创建一个子图，它表示一个有2行1列的网格的顶部图。
#因为这个子图将与第一个重叠，所以之前创建的图将被删除
plt.subplot(211)
plt.plot(range(12))
plt.subplot(212, facecolor='y') #创建带有黄色背景的第二个子图
plt.plot(range(12))
plt.show()