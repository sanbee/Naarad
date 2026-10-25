.class public Lorg/achartengine/tools/Pan;
.super Lorg/achartengine/tools/AbstractTool;
.source "Pan.java"


# instance fields
.field private limitsReachedX:Z

.field private limitsReachedY:Z

.field private mPanListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/achartengine/tools/PanListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/achartengine/chart/AbstractChart;)V
    .locals 1
    .param p1, "chart"    # Lorg/achartengine/chart/AbstractChart;

    .line 42
    invoke-direct {p0, p1}, Lorg/achartengine/tools/AbstractTool;-><init>(Lorg/achartengine/chart/AbstractChart;)V

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/achartengine/tools/Pan;->mPanListeners:Ljava/util/List;

    .line 32
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/achartengine/tools/Pan;->limitsReachedX:Z

    .line 34
    iput-boolean v0, p0, Lorg/achartengine/tools/Pan;->limitsReachedY:Z

    .line 43
    return-void
.end method

.method private getAxisRatio([D)D
    .locals 6
    .param p1, "range"    # [D

    .line 133
    const/4 v0, 0x1

    aget-wide v0, p1, v0

    const/4 v2, 0x0

    aget-wide v2, p1, v2

    sub-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    const/4 v2, 0x3

    aget-wide v2, p1, v2

    const/4 v4, 0x2

    aget-wide v4, p1, v4

    sub-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    div-double/2addr v0, v2

    return-wide v0
.end method

.method private declared-synchronized notifyPanListeners()V
    .locals 2

    monitor-enter p0

    .line 140
    :try_start_0
    iget-object v0, p0, Lorg/achartengine/tools/Pan;->mPanListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/achartengine/tools/PanListener;

    .line 141
    .local v1, "listener":Lorg/achartengine/tools/PanListener;
    invoke-interface {v1}, Lorg/achartengine/tools/PanListener;->panApplied()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v1    # "listener":Lorg/achartengine/tools/PanListener;
    goto :goto_0

    .line 143
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local p0    # "this":Lorg/achartengine/tools/Pan;
    :cond_0
    monitor-exit p0

    return-void

    .line 139
    :catchall_0
    move-exception v0

    monitor-exit p0

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method


# virtual methods
.method public declared-synchronized addPanListener(Lorg/achartengine/tools/PanListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/achartengine/tools/PanListener;

    monitor-enter p0

    .line 151
    :try_start_0
    iget-object v0, p0, Lorg/achartengine/tools/Pan;->mPanListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 152
    monitor-exit p0

    return-void

    .line 150
    .end local p0    # "this":Lorg/achartengine/tools/Pan;
    .end local p1    # "listener":Lorg/achartengine/tools/PanListener;
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public apply(FFFF)V
    .locals 33
    .param p1, "oldX"    # F
    .param p2, "oldY"    # F
    .param p3, "newX"    # F
    .param p4, "newY"    # F

    .line 54
    move-object/from16 v6, p0

    move/from16 v7, p1

    move/from16 v8, p2

    move/from16 v9, p3

    move/from16 v10, p4

    const/4 v0, 0x1

    .line 55
    .local v0, "notLimitedUp":Z
    const/4 v1, 0x1

    .line 56
    .local v1, "notLimitedBottom":Z
    const/4 v2, 0x1

    .line 57
    .local v2, "notLimitedLeft":Z
    const/4 v3, 0x1

    .line 58
    .local v3, "notLimitedRight":Z
    iget-object v4, v6, Lorg/achartengine/tools/Pan;->mChart:Lorg/achartengine/chart/AbstractChart;

    instance-of v4, v4, Lorg/achartengine/chart/XYChart;

    if-eqz v4, :cond_15

    .line 59
    iget-object v4, v6, Lorg/achartengine/tools/Pan;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getScalesCount()I

    move-result v11

    .line 60
    .local v11, "scales":I
    iget-object v4, v6, Lorg/achartengine/tools/Pan;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getPanLimits()[D

    move-result-object v12

    .line 61
    .local v12, "limits":[D
    const/4 v13, 0x0

    const/4 v14, 0x1

    if-eqz v12, :cond_0

    array-length v4, v12

    const/4 v5, 0x4

    if-ne v4, v5, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    move v15, v4

    .line 62
    .local v15, "limited":Z
    iget-object v4, v6, Lorg/achartengine/tools/Pan;->mChart:Lorg/achartengine/chart/AbstractChart;

    move-object v5, v4

    check-cast v5, Lorg/achartengine/chart/XYChart;

    .line 63
    .local v5, "chart":Lorg/achartengine/chart/XYChart;
    const/4 v4, 0x0

    move/from16 v16, v0

    move/from16 v17, v1

    move v0, v3

    move v3, v4

    .end local v1    # "notLimitedBottom":Z
    .local v0, "notLimitedRight":Z
    .local v3, "i":I
    .local v16, "notLimitedUp":Z
    .local v17, "notLimitedBottom":Z
    :goto_1
    if-ge v3, v11, :cond_14

    .line 64
    invoke-virtual {v6, v3}, Lorg/achartengine/tools/Pan;->getRange(I)[D

    move-result-object v4

    .line 65
    .local v4, "range":[D
    invoke-virtual {v5, v3}, Lorg/achartengine/chart/XYChart;->getCalcRange(I)[D

    move-result-object v18

    .line 66
    .local v18, "calcRange":[D
    iget-boolean v1, v6, Lorg/achartengine/tools/Pan;->limitsReachedX:Z

    const/16 v19, 0x3

    const/16 v20, 0x2

    if-eqz v1, :cond_3

    iget-boolean v1, v6, Lorg/achartengine/tools/Pan;->limitsReachedY:Z

    if-eqz v1, :cond_3

    aget-wide v21, v4, v13

    aget-wide v23, v4, v14

    cmpl-double v1, v21, v23

    if-nez v1, :cond_1

    aget-wide v21, v18, v13

    aget-wide v23, v18, v14

    cmpl-double v1, v21, v23

    if-eqz v1, :cond_2

    :cond_1
    aget-wide v21, v4, v20

    aget-wide v23, v4, v19

    cmpl-double v1, v21, v23

    if-nez v1, :cond_3

    aget-wide v21, v18, v20

    aget-wide v23, v18, v19

    cmpl-double v1, v21, v23

    if-nez v1, :cond_3

    .line 70
    :cond_2
    return-void

    .line 72
    :cond_3
    invoke-virtual {v6, v4, v3}, Lorg/achartengine/tools/Pan;->checkRange([DI)V

    .line 74
    invoke-virtual {v5, v7, v8, v3}, Lorg/achartengine/chart/XYChart;->toRealPoint(FFI)[D

    move-result-object v21

    .line 75
    .local v21, "realPoint":[D
    invoke-virtual {v5, v9, v10, v3}, Lorg/achartengine/chart/XYChart;->toRealPoint(FFI)[D

    move-result-object v22

    .line 76
    .local v22, "realPoint2":[D
    aget-wide v23, v21, v13

    aget-wide v25, v22, v13

    sub-double v23, v23, v25

    .line 77
    .local v23, "deltaX":D
    aget-wide v25, v21, v14

    aget-wide v27, v22, v14

    move/from16 v29, v15

    .end local v15    # "limited":Z
    .local v29, "limited":Z
    sub-double v14, v25, v27

    .line 78
    .local v14, "deltaY":D
    invoke-direct {v6, v4}, Lorg/achartengine/tools/Pan;->getAxisRatio([D)D

    move-result-wide v25

    .line 79
    .local v25, "ratio":D
    iget-object v1, v6, Lorg/achartengine/tools/Pan;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v5, v1}, Lorg/achartengine/chart/XYChart;->isVertical(Lorg/achartengine/renderer/DefaultRenderer;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 80
    move/from16 v27, v11

    .end local v11    # "scales":I
    .local v27, "scales":I
    neg-double v10, v14

    mul-double v10, v10, v25

    .line 81
    .local v10, "newDeltaX":D
    div-double v30, v23, v25

    .line 82
    .local v30, "newDeltaY":D
    move-wide/from16 v23, v10

    .line 83
    move-wide/from16 v14, v30

    goto :goto_2

    .line 79
    .end local v10    # "newDeltaX":D
    .end local v27    # "scales":I
    .end local v30    # "newDeltaY":D
    .restart local v11    # "scales":I
    :cond_4
    move/from16 v27, v11

    .line 85
    .end local v11    # "scales":I
    .restart local v27    # "scales":I
    :goto_2
    iget-object v1, v6, Lorg/achartengine/tools/Pan;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isPanXEnabled()Z

    move-result v1

    if-eqz v1, :cond_c

    .line 86
    if-eqz v12, :cond_9

    .line 87
    if-eqz v2, :cond_6

    .line 88
    aget-wide v10, v12, v13

    aget-wide v30, v4, v13

    add-double v30, v30, v23

    cmpg-double v1, v10, v30

    if-gtz v1, :cond_5

    const/4 v1, 0x1

    goto :goto_3

    :cond_5
    const/4 v1, 0x0

    :goto_3
    move v2, v1

    .line 90
    :cond_6
    if-eqz v0, :cond_8

    .line 91
    const/4 v1, 0x1

    aget-wide v10, v12, v1

    aget-wide v30, v4, v1

    add-double v30, v30, v23

    cmpl-double v1, v10, v30

    if-ltz v1, :cond_7

    const/4 v1, 0x1

    goto :goto_4

    :cond_7
    const/4 v1, 0x0

    :goto_4
    move v0, v1

    move v11, v0

    move v10, v2

    goto :goto_5

    .line 90
    :cond_8
    move v11, v0

    move v10, v2

    goto :goto_5

    .line 86
    :cond_9
    move v11, v0

    move v10, v2

    .line 94
    .end local v0    # "notLimitedRight":Z
    .end local v2    # "notLimitedLeft":Z
    .local v10, "notLimitedLeft":Z
    .local v11, "notLimitedRight":Z
    :goto_5
    if-eqz v29, :cond_b

    if-eqz v10, :cond_a

    if-eqz v11, :cond_a

    const/4 v0, 0x1

    goto :goto_6

    .line 98
    :cond_a
    const/4 v0, 0x1

    iput-boolean v0, v6, Lorg/achartengine/tools/Pan;->limitsReachedX:Z

    move/from16 v28, v3

    move-object/from16 v32, v4

    move-object/from16 v30, v5

    goto :goto_7

    .line 94
    :cond_b
    const/4 v0, 0x1

    .line 95
    :goto_6
    aget-wide v1, v4, v13

    add-double v1, v1, v23

    aget-wide v30, v4, v0

    add-double v30, v30, v23

    move-object/from16 v0, p0

    move/from16 v28, v3

    move-object/from16 v32, v4

    .end local v3    # "i":I
    .end local v4    # "range":[D
    .local v28, "i":I
    .local v32, "range":[D
    move-wide/from16 v3, v30

    move-object/from16 v30, v5

    .end local v5    # "chart":Lorg/achartengine/chart/XYChart;
    .local v30, "chart":Lorg/achartengine/chart/XYChart;
    move/from16 v5, v28

    invoke-virtual/range {v0 .. v5}, Lorg/achartengine/tools/Pan;->setXRange(DDI)V

    .line 96
    iput-boolean v13, v6, Lorg/achartengine/tools/Pan;->limitsReachedX:Z

    goto :goto_7

    .line 85
    .end local v10    # "notLimitedLeft":Z
    .end local v11    # "notLimitedRight":Z
    .end local v28    # "i":I
    .end local v30    # "chart":Lorg/achartengine/chart/XYChart;
    .end local v32    # "range":[D
    .restart local v0    # "notLimitedRight":Z
    .restart local v2    # "notLimitedLeft":Z
    .restart local v3    # "i":I
    .restart local v4    # "range":[D
    .restart local v5    # "chart":Lorg/achartengine/chart/XYChart;
    :cond_c
    move/from16 v28, v3

    move-object/from16 v32, v4

    move-object/from16 v30, v5

    .end local v3    # "i":I
    .end local v4    # "range":[D
    .end local v5    # "chart":Lorg/achartengine/chart/XYChart;
    .restart local v28    # "i":I
    .restart local v30    # "chart":Lorg/achartengine/chart/XYChart;
    .restart local v32    # "range":[D
    move v11, v0

    move v10, v2

    .line 101
    .end local v0    # "notLimitedRight":Z
    .end local v2    # "notLimitedLeft":Z
    .restart local v10    # "notLimitedLeft":Z
    .restart local v11    # "notLimitedRight":Z
    :goto_7
    iget-object v0, v6, Lorg/achartengine/tools/Pan;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isPanYEnabled()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 102
    if-eqz v12, :cond_10

    .line 103
    if-eqz v17, :cond_e

    .line 104
    aget-wide v0, v12, v20

    aget-wide v2, v32, v20

    add-double/2addr v2, v14

    cmpg-double v4, v0, v2

    if-gtz v4, :cond_d

    const/4 v0, 0x1

    goto :goto_8

    :cond_d
    const/4 v0, 0x0

    :goto_8
    move/from16 v17, v0

    .line 106
    :cond_e
    if-eqz v16, :cond_10

    .line 107
    aget-wide v0, v12, v19

    aget-wide v2, v32, v19

    add-double/2addr v2, v14

    cmpl-double v4, v0, v2

    if-ltz v4, :cond_f

    const/4 v0, 0x1

    goto :goto_9

    :cond_f
    const/4 v0, 0x0

    :goto_9
    move/from16 v16, v0

    .line 110
    :cond_10
    if-eqz v29, :cond_12

    if-eqz v17, :cond_11

    if-eqz v16, :cond_11

    const/4 v5, 0x1

    goto :goto_a

    .line 114
    :cond_11
    const/4 v5, 0x1

    iput-boolean v5, v6, Lorg/achartengine/tools/Pan;->limitsReachedY:Z

    const/16 v19, 0x1

    goto :goto_b

    .line 110
    :cond_12
    const/4 v5, 0x1

    .line 111
    :goto_a
    aget-wide v0, v32, v20

    add-double v1, v0, v14

    aget-wide v3, v32, v19

    add-double/2addr v3, v14

    move-object/from16 v0, p0

    const/16 v19, 0x1

    move/from16 v5, v28

    invoke-virtual/range {v0 .. v5}, Lorg/achartengine/tools/Pan;->setYRange(DDI)V

    .line 112
    iput-boolean v13, v6, Lorg/achartengine/tools/Pan;->limitsReachedY:Z

    goto :goto_b

    .line 101
    :cond_13
    const/16 v19, 0x1

    .line 63
    .end local v14    # "deltaY":D
    .end local v18    # "calcRange":[D
    .end local v21    # "realPoint":[D
    .end local v22    # "realPoint2":[D
    .end local v23    # "deltaX":D
    .end local v25    # "ratio":D
    .end local v32    # "range":[D
    :goto_b
    add-int/lit8 v3, v28, 0x1

    move v2, v10

    move v0, v11

    move/from16 v11, v27

    move/from16 v15, v29

    move-object/from16 v5, v30

    const/4 v14, 0x1

    move/from16 v10, p4

    .end local v28    # "i":I
    .restart local v3    # "i":I
    goto/16 :goto_1

    .end local v10    # "notLimitedLeft":Z
    .end local v27    # "scales":I
    .end local v29    # "limited":Z
    .end local v30    # "chart":Lorg/achartengine/chart/XYChart;
    .restart local v0    # "notLimitedRight":Z
    .restart local v2    # "notLimitedLeft":Z
    .restart local v5    # "chart":Lorg/achartengine/chart/XYChart;
    .local v11, "scales":I
    .restart local v15    # "limited":Z
    :cond_14
    move/from16 v28, v3

    move-object/from16 v30, v5

    move/from16 v27, v11

    move/from16 v29, v15

    .line 118
    .end local v3    # "i":I
    .end local v5    # "chart":Lorg/achartengine/chart/XYChart;
    .end local v11    # "scales":I
    .end local v12    # "limits":[D
    .end local v15    # "limited":Z
    move v3, v0

    move/from16 v0, v16

    move/from16 v1, v17

    goto :goto_c

    .line 119
    .end local v16    # "notLimitedUp":Z
    .end local v17    # "notLimitedBottom":Z
    .local v0, "notLimitedUp":Z
    .restart local v1    # "notLimitedBottom":Z
    .local v3, "notLimitedRight":Z
    :cond_15
    iget-object v4, v6, Lorg/achartengine/tools/Pan;->mChart:Lorg/achartengine/chart/AbstractChart;

    check-cast v4, Lorg/achartengine/chart/RoundChart;

    .line 120
    .local v4, "chart":Lorg/achartengine/chart/RoundChart;
    invoke-virtual {v4}, Lorg/achartengine/chart/RoundChart;->getCenterX()I

    move-result v5

    sub-float v10, v9, v7

    float-to-int v10, v10

    add-int/2addr v5, v10

    invoke-virtual {v4, v5}, Lorg/achartengine/chart/RoundChart;->setCenterX(I)V

    .line 121
    invoke-virtual {v4}, Lorg/achartengine/chart/RoundChart;->getCenterY()I

    move-result v5

    sub-float v10, p4, v8

    float-to-int v10, v10

    add-int/2addr v5, v10

    invoke-virtual {v4, v5}, Lorg/achartengine/chart/RoundChart;->setCenterY(I)V

    .line 123
    .end local v4    # "chart":Lorg/achartengine/chart/RoundChart;
    :goto_c
    invoke-direct/range {p0 .. p0}, Lorg/achartengine/tools/Pan;->notifyPanListeners()V

    .line 124
    return-void
.end method

.method public declared-synchronized removePanListener(Lorg/achartengine/tools/PanListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/achartengine/tools/PanListener;

    monitor-enter p0

    .line 160
    :try_start_0
    iget-object v0, p0, Lorg/achartengine/tools/Pan;->mPanListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 161
    monitor-exit p0

    return-void

    .line 159
    .end local p0    # "this":Lorg/achartengine/tools/Pan;
    .end local p1    # "listener":Lorg/achartengine/tools/PanListener;
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
