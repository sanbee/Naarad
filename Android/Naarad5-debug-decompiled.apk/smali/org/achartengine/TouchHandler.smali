.class public Lorg/achartengine/TouchHandler;
.super Ljava/lang/Object;
.source "TouchHandler.java"

# interfaces
.implements Lorg/achartengine/ITouchHandler;


# instance fields
.field private graphicalView:Lorg/achartengine/GraphicalView;

.field private mPan:Lorg/achartengine/tools/Pan;

.field private mPinchZoom:Lorg/achartengine/tools/Zoom;

.field private mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

.field private oldX:F

.field private oldX2:F

.field private oldY:F

.field private oldY2:F

.field private zoomR:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Lorg/achartengine/GraphicalView;Lorg/achartengine/chart/AbstractChart;)V
    .locals 3
    .param p1, "view"    # Lorg/achartengine/GraphicalView;
    .param p2, "chart"    # Lorg/achartengine/chart/AbstractChart;

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lorg/achartengine/TouchHandler;->zoomR:Landroid/graphics/RectF;

    .line 60
    iput-object p1, p0, Lorg/achartengine/TouchHandler;->graphicalView:Lorg/achartengine/GraphicalView;

    .line 61
    iget-object v0, p0, Lorg/achartengine/TouchHandler;->graphicalView:Lorg/achartengine/GraphicalView;

    invoke-virtual {v0}, Lorg/achartengine/GraphicalView;->getZoomRectangle()Landroid/graphics/RectF;

    move-result-object v0

    iput-object v0, p0, Lorg/achartengine/TouchHandler;->zoomR:Landroid/graphics/RectF;

    .line 62
    instance-of v0, p2, Lorg/achartengine/chart/XYChart;

    if-eqz v0, :cond_0

    .line 63
    move-object v0, p2

    check-cast v0, Lorg/achartengine/chart/XYChart;

    invoke-virtual {v0}, Lorg/achartengine/chart/XYChart;->getRenderer()Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move-result-object v0

    iput-object v0, p0, Lorg/achartengine/TouchHandler;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    goto :goto_0

    .line 65
    :cond_0
    move-object v0, p2

    check-cast v0, Lorg/achartengine/chart/RoundChart;

    invoke-virtual {v0}, Lorg/achartengine/chart/RoundChart;->getRenderer()Lorg/achartengine/renderer/DefaultRenderer;

    move-result-object v0

    iput-object v0, p0, Lorg/achartengine/TouchHandler;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    .line 67
    :goto_0
    iget-object v0, p0, Lorg/achartengine/TouchHandler;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->isPanEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 68
    new-instance v0, Lorg/achartengine/tools/Pan;

    invoke-direct {v0, p2}, Lorg/achartengine/tools/Pan;-><init>(Lorg/achartengine/chart/AbstractChart;)V

    iput-object v0, p0, Lorg/achartengine/TouchHandler;->mPan:Lorg/achartengine/tools/Pan;

    .line 70
    :cond_1
    iget-object v0, p0, Lorg/achartengine/TouchHandler;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->isZoomEnabled()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 71
    new-instance v0, Lorg/achartengine/tools/Zoom;

    const/4 v1, 0x1

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v0, p2, v1, v2}, Lorg/achartengine/tools/Zoom;-><init>(Lorg/achartengine/chart/AbstractChart;ZF)V

    iput-object v0, p0, Lorg/achartengine/TouchHandler;->mPinchZoom:Lorg/achartengine/tools/Zoom;

    .line 73
    :cond_2
    return-void
.end method

.method private applyZoom(FI)V
    .locals 5
    .param p1, "zoomRate"    # F
    .param p2, "axis"    # I

    .line 155
    const v0, 0x3f666666    # 0.9f

    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    move-result p1

    .line 156
    const v0, 0x3f8ccccd    # 1.1f

    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    move-result p1

    .line 157
    float-to-double v0, p1

    const-wide v2, 0x3feccccccccccccdL    # 0.9

    cmpl-double v4, v0, v2

    if-lez v4, :cond_0

    float-to-double v0, p1

    const-wide v2, 0x3ff199999999999aL    # 1.1

    cmpg-double v4, v0, v2

    if-gez v4, :cond_0

    .line 158
    iget-object v0, p0, Lorg/achartengine/TouchHandler;->mPinchZoom:Lorg/achartengine/tools/Zoom;

    invoke-virtual {v0, p1}, Lorg/achartengine/tools/Zoom;->setZoomRate(F)V

    .line 159
    iget-object v0, p0, Lorg/achartengine/TouchHandler;->mPinchZoom:Lorg/achartengine/tools/Zoom;

    invoke-virtual {v0, p2}, Lorg/achartengine/tools/Zoom;->apply(I)V

    .line 161
    :cond_0
    return-void
.end method


# virtual methods
.method public addPanListener(Lorg/achartengine/tools/PanListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/achartengine/tools/PanListener;

    .line 191
    iget-object v0, p0, Lorg/achartengine/TouchHandler;->mPan:Lorg/achartengine/tools/Pan;

    if-eqz v0, :cond_0

    .line 192
    invoke-virtual {v0, p1}, Lorg/achartengine/tools/Pan;->addPanListener(Lorg/achartengine/tools/PanListener;)V

    .line 194
    :cond_0
    return-void
.end method

.method public addZoomListener(Lorg/achartengine/tools/ZoomListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/achartengine/tools/ZoomListener;

    .line 169
    iget-object v0, p0, Lorg/achartengine/TouchHandler;->mPinchZoom:Lorg/achartengine/tools/Zoom;

    if-eqz v0, :cond_0

    .line 170
    invoke-virtual {v0, p1}, Lorg/achartengine/tools/Zoom;->addZoomListener(Lorg/achartengine/tools/ZoomListener;)V

    .line 172
    :cond_0
    return-void
.end method

.method public handleTouch(Landroid/view/MotionEvent;)Z
    .locals 20
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 81
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    .line 82
    .local v2, "action":I
    iget-object v3, v0, Lorg/achartengine/TouchHandler;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v3, :cond_7

    const/4 v3, 0x2

    if-ne v2, v3, :cond_7

    .line 83
    iget v7, v0, Lorg/achartengine/TouchHandler;->oldX:F

    cmpl-float v7, v7, v6

    if-gez v7, :cond_0

    iget v7, v0, Lorg/achartengine/TouchHandler;->oldY:F

    cmpl-float v7, v7, v6

    if-ltz v7, :cond_d

    .line 84
    :cond_0
    invoke-virtual {v1, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v7

    .line 85
    .local v7, "newX":F
    invoke-virtual {v1, v4}, Landroid/view/MotionEvent;->getY(I)F

    move-result v8

    .line 86
    .local v8, "newY":F
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v9

    if-le v9, v5, :cond_5

    iget v9, v0, Lorg/achartengine/TouchHandler;->oldX2:F

    cmpl-float v9, v9, v6

    if-gez v9, :cond_1

    iget v9, v0, Lorg/achartengine/TouchHandler;->oldY2:F

    cmpl-float v9, v9, v6

    if-ltz v9, :cond_5

    :cond_1
    iget-object v9, v0, Lorg/achartengine/TouchHandler;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v9}, Lorg/achartengine/renderer/DefaultRenderer;->isZoomEnabled()Z

    move-result v9

    if-eqz v9, :cond_5

    .line 87
    invoke-virtual {v1, v5}, Landroid/view/MotionEvent;->getX(I)F

    move-result v6

    .line 88
    .local v6, "newX2":F
    invoke-virtual {v1, v5}, Landroid/view/MotionEvent;->getY(I)F

    move-result v9

    .line 89
    .local v9, "newY2":F
    sub-float v10, v7, v6

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    .line 90
    .local v10, "newDeltaX":F
    sub-float v11, v8, v9

    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    move-result v11

    .line 91
    .local v11, "newDeltaY":F
    iget v12, v0, Lorg/achartengine/TouchHandler;->oldX:F

    iget v13, v0, Lorg/achartengine/TouchHandler;->oldX2:F

    sub-float/2addr v12, v13

    invoke-static {v12}, Ljava/lang/Math;->abs(F)F

    move-result v12

    .line 92
    .local v12, "oldDeltaX":F
    iget v13, v0, Lorg/achartengine/TouchHandler;->oldY:F

    iget v14, v0, Lorg/achartengine/TouchHandler;->oldY2:F

    sub-float/2addr v13, v14

    invoke-static {v13}, Ljava/lang/Math;->abs(F)F

    move-result v13

    .line 93
    .local v13, "oldDeltaY":F
    const/high16 v14, 0x3f800000    # 1.0f

    .line 95
    .local v14, "zoomRate":F
    iget v15, v0, Lorg/achartengine/TouchHandler;->oldY:F

    sub-float v15, v8, v15

    invoke-static {v15}, Ljava/lang/Math;->abs(F)F

    move-result v15

    iget v4, v0, Lorg/achartengine/TouchHandler;->oldX:F

    sub-float v4, v7, v4

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    div-float/2addr v15, v4

    .line 96
    .local v15, "tan1":F
    iget v4, v0, Lorg/achartengine/TouchHandler;->oldY2:F

    sub-float v4, v9, v4

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    iget v3, v0, Lorg/achartengine/TouchHandler;->oldX2:F

    sub-float v3, v6, v3

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    div-float/2addr v4, v3

    .line 97
    .local v4, "tan2":F
    move/from16 v16, v6

    .end local v6    # "newX2":F
    .local v16, "newX2":F
    float-to-double v5, v15

    const-wide/high16 v17, 0x3fd0000000000000L    # 0.25

    cmpg-double v19, v5, v17

    if-gtz v19, :cond_2

    float-to-double v5, v4

    cmpg-double v19, v5, v17

    if-gtz v19, :cond_2

    .line 100
    div-float v5, v10, v12

    .line 101
    .end local v14    # "zoomRate":F
    .local v5, "zoomRate":F
    const/4 v3, 0x1

    invoke-direct {v0, v5, v3}, Lorg/achartengine/TouchHandler;->applyZoom(FI)V

    goto :goto_1

    .line 102
    .end local v5    # "zoomRate":F
    .restart local v14    # "zoomRate":F
    :cond_2
    float-to-double v5, v15

    const-wide v17, 0x400dd70a3d70a3d7L    # 3.73

    cmpl-double v19, v5, v17

    if-ltz v19, :cond_3

    float-to-double v5, v4

    cmpl-double v19, v5, v17

    if-ltz v19, :cond_3

    .line 105
    div-float v5, v11, v13

    .line 106
    .end local v14    # "zoomRate":F
    .restart local v5    # "zoomRate":F
    const/4 v6, 0x2

    invoke-direct {v0, v5, v6}, Lorg/achartengine/TouchHandler;->applyZoom(FI)V

    goto :goto_1

    .line 109
    .end local v5    # "zoomRate":F
    .restart local v14    # "zoomRate":F
    :cond_3
    iget v5, v0, Lorg/achartengine/TouchHandler;->oldX:F

    sub-float v5, v7, v5

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    iget v6, v0, Lorg/achartengine/TouchHandler;->oldY:F

    sub-float v6, v8, v6

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    cmpl-float v5, v5, v6

    if-ltz v5, :cond_4

    .line 110
    div-float v5, v10, v12

    .end local v14    # "zoomRate":F
    .restart local v5    # "zoomRate":F
    goto :goto_0

    .line 112
    .end local v5    # "zoomRate":F
    .restart local v14    # "zoomRate":F
    :cond_4
    div-float v5, v11, v13

    .line 114
    .end local v14    # "zoomRate":F
    .restart local v5    # "zoomRate":F
    :goto_0
    const/4 v6, 0x0

    invoke-direct {v0, v5, v6}, Lorg/achartengine/TouchHandler;->applyZoom(FI)V

    .line 116
    :goto_1
    move/from16 v6, v16

    .end local v16    # "newX2":F
    .restart local v6    # "newX2":F
    iput v6, v0, Lorg/achartengine/TouchHandler;->oldX2:F

    .line 117
    iput v9, v0, Lorg/achartengine/TouchHandler;->oldY2:F

    .end local v4    # "tan2":F
    .end local v5    # "zoomRate":F
    .end local v6    # "newX2":F
    .end local v9    # "newY2":F
    .end local v10    # "newDeltaX":F
    .end local v11    # "newDeltaY":F
    .end local v12    # "oldDeltaX":F
    .end local v13    # "oldDeltaY":F
    .end local v15    # "tan1":F
    goto :goto_2

    .line 118
    :cond_5
    iget-object v4, v0, Lorg/achartengine/TouchHandler;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/DefaultRenderer;->isPanEnabled()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 119
    iget-object v4, v0, Lorg/achartengine/TouchHandler;->mPan:Lorg/achartengine/tools/Pan;

    iget v5, v0, Lorg/achartengine/TouchHandler;->oldX:F

    iget v9, v0, Lorg/achartengine/TouchHandler;->oldY:F

    invoke-virtual {v4, v5, v9, v7, v8}, Lorg/achartengine/tools/Pan;->apply(FFFF)V

    .line 120
    iput v6, v0, Lorg/achartengine/TouchHandler;->oldX2:F

    .line 121
    iput v6, v0, Lorg/achartengine/TouchHandler;->oldY2:F

    goto :goto_3

    .line 118
    :cond_6
    :goto_2
    nop

    .line 123
    :goto_3
    iput v7, v0, Lorg/achartengine/TouchHandler;->oldX:F

    .line 124
    iput v8, v0, Lorg/achartengine/TouchHandler;->oldY:F

    .line 125
    iget-object v4, v0, Lorg/achartengine/TouchHandler;->graphicalView:Lorg/achartengine/GraphicalView;

    invoke-virtual {v4}, Lorg/achartengine/GraphicalView;->repaint()V

    .line 126
    const/4 v3, 0x1

    return v3

    .line 128
    .end local v7    # "newX":F
    .end local v8    # "newY":F
    :cond_7
    if-nez v2, :cond_b

    .line 129
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v5

    iput v5, v0, Lorg/achartengine/TouchHandler;->oldX:F

    .line 130
    invoke-virtual {v1, v4}, Landroid/view/MotionEvent;->getY(I)F

    move-result v4

    iput v4, v0, Lorg/achartengine/TouchHandler;->oldY:F

    .line 131
    iget-object v4, v0, Lorg/achartengine/TouchHandler;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    if-eqz v4, :cond_a

    invoke-virtual {v4}, Lorg/achartengine/renderer/DefaultRenderer;->isZoomEnabled()Z

    move-result v4

    if-eqz v4, :cond_a

    iget-object v4, v0, Lorg/achartengine/TouchHandler;->zoomR:Landroid/graphics/RectF;

    iget v5, v0, Lorg/achartengine/TouchHandler;->oldX:F

    iget v6, v0, Lorg/achartengine/TouchHandler;->oldY:F

    invoke-virtual {v4, v5, v6}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 132
    iget v4, v0, Lorg/achartengine/TouchHandler;->oldX:F

    iget-object v5, v0, Lorg/achartengine/TouchHandler;->zoomR:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    iget-object v6, v0, Lorg/achartengine/TouchHandler;->zoomR:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v6

    const/high16 v7, 0x40400000    # 3.0f

    div-float/2addr v6, v7

    add-float/2addr v5, v6

    cmpg-float v4, v4, v5

    if-gez v4, :cond_8

    .line 133
    iget-object v4, v0, Lorg/achartengine/TouchHandler;->graphicalView:Lorg/achartengine/GraphicalView;

    invoke-virtual {v4}, Lorg/achartengine/GraphicalView;->zoomIn()V

    goto :goto_4

    .line 134
    :cond_8
    iget v4, v0, Lorg/achartengine/TouchHandler;->oldX:F

    iget-object v5, v0, Lorg/achartengine/TouchHandler;->zoomR:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    iget-object v6, v0, Lorg/achartengine/TouchHandler;->zoomR:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v6

    const/high16 v8, 0x40000000    # 2.0f

    mul-float v6, v6, v8

    div-float/2addr v6, v7

    add-float/2addr v5, v6

    cmpg-float v4, v4, v5

    if-gez v4, :cond_9

    .line 135
    iget-object v4, v0, Lorg/achartengine/TouchHandler;->graphicalView:Lorg/achartengine/GraphicalView;

    invoke-virtual {v4}, Lorg/achartengine/GraphicalView;->zoomOut()V

    goto :goto_4

    .line 137
    :cond_9
    iget-object v4, v0, Lorg/achartengine/TouchHandler;->graphicalView:Lorg/achartengine/GraphicalView;

    invoke-virtual {v4}, Lorg/achartengine/GraphicalView;->zoomReset()V

    .line 139
    :goto_4
    const/4 v3, 0x1

    return v3

    .line 131
    :cond_a
    const/4 v3, 0x1

    goto :goto_5

    .line 141
    :cond_b
    const/4 v3, 0x1

    const/4 v4, 0x6

    if-eq v2, v3, :cond_c

    if-ne v2, v4, :cond_d

    .line 142
    :cond_c
    iput v6, v0, Lorg/achartengine/TouchHandler;->oldX:F

    .line 143
    iput v6, v0, Lorg/achartengine/TouchHandler;->oldY:F

    .line 144
    iput v6, v0, Lorg/achartengine/TouchHandler;->oldX2:F

    .line 145
    iput v6, v0, Lorg/achartengine/TouchHandler;->oldY2:F

    .line 146
    if-ne v2, v4, :cond_d

    .line 147
    const/high16 v4, -0x40800000    # -1.0f

    iput v4, v0, Lorg/achartengine/TouchHandler;->oldX:F

    .line 148
    iput v4, v0, Lorg/achartengine/TouchHandler;->oldY:F

    .line 151
    :cond_d
    :goto_5
    iget-object v4, v0, Lorg/achartengine/TouchHandler;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/DefaultRenderer;->isClickEnabled()Z

    move-result v4

    const/4 v3, 0x1

    xor-int/2addr v3, v4

    return v3
.end method

.method public removePanListener(Lorg/achartengine/tools/PanListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/achartengine/tools/PanListener;

    .line 202
    iget-object v0, p0, Lorg/achartengine/TouchHandler;->mPan:Lorg/achartengine/tools/Pan;

    if-eqz v0, :cond_0

    .line 203
    invoke-virtual {v0, p1}, Lorg/achartengine/tools/Pan;->removePanListener(Lorg/achartengine/tools/PanListener;)V

    .line 205
    :cond_0
    return-void
.end method

.method public removeZoomListener(Lorg/achartengine/tools/ZoomListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/achartengine/tools/ZoomListener;

    .line 180
    iget-object v0, p0, Lorg/achartengine/TouchHandler;->mPinchZoom:Lorg/achartengine/tools/Zoom;

    if-eqz v0, :cond_0

    .line 181
    invoke-virtual {v0, p1}, Lorg/achartengine/tools/Zoom;->removeZoomListener(Lorg/achartengine/tools/ZoomListener;)V

    .line 183
    :cond_0
    return-void
.end method
