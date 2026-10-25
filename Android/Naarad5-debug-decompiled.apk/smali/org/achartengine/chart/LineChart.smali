.class public Lorg/achartengine/chart/LineChart;
.super Lorg/achartengine/chart/XYChart;
.source "LineChart.java"


# static fields
.field private static final SHAPE_WIDTH:I = 0x1e

.field public static final TYPE:Ljava/lang/String; = "Line"


# instance fields
.field private pointsChart:Lorg/achartengine/chart/ScatterChart;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 43
    invoke-direct {p0}, Lorg/achartengine/chart/XYChart;-><init>()V

    .line 44
    return-void
.end method

.method public constructor <init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V
    .locals 1
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    .line 53
    invoke-direct {p0, p1, p2}, Lorg/achartengine/chart/XYChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 54
    new-instance v0, Lorg/achartengine/chart/ScatterChart;

    invoke-direct {v0, p1, p2}, Lorg/achartengine/chart/ScatterChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    iput-object v0, p0, Lorg/achartengine/chart/LineChart;->pointsChart:Lorg/achartengine/chart/ScatterChart;

    .line 55
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

    .line 192
    .local p1, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .local p2, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v2

    .line 193
    .local v2, "length":I
    div-int/lit8 v3, v2, 0x2

    new-array v3, v3, [Lorg/achartengine/chart/ClickableArea;

    .line 194
    .local v3, "ret":[Lorg/achartengine/chart/ClickableArea;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v2, :cond_0

    .line 195
    move-object v5, p0

    iget-object v6, v5, Lorg/achartengine/chart/LineChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v6}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getSelectableBuffer()I

    move-result v6

    .line 196
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

    .line 194
    .end local v6    # "selectableBuffer":I
    add-int/lit8 v4, v4, 0x2

    goto :goto_0

    :cond_0
    move-object v5, p0

    .line 200
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

    .line 225
    const/high16 v0, 0x41f00000    # 30.0f

    add-float v4, p3, v0

    move-object v1, p1

    move v2, p3

    move v3, p4

    move v5, p4

    move-object v6, p6

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 226
    invoke-virtual {p0, p2}, Lorg/achartengine/chart/LineChart;->isRenderPoints(Lorg/achartengine/renderer/SimpleSeriesRenderer;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 227
    iget-object v1, p0, Lorg/achartengine/chart/LineChart;->pointsChart:Lorg/achartengine/chart/ScatterChart;

    const/high16 v0, 0x40a00000    # 5.0f

    add-float v4, p3, v0

    move-object v2, p1

    move-object v3, p2

    move v5, p4

    move v6, p5

    move-object v7, p6

    invoke-virtual/range {v1 .. v7}, Lorg/achartengine/chart/ScatterChart;->drawLegendShape(Landroid/graphics/Canvas;Lorg/achartengine/renderer/SimpleSeriesRenderer;FFILandroid/graphics/Paint;)V

    .line 229
    :cond_0
    return-void
.end method

.method public drawSeries(Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/SimpleSeriesRenderer;FII)V
    .locals 25
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

    .line 83
    .local p3, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    check-cast v4, Lorg/achartengine/renderer/XYSeriesRenderer;

    .line 84
    .local v4, "renderer":Lorg/achartengine/renderer/XYSeriesRenderer;
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v5

    .line 85
    .local v5, "lineWidth":F
    invoke-virtual {v4}, Lorg/achartengine/renderer/XYSeriesRenderer;->getLineWidth()F

    move-result v6

    invoke-virtual {v2, v6}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 86
    invoke-virtual {v4}, Lorg/achartengine/renderer/XYSeriesRenderer;->getFillOutsideLine()[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;

    move-result-object v6

    .line 88
    .local v6, "fillOutsideLine":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    move-object v7, v6

    .local v7, "arr$":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    array-length v8, v7

    .local v8, "len$":I
    const/4 v9, 0x0

    .local v9, "i$":I
    const/4 v11, 0x0

    :goto_0
    const/4 v12, 0x0

    if-ge v9, v8, :cond_18

    aget-object v13, v7, v9

    .line 89
    .local v13, "fill":Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    invoke-virtual {v13}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->getType()Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-result-object v14

    sget-object v15, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;->NONE:Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    if-eq v14, v15, :cond_17

    .line 90
    invoke-virtual {v13}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->getColor()I

    move-result v14

    invoke-virtual {v2, v14}, Landroid/graphics/Paint;->setColor(I)V

    .line 92
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 93
    .local v14, "fillPoints":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    invoke-virtual {v13}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->getFillRange()[I

    move-result-object v15

    .line 94
    .local v15, "range":[I
    const/4 v10, 0x1

    if-nez v15, :cond_0

    .line 95
    invoke-interface {v14, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    move-object/from16 v18, v4

    const/4 v12, 0x2

    goto :goto_1

    .line 97
    :cond_0
    aget v17, v15, v12

    move-object/from16 v18, v4

    const/4 v12, 0x2

    .end local v4    # "renderer":Lorg/achartengine/renderer/XYSeriesRenderer;
    .local v18, "renderer":Lorg/achartengine/renderer/XYSeriesRenderer;
    mul-int/lit8 v4, v17, 0x2

    aget v16, v15, v10

    mul-int/lit8 v10, v16, 0x2

    invoke-interface {v3, v4, v10}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v4

    invoke-interface {v14, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 101
    :goto_1
    sget-object v4, Lorg/achartengine/chart/LineChart$1;->$SwitchMap$org$achartengine$renderer$XYSeriesRenderer$FillOutsideLine$Type:[I

    invoke-virtual {v13}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->getType()Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-result-object v10

    invoke-virtual {v10}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;->ordinal()I

    move-result v10

    aget v4, v4, v10

    const/4 v10, 0x1

    if-eq v4, v10, :cond_5

    if-eq v4, v12, :cond_4

    const/4 v10, 0x3

    if-eq v4, v10, :cond_3

    const/4 v10, 0x4

    if-eq v4, v10, :cond_2

    const/4 v10, 0x5

    if-ne v4, v10, :cond_1

    move v4, v11

    .line 115
    .local v4, "referencePoint":F
    const/4 v4, 0x0

    .line 116
    goto :goto_2

    .line 101
    .end local v4    # "referencePoint":F
    :cond_1
    move v4, v11

    .line 118
    .restart local v4    # "referencePoint":F
    new-instance v10, Ljava/lang/RuntimeException;

    const-string v11, "You have added a new type of filling but have not implemented."

    invoke-direct {v10, v11}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 101
    .end local v4    # "referencePoint":F
    :cond_2
    move v4, v11

    .line 112
    .restart local v4    # "referencePoint":F
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v10

    int-to-float v4, v10

    .line 113
    goto :goto_2

    .line 101
    .end local v4    # "referencePoint":F
    :cond_3
    move v4, v11

    .line 109
    .restart local v4    # "referencePoint":F
    move/from16 v4, p5

    .line 110
    goto :goto_2

    .line 101
    .end local v4    # "referencePoint":F
    :cond_4
    move v4, v11

    .line 106
    .restart local v4    # "referencePoint":F
    move/from16 v4, p5

    .line 107
    goto :goto_2

    .line 103
    .end local v4    # "referencePoint":F
    :cond_5
    move/from16 v4, p5

    .line 104
    .restart local v4    # "referencePoint":F
    nop

    .line 121
    :goto_2
    invoke-virtual {v13}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->getType()Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-result-object v10

    sget-object v11, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;->BOUNDS_ABOVE:Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    if-eq v10, v11, :cond_7

    invoke-virtual {v13}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->getType()Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-result-object v10

    sget-object v11, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;->BOUNDS_BELOW:Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    if-ne v10, v11, :cond_6

    goto :goto_3

    :cond_6
    move-object/from16 v19, v6

    move-object/from16 v21, v7

    move/from16 v22, v8

    goto/16 :goto_9

    .line 123
    :cond_7
    :goto_3
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 124
    .local v10, "boundsPoints":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    const/4 v11, 0x0

    .line 125
    .local v11, "add":Z
    invoke-virtual {v13}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->getType()Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-result-object v12

    move-object/from16 v19, v6

    .end local v6    # "fillOutsideLine":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .local v19, "fillOutsideLine":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    sget-object v6, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;->BOUNDS_ABOVE:Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    if-ne v12, v6, :cond_9

    const/4 v6, 0x1

    invoke-interface {v14, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Float;

    invoke-virtual {v12}, Ljava/lang/Float;->floatValue()F

    move-result v6

    cmpg-float v6, v6, v4

    if-ltz v6, :cond_8

    goto :goto_4

    :cond_8
    const/4 v6, 0x1

    goto :goto_5

    :cond_9
    :goto_4
    invoke-virtual {v13}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->getType()Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-result-object v6

    sget-object v12, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;->BOUNDS_BELOW:Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    if-ne v6, v12, :cond_a

    const/4 v6, 0x1

    invoke-interface {v14, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Float;

    invoke-virtual {v12}, Ljava/lang/Float;->floatValue()F

    move-result v12

    cmpl-float v12, v12, v4

    if-lez v12, :cond_a

    .line 129
    :goto_5
    const/4 v12, 0x0

    invoke-interface {v14, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v10, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    const/4 v6, 0x1

    invoke-interface {v14, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    invoke-interface {v10, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 131
    const/4 v11, 0x1

    .line 134
    :cond_a
    const/4 v6, 0x3

    .local v6, "i":I
    :goto_6
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v12

    if-ge v6, v12, :cond_14

    .line 135
    add-int/lit8 v12, v6, -0x2

    invoke-interface {v14, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Float;

    invoke-virtual {v12}, Ljava/lang/Float;->floatValue()F

    move-result v12

    .line 136
    .local v12, "prevValue":F
    invoke-interface {v14, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Float;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Float;->floatValue()F

    move-result v20

    .line 138
    .local v20, "value":F
    cmpg-float v21, v12, v4

    if-gez v21, :cond_b

    cmpl-float v21, v20, v4

    if-gtz v21, :cond_c

    :cond_b
    cmpl-float v21, v12, v4

    if-lez v21, :cond_10

    cmpg-float v21, v20, v4

    if-gez v21, :cond_10

    .line 140
    :cond_c
    move-object/from16 v21, v7

    .end local v7    # "arr$":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .local v21, "arr$":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    add-int/lit8 v7, v6, -0x3

    invoke-interface {v14, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    .line 141
    .local v7, "prevX":F
    move/from16 v22, v8

    .end local v8    # "len$":I
    .local v22, "len$":I
    add-int/lit8 v8, v6, -0x1

    invoke-interface {v14, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Float;

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v8

    .line 142
    .local v8, "x":F
    sub-float v23, v8, v7

    sub-float v24, v4, v12

    mul-float v23, v23, v24

    sub-float v24, v20, v12

    div-float v23, v23, v24

    add-float v23, v7, v23

    move/from16 v24, v7

    .end local v7    # "prevX":F
    .local v24, "prevX":F
    invoke-static/range {v23 .. v23}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    invoke-interface {v10, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 144
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    invoke-interface {v10, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 145
    invoke-virtual {v13}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->getType()Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-result-object v7

    move/from16 v23, v12

    .end local v12    # "prevValue":F
    .local v23, "prevValue":F
    sget-object v12, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;->BOUNDS_ABOVE:Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    if-ne v7, v12, :cond_d

    cmpl-float v7, v20, v4

    if-gtz v7, :cond_e

    :cond_d
    invoke-virtual {v13}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->getType()Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-result-object v7

    sget-object v12, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;->BOUNDS_BELOW:Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    if-ne v7, v12, :cond_f

    cmpg-float v7, v20, v4

    if-gez v7, :cond_f

    .line 147
    :cond_e
    add-int/lit8 v6, v6, 0x2

    .line 148
    const/4 v7, 0x0

    .end local v11    # "add":Z
    .local v7, "add":Z
    goto :goto_7

    .line 150
    .end local v7    # "add":Z
    .restart local v11    # "add":Z
    :cond_f
    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    invoke-interface {v10, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 151
    invoke-static/range {v20 .. v20}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    invoke-interface {v10, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 152
    const/4 v7, 0x1

    .line 154
    .end local v8    # "x":F
    .end local v11    # "add":Z
    .end local v24    # "prevX":F
    .restart local v7    # "add":Z
    :goto_7
    move v11, v7

    goto :goto_8

    .line 138
    .end local v21    # "arr$":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .end local v22    # "len$":I
    .end local v23    # "prevValue":F
    .local v7, "arr$":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .local v8, "len$":I
    .restart local v11    # "add":Z
    .restart local v12    # "prevValue":F
    :cond_10
    move-object/from16 v21, v7

    move/from16 v22, v8

    move/from16 v23, v12

    .line 155
    .end local v7    # "arr$":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .end local v8    # "len$":I
    .end local v12    # "prevValue":F
    .restart local v21    # "arr$":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .restart local v22    # "len$":I
    .restart local v23    # "prevValue":F
    if-nez v11, :cond_12

    invoke-virtual {v13}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->getType()Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-result-object v7

    sget-object v8, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;->BOUNDS_ABOVE:Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    if-ne v7, v8, :cond_11

    cmpg-float v7, v20, v4

    if-ltz v7, :cond_12

    :cond_11
    invoke-virtual {v13}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->getType()Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-result-object v7

    sget-object v8, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;->BOUNDS_BELOW:Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    if-ne v7, v8, :cond_13

    cmpl-float v7, v20, v4

    if-lez v7, :cond_13

    .line 158
    :cond_12
    add-int/lit8 v7, v6, -0x1

    invoke-interface {v14, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v10, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 159
    invoke-static/range {v20 .. v20}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    invoke-interface {v10, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    .end local v20    # "value":F
    .end local v23    # "prevValue":F
    :cond_13
    :goto_8
    const/4 v7, 0x2

    add-int/2addr v6, v7

    move-object/from16 v7, v21

    move/from16 v8, v22

    goto/16 :goto_6

    .end local v21    # "arr$":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .end local v22    # "len$":I
    .restart local v7    # "arr$":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .restart local v8    # "len$":I
    :cond_14
    move-object/from16 v21, v7

    move/from16 v22, v8

    .line 164
    .end local v6    # "i":I
    .end local v7    # "arr$":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .end local v8    # "len$":I
    .restart local v21    # "arr$":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .restart local v22    # "len$":I
    invoke-interface {v14}, Ljava/util/List;->clear()V

    .line 165
    invoke-interface {v14, v10}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 167
    .end local v10    # "boundsPoints":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .end local v11    # "add":Z
    :goto_9
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v6

    .line 168
    .local v6, "length":I
    const/4 v7, 0x0

    invoke-interface {v14, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Float;

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v8

    const/high16 v10, 0x3f800000    # 1.0f

    add-float/2addr v8, v10

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    invoke-interface {v14, v7, v8}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 169
    add-int/lit8 v8, v6, -0x2

    invoke-interface {v14, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-interface {v14, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    invoke-interface {v14, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 171
    invoke-interface {v14, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v14, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 172
    add-int/lit8 v7, v6, 0x1

    invoke-interface {v14, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v14, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 173
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_a
    add-int/lit8 v8, v6, 0x4

    if-ge v7, v8, :cond_16

    .line 174
    add-int/lit8 v8, v7, 0x1

    invoke-interface {v14, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Float;

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v8

    const/4 v10, 0x0

    cmpg-float v8, v8, v10

    if-gez v8, :cond_15

    .line 175
    add-int/lit8 v8, v7, 0x1

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    invoke-interface {v14, v8, v11}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 173
    :cond_15
    add-int/lit8 v7, v7, 0x2

    goto :goto_a

    :cond_16
    const/4 v10, 0x0

    .line 179
    .end local v7    # "i":I
    sget-object v7, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 180
    const/4 v7, 0x1

    invoke-virtual {v0, v1, v14, v2, v7}, Lorg/achartengine/chart/LineChart;->drawPath(Landroid/graphics/Canvas;Ljava/util/List;Landroid/graphics/Paint;Z)V

    move v11, v4

    goto :goto_b

    .line 89
    .end local v14    # "fillPoints":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .end local v15    # "range":[I
    .end local v18    # "renderer":Lorg/achartengine/renderer/XYSeriesRenderer;
    .end local v19    # "fillOutsideLine":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .end local v21    # "arr$":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .end local v22    # "len$":I
    .local v4, "renderer":Lorg/achartengine/renderer/XYSeriesRenderer;
    .local v6, "fillOutsideLine":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .local v7, "arr$":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .restart local v8    # "len$":I
    :cond_17
    move-object/from16 v18, v4

    move-object/from16 v19, v6

    move-object/from16 v21, v7

    move/from16 v22, v8

    const/4 v10, 0x0

    .line 88
    .end local v4    # "renderer":Lorg/achartengine/renderer/XYSeriesRenderer;
    .end local v6    # "fillOutsideLine":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .end local v7    # "arr$":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .end local v8    # "len$":I
    .end local v13    # "fill":Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .restart local v18    # "renderer":Lorg/achartengine/renderer/XYSeriesRenderer;
    .restart local v19    # "fillOutsideLine":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .restart local v21    # "arr$":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .restart local v22    # "len$":I
    :goto_b
    add-int/lit8 v9, v9, 0x1

    move-object/from16 v4, v18

    move-object/from16 v6, v19

    move-object/from16 v7, v21

    move/from16 v8, v22

    goto/16 :goto_0

    .end local v18    # "renderer":Lorg/achartengine/renderer/XYSeriesRenderer;
    .end local v19    # "fillOutsideLine":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .end local v21    # "arr$":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .end local v22    # "len$":I
    .restart local v4    # "renderer":Lorg/achartengine/renderer/XYSeriesRenderer;
    .restart local v6    # "fillOutsideLine":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .restart local v7    # "arr$":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .restart local v8    # "len$":I
    :cond_18
    move-object/from16 v18, v4

    move-object/from16 v19, v6

    move-object/from16 v21, v7

    move/from16 v22, v8

    .line 183
    .end local v4    # "renderer":Lorg/achartengine/renderer/XYSeriesRenderer;
    .end local v6    # "fillOutsideLine":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .end local v7    # "arr$":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .end local v8    # "len$":I
    .end local v9    # "i$":I
    .restart local v18    # "renderer":Lorg/achartengine/renderer/XYSeriesRenderer;
    .restart local v19    # "fillOutsideLine":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    invoke-virtual/range {p4 .. p4}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getColor()I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 184
    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 185
    const/4 v4, 0x0

    invoke-virtual {v0, v1, v3, v2, v4}, Lorg/achartengine/chart/LineChart;->drawPath(Landroid/graphics/Canvas;Ljava/util/List;Landroid/graphics/Paint;Z)V

    .line 186
    invoke-virtual {v2, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 187
    return-void
.end method

.method public getChartType()Ljava/lang/String;
    .locals 1

    .line 255
    const-string v0, "Line"

    return-object v0
.end method

.method public getLegendShapeWidth(I)I
    .locals 1
    .param p1, "seriesIndex"    # I

    .line 210
    const/16 v0, 0x1e

    return v0
.end method

.method public getPointsChart()Lorg/achartengine/chart/ScatterChart;
    .locals 1

    .line 246
    iget-object v0, p0, Lorg/achartengine/chart/LineChart;->pointsChart:Lorg/achartengine/chart/ScatterChart;

    return-object v0
.end method

.method public isRenderPoints(Lorg/achartengine/renderer/SimpleSeriesRenderer;)Z
    .locals 2
    .param p1, "renderer"    # Lorg/achartengine/renderer/SimpleSeriesRenderer;

    .line 237
    move-object v0, p1

    check-cast v0, Lorg/achartengine/renderer/XYSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYSeriesRenderer;->getPointStyle()Lorg/achartengine/chart/PointStyle;

    move-result-object v0

    sget-object v1, Lorg/achartengine/chart/PointStyle;->POINT:Lorg/achartengine/chart/PointStyle;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected setDatasetRenderer(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V
    .locals 1
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    .line 65
    invoke-super {p0, p1, p2}, Lorg/achartengine/chart/XYChart;->setDatasetRenderer(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 66
    new-instance v0, Lorg/achartengine/chart/ScatterChart;

    invoke-direct {v0, p1, p2}, Lorg/achartengine/chart/ScatterChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    iput-object v0, p0, Lorg/achartengine/chart/LineChart;->pointsChart:Lorg/achartengine/chart/ScatterChart;

    .line 67
    return-void
.end method
