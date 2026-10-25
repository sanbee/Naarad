.class public Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
.super Lorg/achartengine/renderer/DefaultRenderer;
.source "XYMultipleSeriesRenderer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    }
.end annotation


# instance fields
.field private initialRange:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "[D>;"
        }
    .end annotation
.end field

.field private mAxisTitleTextSize:F

.field private mBarSpacing:D

.field private mBarWidth:F

.field private mGridColor:I

.field private mLabelFormat:Ljava/text/NumberFormat;

.field private mMarginsColor:I

.field private mMaxX:[D

.field private mMaxY:[D

.field private mMinX:[D

.field private mMinY:[D

.field private mOrientation:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

.field private mPanLimits:[D

.field private mPanXEnabled:Z

.field private mPanYEnabled:Z

.field private mPointSize:F

.field private mXLabels:I

.field private mXLabelsAngle:F

.field private mXLabelsColor:I

.field private mXLabelsPadding:F

.field private mXRoundedLabels:Z

.field private mXTextLabels:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Double;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mXTitle:Ljava/lang/String;

.field private mYLabels:I

.field private mYLabelsAngle:F

.field private mYLabelsColor:[I

.field private mYLabelsPadding:F

.field private mYLabelsVerticalPadding:F

.field private mYTextLabels:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/Map<",
            "Ljava/lang/Double;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private mYTitle:[Ljava/lang/String;

.field private mZoomInLimitX:D

.field private mZoomInLimitY:D

.field private mZoomLimits:[D

.field private mZoomXEnabled:Z

.field private mZoomYEnabled:Z

.field private scalesCount:I

.field private xLabelsAlign:Landroid/graphics/Paint$Align;

.field private yAxisAlign:[Landroid/graphics/Paint$Align;

.field private yLabelsAlign:[Landroid/graphics/Paint$Align;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 137
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;-><init>(I)V

    .line 138
    return-void
.end method

.method public constructor <init>(I)V
    .locals 6
    .param p1, "scaleNumber"    # I

    .line 140
    invoke-direct {p0}, Lorg/achartengine/renderer/DefaultRenderer;-><init>()V

    .line 33
    const-string v0, ""

    iput-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXTitle:Ljava/lang/String;

    .line 37
    const/high16 v0, 0x41400000    # 12.0f

    iput v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mAxisTitleTextSize:F

    .line 47
    const/4 v0, 0x5

    iput v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXLabels:I

    .line 49
    iput v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabels:I

    .line 51
    sget-object v0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->HORIZONTAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    iput-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mOrientation:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    .line 53
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXTextLabels:Ljava/util/Map;

    .line 55
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYTextLabels:Ljava/util/Map;

    .line 57
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mPanXEnabled:Z

    .line 59
    iput-boolean v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mPanYEnabled:Z

    .line 61
    iput-boolean v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomXEnabled:Z

    .line 63
    iput-boolean v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomYEnabled:Z

    .line 65
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mBarSpacing:D

    .line 67
    const/4 v3, 0x0

    iput v3, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMarginsColor:I

    .line 77
    new-instance v4, Ljava/util/LinkedHashMap;

    invoke-direct {v4}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v4, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->initialRange:Ljava/util/Map;

    .line 79
    const/high16 v4, 0x40400000    # 3.0f

    iput v4, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mPointSize:F

    .line 81
    const/16 v4, 0xc8

    const/16 v5, 0x4b

    invoke-static {v5, v4, v4, v4}, Landroid/graphics/Color;->argb(IIII)I

    move-result v4

    iput v4, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mGridColor:I

    .line 85
    sget-object v4, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    iput-object v4, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->xLabelsAlign:Landroid/graphics/Paint$Align;

    .line 89
    const/4 v4, 0x0

    iput v4, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXLabelsPadding:F

    .line 91
    iput v4, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelsPadding:F

    .line 93
    const/high16 v4, 0x40000000    # 2.0f

    iput v4, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelsVerticalPadding:F

    .line 97
    const v4, -0x333334

    iput v4, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXLabelsColor:I

    .line 99
    new-array v5, v0, [I

    aput v4, v5, v3

    iput-object v5, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelsColor:[I

    .line 104
    iput-boolean v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXRoundedLabels:Z

    .line 108
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mBarWidth:F

    .line 110
    iput-wide v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomInLimitX:D

    .line 112
    iput-wide v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomInLimitY:D

    .line 141
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->scalesCount:I

    .line 142
    invoke-virtual {p0, p1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->initAxesRange(I)V

    .line 143
    return-void
.end method


# virtual methods
.method public addTextLabel(DLjava/lang/String;)V
    .locals 0
    .param p1, "x"    # D
    .param p3, "text"    # Ljava/lang/String;

    .line 531
    invoke-virtual {p0, p1, p2, p3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->addXTextLabel(DLjava/lang/String;)V

    .line 532
    return-void
.end method

.method public declared-synchronized addXTextLabel(DLjava/lang/String;)V
    .locals 2
    .param p1, "x"    # D
    .param p3, "text"    # Ljava/lang/String;

    monitor-enter p0

    .line 541
    :try_start_0
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXTextLabels:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 542
    monitor-exit p0

    return-void

    .line 540
    .end local p0    # "this":Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .end local p1    # "x":D
    .end local p3    # "text":Ljava/lang/String;
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public addYTextLabel(DLjava/lang/String;)V
    .locals 1
    .param p1, "y"    # D
    .param p3, "text"    # Ljava/lang/String;

    .line 613
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->addYTextLabel(DLjava/lang/String;I)V

    .line 614
    return-void
.end method

.method public declared-synchronized addYTextLabel(DLjava/lang/String;I)V
    .locals 2
    .param p1, "y"    # D
    .param p3, "text"    # Ljava/lang/String;
    .param p4, "scale"    # I

    monitor-enter p0

    .line 633
    :try_start_0
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYTextLabels:Ljava/util/Map;

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 634
    monitor-exit p0

    return-void

    .line 632
    .end local p0    # "this":Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .end local p1    # "y":D
    .end local p3    # "text":Ljava/lang/String;
    .end local p4    # "scale":I
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public clearTextLabels()V
    .locals 0

    .line 578
    invoke-virtual {p0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->clearXTextLabels()V

    .line 579
    return-void
.end method

.method public declared-synchronized clearXTextLabels()V
    .locals 1

    monitor-enter p0

    .line 585
    :try_start_0
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXTextLabels:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 586
    monitor-exit p0

    return-void

    .line 584
    .end local p0    # "this":Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public clearYTextLabels()V
    .locals 1

    .line 690
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->clearYTextLabels(I)V

    .line 691
    return-void
.end method

.method public declared-synchronized clearYTextLabels(I)V
    .locals 2
    .param p1, "scale"    # I

    monitor-enter p0

    .line 699
    :try_start_0
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYTextLabels:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 700
    monitor-exit p0

    return-void

    .line 698
    .end local p0    # "this":Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .end local p1    # "scale":I
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public getAxisTitleTextSize()F
    .locals 1

    .line 253
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mAxisTitleTextSize:F

    return v0
.end method

.method public getBarSpacing()D
    .locals 2

    .line 865
    iget-wide v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mBarSpacing:D

    return-wide v0
.end method

.method public getBarWidth()F
    .locals 1

    .line 752
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mBarWidth:F

    return v0
.end method

.method public getBarsSpacing()D
    .locals 2

    .line 856
    invoke-virtual {p0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getBarSpacing()D

    move-result-wide v0

    return-wide v0
.end method

.method public getGridColor()I
    .locals 1

    .line 903
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mGridColor:I

    return v0
.end method

.method public getInitialRange()[D
    .locals 1

    .line 1047
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getInitialRange(I)[D

    move-result-object v0

    return-object v0
.end method

.method public getInitialRange(I)[D
    .locals 2
    .param p1, "scale"    # I

    .line 1057
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->initialRange:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [D

    return-object v0
.end method

.method public getLabelFormat()Ljava/text/NumberFormat;
    .locals 1

    .line 1227
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mLabelFormat:Ljava/text/NumberFormat;

    return-object v0
.end method

.method public getMarginsColor()I
    .locals 1

    .line 885
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMarginsColor:I

    return v0
.end method

.method public getOrientation()Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .locals 1

    .line 179
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mOrientation:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    return-object v0
.end method

.method public getPanLimits()[D
    .locals 1

    .line 921
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mPanLimits:[D

    return-object v0
.end method

.method public getPointSize()F
    .locals 1

    .line 997
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mPointSize:F

    return v0
.end method

.method public getScalesCount()I
    .locals 1

    .line 1290
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->scalesCount:I

    return v0
.end method

.method public getXAxisMax()D
    .locals 2

    .line 298
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXAxisMax(I)D

    move-result-wide v0

    return-wide v0
.end method

.method public getXAxisMax(I)D
    .locals 3
    .param p1, "scale"    # I

    .line 413
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMaxX:[D

    aget-wide v1, v0, p1

    return-wide v1
.end method

.method public getXAxisMin()D
    .locals 2

    .line 271
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXAxisMin(I)D

    move-result-wide v0

    return-wide v0
.end method

.method public getXAxisMin(I)D
    .locals 3
    .param p1, "scale"    # I

    .line 380
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMinX:[D

    aget-wide v1, v0, p1

    return-wide v1
.end method

.method public getXLabels()I
    .locals 1

    .line 511
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXLabels:I

    return v0
.end method

.method public getXLabelsAlign()Landroid/graphics/Paint$Align;
    .locals 1

    .line 1124
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->xLabelsAlign:Landroid/graphics/Paint$Align;

    return-object v0
.end method

.method public getXLabelsAngle()F
    .locals 1

    .line 961
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXLabelsAngle:F

    return v0
.end method

.method public getXLabelsColor()I
    .locals 1

    .line 1087
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXLabelsColor:I

    return v0
.end method

.method public getXLabelsPadding()F
    .locals 1

    .line 1173
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXLabelsPadding:F

    return v0
.end method

.method public declared-synchronized getXTextLabel(Ljava/lang/Double;)Ljava/lang/String;
    .locals 1
    .param p1, "x"    # Ljava/lang/Double;

    monitor-enter p0

    .line 560
    :try_start_0
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXTextLabels:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .end local p0    # "this":Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .end local p1    # "x":Ljava/lang/Double;
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getXTextLabelLocations()[Ljava/lang/Double;
    .locals 2

    monitor-enter p0

    .line 569
    :try_start_0
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXTextLabels:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Double;

    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Double;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .end local p0    # "this":Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getXTitle()Ljava/lang/String;
    .locals 1

    .line 197
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getYAxisAlign(I)Landroid/graphics/Paint$Align;
    .locals 1
    .param p1, "scale"    # I

    .line 1151
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->yAxisAlign:[Landroid/graphics/Paint$Align;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getYAxisMax()D
    .locals 2

    .line 352
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisMax(I)D

    move-result-wide v0

    return-wide v0
.end method

.method public getYAxisMax(I)D
    .locals 3
    .param p1, "scale"    # I

    .line 479
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMaxY:[D

    aget-wide v1, v0, p1

    return-wide v1
.end method

.method public getYAxisMin()D
    .locals 2

    .line 325
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisMin(I)D

    move-result-wide v0

    return-wide v0
.end method

.method public getYAxisMin(I)D
    .locals 3
    .param p1, "scale"    # I

    .line 446
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMinY:[D

    aget-wide v1, v0, p1

    return-wide v1
.end method

.method public getYLabels()I
    .locals 1

    .line 708
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabels:I

    return v0
.end method

.method public getYLabelsAlign(I)Landroid/graphics/Paint$Align;
    .locals 1
    .param p1, "scale"    # I

    .line 1143
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->yLabelsAlign:[Landroid/graphics/Paint$Align;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getYLabelsAngle()F
    .locals 1

    .line 979
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelsAngle:F

    return v0
.end method

.method public getYLabelsColor(I)I
    .locals 1
    .param p1, "scale"    # I

    .line 1096
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelsColor:[I

    aget v0, v0, p1

    return v0
.end method

.method public getYLabelsPadding()F
    .locals 1

    .line 1191
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelsPadding:F

    return v0
.end method

.method public getYLabelsVerticalPadding()F
    .locals 1

    .line 1209
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelsVerticalPadding:F

    return v0
.end method

.method public getYTextLabel(Ljava/lang/Double;)Ljava/lang/String;
    .locals 1
    .param p1, "y"    # Ljava/lang/Double;

    .line 653
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYTextLabel(Ljava/lang/Double;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getYTextLabel(Ljava/lang/Double;I)Ljava/lang/String;
    .locals 2
    .param p1, "y"    # Ljava/lang/Double;
    .param p2, "scale"    # I

    monitor-enter p0

    .line 664
    :try_start_0
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYTextLabels:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .end local p0    # "this":Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .end local p1    # "y":Ljava/lang/Double;
    .end local p2    # "scale":I
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public getYTextLabelLocations()[Ljava/lang/Double;
    .locals 1

    .line 673
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYTextLabelLocations(I)[Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getYTextLabelLocations(I)[Ljava/lang/Double;
    .locals 2
    .param p1, "scale"    # I

    monitor-enter p0

    .line 683
    :try_start_0
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYTextLabels:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Double;

    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Double;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .end local p0    # "this":Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .end local p1    # "scale":I
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public getYTitle()Ljava/lang/String;
    .locals 1

    .line 215
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYTitle(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getYTitle(I)Ljava/lang/String;
    .locals 1
    .param p1, "scale"    # I

    .line 225
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYTitle:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getZoomInLimitX()D
    .locals 2

    .line 1247
    iget-wide v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomInLimitX:D

    return-wide v0
.end method

.method public getZoomInLimitY()D
    .locals 2

    .line 1272
    iget-wide v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomInLimitY:D

    return-wide v0
.end method

.method public getZoomLimits()[D
    .locals 1

    .line 941
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomLimits:[D

    return-object v0
.end method

.method public initAxesRange(I)V
    .locals 3
    .param p1, "scales"    # I

    .line 146
    new-array v0, p1, [Ljava/lang/String;

    iput-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYTitle:[Ljava/lang/String;

    .line 147
    new-array v0, p1, [Landroid/graphics/Paint$Align;

    iput-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->yLabelsAlign:[Landroid/graphics/Paint$Align;

    .line 148
    new-array v0, p1, [Landroid/graphics/Paint$Align;

    iput-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->yAxisAlign:[Landroid/graphics/Paint$Align;

    .line 149
    new-array v0, p1, [I

    iput-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelsColor:[I

    .line 150
    new-array v0, p1, [D

    iput-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMinX:[D

    .line 151
    new-array v0, p1, [D

    iput-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMaxX:[D

    .line 152
    new-array v0, p1, [D

    iput-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMinY:[D

    .line 153
    new-array v0, p1, [D

    iput-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMaxY:[D

    .line 154
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p1, :cond_0

    .line 155
    iget-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelsColor:[I

    const v2, -0x333334

    aput v2, v1, v0

    .line 156
    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->initAxesRangeForScale(I)V

    .line 154
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 158
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method public initAxesRangeForScale(I)V
    .locals 7
    .param p1, "i"    # I

    .line 161
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMinX:[D

    const-wide v1, 0x7fefffffffffffffL    # Double.MAX_VALUE

    aput-wide v1, v0, p1

    .line 162
    iget-object v3, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMaxX:[D

    const-wide v4, -0x10000000000001L

    aput-wide v4, v3, p1

    .line 163
    iget-object v6, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMinY:[D

    aput-wide v1, v6, p1

    .line 164
    iget-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMaxY:[D

    aput-wide v4, v1, p1

    .line 165
    const/4 v2, 0x4

    new-array v2, v2, [D

    aget-wide v4, v0, p1

    const/4 v0, 0x0

    aput-wide v4, v2, v0

    aget-wide v4, v3, p1

    const/4 v0, 0x1

    aput-wide v4, v2, v0

    aget-wide v3, v6, p1

    const/4 v0, 0x2

    aput-wide v3, v2, v0

    aget-wide v0, v1, p1

    const/4 v3, 0x3

    aput-wide v0, v2, v3

    move-object v0, v2

    .line 166
    .local v0, "range":[D
    iget-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->initialRange:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    iget-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYTitle:[Ljava/lang/String;

    const-string v2, ""

    aput-object v2, v1, p1

    .line 168
    iget-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYTextLabels:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    iget-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->yLabelsAlign:[Landroid/graphics/Paint$Align;

    sget-object v2, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    aput-object v2, v1, p1

    .line 170
    iget-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->yAxisAlign:[Landroid/graphics/Paint$Align;

    sget-object v2, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    aput-object v2, v1, p1

    .line 171
    return-void
.end method

.method public isInitialRangeSet()Z
    .locals 1

    .line 1028
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isInitialRangeSet(I)Z

    move-result v0

    return v0
.end method

.method public isInitialRangeSet(I)Z
    .locals 2
    .param p1, "scale"    # I

    .line 1038
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->initialRange:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isMaxXSet()Z
    .locals 1

    .line 316
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMaxXSet(I)Z

    move-result v0

    return v0
.end method

.method public isMaxXSet(I)Z
    .locals 5
    .param p1, "scale"    # I

    .line 436
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMaxX:[D

    aget-wide v1, v0, p1

    const-wide v3, -0x10000000000001L

    cmpl-double v0, v1, v3

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isMaxYSet()Z
    .locals 1

    .line 370
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMaxYSet(I)Z

    move-result v0

    return v0
.end method

.method public isMaxYSet(I)Z
    .locals 5
    .param p1, "scale"    # I

    .line 502
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMaxY:[D

    aget-wide v1, v0, p1

    const-wide v3, -0x10000000000001L

    cmpl-double v0, v1, v3

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isMinXSet()Z
    .locals 1

    .line 289
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMinXSet(I)Z

    move-result v0

    return v0
.end method

.method public isMinXSet(I)Z
    .locals 5
    .param p1, "scale"    # I

    .line 403
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMinX:[D

    aget-wide v1, v0, p1

    const-wide v3, 0x7fefffffffffffffL    # Double.MAX_VALUE

    cmpl-double v0, v1, v3

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isMinYSet()Z
    .locals 1

    .line 343
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMinYSet(I)Z

    move-result v0

    return v0
.end method

.method public isMinYSet(I)Z
    .locals 5
    .param p1, "scale"    # I

    .line 469
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMinY:[D

    aget-wide v1, v0, p1

    const-wide v3, 0x7fefffffffffffffL    # Double.MAX_VALUE

    cmpl-double v0, v1, v3

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isPanEnabled()Z
    .locals 1

    .line 770
    invoke-virtual {p0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isPanXEnabled()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isPanYEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public isPanXEnabled()Z
    .locals 1

    .line 779
    iget-boolean v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mPanXEnabled:Z

    return v0
.end method

.method public isPanYEnabled()Z
    .locals 1

    .line 788
    iget-boolean v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mPanYEnabled:Z

    return v0
.end method

.method public isXRoundedLabels()Z
    .locals 1

    .line 594
    iget-boolean v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXRoundedLabels:Z

    return v0
.end method

.method public isZoomEnabled()Z
    .locals 1

    .line 817
    invoke-virtual {p0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isZoomXEnabled()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isZoomYEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public isZoomXEnabled()Z
    .locals 1

    .line 826
    iget-boolean v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomXEnabled:Z

    return v0
.end method

.method public isZoomYEnabled()Z
    .locals 1

    .line 835
    iget-boolean v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomYEnabled:Z

    return v0
.end method

.method public declared-synchronized removeXTextLabel(D)V
    .locals 2
    .param p1, "x"    # D

    monitor-enter p0

    .line 550
    :try_start_0
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXTextLabels:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 551
    monitor-exit p0

    return-void

    .line 549
    .end local p0    # "this":Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .end local p1    # "x":D
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public removeYTextLabel(D)V
    .locals 1
    .param p1, "y"    # D

    .line 622
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->removeYTextLabel(DI)V

    .line 623
    return-void
.end method

.method public declared-synchronized removeYTextLabel(DI)V
    .locals 2
    .param p1, "y"    # D
    .param p3, "scale"    # I

    monitor-enter p0

    .line 643
    :try_start_0
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYTextLabels:Ljava/util/Map;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 644
    monitor-exit p0

    return-void

    .line 642
    .end local p0    # "this":Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .end local p1    # "y":D
    .end local p3    # "scale":I
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setAxisTitleTextSize(F)V
    .locals 0
    .param p1, "textSize"    # F

    .line 262
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mAxisTitleTextSize:F

    .line 263
    return-void
.end method

.method public setBarSpacing(D)V
    .locals 0
    .param p1, "spacing"    # D

    .line 876
    iput-wide p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mBarSpacing:D

    .line 877
    return-void
.end method

.method public setBarWidth(F)V
    .locals 0
    .param p1, "width"    # F

    .line 761
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mBarWidth:F

    .line 762
    return-void
.end method

.method public setChartValuesTextSize(F)V
    .locals 5
    .param p1, "textSize"    # F

    .line 740
    invoke-virtual {p0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getSeriesRenderers()[Lorg/achartengine/renderer/SimpleSeriesRenderer;

    move-result-object v0

    .line 741
    .local v0, "renderers":[Lorg/achartengine/renderer/SimpleSeriesRenderer;
    move-object v1, v0

    .local v1, "arr$":[Lorg/achartengine/renderer/SimpleSeriesRenderer;
    array-length v2, v1

    .local v2, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v1, v3

    .line 742
    .local v4, "renderer":Lorg/achartengine/renderer/SimpleSeriesRenderer;
    invoke-virtual {v4, p1}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->setChartValuesTextSize(F)V

    .line 741
    .end local v4    # "renderer":Lorg/achartengine/renderer/SimpleSeriesRenderer;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 744
    .end local v1    # "arr$":[Lorg/achartengine/renderer/SimpleSeriesRenderer;
    .end local v2    # "len$":I
    .end local v3    # "i$":I
    :cond_0
    return-void
.end method

.method public setDisplayChartValues(Z)V
    .locals 5
    .param p1, "display"    # Z

    .line 727
    invoke-virtual {p0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getSeriesRenderers()[Lorg/achartengine/renderer/SimpleSeriesRenderer;

    move-result-object v0

    .line 728
    .local v0, "renderers":[Lorg/achartengine/renderer/SimpleSeriesRenderer;
    move-object v1, v0

    .local v1, "arr$":[Lorg/achartengine/renderer/SimpleSeriesRenderer;
    array-length v2, v1

    .local v2, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v1, v3

    .line 729
    .local v4, "renderer":Lorg/achartengine/renderer/SimpleSeriesRenderer;
    invoke-virtual {v4, p1}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->setDisplayChartValues(Z)V

    .line 728
    .end local v4    # "renderer":Lorg/achartengine/renderer/SimpleSeriesRenderer;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 731
    .end local v1    # "arr$":[Lorg/achartengine/renderer/SimpleSeriesRenderer;
    .end local v2    # "len$":I
    .end local v3    # "i$":I
    :cond_0
    return-void
.end method

.method public setGridColor(I)V
    .locals 0
    .param p1, "color"    # I

    .line 912
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mGridColor:I

    .line 913
    return-void
.end method

.method public setInitialRange([D)V
    .locals 1
    .param p1, "range"    # [D

    .line 1067
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setInitialRange([DI)V

    .line 1068
    return-void
.end method

.method public setInitialRange([DI)V
    .locals 2
    .param p1, "range"    # [D
    .param p2, "scale"    # I

    .line 1078
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->initialRange:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1079
    return-void
.end method

.method public setLabelFormat(Ljava/text/NumberFormat;)V
    .locals 0
    .param p1, "format"    # Ljava/text/NumberFormat;

    .line 1236
    iput-object p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mLabelFormat:Ljava/text/NumberFormat;

    .line 1237
    return-void
.end method

.method public setMarginsColor(I)V
    .locals 0
    .param p1, "color"    # I

    .line 894
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMarginsColor:I

    .line 895
    return-void
.end method

.method public setOrientation(Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;)V
    .locals 0
    .param p1, "orientation"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    .line 188
    iput-object p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mOrientation:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    .line 189
    return-void
.end method

.method public setPanEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .line 808
    invoke-virtual {p0, p1, p1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setPanEnabled(ZZ)V

    .line 809
    return-void
.end method

.method public setPanEnabled(ZZ)V
    .locals 0
    .param p1, "enabledX"    # Z
    .param p2, "enabledY"    # Z

    .line 798
    iput-boolean p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mPanXEnabled:Z

    .line 799
    iput-boolean p2, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mPanYEnabled:Z

    .line 800
    return-void
.end method

.method public setPanLimits([D)V
    .locals 0
    .param p1, "panLimits"    # [D

    .line 932
    iput-object p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mPanLimits:[D

    .line 933
    return-void
.end method

.method public setPointSize(F)V
    .locals 0
    .param p1, "size"    # F

    .line 1006
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mPointSize:F

    .line 1007
    return-void
.end method

.method public setRange([D)V
    .locals 1
    .param p1, "range"    # [D

    .line 1010
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setRange([DI)V

    .line 1011
    return-void
.end method

.method public setRange([DI)V
    .locals 2
    .param p1, "range"    # [D
    .param p2, "scale"    # I

    .line 1021
    const/4 v0, 0x0

    aget-wide v0, p1, v0

    invoke-virtual {p0, v0, v1, p2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setXAxisMin(DI)V

    .line 1022
    const/4 v0, 0x1

    aget-wide v0, p1, v0

    invoke-virtual {p0, v0, v1, p2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setXAxisMax(DI)V

    .line 1023
    const/4 v0, 0x2

    aget-wide v0, p1, v0

    invoke-virtual {p0, v0, v1, p2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setYAxisMin(DI)V

    .line 1024
    const/4 v0, 0x3

    aget-wide v0, p1, v0

    invoke-virtual {p0, v0, v1, p2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setYAxisMax(DI)V

    .line 1025
    return-void
.end method

.method public setXAxisMax(D)V
    .locals 1
    .param p1, "max"    # D

    .line 307
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setXAxisMax(DI)V

    .line 308
    return-void
.end method

.method public setXAxisMax(DI)V
    .locals 2
    .param p1, "max"    # D
    .param p3, "scale"    # I

    .line 423
    invoke-virtual {p0, p3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMaxXSet(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 424
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->initialRange:Ljava/util/Map;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [D

    const/4 v1, 0x1

    aput-wide p1, v0, v1

    .line 426
    :cond_0
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMaxX:[D

    aput-wide p1, v0, p3

    .line 427
    return-void
.end method

.method public setXAxisMin(D)V
    .locals 1
    .param p1, "min"    # D

    .line 280
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setXAxisMin(DI)V

    .line 281
    return-void
.end method

.method public setXAxisMin(DI)V
    .locals 2
    .param p1, "min"    # D
    .param p3, "scale"    # I

    .line 390
    invoke-virtual {p0, p3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMinXSet(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 391
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->initialRange:Ljava/util/Map;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [D

    const/4 v1, 0x0

    aput-wide p1, v0, v1

    .line 393
    :cond_0
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMinX:[D

    aput-wide p1, v0, p3

    .line 394
    return-void
.end method

.method public setXLabels(I)V
    .locals 0
    .param p1, "xLabels"    # I

    .line 520
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXLabels:I

    .line 521
    return-void
.end method

.method public setXLabelsAlign(Landroid/graphics/Paint$Align;)V
    .locals 0
    .param p1, "align"    # Landroid/graphics/Paint$Align;

    .line 1133
    iput-object p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->xLabelsAlign:Landroid/graphics/Paint$Align;

    .line 1134
    return-void
.end method

.method public setXLabelsAngle(F)V
    .locals 0
    .param p1, "angle"    # F

    .line 970
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXLabelsAngle:F

    .line 971
    return-void
.end method

.method public setXLabelsColor(I)V
    .locals 0
    .param p1, "color"    # I

    .line 1105
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXLabelsColor:I

    .line 1106
    return-void
.end method

.method public setXLabelsPadding(F)V
    .locals 0
    .param p1, "padding"    # F

    .line 1182
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXLabelsPadding:F

    .line 1183
    return-void
.end method

.method public setXRoundedLabels(Z)V
    .locals 0
    .param p1, "rounded"    # Z

    .line 603
    iput-boolean p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXRoundedLabels:Z

    .line 604
    return-void
.end method

.method public setXTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;

    .line 206
    iput-object p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXTitle:Ljava/lang/String;

    .line 207
    return-void
.end method

.method public setYAxisAlign(Landroid/graphics/Paint$Align;I)V
    .locals 1
    .param p1, "align"    # Landroid/graphics/Paint$Align;
    .param p2, "scale"    # I

    .line 1155
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->yAxisAlign:[Landroid/graphics/Paint$Align;

    aput-object p1, v0, p2

    .line 1156
    return-void
.end method

.method public setYAxisMax(D)V
    .locals 1
    .param p1, "max"    # D

    .line 361
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setYAxisMax(DI)V

    .line 362
    return-void
.end method

.method public setYAxisMax(DI)V
    .locals 2
    .param p1, "max"    # D
    .param p3, "scale"    # I

    .line 489
    invoke-virtual {p0, p3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMaxYSet(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 490
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->initialRange:Ljava/util/Map;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [D

    const/4 v1, 0x3

    aput-wide p1, v0, v1

    .line 492
    :cond_0
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMaxY:[D

    aput-wide p1, v0, p3

    .line 493
    return-void
.end method

.method public setYAxisMin(D)V
    .locals 1
    .param p1, "min"    # D

    .line 334
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setYAxisMin(DI)V

    .line 335
    return-void
.end method

.method public setYAxisMin(DI)V
    .locals 2
    .param p1, "min"    # D
    .param p3, "scale"    # I

    .line 456
    invoke-virtual {p0, p3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMinYSet(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 457
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->initialRange:Ljava/util/Map;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [D

    const/4 v1, 0x2

    aput-wide p1, v0, v1

    .line 459
    :cond_0
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMinY:[D

    aput-wide p1, v0, p3

    .line 460
    return-void
.end method

.method public setYLabels(I)V
    .locals 0
    .param p1, "yLabels"    # I

    .line 717
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabels:I

    .line 718
    return-void
.end method

.method public setYLabelsAlign(Landroid/graphics/Paint$Align;)V
    .locals 1
    .param p1, "align"    # Landroid/graphics/Paint$Align;

    .line 1147
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setYLabelsAlign(Landroid/graphics/Paint$Align;I)V

    .line 1148
    return-void
.end method

.method public setYLabelsAlign(Landroid/graphics/Paint$Align;I)V
    .locals 1
    .param p1, "align"    # Landroid/graphics/Paint$Align;
    .param p2, "scale"    # I

    .line 1164
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->yLabelsAlign:[Landroid/graphics/Paint$Align;

    aput-object p1, v0, p2

    .line 1165
    return-void
.end method

.method public setYLabelsAngle(F)V
    .locals 0
    .param p1, "angle"    # F

    .line 988
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelsAngle:F

    .line 989
    return-void
.end method

.method public setYLabelsColor(II)V
    .locals 1
    .param p1, "scale"    # I
    .param p2, "color"    # I

    .line 1115
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelsColor:[I

    aput p2, v0, p1

    .line 1116
    return-void
.end method

.method public setYLabelsPadding(F)V
    .locals 0
    .param p1, "padding"    # F

    .line 1218
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelsPadding:F

    .line 1219
    return-void
.end method

.method public setYLabelsVerticalPadding(F)V
    .locals 0
    .param p1, "padding"    # F

    .line 1200
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelsVerticalPadding:F

    .line 1201
    return-void
.end method

.method public setYTitle(Ljava/lang/String;)V
    .locals 1
    .param p1, "title"    # Ljava/lang/String;

    .line 234
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setYTitle(Ljava/lang/String;I)V

    .line 235
    return-void
.end method

.method public setYTitle(Ljava/lang/String;I)V
    .locals 1
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "scale"    # I

    .line 244
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYTitle:[Ljava/lang/String;

    aput-object p1, v0, p2

    .line 245
    return-void
.end method

.method public setZoomEnabled(ZZ)V
    .locals 0
    .param p1, "enabledX"    # Z
    .param p2, "enabledY"    # Z

    .line 845
    iput-boolean p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomXEnabled:Z

    .line 846
    iput-boolean p2, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomYEnabled:Z

    .line 847
    return-void
.end method

.method public setZoomInLimitX(D)V
    .locals 0
    .param p1, "zoomInLimitX"    # D

    .line 1261
    iput-wide p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomInLimitX:D

    .line 1262
    return-void
.end method

.method public setZoomInLimitY(D)V
    .locals 0
    .param p1, "zoomInLimitY"    # D

    .line 1286
    iput-wide p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomInLimitY:D

    .line 1287
    return-void
.end method

.method public setZoomLimits([D)V
    .locals 0
    .param p1, "zoomLimits"    # [D

    .line 952
    iput-object p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomLimits:[D

    .line 953
    return-void
.end method
