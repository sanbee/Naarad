.class public Lorg/achartengine/chart/BubbleChart;
.super Lorg/achartengine/chart/XYChart;
.source "BubbleChart.java"


# static fields
.field private static final MAX_BUBBLE_SIZE:I = 0x14

.field private static final MIN_BUBBLE_SIZE:I = 0x2

.field private static final SHAPE_WIDTH:I = 0xa

.field public static final TYPE:Ljava/lang/String; = "Bubble"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Lorg/achartengine/chart/XYChart;-><init>()V

    .line 45
    return-void
.end method

.method public constructor <init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V
    .locals 0
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    .line 54
    invoke-direct {p0, p1, p2}, Lorg/achartengine/chart/XYChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 55
    return-void
.end method

.method private drawCircle(Landroid/graphics/Canvas;Landroid/graphics/Paint;FFF)V
    .locals 0
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "paint"    # Landroid/graphics/Paint;
    .param p3, "x"    # F
    .param p4, "y"    # F
    .param p5, "radius"    # F

    .line 137
    invoke-virtual {p1, p3, p4, p5, p2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 138
    return-void
.end method


# virtual methods
.method protected clickableAreasForPoints(Ljava/util/List;Ljava/util/List;FII)[Lorg/achartengine/chart/ClickableArea;
    .locals 24
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

    .line 87
    .local p1, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .local p2, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v2

    .line 88
    .local v2, "length":I
    move-object/from16 v3, p0

    iget-object v4, v3, Lorg/achartengine/chart/BubbleChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    move/from16 v5, p4

    invoke-virtual {v4, v5}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesAt(I)Lorg/achartengine/model/XYSeries;

    move-result-object v4

    check-cast v4, Lorg/achartengine/model/XYValueSeries;

    .line 89
    .local v4, "series":Lorg/achartengine/model/XYValueSeries;
    invoke-virtual {v4}, Lorg/achartengine/model/XYValueSeries;->getMaxValue()D

    move-result-wide v6

    .line 90
    .local v6, "max":D
    const-wide/high16 v8, 0x4034000000000000L    # 20.0

    div-double/2addr v8, v6

    .line 91
    .local v8, "coef":D
    div-int/lit8 v10, v2, 0x2

    new-array v10, v10, [Lorg/achartengine/chart/ClickableArea;

    .line 92
    .local v10, "ret":[Lorg/achartengine/chart/ClickableArea;
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_0
    if-ge v11, v2, :cond_0

    .line 93
    div-int/lit8 v12, v11, 0x2

    add-int v12, p5, v12

    invoke-virtual {v4, v12}, Lorg/achartengine/model/XYValueSeries;->getValue(I)D

    move-result-wide v12

    mul-double v12, v12, v8

    const-wide/high16 v14, 0x4000000000000000L    # 2.0

    add-double/2addr v12, v14

    .line 94
    .local v12, "size":D
    div-int/lit8 v14, v11, 0x2

    new-instance v21, Lorg/achartengine/chart/ClickableArea;

    new-instance v15, Landroid/graphics/RectF;

    invoke-interface {v0, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/Float;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Float;->floatValue()F

    move-result v16

    move/from16 v22, v2

    .end local v2    # "length":I
    .local v22, "length":I
    double-to-float v2, v12

    sub-float v2, v16, v2

    add-int/lit8 v3, v11, 0x1

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    move-object/from16 v23, v4

    .end local v4    # "series":Lorg/achartengine/model/XYValueSeries;
    .local v23, "series":Lorg/achartengine/model/XYValueSeries;
    double-to-float v4, v12

    sub-float/2addr v3, v4

    invoke-interface {v0, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    double-to-float v5, v12

    add-float/2addr v4, v5

    add-int/lit8 v5, v11, 0x1

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    double-to-float v0, v12

    add-float/2addr v5, v0

    invoke-direct {v15, v2, v3, v4, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-interface {v1, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v17

    add-int/lit8 v0, v11, 0x1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v19

    move-object v0, v15

    move-object/from16 v15, v21

    move-object/from16 v16, v0

    invoke-direct/range {v15 .. v20}, Lorg/achartengine/chart/ClickableArea;-><init>(Landroid/graphics/RectF;DD)V

    aput-object v21, v10, v14

    .line 92
    .end local v12    # "size":D
    add-int/lit8 v11, v11, 0x2

    move-object/from16 v3, p0

    move-object/from16 v0, p1

    move/from16 v5, p4

    move/from16 v2, v22

    move-object/from16 v4, v23

    goto :goto_0

    .end local v22    # "length":I
    .end local v23    # "series":Lorg/achartengine/model/XYValueSeries;
    .restart local v2    # "length":I
    .restart local v4    # "series":Lorg/achartengine/model/XYValueSeries;
    :cond_0
    move/from16 v22, v2

    move-object/from16 v23, v4

    .line 98
    .end local v2    # "length":I
    .end local v4    # "series":Lorg/achartengine/model/XYValueSeries;
    .end local v11    # "i":I
    .restart local v22    # "length":I
    .restart local v23    # "series":Lorg/achartengine/model/XYValueSeries;
    return-object v10
.end method

.method public drawLegendShape(Landroid/graphics/Canvas;Lorg/achartengine/renderer/SimpleSeriesRenderer;FFILandroid/graphics/Paint;)V
    .locals 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "renderer"    # Lorg/achartengine/renderer/SimpleSeriesRenderer;
    .param p3, "x"    # F
    .param p4, "y"    # F
    .param p5, "seriesIndex"    # I
    .param p6, "paint"    # Landroid/graphics/Paint;

    .line 123
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p6, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 124
    const/high16 v0, 0x41200000    # 10.0f

    add-float v4, p3, v0

    const/high16 v6, 0x40400000    # 3.0f

    move-object v1, p0

    move-object v2, p1

    move-object v3, p6

    move v5, p4

    invoke-direct/range {v1 .. v6}, Lorg/achartengine/chart/BubbleChart;->drawCircle(Landroid/graphics/Canvas;Landroid/graphics/Paint;FFF)V

    .line 125
    return-void
.end method

.method public drawSeries(Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/SimpleSeriesRenderer;FII)V
    .locals 22
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

    .line 71
    .local p3, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    move-object/from16 v6, p2

    move-object/from16 v7, p3

    move-object/from16 v8, p4

    check-cast v8, Lorg/achartengine/renderer/XYSeriesRenderer;

    .line 72
    .local v8, "renderer":Lorg/achartengine/renderer/XYSeriesRenderer;
    invoke-virtual {v8}, Lorg/achartengine/renderer/XYSeriesRenderer;->getColor()I

    move-result v0

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 73
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 74
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v9

    .line 75
    .local v9, "length":I
    move-object/from16 v10, p0

    iget-object v0, v10, Lorg/achartengine/chart/BubbleChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    move/from16 v11, p6

    invoke-virtual {v0, v11}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesAt(I)Lorg/achartengine/model/XYSeries;

    move-result-object v0

    move-object v12, v0

    check-cast v12, Lorg/achartengine/model/XYValueSeries;

    .line 76
    .local v12, "series":Lorg/achartengine/model/XYValueSeries;
    invoke-virtual {v12}, Lorg/achartengine/model/XYValueSeries;->getMaxValue()D

    move-result-wide v13

    .line 77
    .local v13, "max":D
    const-wide/high16 v0, 0x4034000000000000L    # 20.0

    div-double v15, v0, v13

    .line 78
    .local v15, "coef":D
    const/4 v0, 0x0

    move v5, v0

    .local v5, "i":I
    :goto_0
    if-ge v5, v9, :cond_0

    .line 79
    div-int/lit8 v0, v5, 0x2

    add-int v0, p7, v0

    invoke-virtual {v12, v0}, Lorg/achartengine/model/XYValueSeries;->getValue(I)D

    move-result-wide v0

    mul-double v0, v0, v15

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    add-double v3, v0, v2

    .line 80
    .local v3, "size":D
    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v17

    add-int/lit8 v0, v5, 0x1

    invoke-interface {v7, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v18

    double-to-float v2, v3

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v19, v2

    move-object/from16 v2, p2

    move-wide/from16 v20, v3

    .end local v3    # "size":D
    .local v20, "size":D
    move/from16 v3, v17

    move/from16 v4, v18

    move/from16 v17, v5

    .end local v5    # "i":I
    .local v17, "i":I
    move/from16 v5, v19

    invoke-direct/range {v0 .. v5}, Lorg/achartengine/chart/BubbleChart;->drawCircle(Landroid/graphics/Canvas;Landroid/graphics/Paint;FFF)V

    .line 78
    .end local v20    # "size":D
    add-int/lit8 v5, v17, 0x2

    .end local v17    # "i":I
    .restart local v5    # "i":I
    goto :goto_0

    :cond_0
    move/from16 v17, v5

    .line 82
    .end local v5    # "i":I
    return-void
.end method

.method public getChartType()Ljava/lang/String;
    .locals 1

    .line 146
    const-string v0, "Bubble"

    return-object v0
.end method

.method public getLegendShapeWidth(I)I
    .locals 1
    .param p1, "seriesIndex"    # I

    .line 108
    const/16 v0, 0xa

    return v0
.end method
