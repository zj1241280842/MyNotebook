# 练习35：文本颜色设置。
class bcolors:
    HEADER='\033[95m'  #紫色
    OKBLUE='\033[94m'  #蓝色
    OKGREEN='\033[92m'   #绿色
    WARNING='\033[93m'   #黄色
    FALL='\033[91m'     #红色
    ENDC='\033[0m'    #原色
    BOLD='\033[1m'     #加深色
    UNDERLINE='\033[4m'   #在字体下面划线
print (bcolors.UNDERLINE + bcolors.OKBLUE+ "警告的颜色字体?")