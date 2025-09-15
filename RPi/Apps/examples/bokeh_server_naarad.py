import socket
import threading
import time
from functools import partial

from bokeh.plotting import figure, show
from bokeh.models import ColumnDataSource
from bokeh.server.server import Server
from bokeh.application import Application
from bokeh.application.handlers.function import FunctionHandler

from datetime import datetime
import os;
import sys;

naarad_file_path = os.path.dirname(__file__)+"/../";
sys.path.append(naarad_file_path);
import naaradpath
print("Loading Naarad modules from: ",naarad_file_path);
from cnotify import *

# socket_listener is started in a separate thread.  That calls
# cnotify() with a dataHander_naarad() interface of
# dataHandler_bokeh() as the callback for processing the data received
# by cnoitfy().
#
# dataHandler_bokeh() then sets dataExtractor parameter as the
# bokeh_document.add_new_tick_callback().  The bokeh_app() does a
# bokeh_document.root_add(plot), and the the plot object is somehow
# interacts with add_new_tick_callback() to update the plot.
#
#---------------------------------------------------------------------------------
#
def dataHandler_bokeh(data,qualifier=None,
                      bokeh_document=None,
                      dataExtractor=None,
                      PlotDataSource=None):
    if (qualifier=="str"):
        print(data,flush=True);
    else:
        if ((data.get("rf_fail")==0) and (data.get("node_id")==1)):
            print(data.get("time")," ",data.get("degc"),flush=True);
            bokeh_document.add_next_tick_callback(
                partial(dataExtractor, PlotDataSource, data));
#
#---------------------------------------------------------------------------------
#
def socket_listener(document, source):
    # # This function runs in a separate thread

    try:
        # Create a dataHandler with the signature of the data handler used in cnotify below.
        # Fix the parameters of the Bokeh data handler not used in the Naarad data handler.
        dataHandler_naarad=partial(dataHandler_bokeh,
                                   bokeh_document=document,
                                   dataExtractor=update_data,
                                   PlotDataSource=source);

        # Connect to the naarad server over a socket to get continuous
        # notifications as the OTA packets arrive.  This does a blocking
        # read from the socket in an infinite loop (broken by excptions or
        # EoT).
        argv=["bokeh_server_naarad.py","cnotify","-1", "-1", "showlog", "120", "2"];
        cnotify(argv,dataHandler_naarad);
    except KeyboardInterrupt as e:
        print(str(e)+": Bokeh socket_listener interrupted.  Exiting...");
#
#---------------------------------------------------------------------------------
#
def update_data(PlotDataSource, data):
    print("From update_data");

    # dt_object = datetime.strptime(data.get("time"),"%a %b %d %H:%M:%S %Y")
    # dt_object.timestamp()

    # #new_data_x = dataSource.data['time'] + [float(data.get("time"))];
            
    new_data_y = PlotDataSource.data['degC'] + [float(data.get("degc"))];
    new_data_x = PlotDataSource.data['time'] + list(range(len(PlotDataSource.data['degC'])));

    PlotDataSource.data = {'time': list(range(len(new_data_y))), 'degC':new_data_y};
#
#---------------------------------------------------------------------------------
#
def NaaradPlotter(height,width,title,PlotDataSource):
    plot = figure(height=height, width=width, title=title);
    plot.line(x='time', y='degC', source=PlotDataSource);
    return plot;
#
#---------------------------------------------------------------------------------
#
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

#
#---------------------------------------------------------------------------------
#
if __name__ == '__main__':
    app = Application(FunctionHandler(bokeh_app))
    server = Server({'/': app}, port=5006)
    server.start()
    try:
        print("Opening Bokeh application on http://localhost:5006/")
        server.io_loop.add_callback(server.show, "/")
        server.io_loop.start()
    except Exception as e:
        print(str(e)+": Exception in bokeh_server_naarad");
