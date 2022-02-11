--[[******************************Copyright(c)********************************
** GUANGZHOU DCOLOUR TECHNOLOGY CO.,LTD
** 广州大彩光电科技有限公司
** http://www.gz-dc.com/
**
**LUA 学习网站：www.runoob.com/lua
**------File Info-----------------------------------------------------------
** File Name: LUA 教程-系统参数设置-LUA
** Latest modified Date: 2019.01.15
** Latest Version: V1.0
** Description: 设置系统波特率、设置背光、设置蜂鸣器响、设置时间
**
**--------------------------------------------------------------------------
** Created By: 林绍佳
** Created date: 2019.01.7
** Version: V1.0
** Descriptions: 文件创建时的简要描述
**
**--------------------------------------------------------------------------
** Modified by: 修改人的姓名
** Modified date: 文件的修改日期（YYYY-MM-DD）
** Version: 文件修订的版本号
** Description: 文件修订的简要描述
**
************************************************************************--]]
--[[************************************************************************
** Function name: on_control_notify
** Descriptions: 用户通过触摸修改控件后，执行此回调函数。
** 点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
** input parameters:screen：被触发控件的页码
** control：控件的编号
** value：控件的值
************************************************************************--]]
function on_control_notify(screen,control,value)
--************************
--功能：使用按钮设置系统波特率
--调用函数：uart_set_baudrate(baudrate)
--函数功能：设置系统波特率
--参数：baudrate，波特率；
--************************
if screen==0 and control==1 and value==1 --按下第 0 页、编号 1 按钮
then
uart_set_baudrate(19200) --设置波特率为 19200
end
if screen==0 and control==2 and value==1 --按下第 0 页、编号 2 按钮
then
uart_set_baudrate(115200) --设置波特率为 115200
end
--************************
--功能：使用滑动条设置背光
--调用函数：set_backlight(level)
 --函数功能：设置背光
--参数：level，背光值；
--************************
if screen==0 and control==4 --滑动第 0 页、编号 4 滑动条
then
set_backlight(value) --设置背光为 value
end
--************************
--功能：使用按钮设置设置蜂鸣器响
--调用函数：beep(time)
 --函数功能：设置蜂鸣器响
--参数：time，响的时长，单位：ms；
--************************
if screen==0 and control==5 and value==1 --按下第 0 页、编号 5 按钮
then
beep(100) --蜂鸣器响 100ms
end
--************************
--功能：使用按钮设置时间
--调用函数：set_date_time(year,month,day,hour,minute,second)
 --函数功能：设置 RTC 时间
--参数：year,年；month,月；day,日；hour,时；minute,分；second
--************************
if screen==0 and control==6 and value==1 --按下第 0 页、编号 6 按钮
then
set_date_time(2020,1,1,1,1,1) --设置当前时间为 2019/01/01 01:01:01
end
if screen==0 and control==7 and value==1 --按下第 0 页、编号 7 按钮
then
set_date_time(2020,6,6,6,6,6)--设置当前时间为 2020/06/06 06:06:06
end
end
--[[*******************************************************************
END FILE
*******************************************************************--]]
