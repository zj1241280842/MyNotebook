--[[******************************Copyright(c)*********************************
** GUANGZHOU DCOLOUR TECHNOLOGY CO.,LTD
** ���ݴ�ʹ��Ƽ����޹�˾
** http://www.gz-dc.com/
**
**LUAѧϰ��վ��www.runoob.com/lua
**------File Info-----------------------------------------------------------
** File Name:              LUA�̳�-�ı�����-LUA
** Latest modified Date:   2019.02.21
** Latest Version:         V1.0
** Description:            LUA�ļ�IO
**
**--------------------------------------------------------------------------
** Created By:             ���ܼ�
** Created date:           2019.02.21
** Version:                V1.0
** Descriptions:           �ı�����
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

local write_text
local read_text
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
	--���ܣ�      ���ı��ؼ�1�����ݸ���text.txt�е����ݣ�ԭ�������ݻᱻ��0
	--���ú���1�� writefile(filename,info)
	--���ú���2�� get_text(screen,control)
	--�������ܣ�  ��ȡ�ı��ؼ�������
	--������      screen��  �������ؼ���ҳ��
	--            control�� �ؼ��ı��
	--���أ�      �ı�������
	--********************--]]
	if screen==0 and control==2 and value==1
	then
		write_text=get_text(0,1)                --��ȡ�ı�
		writefile("text.txt",write_text)       --�����ı�
	end
	
	--[[**********************
	--���ܣ�      ��text.txt�е�������ʾ���ı��ؼ�3��
	--���ú���1�� readfile(filename)
	--���ú���2�� set_text(screen,control,text)
	--�������ܣ�  �����ı��ؼ�������
	--������      screen��  �������ؼ���ҳ��
	--            control�� �ؼ��ı��
	--            text:     Ҫ���õ�����
	--********************--]]
	if screen==0 and control==4 and value==1
	then
		read_text=readfile("text.txt")         --������
		set_text(0,3,read_text)                 --��������ʾ���ı�����
	end

end

--[[***************************************************************************
END FILE
***************************************************************************--]]