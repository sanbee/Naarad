#    Create a simple client to send data (run this in a separate terminal)
import socket
import time
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_address = ('localhost', 12345)
sock.connect(server_address)
try:
    for i in range(10):
        message = str(i * 10).encode()
        sock.sendall(message)
        time.sleep(5)
finally:
    sock.close()
