.class public Lorg/achartengine/model/TimeSeries;
.super Lorg/achartengine/model/XYSeries;
.source "TimeSeries.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;

    .line 31
    invoke-direct {p0, p1}, Lorg/achartengine/model/XYSeries;-><init>(Ljava/lang/String;)V

    .line 32
    return-void
.end method


# virtual methods
.method public declared-synchronized add(Ljava/util/Date;D)V
    .locals 2
    .param p1, "x"    # Ljava/util/Date;
    .param p2, "y"    # D

    monitor-enter p0

    .line 41
    :try_start_0
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    long-to-double v0, v0

    invoke-super {p0, v0, v1, p2, p3}, Lorg/achartengine/model/XYSeries;->add(DD)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    monitor-exit p0

    return-void

    .line 40
    .end local p0    # "this":Lorg/achartengine/model/TimeSeries;
    .end local p1    # "x":Ljava/util/Date;
    .end local p2    # "y":D
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method protected getPadding()D
    .locals 2

    .line 45
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    return-wide v0
.end method
