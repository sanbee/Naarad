.class public Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;
.super Landroid/os/AsyncTask;
.source "NaaradPlotFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnaarad/client/tabhost/NaaradPlotFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "SensorDataSource"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Lorg/achartengine/model/XYMultipleSeriesDataset;",
        "Lorg/achartengine/model/XYSeries;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private allDone:Z

.field private doReDraw:Z

.field protected nodeid:I

.field protected stopRecording:Ljava/lang/Boolean;

.field final synthetic this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

.field protected x0:D

.field protected xMax:D

.field protected xMin:D

.field protected y0:D

.field protected yMax:D

.field protected yMin:D


# direct methods
.method protected constructor <init>(Lnaarad/client/tabhost/NaaradPlotFragment;)V
    .locals 3
    .param p1, "this$0"    # Lnaarad/client/tabhost/NaaradPlotFragment;

    .line 427
    iput-object p1, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 433
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->allDone:Z

    const/4 v1, 0x1

    iput-boolean v1, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->doReDraw:Z

    .line 434
    const-wide/high16 v1, 0x4059000000000000L    # 100.0

    iput-wide v1, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->yMin:D

    .line 435
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->stopRecording:Ljava/lang/Boolean;

    return-void
.end method

.method private naaradGetData([I[Lorg/achartengine/model/XYMultipleSeriesDataset;Z)Z
    .locals 9
    .param p1, "keys"    # [I
    .param p2, "params"    # [Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p3, "getHistory"    # Z

    .line 582
    const-string v0, "\nCheck settings"

    const-string v1, ":"

    const/4 v2, 0x0

    .line 587
    .local v2, "staleData":Z
    const/4 v3, 0x0

    .line 588
    .local v3, "tries":I
    :goto_0
    const/16 v4, 0x50

    :try_start_0
    iget-object v5, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    iget-object v6, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    invoke-virtual {v6}, Lnaarad/client/tabhost/NaaradPlotFragment;->getServerName()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    invoke-virtual {v7}, Lnaarad/client/tabhost/NaaradPlotFragment;->getServerPort()I

    move-result v7

    invoke-virtual {v5, v6, v7}, Lnaarad/client/tabhost/NaaradPlotFragment;->naaradSocket(Ljava/lang/String;I)Ljava/net/Socket;

    move-result-object v5

    move-object v6, v5

    .local v6, "mySoc":Ljava/net/Socket;
    if-nez v5, :cond_0

    const/16 v5, 0xa

    if-ge v3, v5, :cond_0

    .line 591
    add-int/lit8 v3, v3, 0x1

    .line 592
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Wifi not yet connected..."

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 593
    .local v5, "msg":Ljava/lang/String;
    iget-object v7, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    invoke-virtual {v7, v5, v4}, Lnaarad/client/tabhost/NaaradPlotFragment;->uiToast(Ljava/lang/String;I)V

    .line 594
    sget-object v7, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v7, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 595
    const-wide/16 v7, 0x64

    invoke-static {v7, v8}, Landroid/os/SystemClock;->sleep(J)V

    .line 596
    .end local v5    # "msg":Ljava/lang/String;
    goto :goto_0

    .line 597
    :cond_0
    if-nez v6, :cond_1

    .line 598
    iget-object v5, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Wifi not connected after 10 tries"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7, v4}, Lnaarad/client/tabhost/NaaradPlotFragment;->uiToast(Ljava/lang/String;I)V

    goto :goto_1

    .line 601
    :cond_1
    if-eqz p3, :cond_2

    .line 602
    invoke-direct {p0, p1, p2, v6}, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->naaradGetDataHistoryEngine([I[Lorg/achartengine/model/XYMultipleSeriesDataset;Ljava/net/Socket;)V

    goto :goto_1

    .line 604
    :cond_2
    invoke-direct {p0, p1, p2, v6}, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->naaradGetDataOnlyEngine([I[Lorg/achartengine/model/XYMultipleSeriesDataset;Ljava/net/Socket;)Z

    move-result v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move v2, v0

    .line 623
    .end local v3    # "tries":I
    .end local v6    # "mySoc":Ljava/net/Socket;
    :goto_1
    goto :goto_2

    .line 619
    :catch_0
    move-exception v3

    .line 621
    .local v3, "e":Ljava/io/IOException;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error connecting to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    invoke-virtual {v6}, Lnaarad/client/tabhost/NaaradPlotFragment;->getServerName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    invoke-virtual {v1}, Lnaarad/client/tabhost/NaaradPlotFragment;->getServerPort()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 622
    .local v0, "msg":Ljava/lang/String;
    iget-object v1, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    invoke-virtual {v1, v0, v4}, Lnaarad/client/tabhost/NaaradPlotFragment;->uiToast(Ljava/lang/String;I)V

    goto :goto_2

    .line 614
    .end local v0    # "msg":Ljava/lang/String;
    .end local v3    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v3

    .line 616
    .local v3, "e":Ljava/net/UnknownHostException;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unknown host: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    invoke-virtual {v6}, Lnaarad/client/tabhost/NaaradPlotFragment;->getServerName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    invoke-virtual {v1}, Lnaarad/client/tabhost/NaaradPlotFragment;->getServerPort()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 617
    .restart local v0    # "msg":Ljava/lang/String;
    iget-object v1, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    invoke-virtual {v1, v0, v4}, Lnaarad/client/tabhost/NaaradPlotFragment;->uiToast(Ljava/lang/String;I)V

    .end local v0    # "msg":Ljava/lang/String;
    .end local v3    # "e":Ljava/net/UnknownHostException;
    goto :goto_1

    .line 607
    :catch_2
    move-exception v0

    .line 610
    .local v0, "e":Lorg/json/JSONException;
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 611
    iget-object v1, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3, v4}, Lnaarad/client/tabhost/NaaradPlotFragment;->uiToast(Ljava/lang/String;I)V

    .end local v0    # "e":Lorg/json/JSONException;
    goto :goto_1

    .line 624
    :goto_2
    return v2
.end method

.method private naaradGetDataHistoryEngine([I[Lorg/achartengine/model/XYMultipleSeriesDataset;Ljava/net/Socket;)V
    .locals 12
    .param p1, "keys"    # [I
    .param p2, "params"    # [Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p3, "mySoc"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .line 477
    new-instance v0, Ljava/io/PrintWriter;

    invoke-virtual {p3}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;Z)V

    .line 478
    .local v0, "mySocWriter":Ljava/io/PrintWriter;
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-virtual {p3}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v4, 0x64

    invoke-direct {v1, v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 479
    .local v1, "mySocReader":Ljava/io/BufferedReader;
    iget-object v3, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    const-string v4, "SensorDataSync"

    invoke-virtual {v3, v0, v4}, Lnaarad/client/tabhost/NaaradPlotFragment;->naaradWriter(Ljava/io/PrintWriter;Ljava/lang/String;)V

    .line 481
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, p1

    if-ge v3, v4, :cond_3

    .line 484
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "gethpkt "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v5, p1, v3

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 487
    .local v4, "msg":Ljava/lang/String;
    iget-object v5, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    invoke-virtual {v5, v0, v4}, Lnaarad/client/tabhost/NaaradPlotFragment;->naaradWriter(Ljava/io/PrintWriter;Ljava/lang/String;)V

    .line 488
    const-wide/16 v5, 0x64

    invoke-static {v5, v6}, Landroid/os/SystemClock;->sleep(J)V

    .line 490
    const-string v5, ""

    .local v5, "message":Ljava/lang/String;
    const-string v6, ""

    .line 491
    .local v6, "msgData":Ljava/lang/String;
    const/4 v7, 0x0

    iput-boolean v7, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->doReDraw:Z

    .line 493
    :goto_1
    const-string v8, " "

    invoke-virtual {v6, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    aget-object v9, v9, v7

    const-string v10, "PHINISHED"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 495
    iget-object v9, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    invoke-virtual {v9, v1}, Lnaarad/client/tabhost/NaaradPlotFragment;->naaradReader(Ljava/io/BufferedReader;)Ljava/lang/String;

    move-result-object v9

    move-object v5, v9

    if-eqz v9, :cond_1

    .line 498
    const/4 v9, 0x2

    invoke-virtual {v5, v8, v9}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v9

    .line 500
    .local v9, "tokens":[Ljava/lang/String;
    aget-object v11, v9, v2

    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    .line 503
    invoke-virtual {v6, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    aget-object v8, v8, v7

    invoke-virtual {v8, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 504
    invoke-direct {p0, v9, p2}, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->publishJSON([Ljava/lang/String;[Lorg/achartengine/model/XYMultipleSeriesDataset;)V

    .line 505
    .end local v9    # "tokens":[Ljava/lang/String;
    :cond_0
    goto :goto_1

    .line 496
    :cond_1
    new-instance v2, Lorg/json/JSONException;

    const-string v7, "JSON message is null"

    invoke-direct {v2, v7}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 506
    :cond_2
    iput-boolean v2, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->doReDraw:Z

    .line 507
    invoke-virtual {p0}, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->reDraw()V

    .line 481
    .end local v4    # "msg":Ljava/lang/String;
    .end local v5    # "message":Ljava/lang/String;
    .end local v6    # "msgData":Ljava/lang/String;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 510
    .end local v3    # "i":I
    :cond_3
    iget-object v3, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    const-string v4, "done"

    invoke-virtual {v3, v0, v4}, Lnaarad/client/tabhost/NaaradPlotFragment;->naaradWriter(Ljava/io/PrintWriter;Ljava/lang/String;)V

    .line 511
    invoke-virtual {p3}, Ljava/net/Socket;->close()V

    .line 512
    iput-boolean v2, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->doReDraw:Z

    .line 513
    return-void
.end method

.method private naaradGetDataOnlyEngine([I[Lorg/achartengine/model/XYMultipleSeriesDataset;Ljava/net/Socket;)Z
    .locals 20
    .param p1, "keys"    # [I
    .param p2, "params"    # [Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p3, "mySoc"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .line 523
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    new-instance v2, Ljava/io/PrintWriter;

    invoke-virtual/range {p3 .. p3}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    const/4 v4, 0x1

    invoke-direct {v2, v3, v4}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;Z)V

    .line 524
    .local v2, "mySocWriter":Ljava/io/PrintWriter;
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    invoke-virtual/range {p3 .. p3}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v6, 0x64

    invoke-direct {v3, v5, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 525
    .local v3, "mySocReader":Ljava/io/BufferedReader;
    iget-object v5, v0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    const-string v6, "SensorDataSync"

    invoke-virtual {v5, v2, v6}, Lnaarad/client/tabhost/NaaradPlotFragment;->naaradWriter(Ljava/io/PrintWriter;Ljava/lang/String;)V

    .line 526
    const/4 v5, 0x0

    .line 527
    .local v5, "staleDataDetected":Z
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    array-length v7, v1

    const-string v8, "getDataOnly:"

    if-ge v6, v7, :cond_4

    .line 530
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "getcpkt "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v9, v1, v6

    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 531
    .local v7, "msg":Ljava/lang/String;
    const-string v9, ""

    .line 535
    .local v9, "message":Ljava/lang/String;
    iget-object v10, v0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    invoke-virtual {v10, v2, v7}, Lnaarad/client/tabhost/NaaradPlotFragment;->naaradWriter(Ljava/io/PrintWriter;Ljava/lang/String;)V

    .line 536
    const-wide/16 v10, 0x64

    invoke-static {v10, v11}, Landroid/os/SystemClock;->sleep(J)V

    .line 538
    iget-object v10, v0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    invoke-virtual {v10, v3}, Lnaarad/client/tabhost/NaaradPlotFragment;->naaradReader(Ljava/io/BufferedReader;)Ljava/lang/String;

    move-result-object v10

    move-object v9, v10

    if-eqz v10, :cond_3

    .line 547
    const/4 v10, 0x2

    const-string v11, " "

    invoke-virtual {v9, v11, v10}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v10

    .line 548
    .local v10, "tokens":[Ljava/lang/String;
    iget-wide v12, v0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->x0:D

    .line 549
    .local v12, "xLatest":D
    const-wide v14, 0x415b774000000000L    # 7200000.0

    .line 550
    .local v14, "TLIMIT":D
    move-object/from16 v4, p2

    invoke-direct {v0, v10, v4}, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->publishJSON([Ljava/lang/String;[Lorg/achartengine/model/XYMultipleSeriesDataset;)V

    .line 561
    move-object/from16 v16, v3

    .end local v3    # "mySocReader":Ljava/io/BufferedReader;
    .local v16, "mySocReader":Ljava/io/BufferedReader;
    iget-wide v3, v0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->x0:D

    sub-double v3, v12, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->abs(D)D

    move-result-wide v3

    const/16 v17, 0x0

    cmpl-double v18, v3, v14

    if-lez v18, :cond_0

    const/4 v3, 0x1

    goto :goto_1

    :cond_0
    const/4 v3, 0x0

    :goto_1
    or-int/2addr v5, v3

    .line 562
    if-eqz v5, :cond_2

    .line 564
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Stale data detected: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object v4, v9

    move-object/from16 v18, v10

    .end local v9    # "message":Ljava/lang/String;
    .end local v10    # "tokens":[Ljava/lang/String;
    .local v4, "message":Ljava/lang/String;
    .local v18, "tokens":[Ljava/lang/String;
    iget-wide v9, v0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->x0:D

    sub-double v9, v12, v9

    invoke-static {v9, v10}, Ljava/lang/Math;->abs(D)D

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v14, v15}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v9, v0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->x0:D

    sub-double v9, v12, v9

    invoke-static {v9, v10}, Ljava/lang/Math;->abs(D)D

    move-result-wide v9

    cmpl-double v19, v9, v14

    if-lez v19, :cond_1

    const/16 v17, 0x1

    :cond_1
    invoke-static/range {v17 .. v17}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 565
    invoke-static {v5}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 564
    invoke-static {v8, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 562
    .end local v4    # "message":Ljava/lang/String;
    .end local v18    # "tokens":[Ljava/lang/String;
    .restart local v9    # "message":Ljava/lang/String;
    .restart local v10    # "tokens":[Ljava/lang/String;
    :cond_2
    move-object v4, v9

    move-object/from16 v18, v10

    .line 527
    .end local v7    # "msg":Ljava/lang/String;
    .end local v9    # "message":Ljava/lang/String;
    .end local v10    # "tokens":[Ljava/lang/String;
    .end local v12    # "xLatest":D
    .end local v14    # "TLIMIT":D
    :goto_2
    add-int/lit8 v6, v6, 0x1

    move-object/from16 v3, v16

    const/4 v4, 0x1

    goto/16 :goto_0

    .line 539
    .end local v16    # "mySocReader":Ljava/io/BufferedReader;
    .restart local v3    # "mySocReader":Ljava/io/BufferedReader;
    .restart local v7    # "msg":Ljava/lang/String;
    .restart local v9    # "message":Ljava/lang/String;
    :cond_3
    move-object/from16 v16, v3

    move-object v4, v9

    .end local v3    # "mySocReader":Ljava/io/BufferedReader;
    .end local v9    # "message":Ljava/lang/String;
    .restart local v4    # "message":Ljava/lang/String;
    .restart local v16    # "mySocReader":Ljava/io/BufferedReader;
    new-instance v3, Lorg/json/JSONException;

    const-string v8, "JSON message is null"

    invoke-direct {v3, v8}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 527
    .end local v4    # "message":Ljava/lang/String;
    .end local v7    # "msg":Ljava/lang/String;
    .end local v16    # "mySocReader":Ljava/io/BufferedReader;
    .restart local v3    # "mySocReader":Ljava/io/BufferedReader;
    :cond_4
    move-object/from16 v16, v3

    .line 571
    .end local v3    # "mySocReader":Ljava/io/BufferedReader;
    .end local v6    # "i":I
    .restart local v16    # "mySocReader":Ljava/io/BufferedReader;
    iget-object v3, v0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    const-string v4, "done"

    invoke-virtual {v3, v2, v4}, Lnaarad/client/tabhost/NaaradPlotFragment;->naaradWriter(Ljava/io/PrintWriter;Ljava/lang/String;)V

    .line 572
    invoke-virtual/range {p3 .. p3}, Ljava/net/Socket;->close()V

    .line 573
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Returning "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v8, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 574
    return v5
.end method

.method private publishJSON([Ljava/lang/String;[Lorg/achartengine/model/XYMultipleSeriesDataset;)V
    .locals 7
    .param p1, "jsonTokens"    # [Ljava/lang/String;
    .param p2, "params"    # [Lorg/achartengine/model/XYMultipleSeriesDataset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 444
    const-string v0, ""

    .line 446
    .local v0, "jsonStr":Ljava/lang/String;
    const/4 v1, 0x1

    aget-object v0, p1, v1

    .line 450
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 451
    .local v2, "json":Lorg/json/JSONObject;
    const-string v3, "rf_fail"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_0

    .line 455
    const-string v3, "node_id"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->nodeid:I

    .line 457
    const-string v3, "time"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v3

    iput-wide v3, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->x0:D

    .line 460
    const-string v3, "degc"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v3

    double-to-float v3, v3

    float-to-double v3, v3

    iput-wide v3, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->y0:D

    .line 461
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget v4, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->nodeid:I

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v5, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->x0:D

    invoke-static {v5, v6}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v4, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->y0:D

    invoke-static {v4, v5}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "publishJSON: "

    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 462
    new-array v1, v1, [Lorg/achartengine/model/XYSeries;

    const/4 v3, 0x0

    aget-object v4, p2, v3

    iget-object v5, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    iget-object v5, v5, Lnaarad/client/tabhost/NaaradPlotFragment;->nodeID2Ndx:Ljava/util/HashMap;

    iget v6, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->nodeid:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v4, v5}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesAt(I)Lorg/achartengine/model/XYSeries;

    move-result-object v4

    aput-object v4, v1, v3

    invoke-virtual {p0, v1}, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->publishProgress([Ljava/lang/Object;)V

    .line 469
    iget-object v1, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    iget-object v1, v1, Lnaarad/client/tabhost/NaaradPlotFragment;->mMainActivityCallback:Lnaarad/client/tabhost/NaaradPlotFragment$nPlotDataArrivalListener;

    invoke-interface {v1, v0}, Lnaarad/client/tabhost/NaaradPlotFragment$nPlotDataArrivalListener;->onDataArrival(Ljava/lang/String;)V

    .line 470
    return-void

    .line 466
    :cond_0
    iget-object v1, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    const/16 v3, 0x50

    const-string v4, "Packet invalid (rf_fail=1)"

    invoke-virtual {v1, v4, v3}, Lnaarad/client/tabhost/NaaradPlotFragment;->uiToast(Ljava/lang/String;I)V

    .line 467
    return-void
.end method

.method private stopRecording(Ljava/lang/Boolean;)V
    .locals 0
    .param p1, "status"    # Ljava/lang/Boolean;

    .line 722
    iput-object p1, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->stopRecording:Ljava/lang/Boolean;

    .line 723
    return-void
.end method


# virtual methods
.method public addNewData(Lorg/achartengine/model/XYSeries;DD)V
    .locals 20
    .param p1, "thisSeries"    # Lorg/achartengine/model/XYSeries;
    .param p2, "x"    # D
    .param p4, "y"    # D

    .line 768
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-wide/from16 v2, p2

    const-wide/16 v4, 0x0

    .local v4, "dX":D
    const-wide v6, 0x41b4997000000000L    # 3.456E8

    .line 769
    .local v6, "dT":D
    const-wide v8, 0x3fc999999999999aL    # 0.2

    .line 779
    .local v8, "quantization":D
    move-wide/from16 v10, p4

    .line 781
    .local v10, "myY":D
    invoke-virtual/range {p1 .. p1}, Lorg/achartengine/model/XYSeries;->getItemCount()I

    move-result v12

    .line 782
    .local v12, "n":I
    if-nez v12, :cond_0

    invoke-virtual {v1, v2, v3, v10, v11}, Lorg/achartengine/model/XYSeries;->add(DD)V

    move-wide/from16 v17, v4

    goto :goto_1

    .line 785
    :cond_0
    add-int/lit8 v13, v12, -0x1

    invoke-virtual {v1, v13}, Lorg/achartengine/model/XYSeries;->getX(I)D

    move-result-wide v13

    sub-double/2addr v13, v2

    .line 786
    .local v13, "dTi":D
    add-int/lit8 v15, v12, -0x1

    invoke-virtual {v1, v15}, Lorg/achartengine/model/XYSeries;->getY(I)D

    move-result-wide v15

    .line 822
    .local v15, "latestY":D
    const-wide v17, 0x40ed4c0000000000L    # 60000.0

    cmpl-double v19, v13, v17

    if-ltz v19, :cond_1

    .line 824
    invoke-virtual {v1, v2, v3, v10, v11}, Lorg/achartengine/model/XYSeries;->add(DD)V

    move-wide/from16 v17, v4

    goto :goto_1

    .line 829
    :cond_1
    cmpl-double v17, v10, v15

    if-eqz v17, :cond_5

    .line 831
    const-wide v17, 0x7fefffffffffffffL    # Double.MAX_VALUE

    cmpl-double v19, v10, v17

    if-eqz v19, :cond_3

    .line 834
    move-wide/from16 v17, v4

    .end local v4    # "dX":D
    .local v17, "dX":D
    iget-wide v4, v0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->yMax:D

    cmpl-double v19, v10, v4

    if-lez v19, :cond_2

    iput-wide v10, v0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->yMax:D

    .line 835
    :cond_2
    iget-wide v4, v0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->yMin:D

    cmpg-double v19, v10, v4

    if-gez v19, :cond_4

    iput-wide v10, v0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->yMin:D

    goto :goto_0

    .line 831
    .end local v17    # "dX":D
    .restart local v4    # "dX":D
    :cond_3
    move-wide/from16 v17, v4

    .line 838
    .end local v4    # "dX":D
    .restart local v17    # "dX":D
    :cond_4
    :goto_0
    invoke-virtual {v1, v2, v3, v10, v11}, Lorg/achartengine/model/XYSeries;->add(DD)V

    goto :goto_1

    .line 829
    .end local v17    # "dX":D
    .restart local v4    # "dX":D
    :cond_5
    move-wide/from16 v17, v4

    .line 844
    .end local v4    # "dX":D
    .end local v13    # "dTi":D
    .end local v15    # "latestY":D
    .restart local v17    # "dX":D
    :goto_1
    if-lez v12, :cond_6

    .line 846
    add-int/lit8 v4, v12, -0x1

    invoke-virtual {v1, v4}, Lorg/achartengine/model/XYSeries;->getX(I)D

    move-result-wide v4

    .line 847
    .local v4, "xMax":D
    const/4 v13, 0x0

    invoke-virtual {v1, v13}, Lorg/achartengine/model/XYSeries;->getX(I)D

    move-result-wide v14

    .line 848
    .local v14, "xMin":D
    sub-double v16, v4, v14

    .line 849
    .end local v17    # "dX":D
    .local v16, "dX":D
    cmpl-double v18, v16, v6

    if-lez v18, :cond_7

    .line 851
    invoke-virtual {v1, v13}, Lorg/achartengine/model/XYSeries;->remove(I)V

    goto :goto_2

    .line 844
    .end local v4    # "xMax":D
    .end local v14    # "xMin":D
    .end local v16    # "dX":D
    .restart local v17    # "dX":D
    :cond_6
    move-wide/from16 v16, v17

    .line 864
    .end local v17    # "dX":D
    .restart local v16    # "dX":D
    :cond_7
    :goto_2
    invoke-virtual/range {p1 .. p1}, Lorg/achartengine/model/XYSeries;->getItemCount()I

    move-result v4

    .line 865
    .end local v12    # "n":I
    .local v4, "n":I
    const/4 v5, 0x1

    if-le v4, v5, :cond_8

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v12, v4, -0x1

    invoke-virtual {v1, v12}, Lorg/achartengine/model/XYSeries;->getX(I)D

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, " "

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v13, v4, -0x1

    invoke-virtual {v1, v13}, Lorg/achartengine/model/XYSeries;->getY(I)D

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v13, v4, -0x2

    .line 866
    invoke-virtual {v1, v13}, Lorg/achartengine/model/XYSeries;->getX(I)D

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v12, v4, -0x2

    invoke-virtual {v1, v12}, Lorg/achartengine/model/XYSeries;->getY(I)D

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 865
    const-string v12, "addNewData: "

    invoke-static {v12, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 868
    :cond_8
    return-void
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 427
    check-cast p1, [Lorg/achartengine/model/XYMultipleSeriesDataset;

    invoke-virtual {p0, p1}, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->doInBackground([Lorg/achartengine/model/XYMultipleSeriesDataset;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Lorg/achartengine/model/XYMultipleSeriesDataset;)Ljava/lang/String;
    .locals 7
    .param p1, "params"    # [Lorg/achartengine/model/XYMultipleSeriesDataset;

    .line 734
    const-string v0, "AllOK"

    .line 736
    .local v0, "retStr":Ljava/lang/String;
    const/4 v1, 0x0

    iput-boolean v1, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->allDone:Z

    .line 737
    iget-object v2, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lnaarad/client/tabhost/NaaradPlotFragment;->access$002(Lnaarad/client/tabhost/NaaradPlotFragment;Z)Z

    .line 738
    iget-object v2, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    iget-object v4, v2, Lnaarad/client/tabhost/NaaradPlotFragment;->nodeID2Ndx:Ljava/util/HashMap;

    invoke-virtual {v2, v4}, Lnaarad/client/tabhost/NaaradPlotFragment;->getKeysAsArray(Ljava/util/HashMap;)[I

    move-result-object v2

    .line 745
    .local v2, "keys":[I
    invoke-direct {p0, v2, p1, v3}, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->naaradGetData([I[Lorg/achartengine/model/XYMultipleSeriesDataset;Z)Z

    move-result v4

    .line 747
    .local v4, "staleData":Z
    :goto_0
    iget-boolean v5, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->allDone:Z

    if-nez v5, :cond_1

    .line 750
    invoke-direct {p0, v2, p1, v1}, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->naaradGetData([I[Lorg/achartengine/model/XYMultipleSeriesDataset;Z)Z

    move-result v4

    .line 751
    if-eqz v4, :cond_0

    .line 753
    const-string v5, "doInBackground:"

    const-string v6, "Stale data detected; loading history records "

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 754
    invoke-direct {p0, v2, p1, v3}, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->naaradGetData([I[Lorg/achartengine/model/XYMultipleSeriesDataset;Z)Z

    .line 756
    :cond_0
    const-wide/32 v5, 0xea60

    invoke-static {v5, v6}, Landroid/os/SystemClock;->sleep(J)V

    goto :goto_0

    .line 758
    :cond_1
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v3, "Exiting doInBackground"

    invoke-virtual {v1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 761
    .end local v2    # "keys":[I
    .end local v4    # "staleData":Z
    return-object v0
.end method

.method public finish()V
    .locals 1

    .line 727
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->allDone:Z

    return-void
.end method

.method protected onCancelled()V
    .locals 2

    .line 925
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "NPF AsyncTask onCancelled()"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 944
    invoke-super {p0}, Landroid/os/AsyncTask;->onCancelled()V

    .line 945
    return-void
.end method

.method protected bridge synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0

    .line 427
    check-cast p1, [Lorg/achartengine/model/XYSeries;

    invoke-virtual {p0, p1}, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->onProgressUpdate([Lorg/achartengine/model/XYSeries;)V

    return-void
.end method

.method protected varargs onProgressUpdate([Lorg/achartengine/model/XYSeries;)V
    .locals 7
    .param p1, "values"    # [Lorg/achartengine/model/XYSeries;

    .line 891
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onProgressUpdate([Ljava/lang/Object;)V

    .line 896
    const/4 v0, 0x0

    aget-object v2, p1, v0

    iget-wide v3, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->x0:D

    iget-wide v5, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->y0:D

    move-object v1, p0

    invoke-virtual/range {v1 .. v6}, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->addNewData(Lorg/achartengine/model/XYSeries;DD)V

    .line 897
    invoke-virtual {p0}, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->reDraw()V

    .line 920
    return-void
.end method

.method protected reDraw()V
    .locals 5

    .line 874
    iget-boolean v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->doReDraw:Z

    if-eqz v0, :cond_0

    .line 875
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    invoke-static {v0}, Lnaarad/client/tabhost/NaaradPlotFragment;->access$100(Lnaarad/client/tabhost/NaaradPlotFragment;)Lorg/achartengine/GraphicalView;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->stopRecording:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    .line 877
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    invoke-static {v0}, Lnaarad/client/tabhost/NaaradPlotFragment;->access$100(Lnaarad/client/tabhost/NaaradPlotFragment;)Lorg/achartengine/GraphicalView;

    move-result-object v0

    invoke-virtual {v0}, Lorg/achartengine/GraphicalView;->zoomReset()V

    .line 878
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    invoke-static {v0}, Lnaarad/client/tabhost/NaaradPlotFragment;->access$200(Lnaarad/client/tabhost/NaaradPlotFragment;)Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move-result-object v0

    iget-wide v1, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->yMax:D

    const-wide v3, 0x3fc999999999999aL    # 0.2

    add-double/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setYAxisMax(D)V

    .line 879
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    invoke-static {v0}, Lnaarad/client/tabhost/NaaradPlotFragment;->access$200(Lnaarad/client/tabhost/NaaradPlotFragment;)Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move-result-object v0

    iget-wide v1, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->yMin:D

    sub-double/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setYAxisMin(D)V

    .line 882
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    invoke-static {v0}, Lnaarad/client/tabhost/NaaradPlotFragment;->access$100(Lnaarad/client/tabhost/NaaradPlotFragment;)Lorg/achartengine/GraphicalView;

    move-result-object v0

    invoke-virtual {v0}, Lorg/achartengine/GraphicalView;->repaint()V

    .line 884
    :cond_0
    return-void
.end method
