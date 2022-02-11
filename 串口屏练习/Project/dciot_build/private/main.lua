------------------------------------
-- 提示
-- 如果使用其他Lua编辑工具编辑此文档，请将VisualTFT软件中打开的此文件编辑器视图关闭，
-- 因为VisualTFT具有自动保存功能，其他软件修改时不能同步到VisualTFT编辑视图，
-- VisualTFT定时保存时，其他软件修改的内容将被恢复。
--
-- Attention
-- If you use other Lua Editor to edit this file, please close the file editor view 
-- opened in the VisualTFT, Because VisualTFT has an automatic save function, 
-- other Lua Editor cannot be synchronized to the VisualTFT edit view when it is modified.
-- When VisualTFT saves regularly, the content modified by other Lua Editor will be restored.
------------------------------------

--下面列出了常用的回调函数
--更多功能请阅读<<LUA脚本API.pdf>>


--初始化函数
--function on_init()
--end

--定时回调函数，系统每隔1秒钟自动调用。
--function on_systick()
--end

--定时器超时回调函数，当设置的定时器超时时，执行此回调函数，timer_id为对应的定时器ID
--function on_timer(timer_id)
--end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
--function on_control_notify(screen,control,value)
--end

--当画面切换时，执行此回调函数，screen为目标画面。
--function on_screen_change(screen)
--end




-- 使用自定义串口指令来发送record 给单片机 ，格式为EE B5【自定义数据】FF FC FF FF

--[[

   | 命令字| 命令数据   | 详情 |
   | ---- | ----------- | ---- |
   | 0x01 |无          | 发送记录条数  |
   | 0x02 | byte1,byte2,byte3,byte4 | 发送单条记录 ,四个字节分别是 步骤、位置、动作、延时 |
--]]



-- 操作链表的方法table
local Linklist = {}
 
-- 初始化，构建一个空表
function Linklist.init()
    -- body
    local node = {}
    -- list为链表名变量
    local list = node
    list.length = 0
    list.next = nil
    --print("链表初始化成功")
    -- 返回链表初始节点和当前节点
    return list, node
end
 
function Linklist.checkList(list)
    -- body
    if not list then 
        --print("链表不存在") 
     return
    end
end
 
function Linklist.checkIndex(list, index)
    -- body
    if index < 1 or index > list.length + 1 then
        --print("索引越界")
        return
    end
end
 
function Linklist.checkAll(list, index)
    -- body
    Linklist.checkList(list)
    Linklist.checkIndex(list, index)
end
 
-- 尾部添加节点
function Linklist.addTail(list, node, data)
    -- body
    Linklist.checkList(list)
 
    -- 创建新的尾部节点
    node.next = {} 
    node = node.next
    node.next = nil
    node.data = data
    list.length = list.length+1
    
    --print("尾部添加节点成功")
    return node
end
 
-- 头部添加节点
function Linklist.addHead(list, data)
    -- body
    Linklist.checkList(list)
 
    --修改新节点和头节点的next
    local newNode = {}  
    newNode.data = data
    newNode.next = list.next
    list.next = newNode
    list.length = list.length+1
    --print("头部添加节点成功")
end
 
-- 索引添加节点
function Linklist.insertByIndex(list, index, data)
    -- body
    Linklist.checkAll(list, index)
 
    local j,k,l = index - 1, 0, list
    while k ~= j do
        k = k + 1
        l = l.next
    end
 
    -- 开始添加
    local newNode = {}
    newNode.data = data
    newNode.next = l.next
    l.next = newNode
    list.length = list.length + 1
    --print("索引添加节点成功")
 
end
 
-- 索引删除并返回节点数据内容
function Linklist.deleteByIndex(list, index)
    -- body
    Linklist.checkAll(list, index)
 
    local j,k,l = index - 1, 0, list
    while k ~= j do
        k = k + 1
        l = l.next
    end
 
    -- 开始删除 l.next
    d = l.next.data
    t = l.next.next
    l.next = nil
    l.next = t
    list.length = list.length - 1
    --print("索引删除节点成功")
    
end
 
-- 索引获取指定节点内容
function Linklist.getDataByIndex(list, index)
    -- body
    Linklist.checkAll(list, index)
 
    local l = list.next
    local k = 1
    while l do
        if k == index then
            --print("索引获取节点成功")
            return l.data
        end
        l = l.next
        k = k + 1
    end
    --print("索引越界")
end

 
-- 链表是否为空
function Linklist.isEmpty(list)
    -- body
    Linklist.checkList(list)
 
    return list.length == 0
end
 
-- 清理链表，操作完成后，链表还在，只不过为空，相当刚开始的初始化状态
function Linklist.clear(list)
    -- body
    Linklist.checkList(list)
 
    while true do
        -- fNode为遍历用指针
        fNode = list.next
        -- 满足则已为空表
        if not fNode then  
            --print("链表清理成功")
            break
        end
        t = fNode.next
        -- 置空
        list.next = nil
        list.next = t
    end
    list.length = 0
end
 
-- 销毁链表
function Linklist.destory(list)
    -- body
    if list then
        Linklist.clear(list)
    end
    list = nil
    --print("链表销毁成功")
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
-- 启动定时器，超时后系统自动调用on_timer
-- timer_id-定时器ID，0~31 
-- timeout-超时时间，单位毫秒
-- countdown-0顺计时，1倒计时
-- repeat-重复次数，0表示无限重复

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
** Descriptions : 打包record第一帧数据，这帧数据的内容是记录的条数
** Input value :  buff 存放数据的元表
                  len 条数
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
** Descriptions : 打包loop第一帧数据，这帧数据的内容是loop的条数
** Input value :  buff 存放数据的元表
                  len 条数
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
** Descriptions : 打包loop最后一帧数据
** Input value :  buff 存放数据的元表
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
** Descriptions : 发送启动命令
** Input value :  buff 存放数据的元表
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
** Input value :  s 字符串  例如"1;腔体2;占位;0.1;"
                  delim 用来分割条目的字符 这里是";"
--]]
--split string
--@str :target string
--@pat :split token
--@return : tb
function my_split(str, pat)

    local t = {}
    local last_end = 0

    local s, e = string.find(str, pat, 1)                            --  第一个分割号的位置
    while s 
    do    
        -- 找出分割符的前的参数
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
** Descriptions : 打包每一帧记录
    [0]:0xEE
    [1]:0xB5    使用自定义串口指令：格式为EE B5【自定义数据】FF FC FF FF
    [2]:0x02  means record 
    [3]:步骤 the position of record,[1,NN]
    [4]:位置 0x00--样本, others NN--腔格NN
    [5]:动作 0x01--推出, 0x02--空置, 0x03--占位
** Input Value position 在记录图表中 这个显示的是步骤
               buff the buff to save sending data
               one_record a string to store a record

--]]
function package_record_detail(position, buff, one_record)
    local table_record = my_split(one_record,';') 
    buff[0] = 0xEE
    buff[1] = 0xB5
    buff[2] = 0x02
    buff[3] = position + 1

    if table_record[2] == "样本" then
        buff[4] = 0
    else
        if #(table_record[2]) > #("腔格1") then
            buff[4] = tonumber(string.sub(table_record[2], -2))
        else    -- "腔格12"
            buff[4] = tonumber(string.sub(table_record[2], -1))
        end
    end
    
    if table_record[3] == "推出" then
        buff[5] = 0x01
    elseif table_record[3] == "空置" then
        buff[5] = 0x02
    elseif table_record[3] == "占位" then
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
** Descriptions : 用户通过触摸修改控件后，执行此回调函数。
                  点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
                  注意：回调函数的参数和函数名固定不能修改
** Input value :  screen  画面ID
                  control 控件ID
                  value   控件值(包括文本控件输入的值)
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
            if(get_text(screen,screen_add_text_position) == "腔格") then
   
                record = "$NUM;".."腔格"..get_text(screen,screen_add_text_num_input)..";"..get_text(screen,screen_add_text_action)..";"..get_value(screen,screen_add_text_delay)..";"
                
                record_insert(set1_screen, screen_set1_record_action, index, record)

            
            else
                record = "$NUM;".."样本"..";"..get_text( screen, screen_add_text_action)..";"..get_value(screen,screen_add_text_delay)..";"
                
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