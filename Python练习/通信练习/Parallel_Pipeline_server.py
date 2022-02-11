#服务端代码
import zmq

context = zmq.Context()
socket = context.socket(zmq.PULL)
socket.bind("tcp://*:5558")
while True:
    data = socket.recv_string()
    print(data)
