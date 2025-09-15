import socket
import threading
import time
from functools import partial

from bokeh.plotting import figure, show
from bokeh.models import ColumnDataSource
from bokeh.server.server import Server
from bokeh.application import Application
from bokeh.application.handlers.function import FunctionHandler

import os;
import sys;
naarad_file_path = os.path.dirname(__file__)+"/../";
sys.path.append(naarad_file_path);
import naaradpath
print("Loading Naarad modules from: ",naarad_file_path);
from cnotify import *

def dataHandler_bokeh(data,qualifier=None,bokeh_document=None,dataExtractor=None,dataSource=None):
    if (qualifier=="str"):
        print(data,flush=True);
    else:
        if ((data.get("rf_fail")==0) and (data.get("node_id")==1)):
            print(data.get("time")," ",data.get("degc"),flush=True);

            # #new_data_x = dataSource.data['time'] + [float(data.get("time"))];
            
            # new_data_y = dataSource.data['degC'] + [float(data.get("degc"))];
            # new_data_x = dataSource.data['time'] + list(range(len(dataSource.data['degC'])));

            # dataSource.data = {'time': list(range(len(new_data_y))), 'degC':new_data_y};
    # # A test call below the ensure pipes are connected correctly.
    # dataExtractor();

def socket_listener(document, source):
    # # This function runs in a separate thread

    try:
        # Create a dataHandler with the signature of the data handler used in cnotify below.
        # Fix the parameters of the Bokeh data handler not used in the Naarad data handler.
        dataHandler_naarad=partial(dataHandler_bokeh,bokeh_document=document,dataExtractor=update_data,dataSource=source);

        # Connect to the naarad server over a socket to get continuous
        # notifications as the OTA packets arrive.  This does a blocking
        # read from the socket in an infinite loop (broken by excptions or
        # EoT).
        argv=["bokeh_server_naarad.py","cnotify","-1", "-1", "showlog", "120", "2"];
        cnotify(argv,dataHandler_naarad);
    except KeyboardInterrupt as e:
        print(str(e)+": Bokeh socket_listener interrupted.  Exiting...");

    # sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    # server_address = ('localhost', 12345)
    # sock.bind(server_address)
    # sock.listen(1)
    # print("Waiting for a connection...")
    # connection, client_address = sock.accept()
    # print(f"Connection from {client_address}")

    # try:
    #     while True:
    #         data = connection.recv(16).decode() # Blocking call
    #         if data:
    #             print(f"Received: {data}")
    #             # Schedule update to Bokeh document on the main thread
    #             document.add_next_tick_callback(partial(update_data, source, float(data)))
    #         else:
    #             break
    # finally:
    #     connection.close()
    #     sock.close()

def update_data():
    print("From update_data");
    
# def update_data(source, new_value):
#     # This function runs on the main Bokeh server thread
#     new_data = source.data['y'] + [new_value]
#     source.data = {'x': list(range(len(new_data))), 'y': new_data}

def NaaradPlotter(height,width,title,dataSource):
    plot = figure(height=height, width=width, title=title);
    plot.line(x='time', y='degC', source=dataSource);
    return plot;

def bokeh_app(doc):
    source = ColumnDataSource(data={'time': [], 'degC': []})
    # plot = figure(height=300, width=600, title="Real-time Socket Data")
    # plot.line(x='x', y='y', source=source)
    plot = NaaradPlotter(764,1024,"Naarad Console",source);

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
    try:
        print("Opening Bokeh application on http://localhost:5006/")
        server.io_loop.add_callback(server.show, "/")
        server.io_loop.start()
    except Exception as e:
        print(str(e)+": Exception in bokeh_server_naarad");
