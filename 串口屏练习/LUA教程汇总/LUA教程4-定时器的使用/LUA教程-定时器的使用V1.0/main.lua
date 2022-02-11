--[[******************************Copyright(c)*********************************
** GUANGZHOU DCOLOUR TECHNOLOGY CO.,LTD
** 广州大彩光电科技有限公司
** http://www.gz-dc.com/
**
**LUA学习网站：www.runoob.com/lua
**------File Info-----------------------------------------------------------
** File Name:              LUA教程-定时器的使用-LUA
** Latest modified Date:   2019.01.21
** Latest Version:         V1.0
** Description:            定时器的使用
**
**--------------------------------------------------------------------------
** Created By:             林绍佳
** Created date:           2019.01.21
** Version:                V1.0
** Descriptions:           按下按钮2s后灯亮/灭
**
**--------------------------------------------------------------------------
** Modified by:            修改人的姓名
** Modified date:          文件的修改日期（YYYY-MM-DD）
** Version:                文件修订的版本号
** Description:            文件修订的简要描述
**
***************************************************************************--]]


--[[***************************************************************************
** Function name:          on_control_notify
** Descriptions:           用户通过触摸修改控件后，执行此回调函数。
**                         点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
** input parameters:       screen：被触发控件的页码
**                         control：控件的编号
**                         value：控件的值
***************************************************************************--]]
function on_control_notify(screen,control,value)
	
	--************************
	--功能：     按下按钮时启动定时器
	--调用函数： start_timer(timer_id, timeout, countdown, repeat)
	--函数功能： 启动定时器
	--参数：     timer_id：  定时器ID，0~31；
    --           timeout：   超时时间，单位毫秒；
    --           countdown： 0 顺计时，1 倒计时；
    --           repeat：    重复次数，0 表示无限重复；
	--************************
	if screen==0 and control==1 and value==1    --按下第0页，第1个控件
	then
		start_timer(0,1000,1,0)                 --开启定时器0，超时时间2s
	end
	
	--************************
	--功能：     松开按钮时停止定时器
	--调用函数： stop_timer(timer_id)
	--函数功能： 停止定时器
	--参数：     timer_id：定时器ID，0~31；
	--************************
	if screen==0 and control==1 and value==0    --松开第0页，第1个控件
	then
		stop_timer(0)                            --停止定时器0
	end
	
	
end

local lamp_status=0

--[[***************************************************************************
** Function name:          on_timer
** Descriptions:           定时器超时回调函数
** input parameters:       timer_id,超时定时器的id；
***************************************************************************--]]
function on_timer(timer_id)
	
	--************************
	--功能：     定时器1超时，设置按钮2为按下状态（灯亮）
	--调用函数： set_value(screen,control,value)
	--函数功能： 设置按钮2为按下状态
	--参数：     screen：  目标画面ID；
	--           control： 目标控件ID；
	--           value：   0 按下，1 弹起；
	--************************
	if timer_id==0              --定时器0超时
	then
		if lamp_status==0       --当按钮为弹起状态
		then
			set_value(0,2,1)    --设置按钮2为按下状态，灯亮
			lamp_status=1
		elseif lamp_status==1   --当按钮为按下状态
		then
			set_value(0,2,0)    --设置按钮2为弹起状态，灯灭
			lamp_status=0
		end
	end
	
	
end

--[[***************************************************************************
END FILE
***************************************************************************--]]