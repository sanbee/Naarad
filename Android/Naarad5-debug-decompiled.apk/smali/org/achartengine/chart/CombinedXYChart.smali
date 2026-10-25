.class public Lorg/achartengine/chart/CombinedXYChart;
.super Lorg/achartengine/chart/XYChart;
.source "CombinedXYChart.java"


# instance fields
.field private mCharts:[Lorg/achartengine/chart/XYChart;

.field private xyChartTypes:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;[Ljava/lang/String;)V
    .locals 7
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .param p3, "types"    # [Ljava/lang/String;

    .line 49
    invoke-direct {p0, p1, p2}, Lorg/achartengine/chart/XYChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 36
    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Lorg/achartengine/chart/TimeChart;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-class v1, Lorg/achartengine/chart/LineChart;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-class v1, Lorg/achartengine/chart/CubicLineChart;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const-class v1, Lorg/achartengine/chart/BarChart;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    const-class v1, Lorg/achartengine/chart/BubbleChart;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    const-class v1, Lorg/achartengine/chart/ScatterChart;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    const-class v1, Lorg/achartengine/chart/RangeBarChart;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    const-class v1, Lorg/achartengine/chart/RangeStackedBarChart;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    iput-object v0, p0, Lorg/achartengine/chart/CombinedXYChart;->xyChartTypes:[Ljava/lang/Class;

    .line 50
    array-length v0, p3

    .line 51
    .local v0, "length":I
    new-array v1, v0, [Lorg/achartengine/chart/XYChart;

    iput-object v1, p0, Lorg/achartengine/chart/CombinedXYChart;->mCharts:[Lorg/achartengine/chart/XYChart;

    .line 52
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_5

    .line 54
    :try_start_0
    iget-object v2, p0, Lorg/achartengine/chart/CombinedXYChart;->mCharts:[Lorg/achartengine/chart/XYChart;

    aget-object v3, p3, v1

    invoke-direct {p0, v3}, Lorg/achartengine/chart/CombinedXYChart;->getXYChart(Ljava/lang/String;)Lorg/achartengine/chart/XYChart;

    move-result-object v3

    aput-object v3, v2, v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    goto :goto_1

    .line 55
    :catch_0
    move-exception v2

    .line 58
    :goto_1
    iget-object v2, p0, Lorg/achartengine/chart/CombinedXYChart;->mCharts:[Lorg/achartengine/chart/XYChart;

    aget-object v2, v2, v1

    if-eqz v2, :cond_4

    .line 61
    new-instance v2, Lorg/achartengine/model/XYMultipleSeriesDataset;

    invoke-direct {v2}, Lorg/achartengine/model/XYMultipleSeriesDataset;-><init>()V

    .line 62
    .local v2, "newDataset":Lorg/achartengine/model/XYMultipleSeriesDataset;
    invoke-virtual {p1, v1}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesAt(I)Lorg/achartengine/model/XYSeries;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/achartengine/model/XYMultipleSeriesDataset;->addSeries(Lorg/achartengine/model/XYSeries;)V

    .line 63
    new-instance v3, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-direct {v3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;-><init>()V

    .line 65
    .local v3, "newRenderer":Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    invoke-virtual {p2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getBarSpacing()D

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setBarSpacing(D)V

    .line 66
    invoke-virtual {p2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getPointSize()F

    move-result v4

    invoke-virtual {v3, v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setPointSize(F)V

    .line 67
    invoke-virtual {p1, v1}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesAt(I)Lorg/achartengine/model/XYSeries;

    move-result-object v4

    invoke-virtual {v4}, Lorg/achartengine/model/XYSeries;->getScaleNumber()I

    move-result v4

    .line 68
    .local v4, "scale":I
    invoke-virtual {p2, v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMinXSet(I)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 69
    invoke-virtual {p2, v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXAxisMin(I)D

    move-result-wide v5

    invoke-virtual {v3, v5, v6}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setXAxisMin(D)V

    .line 71
    :cond_0
    invoke-virtual {p2, v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMaxXSet(I)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 72
    invoke-virtual {p2, v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXAxisMax(I)D

    move-result-wide v5

    invoke-virtual {v3, v5, v6}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setXAxisMax(D)V

    .line 74
    :cond_1
    invoke-virtual {p2, v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMinYSet(I)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 75
    invoke-virtual {p2, v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisMin(I)D

    move-result-wide v5

    invoke-virtual {v3, v5, v6}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setYAxisMin(D)V

    .line 77
    :cond_2
    invoke-virtual {p2, v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMaxYSet(I)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 78
    invoke-virtual {p2, v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisMax(I)D

    move-result-wide v5

    invoke-virtual {v3, v5, v6}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setYAxisMax(D)V

    .line 80
    :cond_3
    invoke-virtual {p2, v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getSeriesRendererAt(I)Lorg/achartengine/renderer/SimpleSeriesRenderer;

    move-result-object v5

    invoke-virtual {v3, v5}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->addSeriesRenderer(Lorg/achartengine/renderer/SimpleSeriesRenderer;)V

    .line 81
    iget-object v5, p0, Lorg/achartengine/chart/CombinedXYChart;->mCharts:[Lorg/achartengine/chart/XYChart;

    aget-object v5, v5, v1

    invoke-virtual {v5, v2, v3}, Lorg/achartengine/chart/XYChart;->setDatasetRenderer(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 52
    .end local v2    # "newDataset":Lorg/achartengine/model/XYMultipleSeriesDataset;
    .end local v3    # "newRenderer":Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .end local v4    # "scale":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 59
    :cond_4
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown chart type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v4, p3, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 84
    .end local v1    # "i":I
    :cond_5
    return-void
.end method

.method private getXYChart(Ljava/lang/String;)Lorg/achartengine/chart/XYChart;
    .locals 5
    .param p1, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .line 95
    const/4 v0, 0x0

    .line 96
    .local v0, "chart":Lorg/achartengine/chart/XYChart;
    iget-object v1, p0, Lorg/achartengine/chart/CombinedXYChart;->xyChartTypes:[Ljava/lang/Class;

    array-length v1, v1

    .line 97
    .local v1, "length":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_1

    if-nez v0, :cond_1

    .line 98
    iget-object v3, p0, Lorg/achartengine/chart/CombinedXYChart;->xyChartTypes:[Ljava/lang/Class;

    aget-object v3, v3, v2

    invoke-virtual {v3}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/achartengine/chart/XYChart;

    .line 99
    .local v3, "newChart":Lorg/achartengine/chart/XYChart;
    invoke-virtual {v3}, Lorg/achartengine/chart/XYChart;->getChartType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 100
    move-object v0, v3

    .line 97
    .end local v3    # "newChart":Lorg/achartengine/chart/XYChart;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 103
    .end local v2    # "i":I
    :cond_1
    return-object v0
.end method


# virtual methods
.method protected clickableAreasForPoints(Ljava/util/List;Ljava/util/List;FII)[Lorg/achartengine/chart/ClickableArea;
    .locals 7
    .param p3, "yAxisValue"    # F
    .param p4, "seriesIndex"    # I
    .param p5, "startIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;FII)[",
            "Lorg/achartengine/chart/ClickableArea;"
        }
    .end annotation

    .line 130
    .local p1, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .local p2, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    iget-object v0, p0, Lorg/achartengine/chart/CombinedXYChart;->mCharts:[Lorg/achartengine/chart/XYChart;

    aget-object v1, v0, p4

    const/4 v5, 0x0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v6, p5

    invoke-virtual/range {v1 .. v6}, Lorg/achartengine/chart/XYChart;->clickableAreasForPoints(Ljava/util/List;Ljava/util/List;FII)[Lorg/achartengine/chart/ClickableArea;

    move-result-object v0

    return-object v0
.end method

.method public drawLegendShape(Landroid/graphics/Canvas;Lorg/achartengine/renderer/SimpleSeriesRenderer;FFILandroid/graphics/Paint;)V
    .locals 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "renderer"    # Lorg/achartengine/renderer/SimpleSeriesRenderer;
    .param p3, "x"    # F
    .param p4, "y"    # F
    .param p5, "seriesIndex"    # I
    .param p6, "paint"    # Landroid/graphics/Paint;

    .line 166
    iget-object v0, p0, Lorg/achartengine/chart/CombinedXYChart;->mCharts:[Lorg/achartengine/chart/XYChart;

    aget-object v1, v0, p5

    const/4 v6, 0x0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    move-object v7, p6

    invoke-virtual/range {v1 .. v7}, Lorg/achartengine/chart/XYChart;->drawLegendShape(Landroid/graphics/Canvas;Lorg/achartengine/renderer/SimpleSeriesRenderer;FFILandroid/graphics/Paint;)V

    .line 167
    return-void
.end method

.method public drawSeries(Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/SimpleSeriesRenderer;FII)V
    .locals 11
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "paint"    # Landroid/graphics/Paint;
    .param p4, "seriesRenderer"    # Lorg/achartengine/renderer/SimpleSeriesRenderer;
    .param p5, "yAxisValue"    # F
    .param p6, "seriesIndex"    # I
    .param p7, "startIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Canvas;",
            "Landroid/graphics/Paint;",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;",
            "Lorg/achartengine/renderer/SimpleSeriesRenderer;",
            "FII)V"
        }
    .end annotation

    .line 120
    .local p3, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    move-object v0, p0

    move/from16 v1, p6

    iget-object v2, v0, Lorg/achartengine/chart/CombinedXYChart;->mCharts:[Lorg/achartengine/chart/XYChart;

    aget-object v2, v2, v1

    invoke-virtual {p0}, Lorg/achartengine/chart/CombinedXYChart;->getScreenR()Landroid/graphics/Rect;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/achartengine/chart/XYChart;->setScreenR(Landroid/graphics/Rect;)V

    .line 121
    iget-object v2, v0, Lorg/achartengine/chart/CombinedXYChart;->mCharts:[Lorg/achartengine/chart/XYChart;

    aget-object v2, v2, v1

    iget-object v3, v0, Lorg/achartengine/chart/CombinedXYChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    invoke-virtual {v3, v1}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesAt(I)Lorg/achartengine/model/XYSeries;

    move-result-object v3

    invoke-virtual {v3}, Lorg/achartengine/model/XYSeries;->getScaleNumber()I

    move-result v3

    invoke-virtual {p0, v3}, Lorg/achartengine/chart/CombinedXYChart;->getCalcRange(I)[D

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lorg/achartengine/chart/XYChart;->setCalcRange([DI)V

    .line 123
    iget-object v2, v0, Lorg/achartengine/chart/CombinedXYChart;->mCharts:[Lorg/achartengine/chart/XYChart;

    aget-object v3, v2, v1

    const/4 v9, 0x0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    move-object v7, p4

    move/from16 v8, p5

    move/from16 v10, p7

    invoke-virtual/range {v3 .. v10}, Lorg/achartengine/chart/XYChart;->drawSeries(Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/SimpleSeriesRenderer;FII)V

    .line 125
    return-void
.end method

.method protected drawSeries(Lorg/achartengine/model/XYSeries;Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/SimpleSeriesRenderer;FILorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;I)V
    .locals 13
    .param p1, "series"    # Lorg/achartengine/model/XYSeries;
    .param p2, "canvas"    # Landroid/graphics/Canvas;
    .param p3, "paint"    # Landroid/graphics/Paint;
    .param p5, "seriesRenderer"    # Lorg/achartengine/renderer/SimpleSeriesRenderer;
    .param p6, "yAxisValue"    # F
    .param p7, "seriesIndex"    # I
    .param p8, "or"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .param p9, "startIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/achartengine/model/XYSeries;",
            "Landroid/graphics/Canvas;",
            "Landroid/graphics/Paint;",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;",
            "Lorg/achartengine/renderer/SimpleSeriesRenderer;",
            "FI",
            "Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;",
            "I)V"
        }
    .end annotation

    .line 137
    .local p4, "pointsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    move-object v0, p0

    move/from16 v1, p7

    iget-object v2, v0, Lorg/achartengine/chart/CombinedXYChart;->mCharts:[Lorg/achartengine/chart/XYChart;

    aget-object v2, v2, v1

    invoke-virtual {p0}, Lorg/achartengine/chart/CombinedXYChart;->getScreenR()Landroid/graphics/Rect;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/achartengine/chart/XYChart;->setScreenR(Landroid/graphics/Rect;)V

    .line 138
    iget-object v2, v0, Lorg/achartengine/chart/CombinedXYChart;->mCharts:[Lorg/achartengine/chart/XYChart;

    aget-object v2, v2, v1

    iget-object v3, v0, Lorg/achartengine/chart/CombinedXYChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    invoke-virtual {v3, v1}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesAt(I)Lorg/achartengine/model/XYSeries;

    move-result-object v3

    invoke-virtual {v3}, Lorg/achartengine/model/XYSeries;->getScaleNumber()I

    move-result v3

    invoke-virtual {p0, v3}, Lorg/achartengine/chart/CombinedXYChart;->getCalcRange(I)[D

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lorg/achartengine/chart/XYChart;->setCalcRange([DI)V

    .line 140
    iget-object v2, v0, Lorg/achartengine/chart/CombinedXYChart;->mCharts:[Lorg/achartengine/chart/XYChart;

    aget-object v3, v2, v1

    const/4 v10, 0x0

    move-object v4, p1

    move-object v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    move/from16 v9, p6

    move-object/from16 v11, p8

    move/from16 v12, p9

    invoke-virtual/range {v3 .. v12}, Lorg/achartengine/chart/XYChart;->drawSeries(Lorg/achartengine/model/XYSeries;Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/SimpleSeriesRenderer;FILorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;I)V

    .line 142
    return-void
.end method

.method public getChartType()Ljava/lang/String;
    .locals 1

    .line 175
    const-string v0, "Combined"

    return-object v0
.end method

.method public getLegendShapeWidth(I)I
    .locals 2
    .param p1, "seriesIndex"    # I

    .line 151
    iget-object v0, p0, Lorg/achartengine/chart/CombinedXYChart;->mCharts:[Lorg/achartengine/chart/XYChart;

    aget-object v0, v0, p1

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/achartengine/chart/XYChart;->getLegendShapeWidth(I)I

    move-result v0

    return v0
.end method
