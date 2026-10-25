.class public Lorg/achartengine/chart/ScatterChart;
.super Lorg/achartengine/chart/XYChart;
.source "ScatterChart.java"


# static fields
.field private static final SHAPE_WIDTH:I = 0xa

.field private static final SIZE:F = 3.0f

.field public static final TYPE:Ljava/lang/String; = "Scatter"


# instance fields
.field private size:F


# direct methods
.method constructor <init>()V
    .locals 1

    .line 43
    invoke-direct {p0}, Lorg/achartengine/chart/XYChart;-><init>()V

    .line 41
    const/high16 v0, 0x40400000    # 3.0f

    iput v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    .line 44
    return-void
.end method

.method public constructor <init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V
    .locals 1
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    .line 53
    invoke-direct {p0, p1, p2}, Lorg/achartengine/chart/XYChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 41
    const/high16 v0, 0x40400000    # 3.0f

    iput v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    .line 54
    invoke-virtual {p2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getPointSize()F

    move-result v0

    iput v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    .line 55
    return-void
.end method

.method private drawCircle(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V
    .locals 1
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "paint"    # Landroid/graphics/Paint;
    .param p3, "x"    # F
    .param p4, "y"    # F

    .line 211
    iget v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    invoke-virtual {p1, p3, p4, v0, p2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 212
    return-void
.end method

.method private drawDiamond(Landroid/graphics/Canvas;Landroid/graphics/Paint;[FFF)V
    .locals 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "paint"    # Landroid/graphics/Paint;
    .param p3, "path"    # [F
    .param p4, "x"    # F
    .param p5, "y"    # F

    .line 255
    const/4 v0, 0x0

    aput p4, p3, v0

    .line 256
    iget v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    sub-float v1, p5, v0

    const/4 v2, 0x1

    aput v1, p3, v2

    .line 257
    sub-float v1, p4, v0

    const/4 v3, 0x2

    aput v1, p3, v3

    .line 258
    const/4 v1, 0x3

    aput p5, p3, v1

    .line 259
    const/4 v1, 0x4

    aput p4, p3, v1

    .line 260
    add-float v1, p5, v0

    const/4 v3, 0x5

    aput v1, p3, v3

    .line 261
    add-float/2addr v0, p4

    const/4 v1, 0x6

    aput v0, p3, v1

    .line 262
    const/4 v0, 0x7

    aput p5, p3, v0

    .line 263
    invoke-virtual {p0, p1, p3, p2, v2}, Lorg/achartengine/chart/ScatterChart;->drawPath(Landroid/graphics/Canvas;[FLandroid/graphics/Paint;Z)V

    .line 264
    return-void
.end method

.method private drawSquare(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V
    .locals 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "paint"    # Landroid/graphics/Paint;
    .param p3, "x"    # F
    .param p4, "y"    # F

    .line 242
    iget v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    sub-float v2, p3, v0

    sub-float v3, p4, v0

    add-float v4, p3, v0

    add-float v5, p4, v0

    move-object v1, p1

    move-object v6, p2

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 243
    return-void
.end method

.method private drawTriangle(Landroid/graphics/Canvas;Landroid/graphics/Paint;[FFF)V
    .locals 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "paint"    # Landroid/graphics/Paint;
    .param p3, "path"    # [F
    .param p4, "x"    # F
    .param p5, "y"    # F

    .line 224
    const/4 v0, 0x0

    aput p4, p3, v0

    .line 225
    iget v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    sub-float v1, p5, v0

    const/high16 v2, 0x40000000    # 2.0f

    div-float v2, v0, v2

    sub-float/2addr v1, v2

    const/4 v2, 0x1

    aput v1, p3, v2

    .line 226
    sub-float v1, p4, v0

    const/4 v3, 0x2

    aput v1, p3, v3

    .line 227
    add-float v1, p5, v0

    const/4 v3, 0x3

    aput v1, p3, v3

    .line 228
    add-float/2addr v0, p4

    const/4 v1, 0x4

    aput v0, p3, v1

    .line 229
    aget v0, p3, v3

    const/4 v1, 0x5

    aput v0, p3, v1

    .line 230
    invoke-virtual {p0, p1, p3, p2, v2}, Lorg/achartengine/chart/ScatterChart;->drawPath(Landroid/graphics/Canvas;[FLandroid/graphics/Paint;Z)V

    .line 231
    return-void
.end method

.method private drawX(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V
    .locals 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "paint"    # Landroid/graphics/Paint;
    .param p3, "x"    # F
    .param p4, "y"    # F

    .line 198
    iget v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    sub-float v2, p3, v0

    sub-float v3, p4, v0

    add-float v4, p3, v0

    add-float v5, p4, v0

    move-object v1, p1

    move-object v6, p2

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 199
    iget v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    add-float v2, p3, v0

    sub-float v3, p4, v0

    sub-float v4, p3, v0

    add-float v5, p4, v0

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 200
    return-void
.end method


# virtual methods
.method protected clickableAreasForPoints(Ljava/util/List;Ljava/util/List;FII)[Lorg/achartengine/chart/ClickableArea;
    .locals 15
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

    .line 129
    .local p1, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .local p2, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v2

    .line 130
    .local v2, "length":I
    div-int/lit8 v3, v2, 0x2

    new-array v3, v3, [Lorg/achartengine/chart/ClickableArea;

    .line 131
    .local v3, "ret":[Lorg/achartengine/chart/ClickableArea;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v2, :cond_0

    .line 132
    move-object v5, p0

    iget-object v6, v5, Lorg/achartengine/chart/ScatterChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v6}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getSelectableBuffer()I

    move-result v6

    .line 133
    .local v6, "selectableBuffer":I
    div-int/lit8 v7, v4, 0x2

    new-instance v14, Lorg/achartengine/chart/ClickableArea;

    new-instance v9, Landroid/graphics/RectF;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Float;

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v8

    int-to-float v10, v6

    sub-float/2addr v8, v10

    add-int/lit8 v10, v4, 0x1

    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Float;

    invoke-virtual {v10}, Ljava/lang/Float;->floatValue()F

    move-result v10

    int-to-float v11, v6

    sub-float/2addr v10, v11

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Float;

    invoke-virtual {v11}, Ljava/lang/Float;->floatValue()F

    move-result v11

    int-to-float v12, v6

    add-float/2addr v11, v12

    add-int/lit8 v12, v4, 0x1

    invoke-interface {v0, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Float;

    invoke-virtual {v12}, Ljava/lang/Float;->floatValue()F

    move-result v12

    int-to-float v13, v6

    add-float/2addr v12, v13

    invoke-direct {v9, v8, v10, v11, v12}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Double;

    invoke-virtual {v8}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v10

    add-int/lit8 v8, v4, 0x1

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Double;

    invoke-virtual {v8}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v12

    move-object v8, v14

    invoke-direct/range {v8 .. v13}, Lorg/achartengine/chart/ClickableArea;-><init>(Landroid/graphics/RectF;DD)V

    aput-object v14, v3, v7

    .line 131
    .end local v6    # "selectableBuffer":I
    add-int/lit8 v4, v4, 0x2

    goto :goto_0

    :cond_0
    move-object v5, p0

    .line 137
    .end local v4    # "i":I
    return-object v3
.end method

.method public drawLegendShape(Landroid/graphics/Canvas;Lorg/achartengine/renderer/SimpleSeriesRenderer;FFILandroid/graphics/Paint;)V
    .locals 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "renderer"    # Lorg/achartengine/renderer/SimpleSeriesRenderer;
    .param p3, "x"    # F
    .param p4, "y"    # F
    .param p5, "seriesIndex"    # I
    .param p6, "paint"    # Landroid/graphics/Paint;

    .line 162
    move-object v0, p2

    check-cast v0, Lorg/achartengine/renderer/XYSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYSeriesRenderer;->isFillPoints()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 163
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p6, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    goto :goto_0

    .line 165
    :cond_0
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p6, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 167
    :goto_0
    sget-object v0, Lorg/achartengine/chart/ScatterChart$1;->$SwitchMap$org$achartengine$chart$PointStyle:[I

    move-object v1, p2

    check-cast v1, Lorg/achartengine/renderer/XYSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYSeriesRenderer;->getPointStyle()Lorg/achartengine/chart/PointStyle;

    move-result-object v1

    invoke-virtual {v1}, Lorg/achartengine/chart/PointStyle;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/high16 v1, 0x41200000    # 10.0f

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    .line 184
    :pswitch_0
    add-float/2addr v1, p3

    invoke-virtual {p1, v1, p4, p6}, Landroid/graphics/Canvas;->drawPoint(FFLandroid/graphics/Paint;)V

    goto :goto_1

    .line 181
    :pswitch_1
    const/16 v0, 0x8

    new-array v5, v0, [F

    add-float v6, p3, v1

    move-object v2, p0

    move-object v3, p1

    move-object v4, p6

    move v7, p4

    invoke-direct/range {v2 .. v7}, Lorg/achartengine/chart/ScatterChart;->drawDiamond(Landroid/graphics/Canvas;Landroid/graphics/Paint;[FFF)V

    .line 182
    goto :goto_1

    .line 178
    :pswitch_2
    add-float/2addr v1, p3

    invoke-direct {p0, p1, p6, v1, p4}, Lorg/achartengine/chart/ScatterChart;->drawSquare(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    .line 179
    goto :goto_1

    .line 175
    :pswitch_3
    const/4 v0, 0x6

    new-array v5, v0, [F

    add-float v6, p3, v1

    move-object v2, p0

    move-object v3, p1

    move-object v4, p6

    move v7, p4

    invoke-direct/range {v2 .. v7}, Lorg/achartengine/chart/ScatterChart;->drawTriangle(Landroid/graphics/Canvas;Landroid/graphics/Paint;[FFF)V

    .line 176
    goto :goto_1

    .line 172
    :pswitch_4
    add-float/2addr v1, p3

    invoke-direct {p0, p1, p6, v1, p4}, Lorg/achartengine/chart/ScatterChart;->drawCircle(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    .line 173
    goto :goto_1

    .line 169
    :pswitch_5
    add-float/2addr v1, p3

    invoke-direct {p0, p1, p6, v1, p4}, Lorg/achartengine/chart/ScatterChart;->drawX(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    .line 170
    nop

    .line 187
    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public drawSeries(Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/SimpleSeriesRenderer;FII)V
    .locals 15
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

    .line 78
    .local p3, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    move-object v6, p0

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    move-object/from16 v9, p3

    move-object/from16 v10, p4

    check-cast v10, Lorg/achartengine/renderer/XYSeriesRenderer;

    .line 79
    .local v10, "renderer":Lorg/achartengine/renderer/XYSeriesRenderer;
    invoke-virtual {v10}, Lorg/achartengine/renderer/XYSeriesRenderer;->getColor()I

    move-result v0

    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 80
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v11

    .line 81
    .local v11, "stroke":F
    invoke-virtual {v10}, Lorg/achartengine/renderer/XYSeriesRenderer;->isFillPoints()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 82
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    goto :goto_0

    .line 84
    :cond_0
    invoke-virtual {v10}, Lorg/achartengine/renderer/XYSeriesRenderer;->getPointStrokeWidth()F

    move-result v0

    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 85
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 87
    :goto_0
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v12

    .line 88
    .local v12, "length":I
    sget-object v0, Lorg/achartengine/chart/ScatterChart$1;->$SwitchMap$org$achartengine$chart$PointStyle:[I

    invoke-virtual {v10}, Lorg/achartengine/renderer/XYSeriesRenderer;->getPointStyle()Lorg/achartengine/chart/PointStyle;

    move-result-object v1

    invoke-virtual {v1}, Lorg/achartengine/chart/PointStyle;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_7

    :pswitch_0
    move-object v0, v1

    .line 118
    .local v0, "path":[F
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v12, :cond_6

    .line 119
    invoke-interface {v9, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    add-int/lit8 v3, v1, 0x1

    invoke-interface {v9, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v7, v2, v3, v8}, Landroid/graphics/Canvas;->drawPoint(FFLandroid/graphics/Paint;)V

    .line 118
    add-int/lit8 v1, v1, 0x2

    goto :goto_1

    .line 88
    .end local v0    # "path":[F
    .end local v1    # "i":I
    :pswitch_1
    move-object v0, v1

    .line 112
    .restart local v0    # "path":[F
    const/16 v1, 0x8

    new-array v13, v1, [F

    .line 113
    .end local v0    # "path":[F
    .local v13, "path":[F
    const/4 v0, 0x0

    move v14, v0

    .local v14, "i":I
    :goto_2
    if-ge v14, v12, :cond_1

    .line 114
    invoke-interface {v9, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v4

    add-int/lit8 v0, v14, 0x1

    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v5

    move-object v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v3, v13

    invoke-direct/range {v0 .. v5}, Lorg/achartengine/chart/ScatterChart;->drawDiamond(Landroid/graphics/Canvas;Landroid/graphics/Paint;[FFF)V

    .line 113
    add-int/lit8 v14, v14, 0x2

    goto :goto_2

    .line 116
    .end local v14    # "i":I
    :cond_1
    goto/16 :goto_7

    .line 88
    .end local v13    # "path":[F
    :pswitch_2
    move-object v0, v1

    .line 107
    .restart local v0    # "path":[F
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_3
    if-ge v1, v12, :cond_2

    .line 108
    invoke-interface {v9, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    add-int/lit8 v3, v1, 0x1

    invoke-interface {v9, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-direct {p0, v7, v8, v2, v3}, Lorg/achartengine/chart/ScatterChart;->drawSquare(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    .line 107
    add-int/lit8 v1, v1, 0x2

    goto :goto_3

    .line 110
    .end local v1    # "i":I
    :cond_2
    goto/16 :goto_7

    .line 101
    .end local v0    # "path":[F
    :pswitch_3
    const/4 v0, 0x6

    new-array v13, v0, [F

    .line 102
    .restart local v13    # "path":[F
    const/4 v0, 0x0

    move v14, v0

    .restart local v14    # "i":I
    :goto_4
    if-ge v14, v12, :cond_3

    .line 103
    invoke-interface {v9, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v4

    add-int/lit8 v0, v14, 0x1

    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v5

    move-object v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v3, v13

    invoke-direct/range {v0 .. v5}, Lorg/achartengine/chart/ScatterChart;->drawTriangle(Landroid/graphics/Canvas;Landroid/graphics/Paint;[FFF)V

    .line 102
    add-int/lit8 v14, v14, 0x2

    goto :goto_4

    .line 105
    .end local v14    # "i":I
    :cond_3
    goto :goto_7

    .line 96
    .end local v13    # "path":[F
    :pswitch_4
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    if-ge v0, v12, :cond_4

    .line 97
    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    add-int/lit8 v2, v0, 0x1

    invoke-interface {v9, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-direct {p0, v7, v8, v1, v2}, Lorg/achartengine/chart/ScatterChart;->drawCircle(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    .line 96
    add-int/lit8 v0, v0, 0x2

    goto :goto_5

    .line 99
    .end local v0    # "i":I
    :cond_4
    goto :goto_7

    .line 90
    :pswitch_5
    invoke-virtual {v10}, Lorg/achartengine/renderer/XYSeriesRenderer;->getPointStrokeWidth()F

    move-result v0

    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 91
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_6
    if-ge v0, v12, :cond_5

    .line 92
    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    add-int/lit8 v2, v0, 0x1

    invoke-interface {v9, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-direct {p0, v7, v8, v1, v2}, Lorg/achartengine/chart/ScatterChart;->drawX(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    .line 91
    add-int/lit8 v0, v0, 0x2

    goto :goto_6

    .line 94
    .end local v0    # "i":I
    :cond_5
    nop

    .line 123
    :cond_6
    :goto_7
    invoke-virtual {v8, v11}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 124
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getChartType()Ljava/lang/String;
    .locals 1

    .line 272
    const-string v0, "Scatter"

    return-object v0
.end method

.method public getLegendShapeWidth(I)I
    .locals 1
    .param p1, "seriesIndex"    # I

    .line 147
    const/16 v0, 0xa

    return v0
.end method

.method protected setDatasetRenderer(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V
    .locals 1
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    .line 60
    invoke-super {p0, p1, p2}, Lorg/achartengine/chart/XYChart;->setDatasetRenderer(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 61
    invoke-virtual {p2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getPointSize()F

    move-result v0

    iput v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    .line 62
    return-void
.end method
