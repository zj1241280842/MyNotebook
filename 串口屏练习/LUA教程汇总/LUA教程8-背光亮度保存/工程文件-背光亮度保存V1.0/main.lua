--[[******************************Copyright(c)*********************************
** GUANGZHOU DCOLOUR TECHNOLOGY CO.,LTD
** 广州大彩光电科技有限公司
** http://www.gz-dc.com/
**
**LUA学习网站：www.runoob.com/lua
**------File Info-----------------------------------------------------------
** File Name:              LUA教程-背光亮度保存
** Latest modified Date:   2019.02.21
** Latest Version:         V1.0
** Description:            背光亮度保存
**
**--------------------------------------------------------------------------
** Created By:             林绍佳
** Created date:           2019.02.21
** Version:                V1.0
** Descriptions:           文件读写
**
**--------------------------------------------------------------------------
** Modified by:            修改人的姓名
** Modified date:          文件的修改日期（YYYY-MM-DD）
** Version:                文件修订的版本号
** Description:            文件修订的简要描述
**
***************************************************************************--]]

--[[***************************************************************************
自定义函数
** Function name:          writefile
** Descriptions:           对文件写入，会覆盖原来的所有内容
** input parameters:       filename  文件名
**                         info      要写入文本
***************************************************************************--]]
function writefile(filename,info)
	local wfile = io.open(filename,"w")      --以覆盖写入的方式打开文本
	assert(wfile)                            --检查文本是否存在，不存在会报错，存在就正常运行
	wfile:write(info)                        --写入文本
	wfile:close()                            --关闭文本
end

--[[***************************************************************************
自定义函数
** Function name:          readfile
** Descriptions:           读出文件中的所有内容
** input parameters:       filename  文件名
** output parameters:      info      文件内容
***************************************************************************--]]
function readfile(filename)
	local wfile = io.open(filename,"r")      --以只读的方式打开文本
	assert(wfile)                            --检查文本是否存在，不存在会报错，存在就正常运行
	wfile:seek("set")                        --把文件位置定位到开头
	info=wfile:read("a")                     --从当前位置读取整个文件，并赋值到字符串中
	wfile:close()                            --关闭文本
	return info                              --返回字符串
end

--[[***************************************************************************
系统函数
** Function name:          on_control_notify
** Descriptions:           用户通过触摸修改控件后，执行此回调函数。
**                         点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
** input parameters:       screen：  被触发控件的页码
**                         control： 控件的编号
**                         value：   控件的值
***************************************************************************--]]
function on_control_notify(screen,control,value)

	--[[**********************
	--功能：      设置背光
	--调用函数：	 set_backlight(level)
	--函数功能：  设置背光值
	--参数：      level：  背光值	
	--********************--]]
	if screen==0 and control==2
	then
		set_backlight(value)                 --设置背光
	end

	--[[**********************
	--功能：      把背光值覆盖backlight.txt中的内容，原来的数据会被清0
	--调用函数1： writefile(filename,info)
	--调用函数2： get_backlight()
	--函数功能：  获取背光值
	--返回：      背光值
	--********************--]]
	if screen==0 and control==3 and value==1
	then
		backlight_value=get_backlight()                 --获取背光值
		writefile("backlight.txt",backlight_value)      --保存背光值
	end
	
	--[[**********************
	--功能：      读取backlight.txt中的背光值，并设置
	--调用函数1： readfile(filename)
	--调用函数2： set_backlight(level)
	--函数功能：  设置背光亮度值
	--参数：      level：  背光值
 	--调用函数3： set_value(screen,control,text)
	--函数功能：  设置控件的值
	--参数：      screen：  被触发控件的页码
	--            control： 控件的编号
	--            text:     要设置的内容
	--********************--]]
	if screen==0 and control==4 and value==1
	then
		backlight_value=readfile("backlight.txt")      --读数据
		set_backlight(backlight_value)                 --设置背光
		set_value(0,2,backlight_value)                 --设置滑块
	end

end

--[[***************************************************************************
END FILE
***************************************************************************--]]