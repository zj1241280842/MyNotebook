--[[*****************************Copyright(c)**********************************
**				Guangzhou DACAIGAUNGDIAN Technology Co. Ltd
**
**							 http://www.gz-dc.com
**
**------File Info-----------------------------------------------------------
** File Name:			    main.lua
** Latest modified Date:	2019/1/18
** Latest Version:			
** Description:				�ؼ�API����ʹ��˵��
**
**--------------------------------------------------------------------------
** Created By:				������
** Created date:			2019/1/24
** Version:					V1.0	
** Descriptions:			�ؼ�API����ʹ��˵��
**
**--------------------------------------------------------------------------
** Modified by:
** Modified date:
** Version:
** Description:
**
***************************************************************************--]]

local meter_value = 0				   --�Ǳ�
local Icon_value = 0                   --ͼ��������       

--[[***************************************************************************
** Function name:  on_init
** Descriptions:   ϵͳ��ʼ��ʱ��ִ�д˻ص�������
				   ע�⣺�ص������Ĳ����ͺ������̶������޸�
***************************************************************************--]]
function on_init()

end


--[[***************************************************************************
** Function name:  on_systick
** Descriptions:   ��ʱ�ص�������ϵͳÿ��1�����Զ����á�
				   ע�⣺�ص������Ĳ����ͺ������̶������޸�
***************************************************************************--]]
function on_systick()

end


--[[***************************************************************************
** Function name:  on_timer
** Descriptions:   ��ʱ����ʱ��ִ�д˻ص�����
				   ע�⣺�ص������Ĳ����ͺ������̶������޸�
** Input value :   timer_id ��ʱ��ʱ�Ķ�ʱ��ID�ţ���ʱ�����0~31
***************************************************************************--]]
function on_timer(timer_id)

end


--[[***************************************************************************
** Function name:  on_control_notify
** Descriptions:   �û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
				   �����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
				   ע�⣺�ص������Ĳ����ͺ������̶������޸�
** Input value :   screen  ����ID
				   control �ؼ�ID
				   value   �ؼ�ֵ(�����ı��ؼ������ֵ)
***************************************************************************--]]
function on_control_notify(screen,control,value)
	--***************************************************************************
	--���ܣ���ť�ؼ������д��ť�ؼ�ֵ
	--���ú�����set_value(screen,control,value) ���ÿؼ���ֵ��Ҳ�������ý����������顢�Ǳ�ȣ�
	--���ú����� get_value(screen,control)	   ��ȡ�ؼ�����ֵ
    --Input value :   screen  ����ID
	--			      control �ؼ�ID
	--			      value   �ؼ�ֵ(0 or 1)
	--***************************************************************************
	if screen == 1 then
	    if control == 4 and value == 1 then                       --���°�ť4��ȡ��ť1��2��ֵ
		    local contorl1_value = get_value(1,1)        
		    local contorl2_value = get_value(1,2)
		    set_value(1,6,contorl1_value)
		    set_value(1,8,contorl2_value)
		end
		if control == 9 and value == 1 then                       --���°�ť9���ð�ť1��ֵΪ1
		    set_value(1,1,1)
		end
		if control == 10 and value == 1 then					  --���°�ť10���ð�ť2��ֵΪ0
		    set_value(1,2,0)
		end
	end 
	--***************************************************************************
	--���ܣ��ı��ؼ������д�ؼ���ֵ
	--���ú�����set_value(screen,control,value)
	--          set_text(screen,control,value)    ���ÿؼ���ʾ����(�ַ���)���ı��ؼ�����ά��ؼ���
	--          get_value(screen,control)
	--          get_text (screen,control)         ��ȡ�ؼ��ַ�������(�ַ���)���ı��ؼ�����ά��ؼ���
    --Input value :   screen  ����ID
	--			      control �ؼ�ID
	--			      value   �ؼ�ֵ(�����ı��ؼ������ֵ)
	--***************************************************************************
	if screen == 2 then
	    if control == 4 and value == 1 then                       --���°�ť4��ȡ�ı��ؼ�1��2������
		    local text1_value = get_value(2,1)
		    local text2_value = get_text(2,2)
		    set_value(2,6,text1_value)
		    set_text(2,8,text2_value)
		end
		if control == 9 and value == 1 then                       --���°�ť9�����ı��ؼ�1������Ϊ��ֵ20
		    set_value(2,1,20)
		end
		if control == 10 and value == 1 then                      --���°�ť10�����ı��ؼ�2������Ϊ��ʿƼ�
		    set_text(2,2,"��ʿƼ�")
		end
	end 
	--***************************************************************************
	--���ܣ��Ǳ�ؼ������д�ؼ���ֵ
	--���ú�����set_value(screen,control,value)
	--���ú�����get_value(screen,control)
    --���� :    screen  ����ID
	--			control �ؼ�ID
	--	        value   �ؼ�ֵ
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
	--���ܣ�ͼ��ؼ������д�ؼ���ֵ
	--���ú�����set_value(screen,control,value)
	--���ú�����get_value(screen,control)
    --���� :    screen  ����ID
	--			control �ؼ�ID
	--	        value   �ؼ�ֵ
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
	--���ܣ����飬�������ؼ������д�ؼ���ֵ
	--���ú�����set_value(screen,control,value)
	--���ú�����get_value(screen,control)
    --Input value :   screen  ����ID
	--			      control �ؼ�ID
	--			      value   �ؼ�ֵ(�����ı��ؼ������ֵ)
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
	--���ܣ�����ѡ��ؼ������д�ؼ���ֵ
	--���ú�����set_value(screen,control,value)
	--���ú�����get_value(screen,control)
    --Input value :   screen  ����ID
	--			      control �ؼ�ID
	--			      value   �ؼ�ֵ(�����ı��ؼ������ֵ)
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
	--���ܣ���ά��ؼ���д
	--���ú�����set_text(screen,control,value)
	--���ú�����get_text(screen,control)
    --Input value :   screen  ����ID
	--			      control �ؼ�ID
	--			      value   �ؼ�ֵ(�����ı��ؼ������ֵ)
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
	--���ܣ�����8���ƿؼ���ʾ������
	--���ú�����set_visiable(screen,control,value)  ���ÿؼ��Ƿ�ɼ��� visiable Ϊ 0 ���أ� 
    --Input value :   screen  ����ID
	--			      control �ؼ�ID
	--			      value   0 or 1
	--                0Ϊ����  1Ϊ��ʾ
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
	--���ܣ�����9���ƿؼ��ܷ���
	--���ú�����set_enable(screen,control,value) ���ÿؼ��Ƿ�ɴ���
    --Input value :   screen  ����ID
	--			      control �ؼ�ID
	--			      value   0 or 1
	--                0Ϊ��ֹ����  1Ϊ����ʹ��
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
	--���ܣ�����10���ÿؼ�ǰ��ɫ
	--���ú�����set_fore_color(screen,control,color)  ���ÿؼ�ǰ��ɫ
    --Input value :   screen  ����ID
	--			      control �ؼ�ID
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
	--���ܣ�����11���ÿؼ�����ɫ
	--���ú�����set_back_color(screen,control,color)  ���ÿؼ�����ɫ
    --Input value :   screen  ����ID
	--			      control �ؼ�ID
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
** Descriptions:   �������л���Ŀ�껭��IDʱ��ִ�д˻ص�����
				   ע�⣺�ص������Ĳ����ͺ������̶������޸�
** Input value :   screen  Ŀ�껭��ID
*******************************************************************************--]]
function on_screen_change(screen)

end
--[[************************************************************************
END FILE
************************************************************************--]]

