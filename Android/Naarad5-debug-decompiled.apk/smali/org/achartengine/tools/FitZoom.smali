.class public Lorg/achartengine/tools/FitZoom;
.super Lorg/achartengine/tools/AbstractTool;
.source "FitZoom.java"


# direct methods
.method public constructor <init>(Lorg/achartengine/chart/AbstractChart;)V
    .locals 0
    .param p1, "chart"    # Lorg/achartengine/chart/AbstractChart;

    .line 32
    invoke-direct {p0, p1}, Lorg/achartengine/tools/AbstractTool;-><init>(Lorg/achartengine/chart/AbstractChart;)V

    .line 33
    return-void
.end method


# virtual methods
.method public apply()V
    .locals 20

    .line 39
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/tools/FitZoom;->mChart:Lorg/achartengine/chart/AbstractChart;

    instance-of v1, v1, Lorg/achartengine/chart/XYChart;

    if-eqz v1, :cond_7

    .line 40
    iget-object v1, v0, Lorg/achartengine/tools/FitZoom;->mChart:Lorg/achartengine/chart/AbstractChart;

    check-cast v1, Lorg/achartengine/chart/XYChart;

    invoke-virtual {v1}, Lorg/achartengine/chart/XYChart;->getDataset()Lorg/achartengine/model/XYMultipleSeriesDataset;

    move-result-object v1

    if-nez v1, :cond_0

    .line 41
    return-void

    .line 43
    :cond_0
    iget-object v1, v0, Lorg/achartengine/tools/FitZoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getScalesCount()I

    move-result v1

    .line 44
    .local v1, "scales":I
    iget-object v2, v0, Lorg/achartengine/tools/FitZoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isInitialRangeSet()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 45
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_2

    .line 46
    iget-object v3, v0, Lorg/achartengine/tools/FitZoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v3, v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isInitialRangeSet(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 47
    iget-object v3, v0, Lorg/achartengine/tools/FitZoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    iget-object v4, v0, Lorg/achartengine/tools/FitZoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4, v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getInitialRange(I)[D

    move-result-object v4

    invoke-virtual {v3, v4, v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setRange([DI)V

    .line 45
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v2    # "i":I
    :cond_2
    goto/16 :goto_3

    .line 51
    :cond_3
    iget-object v2, v0, Lorg/achartengine/tools/FitZoom;->mChart:Lorg/achartengine/chart/AbstractChart;

    check-cast v2, Lorg/achartengine/chart/XYChart;

    invoke-virtual {v2}, Lorg/achartengine/chart/XYChart;->getDataset()Lorg/achartengine/model/XYMultipleSeriesDataset;

    move-result-object v2

    invoke-virtual {v2}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeries()[Lorg/achartengine/model/XYSeries;

    move-result-object v2

    .line 52
    .local v2, "series":[Lorg/achartengine/model/XYSeries;
    const/4 v3, 0x0

    .line 53
    .local v3, "range":[D
    array-length v4, v2

    .line 54
    .local v4, "length":I
    if-lez v4, :cond_6

    .line 55
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    if-ge v5, v1, :cond_6

    .line 56
    const/4 v6, 0x4

    new-array v7, v6, [D

    fill-array-data v7, :array_0

    move-object v3, v7

    .line 58
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_2
    const/4 v8, 0x2

    const/4 v9, 0x3

    const/4 v10, 0x0

    const/4 v11, 0x1

    if-ge v7, v4, :cond_5

    .line 59
    aget-object v12, v2, v7

    invoke-virtual {v12}, Lorg/achartengine/model/XYSeries;->getScaleNumber()I

    move-result v12

    if-ne v5, v12, :cond_4

    .line 60
    aget-wide v12, v3, v10

    aget-object v14, v2, v7

    invoke-virtual {v14}, Lorg/achartengine/model/XYSeries;->getMinX()D

    move-result-wide v14

    invoke-static {v12, v13, v14, v15}, Ljava/lang/Math;->min(DD)D

    move-result-wide v12

    aput-wide v12, v3, v10

    .line 61
    aget-wide v12, v3, v11

    aget-object v10, v2, v7

    invoke-virtual {v10}, Lorg/achartengine/model/XYSeries;->getMaxX()D

    move-result-wide v14

    invoke-static {v12, v13, v14, v15}, Ljava/lang/Math;->max(DD)D

    move-result-wide v12

    aput-wide v12, v3, v11

    .line 62
    aget-wide v10, v3, v8

    aget-object v12, v2, v7

    invoke-virtual {v12}, Lorg/achartengine/model/XYSeries;->getMinY()D

    move-result-wide v12

    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->min(DD)D

    move-result-wide v10

    aput-wide v10, v3, v8

    .line 63
    aget-wide v10, v3, v9

    aget-object v8, v2, v7

    invoke-virtual {v8}, Lorg/achartengine/model/XYSeries;->getMaxY()D

    move-result-wide v12

    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->max(DD)D

    move-result-wide v10

    aput-wide v10, v3, v9

    .line 58
    :cond_4
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 66
    .end local v7    # "j":I
    :cond_5
    aget-wide v12, v3, v11

    aget-wide v14, v3, v10

    sub-double/2addr v12, v14

    invoke-static {v12, v13}, Ljava/lang/Math;->abs(D)D

    move-result-wide v12

    const-wide/high16 v14, 0x4044000000000000L    # 40.0

    div-double/2addr v12, v14

    .line 67
    .local v12, "marginX":D
    aget-wide v16, v3, v9

    aget-wide v18, v3, v8

    sub-double v16, v16, v18

    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->abs(D)D

    move-result-wide v16

    div-double v16, v16, v14

    .line 68
    .local v16, "marginY":D
    iget-object v7, v0, Lorg/achartengine/tools/FitZoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    new-array v6, v6, [D

    aget-wide v14, v3, v10

    sub-double/2addr v14, v12

    aput-wide v14, v6, v10

    aget-wide v14, v3, v11

    add-double/2addr v14, v12

    aput-wide v14, v6, v11

    aget-wide v10, v3, v8

    sub-double v10, v10, v16

    aput-wide v10, v6, v8

    aget-wide v10, v3, v9

    add-double v10, v10, v16

    aput-wide v10, v6, v9

    invoke-virtual {v7, v6, v5}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setRange([DI)V

    .line 55
    .end local v12    # "marginX":D
    .end local v16    # "marginY":D
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_1

    .line 73
    .end local v1    # "scales":I
    .end local v2    # "series":[Lorg/achartengine/model/XYSeries;
    .end local v3    # "range":[D
    .end local v4    # "length":I
    .end local v5    # "i":I
    :cond_6
    :goto_3
    goto :goto_4

    .line 74
    :cond_7
    iget-object v1, v0, Lorg/achartengine/tools/FitZoom;->mChart:Lorg/achartengine/chart/AbstractChart;

    check-cast v1, Lorg/achartengine/chart/RoundChart;

    invoke-virtual {v1}, Lorg/achartengine/chart/RoundChart;->getRenderer()Lorg/achartengine/renderer/DefaultRenderer;

    move-result-object v1

    .line 75
    .local v1, "renderer":Lorg/achartengine/renderer/DefaultRenderer;
    invoke-virtual {v1}, Lorg/achartengine/renderer/DefaultRenderer;->getOriginalScale()F

    move-result v2

    invoke-virtual {v1, v2}, Lorg/achartengine/renderer/DefaultRenderer;->setScale(F)V

    .line 77
    .end local v1    # "renderer":Lorg/achartengine/renderer/DefaultRenderer;
    :goto_4
    return-void

    :array_0
    .array-data 8
        0x7fefffffffffffffL    # Double.MAX_VALUE
        -0x10000000000001L
        0x7fefffffffffffffL    # Double.MAX_VALUE
        -0x10000000000001L
    .end array-data
.end method
