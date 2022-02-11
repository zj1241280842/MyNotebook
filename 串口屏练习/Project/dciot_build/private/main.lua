------------------------------------
-- ��ʾ
-- ���ʹ������Lua�༭���߱༭���ĵ����뽫VisualTFT����д򿪵Ĵ��ļ��༭����ͼ�رգ�
-- ��ΪVisualTFT�����Զ����湦�ܣ���������޸�ʱ����ͬ����VisualTFT�༭��ͼ��
-- VisualTFT��ʱ����ʱ����������޸ĵ����ݽ����ָ���
--
-- Attention
-- If you use other Lua Editor to edit this file, please close the file editor view 
-- opened in the VisualTFT, Because VisualTFT has an automatic save function, 
-- other Lua Editor cannot be synchronized to the VisualTFT edit view when it is modified.
-- When VisualTFT saves regularly, the content modified by other Lua Editor will be restored.
------------------------------------

--�����г��˳��õĻص�����
--���๦�����Ķ�<<LUA�ű�API.pdf>>


--��ʼ������
--function on_init()
--end

--��ʱ�ص�������ϵͳÿ��1�����Զ����á�
--function on_systick()
--end

--��ʱ����ʱ�ص������������õĶ�ʱ����ʱʱ��ִ�д˻ص�������timer_idΪ��Ӧ�Ķ�ʱ��ID
--function on_timer(timer_id)
--end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
--function on_control_notify(screen,control,value)
--end

--�������л�ʱ��ִ�д˻ص�������screenΪĿ�껭�档
--function on_screen_change(screen)
--end




-- ʹ���Զ��崮��ָ��������record ����Ƭ�� ����ʽΪEE B5���Զ������ݡ�FF FC FF FF

--[[

   | ������| ��������   | ���� |
   | ---- | ----------- | ---- |
   | 0x01 |��          | ���ͼ�¼����  |
   | 0x02 | byte1,byte2,byte3,byte4 | ���͵�����¼ ,�ĸ��ֽڷֱ��� ���衢λ�á���������ʱ |
--]]



-- ��������ķ���table
local Linklist = {}
 
-- ��ʼ��������һ���ձ�
function Linklist.init()
    -- body
    local node = {}
    -- listΪ����������
    local list = node
    list.length = 0
    list.next = nil
    --print("�����ʼ���ɹ�")
    -- ���������ʼ�ڵ�͵�ǰ�ڵ�
    return list, node
end
 
function Linklist.checkList(list)
    -- body
    if not list then 
        --print("��������") 
     return
    end
end
 
function Linklist.checkIndex(list, index)
    -- body
    if index < 1 or index > list.length + 1 then
        --print("����Խ��")
        return
    end
end
 
function Linklist.checkAll(list, index)
    -- body
    Linklist.checkList(list)
    Linklist.checkIndex(list, index)
end
 
-- β����ӽڵ�
function Linklist.addTail(list, node, data)
    -- body
    Linklist.checkList(list)
 
    -- �����µ�β���ڵ�
    node.next = {} 
    node = node.next
    node.next = nil
    node.data = data
    list.length = list.length+1
    
    --print("β����ӽڵ�ɹ�")
    return node
end
 
-- ͷ����ӽڵ�
function Linklist.addHead(list, data)
    -- body
    Linklist.checkList(list)
 
    --�޸��½ڵ��ͷ�ڵ��next
    local newNode = {}  
    newNode.data = data
    newNode.next = list.next
    list.next = newNode
    list.length = list.length+1
    --print("ͷ����ӽڵ�ɹ�")
end
 
-- ������ӽڵ�
function Linklist.insertByIndex(list, index, data)
    -- body
    Linklist.checkAll(list, index)
 
    local j,k,l = index - 1, 0, list
    while k ~= j do
        k = k + 1
        l = l.next
    end
 
    -- ��ʼ���
    local newNode = {}
    newNode.data = data
    newNode.next = l.next
    l.next = newNode
    list.length = list.length + 1
    --print("������ӽڵ�ɹ�")
 
end
 
-- ����ɾ�������ؽڵ���������
function Linklist.deleteByIndex(list, index)
    -- body
    Linklist.checkAll(list, index)
 
    local j,k,l = index - 1, 0, list
    while k ~= j do
        k = k + 1
        l = l.next
    end
 
    -- ��ʼɾ�� l.next
    d = l.next.data
    t = l.next.next
    l.next = nil
    l.next = t
    list.length = list.length - 1
    --print("����ɾ���ڵ�ɹ�")
    
end
 
-- ������ȡָ���ڵ�����
function Linklist.getDataByIndex(list, index)
    -- body
    Linklist.checkAll(list, index)
 
    local l = list.next
    local k = 1
    while l do
        if k == index then
            --print("������ȡ�ڵ�ɹ�")
            return l.data
        end
        l = l.next
        k = k + 1
    end
    --print("����Խ��")
end

 
-- �����Ƿ�Ϊ��
function Linklist.isEmpty(list)
    -- body
    Linklist.checkList(list)
 
    return list.length == 0
end
 
-- ��������������ɺ������ڣ�ֻ����Ϊ�գ��൱�տ�ʼ�ĳ�ʼ��״̬
function Linklist.clear(list)
    -- body
    Linklist.checkList(list)
 
    while true do
        -- fNodeΪ������ָ��
        fNode = list.next
        -- ��������Ϊ�ձ�
        if not fNode then  
            --print("��������ɹ�")
            break
        end
        t = fNode.next
        -- �ÿ�
        list.next = nil
        list.next = t
    end
    list.length = 0
end
 
-- ��������
function Linklist.destory(list)
    -- body
    if list then
        Linklist.clear(list)
    end
    list = nil
    --print("�������ٳɹ�")
end
 

local dList, curNode = Linklist.init()

local main_screen = 0
local del_screen = 1
local screen_add = 3
local screen_test = 2
local set1_screen = 4
local screen_add_loop = 6
local screen_del_loop = 5


local step_total = 0

--set screen
local screen_set_button_return = 1
local screen_set_button_del = 4
local screen_set_button_add = 3
local screen_set_record_action = 2
local screen_set_button_download = 6
local screen_set_process_download = 8

-- add screen 
local screen_add_button_confirm = 1
local screen_add_button_cancel = 2
local screen_add_text_step = 3

local screen_add_menu_position = 4
local screen_add_text_position = 5
local screen_add_button_position = 6

local screen_add_text_num_display = 7
local screen_add_text_num_input = 8
local screen_add_text_delay = 9
local screen_add_text_action = 10
local add_act_text_control = 11

--delete screen
local screen_del_button_confirm = 1
local screen_del_button_cancel = 2
local screen_del_text_del_num = 3

--set1 screen
local screen_set1_button_return = 1
local screen_set1_record_action = 2
local screen_set1_record_loop   = 5
local screen_set1_button_action_add = 3
local screen_set1_button_action_del = 4
local screen_set1_button_loop_add   = 6
local screen_set1_button_loop_del   = 7
local screen_set1_button_download   = 8
local screen_set1_button_run        = 9
local screen_set1_circleprogress_download = 10

--loop add screen
local screen_addloop_text_step      = 1
local screen_addloop_text_start     = 2
local screen_addloop_text_end       = 3
local screen_addloop_text_times     = 4
local screen_addloop_button_confirm = 5

--loop del screen
local screen_delloop_text_del       = 3
local screen_delloop_button_confirm = 1
local screen_delloop_button_cancel  = 2

-- start_timer(timer_id, timeout, countdown, repeat)
-- ������ʱ������ʱ��ϵͳ�Զ�����on_timer
-- timer_id-��ʱ��ID��0~31 
-- timeout-��ʱʱ�䣬��λ����
-- countdown-0˳��ʱ��1����ʱ
-- repeat-�ظ�������0��ʾ�����ظ�

send_cmd_total = 0
send_cmd_cnt = 0
function on_timer(timer_id)
    --if time_id == 0 then
        if Linklist.isEmpty(dList) then
            stop_timer(timer_id)
            return
        end
        local table_send = Linklist.getDataByIndex(dList, 1)
        uart_send_data(table_send)
  
        Linklist.deleteByIndex(dList,1)
        send_cmd_cnt = send_cmd_cnt+1
        set_value(set1_screen,screen_set1_circleprogress_download, send_cmd_cnt*(360-0)/send_cmd_total)
    --end
end

function download_key_pressed()
    --manage action record
    dList, curNode = Linklist.init()
    record_act_total = record_get_count(set1_screen, screen_set1_record_action)
    
    record_loop_total = record_get_count(set1_screen, screen_set1_record_loop)
    
    send_cmd_total =  record_act_total + record_loop_total +4
    send_cmd_cnt = 0
    set_value(set1_screen,screen_set1_circleprogress_download,0)
    table1={}
    package_record_num(table1,record_act_total) -- the fist frame of action record
    curNode = Linklist.addTail(dList,curNode,table1)
    
    if record_act_total > 0 then
        pos = 0
        repeat
            table1={}
            local current_record = record_read(set1_screen,screen_set1_record_action,pos)
            if #(current_record) > 0 then
                package_record_detail(pos,table1,current_record)
                curNode =Linklist.addTail(dList,curNode,table1)
                pos= pos +1                       
                -- set_value(set_screen, screen_set_process_download, --(100*pos)/record_total);
            end
        until(pos > record_act_total -1)               
    end
    table1={}
    package_record_end(table1) --the last frame of action record
    curNode = Linklist.addTail(dList,curNode,table1)
    
    table1={}
    package_loop_num(table1,record_loop_total) -- the fist frame of loop record
    curNode = Linklist.addTail(dList,curNode,table1)
    
    if record_loop_total > 0 then
        pos = 0
        repeat
            table1={}
            local current_record = record_read(set1_screen,screen_set1_record_loop,pos)
            if #(current_record) > 0 then
                package_loop_detail(pos,table1,current_record)
                curNode = Linklist.addTail(dList,curNode,table1)
                pos= pos +1                       
            end
        until(pos > record_loop_total -1)               
    end
    table1={}
    package_loop_end(table1)
    curNode = Linklist.addTail(dList,curNode,table1)
    start_timer(0, 100, 1, 0)
end


--[[***************************************************************************
** Function name: package_record_num
** Descriptions : ���record��һ֡���ݣ���֡���ݵ������Ǽ�¼������
** Input value :  buff ������ݵ�Ԫ��
                  len ����
***************************************************************************--]]
function package_record_num(buff,num)
    buff[0]= 0xEE
    buff[1]= 0xB5
    buff[2]= 0x01
    buff[3]= num
    buff[4]= 0xff
    buff[5]= 0xfc
    buff[6]= 0xff
    buff[7]= 0xff
end

function package_record_end(buff)
    buff[0]= 0xEE
    buff[1]= 0xB5
    buff[2]= 0x03
    buff[3]= 0xff
    buff[4]= 0xfc
    buff[5]= 0xff
    buff[6]= 0xff
end
    
--[[***************************************************************************
** Function name: package_loop_num
** Descriptions : ���loop��һ֡���ݣ���֡���ݵ�������loop������
** Input value :  buff ������ݵ�Ԫ��
                  len ����
***************************************************************************--]]
function package_loop_num(buff,num)
    buff[0]= 0xEE
    buff[1]= 0xB5
    buff[2]= 0x04
    buff[3]= num
    buff[4]= 0xff
    buff[5]= 0xfc
    buff[6]= 0xff
    buff[7]= 0xff
end

--[[***************************************************************************
** Function name: package_loop_end
** Descriptions : ���loop���һ֡����
** Input value :  buff ������ݵ�Ԫ��
***************************************************************************--]]
function package_loop_end(buff)
    buff[0]= 0xEE
    buff[1]= 0xB5
    buff[2]= 0x06
    buff[3]= 0xff
    buff[4]= 0xfc
    buff[5]= 0xff
    buff[6]= 0xff
end

--[[***************************************************************************
** Function name: package_run_cmd
** Descriptions : ������������
** Input value :  buff ������ݵ�Ԫ��
***************************************************************************--]]
function package_run_cmd(buff)
    buff[0]= 0xEE
    buff[1]= 0xB5
    buff[2]= 0x07
    buff[3]= 0xff
    buff[4]= 0xfc
    buff[5]= 0xff
    buff[6]= 0xff
end

--[[
** Function name: my_split
** Input value :  s �ַ���  ����"1;ǻ��2;ռλ;0.1;"
                  delim �����ָ���Ŀ���ַ� ������";"
--]]
--split string
--@str :target string
--@pat :split token
--@return : tb
function my_split(str, pat)

    local t = {}
    local last_end = 0

    local s, e = string.find(str, pat, 1)                            --  ��һ���ָ�ŵ�λ��
    while s 
    do    
        -- �ҳ��ָ����ǰ�Ĳ���
        table.insert(t, string.sub(str, last_end + 1, last_end + s - last_end - 1))
        last_end = e
        s, e = string.find(str, pat, last_end + 1)
    end


    if last_end <= #str and  last_end ~= 0 then
        cap = string.sub(str, last_end + 1)
        table.insert(t, cap)
    end

    return t  
end

--[[
** Function name: package_record_detail
** Descriptions : ���ÿһ֡��¼
    [0]:0xEE
    [1]:0xB5    ʹ���Զ��崮��ָ���ʽΪEE B5���Զ������ݡ�FF FC FF FF
    [2]:0x02  means record 
    [3]:���� the position of record,[1,NN]
    [4]:λ�� 0x00--����, others NN--ǻ��NN
    [5]:���� 0x01--�Ƴ�, 0x02--����, 0x03--ռλ
** Input Value position �ڼ�¼ͼ���� �����ʾ���ǲ���
               buff the buff to save sending data
               one_record a string to store a record

--]]
function package_record_detail(position, buff, one_record)
    local table_record = my_split(one_record,';') 
    buff[0] = 0xEE
    buff[1] = 0xB5
    buff[2] = 0x02
    buff[3] = position + 1

    if table_record[2] == "����" then
        buff[4] = 0
    else
        if #(table_record[2]) > #("ǻ��1") then
            buff[4] = tonumber(string.sub(table_record[2], -2))
        else    -- "ǻ��12"
            buff[4] = tonumber(string.sub(table_record[2], -1))
        end
    end
    
    if table_record[3] == "�Ƴ�" then
        buff[5] = 0x01
    elseif table_record[3] == "����" then
        buff[5] = 0x02
    elseif table_record[3] == "ռλ" then
        buff[5] = 0x03
    end
    
    local float_value = tonumber(table_record[4])
    int_value = float_value * 10
    buff[6] = int_value
    buff[7]= 0xff
    buff[8]= 0xfc
    buff[9]= 0xff
    buff[10]= 0xff
end

--[[
** Function name:package_loop_detail
** Descriptions: 
--]]
function package_loop_detail(position, buff, one_record)
    local table_record = my_split(one_record,';') 
    buff[0] = 0xEE
    buff[1] = 0xB5
    buff[2] = 0x05
    
    buff[3] = tonumber(table_record[2])
    buff[4] = tonumber(table_record[3])
    buff[5] = tonumber(table_record[4])
    buff[6]= 0xff
    buff[7]= 0xfc
    buff[8]= 0xff
    buff[9]= 0xff
end


--uart_send_data

--[[***************************************************************************
** Function name: on_control_notify
** Descriptions : �û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
                  �����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
                  ע�⣺�ص������Ĳ����ͺ������̶������޸�
** Input value :  screen  ����ID
                  control �ؼ�ID
                  value   �ؼ�ֵ(�����ı��ؼ������ֵ)
***************************************************************************--]]
local record=""
local index = 1
function on_control_notify(screen,control,value)
    if screen == screen_add then

        if control == screen_add_menu_position then
            if value == 0 then
                set_visiable(screen_add, screen_add_text_num_display, 0)
                set_visiable(screen_add, screen_add_text_num_input, 0)
            else
                set_visiable(screen_add, screen_add_text_num_display, 1)
                set_visiable(screen_add, screen_add_text_num_input, 1)
            end
            
        elseif control == screen_add_button_confirm and value ==0 then
            index = get_value(screen,screen_add_text_step)
            if index >0 then
                index = index -1
            end
            if(get_text(screen,screen_add_text_position) == "ǻ��") then
   
                record = "$NUM;".."ǻ��"..get_text(screen,screen_add_text_num_input)..";"..get_text(screen,screen_add_text_action)..";"..get_value(screen,screen_add_text_delay)..";"
                
                record_insert(set1_screen, screen_set1_record_action, index, record)

            
            else
                record = "$NUM;".."����"..";"..get_text( screen, screen_add_text_action)..";"..get_value(screen,screen_add_text_delay)..";"
                
                record_insert(set1_screen, screen_set1_record_action, index, record)

            end
        end
        
    elseif screen == del_screen then
        if control ==screen_del_button_confirm and value ==0 then
            index = get_value(screen,screen_del_text_del_num)
            if index >0 then
                index = index -1
            end
            record_delete(set1_screen, screen_set1_record_action, index)
        end
        
  
    -- set1 screen ,the main function is sending data to MCU
    elseif screen == set1_screen then
        if control == screen_set1_button_download and value ==0 then
            download_key_pressed()
        elseif  control == screen_set1_button_run and value ==0 then
            local table1={}
            package_run_cmd(table1)
            uart_send_data(table1)
        end
       
    -- loop add screen
    elseif screen == screen_add_loop then
        if control == screen_addloop_button_confirm and value ==0 then
 
            index = get_value(screen,screen_addloop_text_step)
            if index >0 then
                index = index -1
            end
            loop_record = "$NUM;"..get_text(screen, screen_addloop_text_start)..";"..get_text(screen, screen_addloop_text_end)..";"..get_text(screen,screen_addloop_text_times)..";"

            record_insert(set1_screen, screen_set1_record_loop, index, loop_record)
        end
        
    elseif screen == screen_del_loop then
        if control ==screen_delloop_button_confirm and value ==0 then
        
            index  = get_value(screen,screen_delloop_text_del)
            if index >0 then
                index = index -1
            end
            record_delete(set1_screen, screen_set1_record_loop, index)
        end

    end
    
end


function on_screen_change(screen)
    if screen == set1_screen then
        set_value(set1_screen,screen_set1_circleprogress_download,0)
    end
end