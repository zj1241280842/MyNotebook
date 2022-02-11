--[[*****************************Copyright(c)**********************************
**				Guangzhou DACAIGAUNGDIAN Technology Co. Ltd
**
**							 http://www.gz-dc.com
**
**------File Info-----------------------------------------------------------
** File Name:			    main.lua
** Latest modified Date:	2019/2/22
** Latest Version:			
** Description:				绘图API使用教程说明
**
**--------------------------------------------------------------------------
** Created By:				林青田
** Created date:			2019/2/22
** Version:					V1.0	
** Descriptions:			绘图API使用教程说明
**
**--------------------------------------------------------------------------
** Modified by:
** Modified date:
** Version:
** Description:
**
***************************************************************************--]]

local draw_type = 0                                 --画的类型
local draw_pen_color = 0xFFFF                       --画笔颜色为白色，RGB565

local graph_x = {70,120,160,200,240,280}            --曲线数据
local graph_y = {300,300,260,260,300,300}           --曲线数据


local progress = 0                                  --进度条百分比
local rectangle_x = 460                             --进度条起始x
local rectangle_y = 354                            --进度条起始y
local draw_pic1 = 0
local surface = 0

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

	if timer_id == 2 then
		rectangle_x = rectangle_x +30
		progress = progress + 10
		if rectangle_x > 760 then
			rectangle_x = 460
			progress = 0
		end
		
		set_value(2,3,progress)
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
	--******************************************************
	--功能：   选取对应的图形
	--调用函数：redraw()               重新绘图                        
	--******************************************************	
	if screen == 1 then
	    if (control >= 1 and control <= 8)and value == 1 then                       --按下画对应的图形
		   draw_type = control
		   redraw()
		end
		if control == 9 and value == 1 then                                           --按下设置画笔颜色
		   draw_pen_color = 0xffe0
		   redraw()
		end
	end 
	--******************************************************
	--功能：   打开定时器，定时绘图
	--调用函数：start_timer(timer_id, timeout, countdown, repeat)   打开定时器
    --参数 :    timer_id         画面ID
	--          timeout          超时时间
	--	        countdown        1或0  顺计时 1 ，倒计时 0 
	--	        repeat           计时器重复次数   0为无限循环
	--调用函数：stop_timer(timer_id)   停止定时器
	--调用函数：redraw()               重新绘图                        
	--******************************************************	
	if screen == 2 then
		if control == 8 and value == 1 then                                           --按下启动定时器2
			start_timer(2,300,1,0)

		elseif control == 8 and value == 0 then
			stop_timer(2)                                                             --按下按钮停止定时器2
			
		end
	end 
	if screen == 3 and control == 6 and value == 1 then
	--******************************************************
	--功能：   销毁图层指针
	--调用函数：destroy_surface(surface)   销毁图层指针
    --参数 :    surface         图层指针
	--调用函数：surface = load_surface (filepath)   加载图片到图层
	--参数      filepath               图片路径
	--返还值    surface                图层指针     指向所加载的图片
	--调用函数：redraw()               重新绘图                        
	--******************************************************		
		if surface ~= 0 then
			destroy_surface(surface)           
			surface = 0
		end

		surface = load_surface ("A:/0.jpg")

	end
	if screen == 3 and control == 4 and value == 1 then
		redraw()
		draw_pic1 = 1
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

--[[***************************************************************************
** Function name:  on_draw
** Descriptions:   画面刷新时，或者使用API函数 redraw 申请重绘，执行此回调函数
				   注意：回调函数的参数和函数名固定不能修改
** Input value :   screen  目标画面ID
***************************************************************************--]]
function on_draw(screen)
	
	set_pen_color(draw_pen_color)
 
    if screen == 1  then
    --*********************************************************************
	--调用函数：draw_line(x1,y1,x2,y2,level)
    --函数功能：   两点间画直线
	--参数：      
	--      x1           直线起始点x轴的坐标
	--      y1           直线起始点y轴的坐标
	--      x2           直线结束点X轴的坐标
	--      y2           直线结束点y轴的坐标
	--      level        直线的曲线等级，1~10级
	--*********************************************************************
	    if draw_type == 1 then
			draw_line(400,250,550,250,2)
    --*********************************************************************
	--调用函数：draw_rect(x1,y1,x2,y2,fill)
    --函数功能：   画矩形
	--参数：       
	--       x1           矩形左上脚x轴的坐标
	--       y1           矩形左上脚y轴的坐标
	--       x2           矩形右下脚X轴的坐标
	--       y2           矩形右下角y轴的坐标
	--       fill         填充1，不填充0
	--*********************************************************************	
		elseif draw_type == 2 then
		    draw_rect(400,200,600,300,0)
		elseif draw_type == 3 then
		    draw_rect(400,200,600,300,1)
    --*********************************************************************
	--调用函数：draw_circle(x1,y1,r,fill)
    --函数功能：   画圆
	--参数：    
	--       x1           直线起始点x轴的坐标
	--       y1           直线起始点y轴的坐标
	--       x2           直线结束点X轴的坐标
	--       r            直线结束点y轴的坐标
	--       fill         填充1，不填充0
	--*********************************************************************
		elseif draw_type == 4 then
		    draw_circle(500,250,50,0)
		elseif draw_type == 5 then
		    draw_circle(500,250,50,1)
    --*********************************************************************
	--调用函数：draw_ellipse(x1,y1,x2,y2,fill)
    --函数功能：   画椭圆
	--参数：       
	--       x1           左上角的x坐标
	--       y1           左上角的y坐标
	--       x2           右下角的x坐标
	--       y2           右下角的y坐标
	--       fill         填充1，不填充0
	--*********************************************************************
		elseif draw_type == 6 then
		    draw_ellipse(400,200,600,300,0)
		elseif draw_type == 7 then
		    draw_ellipse(400,200,600,300,1)
		end
 	end	
    if screen == 2  then	
		
		draw_rect(460,320,rectangle_x,rectangle_y,1)                                --进度条

		for i = 1 ,5 do
			draw_line(graph_x[i],graph_y[i],graph_x[i+1],graph_y[i+1],1)	        --曲线
		end
	
	end
	if screen == 3  then	
		
		if draw_pic1 == 1 then
			draw_image_file("a:/1.png",80,160,270,230,0,100)                        --显示内部存储a区中的1.png图片
		end
	    draw_surface(surface,460,160,270,230,0,0)							        --显示内部存储a区中的0.jpg图片
		
	end
end  

--[[************************************************************************
END FILE
************************************************************************--]]

