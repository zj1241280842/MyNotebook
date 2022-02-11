--[[*****************************Copyright(c)**********************************
**				Guangzhou DACAIGAUNGDIAN Technology Co. Ltd
**
**							 http://www.gz-dc.com
**
**------File Info-----------------------------------------------------------
** File Name:			    main.lua
** Latest modified Date:	2019/1/18
** Latest Version:			
** Description:				控件API函数使用说明
**
**--------------------------------------------------------------------------
** Created By:				林青田
** Created date:			2019/1/24
** Version:					V1.0	
** Descriptions:			控件API函数使用说明
**
**--------------------------------------------------------------------------
** Modified by:
** Modified date:
** Version:
** Description:
**
***************************************************************************--]]

local meter_value = 0				   --仪表
local Icon_value = 0                   --图标索引号       

--[[***************************************************************************
** Function name:  on_init
** Descriptions:   系统初始化时，执行此回调函数。
				   注意：回调函数的参数和函数名固定不能修改
***************************************************************************--]]
function on_init()

end


--[[***************************************************************************
** Function name:  on_systick
** Descriptions:   定时回调函数，系统每隔1秒钟自动调用。
				   注意：回调函数的参数和函数名固定不能修改
***************************************************************************--]]
function on_systick()

end


--[[***************************************************************************
** Function name:  on_timer
** Descriptions:   定时器超时，执行此回调函数
				   注意：回调函数的参数和函数名固定不能修改
** Input value :   timer_id 定时超时的定时器ID号，定时器编号0~31
***************************************************************************--]]
function on_timer(timer_id)

end


--[[***************************************************************************
** Function name:  on_control_notify
** Descriptions:   用户通过触摸修改控件后，执行此回调函数。
				   点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
				   注意：回调函数的参数和函数名固定不能修改
** Input value :   screen  画面ID
				   control 控件ID
				   value   控件值(包括文本控件输入的值)
***************************************************************************--]]
function on_control_notify(screen,control,value)
	--***************************************************************************
	--功能：按钮控件画面读写按钮控件值
	--调用函数：set_value(screen,control,value) 设置控件数值（也可以设置进度条、滑块、仪表等）
	--调用函数： get_value(screen,control)	   获取控件的数值
    --Input value :   screen  画面ID
	--			      control 控件ID
	--			      value   控件值(0 or 1)
	--***************************************************************************
	if screen == 1 then
	    if control == 4 and value == 1 then                       --按下按钮4获取按钮1，2的值
		    local contorl1_value = get_value(1,1)        
		    local contorl2_value = get_value(1,2)
		    set_value(1,6,contorl1_value)
		    set_value(1,8,contorl2_value)
		end
		if control == 9 and value == 1 then                       --按下按钮9设置按钮1的值为1
		    set_value(1,1,1)
		end
		if control == 10 and value == 1 then					  --按下按钮10设置按钮2的值为0
		    set_value(1,2,0)
		end
	end 
	--***************************************************************************
	--功能：文本控件画面读写控件件值
	--调用函数：set_value(screen,control,value)
	--          set_text(screen,control,value)    设置控件显示内容(字符串)，文本控件，二维码控件等
	--          get_value(screen,control)
	--          get_text (screen,control)         获取控件字符串内容(字符串)，文本控件，二维码控件等
    --Input value :   screen  画面ID
	--			      control 控件ID
	--			      value   控件值(包括文本控件输入的值)
	--***************************************************************************
	if screen == 2 then
	    if control == 4 and value == 1 then                       --按下按钮4读取文本控件1，2的内容
		    local text1_value = get_value(2,1)
		    local text2_value = get_text(2,2)
		    set_value(2,6,text1_value)
		    set_text(2,8,text2_value)
		end
		if control == 9 and value == 1 then                       --按下按钮9设置文本控件1的内容为数值20
		    set_value(2,1,20)
		end
		if control == 10 and value == 1 then                      --按下按钮10设置文本控件2的内容为大彩科技
		    set_text(2,2,"大彩科技")
		end
	end 
	--***************************************************************************
	--功能：仪表控件画面读写控件件值
	--调用函数：set_value(screen,control,value)
	--调用函数：get_value(screen,control)
    --参数 :    screen  画面ID
	--			control 控件ID
	--	        value   控件值
	--***************************************************************************
	if screen == 3 then
	    if control == 3 and value == 1 then
			meter_value = meter_value + 5
			if meter_value >= 360 then
				meter_value = 0
			end
		    set_value(3,1,meter_value)
		end
		if control == 4 and value == 1 then
			meter_value = meter_value - 5 
			if meter_value < 0 then
				meter_value = 355
			end
		    set_value(3,1,meter_value)
		end
		if control == 2 and value == 1 then
		    local value = get_value(3,1)
			set_value(3,7,value)
		end
	end 
	--***************************************************************************
	--功能：图标控件画面读写控件件值
	--调用函数：set_value(screen,control,value)
	--调用函数：get_value(screen,control)
    --参数 :    screen  画面ID
	--			control 控件ID
	--	        value   控件值
	--***************************************************************************
	if screen == 5 then
	    if control == 2 and value == 1 then
		    Icon_value = Icon_value -1
			if Icon_value < 0 then
				Icon_value = 6
			end
			set_value(5,1,Icon_value)
		end
		if control == 3 and value == 1 then
		    Icon_value = Icon_value +1
			if Icon_value > 6 then
				Icon_value = 0
			end
			set_value(5,1,Icon_value)
		end
		if control == 4 and value == 1 then
		    local value = get_value(5,1)
			set_value(5,9,value)
		end
	end 
	--***************************************************************************
	--功能：滑块，进度条控件画面读写控件件值
	--调用函数：set_value(screen,control,value)
	--调用函数：get_value(screen,control)
    --Input value :   screen  画面ID
	--			      control 控件ID
	--			      value   控件值(包括文本控件输入的值)
	--***************************************************************************
	if screen == 4 then
	    if control == 5 and value == 1 then
		    set_value(4,1,100)
		end
		if control == 6 and value == 1 then
		    set_value(4,2,50)
		end
		if control == 3 and value == 1 then
		    local progress_value = get_value(4,1)
			local slider_value = get_value(4,2)
			set_value(4,7,slider_value)
			set_value(4,8,progress_value)
		end
	end 
	--***************************************************************************
	--功能：滑动选择控件画面读写控件件值
	--调用函数：set_value(screen,control,value)
	--调用函数：get_value(screen,control)
    --Input value :   screen  画面ID
	--			      control 控件ID
	--			      value   控件值(包括文本控件输入的值)
    --***************************************************************************	
	if screen == 6 then
	    if control == 7 and value == 1 then
		    set_value(6,1,2)
		end
		if control == 8 and value == 1 then
		    set_value(6,2,1)
		end
		if control == 6 and value == 1 then
		    local selector1_value = get_value(6,1)
			local selector2_value = get_value(6,2)
			set_value(6,13,selector1_value)
			set_value(6,16,selector2_value)
		end
	end 
	--***************************************************************************
	--功能：二维码控件读写
	--调用函数：set_text(screen,control,value)
	--调用函数：get_text(screen,control)
    --Input value :   screen  画面ID
	--			      control 控件ID
	--			      value   控件值(包括文本控件输入的值)
    --***************************************************************************	
	if screen == 7 then
	    if control == 7 and value == 1 then
			local qccode_value = get_text(7,2)
		    set_text(7,1,qccode_value)
		end
		if control == 6 and value == 1 then
		    local qccode_value = get_text(7,1)
		    set_text(7,3,qccode_value)
		end

	end
	--***************************************************************************
	--功能：画面8控制控件显示或隐藏
	--调用函数：set_visiable(screen,control,value)  设置控件是否可见， visiable 为 0 隐藏， 
    --Input value :   screen  画面ID
	--			      control 控件ID
	--			      value   0 or 1
	--                0为隐藏  1为显示
    --***************************************************************************	
	if screen == 8 then
	    if control == 12 and value == 1 then
			for i = 1 ,11 do
				set_visiable(8,i,1)
			end
		end
		if control == 13 and value == 1 then
		    for i = 1 ,11 do
				set_visiable(8,i,0)
			end
		end
		
	end
	--***************************************************************************
	--功能：画面9控制控件能否触摸
	--调用函数：set_enable(screen,control,value) 设置控件是否可触摸
    --Input value :   screen  画面ID
	--			      control 控件ID
	--			      value   0 or 1
	--                0为禁止触摸  1为触摸使能
    --***************************************************************************	
	if screen == 9 then
	    if control == 12 and value == 1 then
			for i = 1 ,11 do
				set_enable(9,i,0)
			end
		end
		if control == 13 and value == 1 then
		    for i = 1 ,11 do
				set_enable(9,i,1)
			end
		end
	end
	--***************************************************************************
	--功能：画面10设置控件前景色
	--调用函数：set_fore_color(screen,control,color)  设置控件前景色
    --Input value :   screen  画面ID
	--			      control 控件ID
	--			      color   RGB565
    --***************************************************************************
	if screen == 10 then
	    if control == 12 and value == 1 then
			for i = 1 ,2 do
				set_fore_color(10,i,0xF800)
			end
		end
		if control == 13 and value == 1 then
		    for i = 1 ,2 do
				set_fore_color(10,i,0x1f)
			end
		end
	end
	--***************************************************************************
	--功能：画面11设置控件背景色
	--调用函数：set_back_color(screen,control,color)  设置控件背景色
    --Input value :   screen  画面ID
	--			      control 控件ID
	--			      color   RGB565
    --***************************************************************************
	if screen == 11 then
	    if control == 12 and value == 1 then
			for i = 1 ,2 do
				set_back_color(11,i,0xF800)
			end
		end
		if control == 13 and value == 1 then
		    for i = 1 ,2 do
				set_back_color(11,i,0x1f)
			end
		end
	end
end


--[[***************************************************************************
** Function name:  on_screen_change
** Descriptions:   当画面切换至目标画面ID时，执行此回调函数
				   注意：回调函数的参数和函数名固定不能修改
** Input value :   screen  目标画面ID
*******************************************************************************--]]
function on_screen_change(screen)

end
--[[************************************************************************
END FILE
************************************************************************--]]

