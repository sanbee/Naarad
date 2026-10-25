.class public Lorg/achartengine/chart/PieMapper;
.super Ljava/lang/Object;
.source "PieMapper.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private mCenterX:I

.field private mCenterY:I

.field private mPieChartRadius:I

.field private mPieSegmentList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/achartengine/chart/PieSegment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/achartengine/chart/PieMapper;->mPieSegmentList:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public addPieSegment(IFFF)V
    .locals 2
    .param p1, "dataIndex"    # I
    .param p2, "value"    # F
    .param p3, "startAngle"    # F
    .param p4, "angle"    # F

    .line 68
    iget-object v0, p0, Lorg/achartengine/chart/PieMapper;->mPieSegmentList:Ljava/util/List;

    new-instance v1, Lorg/achartengine/chart/PieSegment;

    invoke-direct {v1, p1, p2, p3, p4}, Lorg/achartengine/chart/PieSegment;-><init>(IFFF)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    return-void
.end method

.method public areAllSegmentPresent(I)Z
    .locals 1
    .param p1, "datasetSize"    # I

    .line 56
    iget-object v0, p0, Lorg/achartengine/chart/PieMapper;->mPieSegmentList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ne v0, p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public clearPieSegments()V
    .locals 1

    .line 75
    iget-object v0, p0, Lorg/achartengine/chart/PieMapper;->mPieSegmentList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 76
    return-void
.end method

.method public getAngle(Lorg/achartengine/model/Point;)D
    .locals 9
    .param p1, "screenPoint"    # Lorg/achartengine/model/Point;

    .line 86
    invoke-virtual {p1}, Lorg/achartengine/model/Point;->getX()F

    move-result v0

    iget v1, p0, Lorg/achartengine/chart/PieMapper;->mCenterX:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    float-to-double v0, v0

    .line 88
    .local v0, "dx":D
    invoke-virtual {p1}, Lorg/achartengine/model/Point;->getY()F

    move-result v2

    iget v3, p0, Lorg/achartengine/chart/PieMapper;->mCenterY:I

    int-to-float v3, v3

    sub-float/2addr v2, v3

    neg-float v2, v2

    float-to-double v2, v2

    .line 90
    .local v2, "dy":D
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v4

    .line 94
    .local v4, "inRads":D
    const-wide/16 v6, 0x0

    cmpg-double v8, v4, v6

    if-gez v8, :cond_0

    .line 95
    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    goto :goto_0

    .line 97
    :cond_0
    const-wide v6, 0x401921fb54442d18L    # 6.283185307179586

    sub-double v4, v6, v4

    .line 99
    :goto_0
    invoke-static {v4, v5}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v6

    return-wide v6
.end method

.method public getSeriesAndPointForScreenCoordinate(Lorg/achartengine/model/Point;)Lorg/achartengine/model/SeriesSelection;
    .locals 12
    .param p1, "screenPoint"    # Lorg/achartengine/model/Point;

    .line 127
    invoke-virtual {p0, p1}, Lorg/achartengine/chart/PieMapper;->isOnPieChart(Lorg/achartengine/model/Point;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 128
    invoke-virtual {p0, p1}, Lorg/achartengine/chart/PieMapper;->getAngle(Lorg/achartengine/model/Point;)D

    move-result-wide v0

    .line 130
    .local v0, "angleFromPieCenter":D
    iget-object v2, p0, Lorg/achartengine/chart/PieMapper;->mPieSegmentList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/achartengine/chart/PieSegment;

    .line 131
    .local v3, "pieSeg":Lorg/achartengine/chart/PieSegment;
    invoke-virtual {v3, v0, v1}, Lorg/achartengine/chart/PieSegment;->isInSegment(D)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 132
    new-instance v4, Lorg/achartengine/model/SeriesSelection;

    const/4 v6, 0x0

    invoke-virtual {v3}, Lorg/achartengine/chart/PieSegment;->getDataIndex()I

    move-result v7

    invoke-virtual {v3}, Lorg/achartengine/chart/PieSegment;->getValue()F

    move-result v5

    float-to-double v8, v5

    invoke-virtual {v3}, Lorg/achartengine/chart/PieSegment;->getValue()F

    move-result v5

    float-to-double v10, v5

    move-object v5, v4

    invoke-direct/range {v5 .. v11}, Lorg/achartengine/model/SeriesSelection;-><init>(IIDD)V

    return-object v4

    .end local v3    # "pieSeg":Lorg/achartengine/chart/PieSegment;
    :cond_0
    goto :goto_0

    .line 137
    .end local v0    # "angleFromPieCenter":D
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public isOnPieChart(Lorg/achartengine/model/Point;)Z
    .locals 6
    .param p1, "screenPoint"    # Lorg/achartengine/model/Point;

    .line 112
    iget v0, p0, Lorg/achartengine/chart/PieMapper;->mCenterX:I

    int-to-float v0, v0

    invoke-virtual {p1}, Lorg/achartengine/model/Point;->getX()F

    move-result v1

    sub-float/2addr v0, v1

    float-to-double v0, v0

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    iget v4, p0, Lorg/achartengine/chart/PieMapper;->mCenterY:I

    int-to-float v4, v4

    invoke-virtual {p1}, Lorg/achartengine/model/Point;->getY()F

    move-result v5

    sub-float/2addr v4, v5

    float-to-double v4, v4

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    add-double/2addr v0, v2

    .line 115
    .local v0, "sqValue":D
    iget v2, p0, Lorg/achartengine/chart/PieMapper;->mPieChartRadius:I

    mul-int v2, v2, v2

    int-to-double v2, v2

    .line 116
    .local v2, "radiusSquared":D
    cmpg-double v4, v0, v2

    if-gtz v4, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    .line 117
    .local v4, "isOnPieChart":Z
    :goto_0
    return v4
.end method

.method public setDimensions(III)V
    .locals 0
    .param p1, "pieRadius"    # I
    .param p2, "centerX"    # I
    .param p3, "centerY"    # I

    .line 44
    iput p1, p0, Lorg/achartengine/chart/PieMapper;->mPieChartRadius:I

    .line 45
    iput p2, p0, Lorg/achartengine/chart/PieMapper;->mCenterX:I

    .line 46
    iput p3, p0, Lorg/achartengine/chart/PieMapper;->mCenterY:I

    .line 47
    return-void
.end method
