.class public Lorg/achartengine/model/RangeCategorySeries;
.super Lorg/achartengine/model/CategorySeries;
.source "RangeCategorySeries.java"


# instance fields
.field private mMaxValues:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "title"    # Ljava/lang/String;

    .line 32
    invoke-direct {p0, p1}, Lorg/achartengine/model/CategorySeries;-><init>(Ljava/lang/String;)V

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/achartengine/model/RangeCategorySeries;->mMaxValues:Ljava/util/List;

    .line 33
    return-void
.end method


# virtual methods
.method public declared-synchronized add(DD)V
    .locals 2
    .param p1, "minValue"    # D
    .param p3, "maxValue"    # D

    monitor-enter p0

    .line 41
    :try_start_0
    invoke-super {p0, p1, p2}, Lorg/achartengine/model/CategorySeries;->add(D)V

    .line 42
    iget-object v0, p0, Lorg/achartengine/model/RangeCategorySeries;->mMaxValues:Ljava/util/List;

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    monitor-exit p0

    return-void

    .line 40
    .end local p0    # "this":Lorg/achartengine/model/RangeCategorySeries;
    .end local p1    # "minValue":D
    .end local p3    # "maxValue":D
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized add(Ljava/lang/String;DD)V
    .locals 2
    .param p1, "category"    # Ljava/lang/String;
    .param p2, "minValue"    # D
    .param p4, "maxValue"    # D

    monitor-enter p0

    .line 53
    :try_start_0
    invoke-super {p0, p1, p2, p3}, Lorg/achartengine/model/CategorySeries;->add(Ljava/lang/String;D)V

    .line 54
    iget-object v0, p0, Lorg/achartengine/model/RangeCategorySeries;->mMaxValues:Ljava/util/List;

    invoke-static {p4, p5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    monitor-exit p0

    return-void

    .line 52
    .end local p0    # "this":Lorg/achartengine/model/RangeCategorySeries;
    .end local p1    # "category":Ljava/lang/String;
    .end local p2    # "minValue":D
    .end local p4    # "maxValue":D
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized clear()V
    .locals 1

    monitor-enter p0

    .line 71
    :try_start_0
    invoke-super {p0}, Lorg/achartengine/model/CategorySeries;->clear()V

    .line 72
    iget-object v0, p0, Lorg/achartengine/model/RangeCategorySeries;->mMaxValues:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 73
    monitor-exit p0

    return-void

    .line 70
    .end local p0    # "this":Lorg/achartengine/model/RangeCategorySeries;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getMaximumValue(I)D
    .locals 2
    .param p1, "index"    # I

    .line 92
    iget-object v0, p0, Lorg/achartengine/model/RangeCategorySeries;->mMaxValues:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    return-wide v0
.end method

.method public getMinimumValue(I)D
    .locals 2
    .param p1, "index"    # I

    .line 82
    invoke-virtual {p0, p1}, Lorg/achartengine/model/RangeCategorySeries;->getValue(I)D

    move-result-wide v0

    return-wide v0
.end method

.method public declared-synchronized remove(I)V
    .locals 1
    .param p1, "index"    # I

    monitor-enter p0

    .line 63
    :try_start_0
    invoke-super {p0, p1}, Lorg/achartengine/model/CategorySeries;->remove(I)V

    .line 64
    iget-object v0, p0, Lorg/achartengine/model/RangeCategorySeries;->mMaxValues:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    monitor-exit p0

    return-void

    .line 62
    .end local p0    # "this":Lorg/achartengine/model/RangeCategorySeries;
    .end local p1    # "index":I
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public toXYSeries()Lorg/achartengine/model/XYSeries;
    .locals 7

    .line 101
    new-instance v0, Lorg/achartengine/model/XYSeries;

    invoke-virtual {p0}, Lorg/achartengine/model/RangeCategorySeries;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/achartengine/model/XYSeries;-><init>(Ljava/lang/String;)V

    .line 102
    .local v0, "xySeries":Lorg/achartengine/model/XYSeries;
    invoke-virtual {p0}, Lorg/achartengine/model/RangeCategorySeries;->getItemCount()I

    move-result v1

    .line 103
    .local v1, "length":I
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 104
    add-int/lit8 v3, v2, 0x1

    int-to-double v3, v3

    invoke-virtual {p0, v2}, Lorg/achartengine/model/RangeCategorySeries;->getMinimumValue(I)D

    move-result-wide v5

    invoke-virtual {v0, v3, v4, v5, v6}, Lorg/achartengine/model/XYSeries;->add(DD)V

    .line 107
    int-to-double v3, v2

    const-wide v5, 0x3ff000010c6f7a0bL    # 1.000001

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v3, v5

    invoke-virtual {p0, v2}, Lorg/achartengine/model/RangeCategorySeries;->getMaximumValue(I)D

    move-result-wide v5

    invoke-virtual {v0, v3, v4, v5, v6}, Lorg/achartengine/model/XYSeries;->add(DD)V

    .line 103
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 109
    .end local v2    # "k":I
    :cond_0
    return-object v0
.end method
