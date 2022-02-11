--[[*****************************Copyright(c)**********************************
**				Guangzhou DACAIGAUNGDIAN Technology Co. Ltd
**
**							 http://www.gz-dc.com
**
**------File Info-----------------------------------------------------------
** File Name:			    main.lua
** Latest modified Date:	2019/1/18
** Latest Version:			
** Description:				常用的回调函数的使用说明
**
**--------------------------------------------------------------------------
** Created By:				林青田
** Created date:			2019/1/18
** Version:					V1.0	
** Descriptions:			常用回调函数的使用说明
**
**--------------------------------------------------------------------------
** Modified by:
** Modified date:
** Version:
** Description:
**
***************************************************************************--]]

local sys_timer      = 0                                  --系统定时器计数器
local timer_out      = 0                                  --定时器超时计数器
local show_picture   = 0                                  --画图图片编号

--[[***************************************************************************
** Function name:  on_init
** Descriptions:   系统初始化时，执行此回调函数。
				   注意：回调函数的参数和函数名固定不能修改
***************************************************************************--]]
function on_init()
     set_value(1,1,10)									  --设置文本控件的值
 	 set_value(1,2,2)                                     --设置文本控件的值
end


--[[***************************************************************************
** Function name:  on_systick
** Descriptions:   定时回调函数，系统每隔1秒钟自动调用。
				   注意：回调函数的参数和函数名固定不能修改
***************************************************************************--]]
function on_systick()
     sys_timer = sys_timer +1     
	 set_value(2,1,sys_timer)
end


--[[***************************************************************************
** Function name:  on_timer
** Descriptions:   定时器超时，执行此回调函数
				   注意：回调函数的参数和函数名固定不能修改
** Input value :   timer_id 定时超时的定时器ID号，定时器编号0~31
***************************************************************************--]]
function on_timer(timer_id)
     if timer_id == 0 then                                --定时器0
		timer_out = timer_out +1
		set_value(3,3,timer_out)
	 end
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
	--***********************************************************
	--功能：按下画面4的控件1启动定时器0
	--调用函数：start_timer(timer_id, timeout, countdown, repeat)
    --函数功能：启动定时器
	--参数：    timer_id， 定时器ID；
	--  		timeout，  超时时间；
	--          countdown，1顺计时，0倒计时
	--          repeat     计时次数，0无限循环 
	--***********************************************************
    if screen == 3 and control == 1 and value == 1 then	
		start_timer(0,1000,1,0)                
    end 
    if screen == 3 and control == 2 and value == 1 then	                                                       
		stop_timer(0)                                     --停止定时时器0工作
		timer_out = 0                
    end 	
    if screen == 4  then	
        if control == 1 and value == 1 then               --value == 1 按钮按下
		 	set_text(4,7,"按钮按下")
		elseif control == 1 and value == 0 then           --value == 0 按钮弹起
			set_text(4,7,"按钮弹起")
		elseif control == 2   then                        --文本输入
			set_text(4,7,"文本输入")      
		elseif control == 3   then                        --图标控件
			set_text(4,7,"触摸图标")
 		elseif control == 4  then                         --滑动选择控件
			set_text(4,7,"滑动选择")
		elseif control == 5   then                        --菜单控件
			set_text(4,7,"菜单选择")
		elseif control == 6   then                        --滑块控件
			set_text(4,7,"滑块滑动")
	    end
    end 

    if screen == 6 then
		if control == 1 and value == 1  then             --绘制图片1
			show_picture = 1
			redraw()									 --申请重绘
        end
      	if control == 2 and value == 1  then             --绘制图片2
	 		show_picture = 2
			redraw()                                    
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
	
    if screen == 8 then                                --切换到画面9时，修改控件1，2的数据
       set_value(8,1,9)                                --修改控件1的数据
 	   set_value(8,2,30)                               --修改控件2的数据
	end
end


--[[***************************************************************************
** Function name:  on_draw
** Descriptions:   画面刷新时，或者使用API函数 redraw 申请重绘，执行此回调函数
				   注意：回调函数的参数和函数名固定不能修改
** Input value :   screen  目标画面ID
***************************************************************************--]]
function on_draw(screen)
    --******************************************************************************
	--调用函数：draw_image(image_id,frame_id,dstx,dsty,width,height,srcx,srcy)
    --函数功能：根据图片ID绘图
	--参数：   image_id 图片资源的 ID
	--frame_id 对应图标， 可以设置帧 ID，其他图片固定为 0
	--dstx     图片显示 X 坐标
	--dsty     图片显示 Y 坐标
	--width       图片显示宽度
	--height      图片显示高度
	--srcx     图片裁剪 X 坐标
	--srcy     图片裁剪 Y 坐标	
	--*****************************************************************************
    if screen == 6 and show_picture == 1 then
	    draw_image(0,0,180,200,450,185,0,0)
 	end	
    if screen == 6 and show_picture == 2 then	
        draw_image(1,0,180,200,450,185,0,0) 
	end
end  


--[[***************************************************************************
** Function name:  on_usb_inserted
** Descriptions:   插入U盘后，执行此回调函数
				   注意：回调函数的参数和函数名固定不能修改
** Input value :   dir  U盘的路径
***************************************************************************--]]
function on_usb_inserted(dir)
       set_text(7,1,dir)                              --显示U盘路径      
end


--[[***************************************************************************
** Function name:  on_sd_inserted
** Descriptions:   插入SD卡后，执行此回调函数
				   注意：回调函数的参数和函数名固定不能修改
** Input value :   dir  SD卡的路径
***************************************************************************--]]
function on_sd_inserted(dir)
	   set_text(7,2,dir)                              --显示SD卡路径  
end

--[[***************************************************************************
** Function name:  on_sd_inserted
** Descriptions:   拔出U盘后，执行此回调函数
				   注意：回调函数的参数和函数名固定不能修改
***************************************************************************--]]
function on_usb_removed()
       set_text(7,1,"已拔出U盘")
end


--[[***************************************************************************
** Function name:  on_sd_inserted
** Descriptions:   拔出SD卡后，执行此回调函数
				   注意：回调函数的参数和函数名固定不能修改
***************************************************************************--]]
function on_sd_removed()
	   set_text(7,2,"已拔出SD卡")
end
--[[************************************************************************
END FILE
************************************************************************--]]


