--[[******************************Copyright(c)*********************************
** GUANGZHOU DCOLOUR TECHNOLOGY CO.,LTD
** ���ݴ�ʹ��Ƽ����޹�˾
** http://www.gz-dc.com/
**
**LUAѧϰ��վ��www.runoob.com/lua
**------File Info-----------------------------------------------------------
** File Name:              LUA�̳�-�������ȱ���
** Latest modified Date:   2019.02.21
** Latest Version:         V1.0
** Description:            �������ȱ���
**
**--------------------------------------------------------------------------
** Created By:             ���ܼ�
** Created date:           2019.02.21
** Version:                V1.0
** Descriptions:           �ļ���д
**
**--------------------------------------------------------------------------
** Modified by:            �޸��˵�����
** Modified date:          �ļ����޸����ڣ�YYYY-MM-DD��
** Version:                �ļ��޶��İ汾��
** Description:            �ļ��޶��ļ�Ҫ����
**
***************************************************************************--]]

--[[***************************************************************************
�Զ��庯��
** Function name:          writefile
** Descriptions:           ���ļ�д�룬�Ḳ��ԭ������������
** input parameters:       filename  �ļ���
**                         info      Ҫд���ı�
***************************************************************************--]]
function writefile(filename,info)
	local wfile = io.open(filename,"w")      --�Ը���д��ķ�ʽ���ı�
	assert(wfile)                            --����ı��Ƿ���ڣ������ڻᱨ�����ھ���������
	wfile:write(info)                        --д���ı�
	wfile:close()                            --�ر��ı�
end

--[[***************************************************************************
�Զ��庯��
** Function name:          readfile
** Descriptions:           �����ļ��е���������
** input parameters:       filename  �ļ���
** output parameters:      info      �ļ�����
***************************************************************************--]]
function readfile(filename)
	local wfile = io.open(filename,"r")      --��ֻ���ķ�ʽ���ı�
	assert(wfile)                            --����ı��Ƿ���ڣ������ڻᱨ�����ھ���������
	wfile:seek("set")                        --���ļ�λ�ö�λ����ͷ
	info=wfile:read("a")                     --�ӵ�ǰλ�ö�ȡ�����ļ�������ֵ���ַ�����
	wfile:close()                            --�ر��ı�
	return info                              --�����ַ���
end

--[[***************************************************************************
ϵͳ����
** Function name:          on_control_notify
** Descriptions:           �û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
**                         �����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
** input parameters:       screen��  �������ؼ���ҳ��
**                         control�� �ؼ��ı��
**                         value��   �ؼ���ֵ
***************************************************************************--]]
function on_control_notify(screen,control,value)

	--[[**********************
	--���ܣ�      ���ñ���
	--���ú�����	 set_backlight(level)
	--�������ܣ�  ���ñ���ֵ
	--������      level��  ����ֵ	
	--********************--]]
	if screen==0 and control==2
	then
		set_backlight(value)                 --���ñ���
	end

	--[[**********************
	--���ܣ�      �ѱ���ֵ����backlight.txt�е����ݣ�ԭ�������ݻᱻ��0
	--���ú���1�� writefile(filename,info)
	--���ú���2�� get_backlight()
	--�������ܣ�  ��ȡ����ֵ
	--���أ�      ����ֵ
	--********************--]]
	if screen==0 and control==3 and value==1
	then
		backlight_value=get_backlight()                 --��ȡ����ֵ
		writefile("backlight.txt",backlight_value)      --���汳��ֵ
	end
	
	--[[**********************
	--���ܣ�      ��ȡbacklight.txt�еı���ֵ��������
	--���ú���1�� readfile(filename)
	--���ú���2�� set_backlight(level)
	--�������ܣ�  ���ñ�������ֵ
	--������      level��  ����ֵ
 	--���ú���3�� set_value(screen,control,text)
	--�������ܣ�  ���ÿؼ���ֵ
	--������      screen��  �������ؼ���ҳ��
	--            control�� �ؼ��ı��
	--            text:     Ҫ���õ�����
	--********************--]]
	if screen==0 and control==4 and value==1
	then
		backlight_value=readfile("backlight.txt")      --������
		set_backlight(backlight_value)                 --���ñ���
		set_value(0,2,backlight_value)                 --���û���
	end

end

--[[***************************************************************************
END FILE
***************************************************************************--]]