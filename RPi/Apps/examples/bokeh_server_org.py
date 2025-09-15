import socket
import threading
import time
from functools import partial

from bokeh.plotting import figure, show
from bokeh.models import ColumnDataSource
from bokeh.server.server import Server
from bokeh.application import Application
from bokeh.application.handlers.function import FunctionHandler

def socket_listener(document, source):
    # This function runs in a separate thread
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_address = ('localhost', 12345)
    sock.bind(server_address)
    sock.listen(1)
    print("Waiting for a connection...")
    connection, client_address = sock.accept()
    print(f"Connection from {client_address}")

    try:
        while True:
            data = connection.recv(16).decode() # Blocking call
            if data:
                print(f"Received: {data}")
                # Schedule update to Bokeh document on the main thread
                document.add_next_tick_callback(partial(update_data, source, float(data)))
            else:
                break
    finally:
        connection.close()
        sock.close()

def update_data(source, new_value):
    # This function runs on the main Bokeh server thread
    new_data = source.data['y'] + [new_value]
    source.data = {'x': list(range(len(new_data))), 'y': new_data}

def bokeh_app(doc):
    source = ColumnDataSource(data={'x': [], 'y': []})
    plot = figure(height=300, width=600, title="Real-time Socket Data")
    plot.line(x='x', y='y', source=source)

    # Start the socket listener in a separate thread
    thread = threading.Thread(target=socket_listener, args=(doc, source))
    thread.daemon = True # Allows the thread to exit when the main program exits
    thread.start()

    doc.add_root(plot)

if __name__ == '__main__':
    # Create a simple client to send data (run this in a separate terminal)
    # import socket
    # import time
    # sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    # server_address = ('localhost', 12345)
    # sock.connect(server_address)
    # try:
    #     for i in range(10):
    #         message = str(i * 10).encode()
    #         sock.sendall(message)
    #         time.sleep(1)
    # finally:
    #     sock.close()

    app = Application(FunctionHandler(bokeh_app))
    server = Server({'/': app}, port=5006)
    server.start()
    print("Opening Bokeh application on http://localhost:5006/")
    server.io_loop.add_callback(server.show, "/")
    server.io_loop.start()
