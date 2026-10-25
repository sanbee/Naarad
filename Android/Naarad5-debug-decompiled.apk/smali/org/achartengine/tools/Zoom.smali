.class public Lorg/achartengine/tools/Zoom;
.super Lorg/achartengine/tools/AbstractTool;
.source "Zoom.java"


# static fields
.field public static final ZOOM_AXIS_X:I = 0x1

.field public static final ZOOM_AXIS_XY:I = 0x0

.field public static final ZOOM_AXIS_Y:I = 0x2


# instance fields
.field private limitsReachedX:Z

.field private limitsReachedY:Z

.field private mZoomIn:Z

.field private mZoomListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/achartengine/tools/ZoomListener;",
            ">;"
        }
    .end annotation
.end field

.field private mZoomRate:F


# direct methods
.method public constructor <init>(Lorg/achartengine/chart/AbstractChart;ZF)V
    .locals 1
    .param p1, "chart"    # Lorg/achartengine/chart/AbstractChart;
    .param p2, "in"    # Z
    .param p3, "rate"    # F

    .line 56
    invoke-direct {p0, p1}, Lorg/achartengine/tools/AbstractTool;-><init>(Lorg/achartengine/chart/AbstractChart;)V

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/achartengine/tools/Zoom;->mZoomListeners:Ljava/util/List;

    .line 37
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/achartengine/tools/Zoom;->limitsReachedX:Z

    .line 39
    iput-boolean v0, p0, Lorg/achartengine/tools/Zoom;->limitsReachedY:Z

    .line 57
    iput-boolean p2, p0, Lorg/achartengine/tools/Zoom;->mZoomIn:Z

    .line 58
    invoke-virtual {p0, p3}, Lorg/achartengine/tools/Zoom;->setZoomRate(F)V

    .line 59
    return-void
.end method

.method private declared-synchronized notifyZoomListeners(Lorg/achartengine/tools/ZoomEvent;)V
    .locals 2
    .param p1, "e"    # Lorg/achartengine/tools/ZoomEvent;

    monitor-enter p0

    .line 162
    :try_start_0
    iget-object v0, p0, Lorg/achartengine/tools/Zoom;->mZoomListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/achartengine/tools/ZoomListener;

    .line 163
    .local v1, "listener":Lorg/achartengine/tools/ZoomListener;
    invoke-interface {v1, p1}, Lorg/achartengine/tools/ZoomListener;->zoomApplied(Lorg/achartengine/tools/ZoomEvent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v1    # "listener":Lorg/achartengine/tools/ZoomListener;
    goto :goto_0

    .line 165
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local p0    # "this":Lorg/achartengine/tools/Zoom;
    :cond_0
    monitor-exit p0

    return-void

    .line 161
    .end local p1    # "e":Lorg/achartengine/tools/ZoomEvent;
    :catchall_0
    move-exception p1

    monitor-exit p0

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method


# virtual methods
.method public declared-synchronized addZoomListener(Lorg/achartengine/tools/ZoomListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/achartengine/tools/ZoomListener;

    monitor-enter p0

    .line 182
    :try_start_0
    iget-object v0, p0, Lorg/achartengine/tools/Zoom;->mZoomListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 183
    monitor-exit p0

    return-void

    .line 181
    .end local p0    # "this":Lorg/achartengine/tools/Zoom;
    .end local p1    # "listener":Lorg/achartengine/tools/ZoomListener;
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public apply(I)V
    .locals 39
    .param p1, "zoom_axis"    # I

    .line 74
    move-object/from16 v6, p0

    move/from16 v7, p1

    iget-object v0, v6, Lorg/achartengine/tools/Zoom;->mChart:Lorg/achartengine/chart/AbstractChart;

    instance-of v0, v0, Lorg/achartengine/chart/XYChart;

    if-eqz v0, :cond_16

    .line 75
    iget-object v0, v6, Lorg/achartengine/tools/Zoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getScalesCount()I

    move-result v8

    .line 76
    .local v8, "scales":I
    const/4 v0, 0x0

    move v9, v0

    .local v9, "i":I
    :goto_0
    if-ge v9, v8, :cond_15

    .line 77
    invoke-virtual {v6, v9}, Lorg/achartengine/tools/Zoom;->getRange(I)[D

    move-result-object v10

    .line 78
    .local v10, "range":[D
    invoke-virtual {v6, v10, v9}, Lorg/achartengine/tools/Zoom;->checkRange([DI)V

    .line 79
    iget-object v0, v6, Lorg/achartengine/tools/Zoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getZoomLimits()[D

    move-result-object v11

    .line 81
    .local v11, "limits":[D
    const/4 v0, 0x0

    aget-wide v1, v10, v0

    const/4 v3, 0x1

    aget-wide v4, v10, v3

    add-double/2addr v1, v4

    const-wide/high16 v12, 0x4000000000000000L    # 2.0

    div-double v14, v1, v12

    .line 82
    .local v14, "centerX":D
    const/4 v5, 0x2

    aget-wide v1, v10, v5

    const/4 v4, 0x3

    aget-wide v16, v10, v4

    add-double v1, v1, v16

    div-double v16, v1, v12

    .line 83
    .local v16, "centerY":D
    aget-wide v1, v10, v3

    aget-wide v18, v10, v0

    sub-double v1, v1, v18

    .line 84
    .local v1, "newWidth":D
    aget-wide v18, v10, v4

    aget-wide v20, v10, v5

    sub-double v18, v18, v20

    .line 85
    .local v18, "newHeight":D
    div-double v20, v1, v12

    sub-double v20, v14, v20

    .line 86
    .local v20, "newXMin":D
    div-double v22, v1, v12

    add-double v22, v14, v22

    .line 87
    .local v22, "newXMax":D
    div-double v24, v18, v12

    sub-double v24, v16, v24

    .line 88
    .local v24, "newYMin":D
    div-double v26, v18, v12

    add-double v26, v16, v26

    .line 91
    .local v26, "newYMax":D
    if-nez v9, :cond_4

    .line 92
    if-eqz v11, :cond_1

    aget-wide v28, v11, v0

    cmpg-double v30, v20, v28

    if-lez v30, :cond_0

    aget-wide v28, v11, v3

    cmpl-double v30, v22, v28

    if-ltz v30, :cond_1

    :cond_0
    const/4 v12, 0x1

    goto :goto_1

    :cond_1
    const/4 v12, 0x0

    :goto_1
    iput-boolean v12, v6, Lorg/achartengine/tools/Zoom;->limitsReachedX:Z

    .line 93
    if-eqz v11, :cond_3

    aget-wide v12, v11, v5

    cmpg-double v30, v24, v12

    if-lez v30, :cond_2

    aget-wide v12, v11, v4

    cmpl-double v30, v26, v12

    if-ltz v30, :cond_3

    :cond_2
    const/4 v12, 0x1

    goto :goto_2

    :cond_3
    const/4 v12, 0x0

    :goto_2
    iput-boolean v12, v6, Lorg/achartengine/tools/Zoom;->limitsReachedY:Z

    .line 96
    :cond_4
    iget-boolean v12, v6, Lorg/achartengine/tools/Zoom;->mZoomIn:Z

    if-eqz v12, :cond_a

    .line 97
    iget-object v12, v6, Lorg/achartengine/tools/Zoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v12}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isZoomXEnabled()Z

    move-result v12

    const/high16 v13, 0x3f800000    # 1.0f

    if-eqz v12, :cond_7

    if-eq v7, v3, :cond_5

    if-nez v7, :cond_7

    .line 98
    :cond_5
    iget-boolean v12, v6, Lorg/achartengine/tools/Zoom;->limitsReachedX:Z

    if-eqz v12, :cond_6

    iget v12, v6, Lorg/achartengine/tools/Zoom;->mZoomRate:F

    cmpg-float v12, v12, v13

    if-gez v12, :cond_6

    goto :goto_3

    .line 101
    :cond_6
    iget v12, v6, Lorg/achartengine/tools/Zoom;->mZoomRate:F

    float-to-double v3, v12

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v1, v3

    .line 105
    :cond_7
    :goto_3
    iget-object v3, v6, Lorg/achartengine/tools/Zoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isZoomYEnabled()Z

    move-result v3

    if-eqz v3, :cond_e

    if-eq v7, v5, :cond_8

    if-nez v7, :cond_e

    .line 106
    :cond_8
    iget-boolean v3, v6, Lorg/achartengine/tools/Zoom;->limitsReachedY:Z

    if-eqz v3, :cond_9

    iget v3, v6, Lorg/achartengine/tools/Zoom;->mZoomRate:F

    cmpg-float v3, v3, v13

    if-gez v3, :cond_9

    goto :goto_4

    .line 108
    :cond_9
    iget v3, v6, Lorg/achartengine/tools/Zoom;->mZoomRate:F

    float-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    div-double v18, v18, v3

    move-wide/from16 v3, v18

    goto :goto_5

    .line 112
    :cond_a
    iget-object v3, v6, Lorg/achartengine/tools/Zoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isZoomXEnabled()Z

    move-result v3

    if-eqz v3, :cond_c

    iget-boolean v3, v6, Lorg/achartengine/tools/Zoom;->limitsReachedX:Z

    if-nez v3, :cond_c

    const/4 v3, 0x1

    if-eq v7, v3, :cond_b

    if-nez v7, :cond_c

    .line 114
    :cond_b
    iget v3, v6, Lorg/achartengine/tools/Zoom;->mZoomRate:F

    float-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v1, v1, v3

    .line 117
    :cond_c
    iget-object v3, v6, Lorg/achartengine/tools/Zoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isZoomYEnabled()Z

    move-result v3

    if-eqz v3, :cond_e

    iget-boolean v3, v6, Lorg/achartengine/tools/Zoom;->limitsReachedY:Z

    if-nez v3, :cond_e

    if-eq v7, v5, :cond_d

    if-nez v7, :cond_e

    .line 119
    :cond_d
    iget v3, v6, Lorg/achartengine/tools/Zoom;->mZoomRate:F

    float-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v18, v18, v3

    move-wide/from16 v3, v18

    goto :goto_5

    .line 124
    :cond_e
    :goto_4
    move-wide/from16 v3, v18

    .end local v18    # "newHeight":D
    .local v3, "newHeight":D
    :goto_5
    if-eqz v11, :cond_f

    .line 125
    iget-object v12, v6, Lorg/achartengine/tools/Zoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v12}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getZoomInLimitX()D

    move-result-wide v12

    const/16 v18, 0x1

    aget-wide v32, v11, v18

    aget-wide v18, v11, v0

    sub-double v5, v32, v18

    invoke-static {v12, v13, v5, v6}, Ljava/lang/Math;->min(DD)D

    move-result-wide v5

    .line 126
    .local v5, "minX":D
    move-object/from16 v12, p0

    iget-object v0, v12, Lorg/achartengine/tools/Zoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move-wide/from16 v18, v5

    .end local v5    # "minX":D
    .local v18, "minX":D
    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getZoomInLimitY()D

    move-result-wide v5

    const/4 v0, 0x3

    aget-wide v31, v11, v0

    const/4 v13, 0x2

    aget-wide v33, v11, v13

    move-wide/from16 v35, v14

    .end local v14    # "centerX":D
    .local v35, "centerX":D
    sub-double v13, v31, v33

    invoke-static {v5, v6, v13, v14}, Ljava/lang/Math;->min(DD)D

    move-result-wide v5

    move-wide/from16 v13, v18

    .local v5, "minY":D
    goto :goto_6

    .line 128
    .end local v5    # "minY":D
    .end local v18    # "minX":D
    .end local v35    # "centerX":D
    .restart local v14    # "centerX":D
    :cond_f
    move-object v12, v6

    move-wide/from16 v35, v14

    .end local v14    # "centerX":D
    .restart local v35    # "centerX":D
    iget-object v0, v12, Lorg/achartengine/tools/Zoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getZoomInLimitX()D

    move-result-wide v5

    .line 129
    .local v5, "minX":D
    iget-object v0, v12, Lorg/achartengine/tools/Zoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getZoomInLimitY()D

    move-result-wide v13

    move-wide/from16 v37, v5

    move-wide v5, v13

    move-wide/from16 v13, v37

    .line 131
    .local v5, "minY":D
    .local v13, "minX":D
    :goto_6
    invoke-static {v1, v2, v13, v14}, Ljava/lang/Math;->max(DD)D

    move-result-wide v18

    .line 132
    .end local v1    # "newWidth":D
    .local v18, "newWidth":D
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->max(DD)D

    move-result-wide v31

    .line 134
    .end local v3    # "newHeight":D
    .local v31, "newHeight":D
    iget-object v0, v12, Lorg/achartengine/tools/Zoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isZoomXEnabled()Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    if-eq v7, v0, :cond_11

    if-nez v7, :cond_10

    goto :goto_7

    :cond_10
    move-wide/from16 v33, v5

    const/4 v6, 0x2

    goto :goto_8

    .line 135
    :cond_11
    :goto_7
    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    div-double v2, v18, v0

    sub-double v20, v35, v2

    .line 136
    div-double v2, v18, v0

    add-double v22, v35, v2

    .line 137
    move-object/from16 v0, p0

    move-wide/from16 v1, v20

    move-wide/from16 v3, v22

    move-wide/from16 v33, v5

    const/4 v6, 0x2

    .end local v5    # "minY":D
    .local v33, "minY":D
    move v5, v9

    invoke-virtual/range {v0 .. v5}, Lorg/achartengine/tools/Zoom;->setXRange(DDI)V

    goto :goto_8

    .line 134
    .end local v33    # "minY":D
    .restart local v5    # "minY":D
    :cond_12
    move-wide/from16 v33, v5

    const/4 v6, 0x2

    .line 139
    .end local v5    # "minY":D
    .restart local v33    # "minY":D
    :goto_8
    iget-object v0, v12, Lorg/achartengine/tools/Zoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isZoomYEnabled()Z

    move-result v0

    if-eqz v0, :cond_14

    if-eq v7, v6, :cond_13

    if-nez v7, :cond_14

    .line 140
    :cond_13
    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    div-double v2, v31, v0

    sub-double v24, v16, v2

    .line 141
    div-double v0, v31, v0

    add-double v26, v16, v0

    .line 142
    move-object/from16 v0, p0

    move-wide/from16 v1, v24

    move-wide/from16 v3, v26

    move v5, v9

    invoke-virtual/range {v0 .. v5}, Lorg/achartengine/tools/Zoom;->setYRange(DDI)V

    .line 76
    .end local v10    # "range":[D
    .end local v11    # "limits":[D
    .end local v13    # "minX":D
    .end local v16    # "centerY":D
    .end local v18    # "newWidth":D
    .end local v20    # "newXMin":D
    .end local v22    # "newXMax":D
    .end local v24    # "newYMin":D
    .end local v26    # "newYMax":D
    .end local v31    # "newHeight":D
    .end local v33    # "minY":D
    .end local v35    # "centerX":D
    :cond_14
    add-int/lit8 v9, v9, 0x1

    move-object v6, v12

    goto/16 :goto_0

    :cond_15
    move-object v12, v6

    .line 145
    .end local v8    # "scales":I
    .end local v9    # "i":I
    goto :goto_9

    .line 146
    :cond_16
    move-object v12, v6

    iget-object v0, v12, Lorg/achartengine/tools/Zoom;->mChart:Lorg/achartengine/chart/AbstractChart;

    check-cast v0, Lorg/achartengine/chart/RoundChart;

    invoke-virtual {v0}, Lorg/achartengine/chart/RoundChart;->getRenderer()Lorg/achartengine/renderer/DefaultRenderer;

    move-result-object v0

    .line 147
    .local v0, "renderer":Lorg/achartengine/renderer/DefaultRenderer;
    iget-boolean v1, v12, Lorg/achartengine/tools/Zoom;->mZoomIn:Z

    if-eqz v1, :cond_17

    .line 148
    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->getScale()F

    move-result v1

    iget v2, v12, Lorg/achartengine/tools/Zoom;->mZoomRate:F

    mul-float v1, v1, v2

    invoke-virtual {v0, v1}, Lorg/achartengine/renderer/DefaultRenderer;->setScale(F)V

    goto :goto_9

    .line 150
    :cond_17
    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->getScale()F

    move-result v1

    iget v2, v12, Lorg/achartengine/tools/Zoom;->mZoomRate:F

    div-float/2addr v1, v2

    invoke-virtual {v0, v1}, Lorg/achartengine/renderer/DefaultRenderer;->setScale(F)V

    .line 153
    .end local v0    # "renderer":Lorg/achartengine/renderer/DefaultRenderer;
    :goto_9
    new-instance v0, Lorg/achartengine/tools/ZoomEvent;

    iget-boolean v1, v12, Lorg/achartengine/tools/Zoom;->mZoomIn:Z

    iget v2, v12, Lorg/achartengine/tools/Zoom;->mZoomRate:F

    invoke-direct {v0, v1, v2}, Lorg/achartengine/tools/ZoomEvent;-><init>(ZF)V

    invoke-direct {v12, v0}, Lorg/achartengine/tools/Zoom;->notifyZoomListeners(Lorg/achartengine/tools/ZoomEvent;)V

    .line 154
    return-void
.end method

.method public declared-synchronized notifyZoomResetListeners()V
    .locals 2

    monitor-enter p0

    .line 171
    :try_start_0
    iget-object v0, p0, Lorg/achartengine/tools/Zoom;->mZoomListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/achartengine/tools/ZoomListener;

    .line 172
    .local v1, "listener":Lorg/achartengine/tools/ZoomListener;
    invoke-interface {v1}, Lorg/achartengine/tools/ZoomListener;->zoomReset()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v1    # "listener":Lorg/achartengine/tools/ZoomListener;
    goto :goto_0

    .line 174
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local p0    # "this":Lorg/achartengine/tools/Zoom;
    :cond_0
    monitor-exit p0

    return-void

    .line 170
    :catchall_0
    move-exception v0

    monitor-exit p0

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method

.method public declared-synchronized removeZoomListener(Lorg/achartengine/tools/ZoomListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/achartengine/tools/ZoomListener;

    monitor-enter p0

    .line 191
    :try_start_0
    iget-object v0, p0, Lorg/achartengine/tools/Zoom;->mZoomListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 192
    monitor-exit p0

    return-void

    .line 190
    .end local p0    # "this":Lorg/achartengine/tools/Zoom;
    .end local p1    # "listener":Lorg/achartengine/tools/ZoomListener;
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setZoomRate(F)V
    .locals 0
    .param p1, "rate"    # F

    .line 67
    iput p1, p0, Lorg/achartengine/tools/Zoom;->mZoomRate:F

    .line 68
    return-void
.end method
