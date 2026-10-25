.class public Lorg/achartengine/chart/RangeBarChart;
.super Lorg/achartengine/chart/BarChart;
.source "RangeBarChart.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "RangeBar"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Lorg/achartengine/chart/BarChart;-><init>()V

    .line 37
    return-void
.end method

.method constructor <init>(Lorg/achartengine/chart/BarChart$Type;)V
    .locals 0
    .param p1, "type"    # Lorg/achartengine/chart/BarChart$Type;

    .line 40
    invoke-direct {p0, p1}, Lorg/achartengine/chart/BarChart;-><init>(Lorg/achartengine/chart/BarChart$Type;)V

    .line 41
    return-void
.end method

.method public constructor <init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Lorg/achartengine/chart/BarChart$Type;)V
    .locals 0
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .param p3, "type"    # Lorg/achartengine/chart/BarChart$Type;

    .line 51
    invoke-direct {p0, p1, p2, p3}, Lorg/achartengine/chart/BarChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Lorg/achartengine/chart/BarChart$Type;)V

    .line 52
    return-void
.end method


# virtual methods
.method protected drawChartValuesText(Landroid/graphics/Canvas;Lorg/achartengine/model/XYSeries;Lorg/achartengine/renderer/SimpleSeriesRenderer;Landroid/graphics/Paint;Ljava/util/List;II)V
    .locals 16
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "series"    # Lorg/achartengine/model/XYSeries;
    .param p3, "renderer"    # Lorg/achartengine/renderer/SimpleSeriesRenderer;
    .param p4, "paint"    # Landroid/graphics/Paint;
    .param p6, "seriesIndex"    # I
    .param p7, "startIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Canvas;",
            "Lorg/achartengine/model/XYSeries;",
            "Lorg/achartengine/renderer/SimpleSeriesRenderer;",
            "Landroid/graphics/Paint;",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;II)V"
        }
    .end annotation

    .line 102
    .local p5, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    move-object/from16 v7, p0

    move-object/from16 v8, p2

    move-object/from16 v9, p5

    iget-object v0, v7, Lorg/achartengine/chart/RangeBarChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    invoke-virtual {v0}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesCount()I

    move-result v10

    .line 103
    .local v10, "seriesNr":I
    invoke-interface/range {p5 .. p5}, Ljava/util/List;->size()I

    move-result v0

    invoke-virtual {v7, v9, v0, v10}, Lorg/achartengine/chart/RangeBarChart;->getHalfDiffX(Ljava/util/List;II)F

    move-result v11

    .line 104
    .local v11, "halfDiffX":F
    const/4 v0, 0x0

    .line 105
    .local v0, "start":I
    if-lez p7, :cond_0

    .line 106
    const/4 v0, 0x2

    move v12, v0

    goto :goto_0

    .line 105
    :cond_0
    move v12, v0

    .line 108
    .end local v0    # "start":I
    .local v12, "start":I
    :goto_0
    move v0, v12

    move v13, v0

    .local v13, "i":I
    :goto_1
    invoke-interface/range {p5 .. p5}, Ljava/util/List;->size()I

    move-result v0

    if-ge v13, v0, :cond_4

    .line 109
    div-int/lit8 v0, v13, 0x2

    add-int v14, p7, v0

    .line 110
    .local v14, "index":I
    invoke-interface {v9, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 111
    .local v0, "x":F
    iget-object v1, v7, Lorg/achartengine/chart/RangeBarChart;->mType:Lorg/achartengine/chart/BarChart$Type;

    sget-object v2, Lorg/achartengine/chart/BarChart$Type;->DEFAULT:Lorg/achartengine/chart/BarChart$Type;

    if-ne v1, v2, :cond_1

    .line 112
    mul-int/lit8 v1, p6, 0x2

    int-to-float v1, v1

    mul-float v1, v1, v11

    int-to-float v2, v10

    const/high16 v3, 0x3fc00000    # 1.5f

    sub-float/2addr v2, v3

    mul-float v2, v2, v11

    sub-float/2addr v1, v2

    add-float/2addr v0, v1

    move v15, v0

    goto :goto_2

    .line 111
    :cond_1
    move v15, v0

    .line 115
    .end local v0    # "x":F
    .local v15, "x":F
    :goto_2
    add-int/lit8 v0, v14, 0x1

    invoke-virtual {v8, v0}, Lorg/achartengine/model/XYSeries;->getY(I)D

    move-result-wide v0

    invoke-virtual {v7, v0, v1}, Lorg/achartengine/chart/RangeBarChart;->isNullValue(D)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-interface/range {p5 .. p5}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v1, v13, 0x3

    if-le v0, v1, :cond_2

    .line 117
    invoke-virtual/range {p3 .. p3}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getChartValuesFormat()Ljava/text/NumberFormat;

    move-result-object v0

    add-int/lit8 v1, v14, 0x1

    invoke-virtual {v8, v1}, Lorg/achartengine/model/XYSeries;->getY(I)D

    move-result-wide v1

    invoke-virtual {v7, v0, v1, v2}, Lorg/achartengine/chart/RangeBarChart;->getLabel(Ljava/text/NumberFormat;D)Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v0, v13, 0x3

    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual/range {p3 .. p3}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getChartValuesSpacing()F

    move-result v1

    sub-float v4, v0, v1

    const/4 v6, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v3, v15

    move-object/from16 v5, p4

    invoke-virtual/range {v0 .. v6}, Lorg/achartengine/chart/RangeBarChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 120
    :cond_2
    invoke-virtual {v8, v14}, Lorg/achartengine/model/XYSeries;->getY(I)D

    move-result-wide v0

    invoke-virtual {v7, v0, v1}, Lorg/achartengine/chart/RangeBarChart;->isNullValue(D)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-interface/range {p5 .. p5}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v1, v13, 0x1

    if-le v0, v1, :cond_3

    .line 122
    invoke-virtual/range {p3 .. p3}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getChartValuesFormat()Ljava/text/NumberFormat;

    move-result-object v0

    invoke-virtual {v8, v14}, Lorg/achartengine/model/XYSeries;->getY(I)D

    move-result-wide v1

    invoke-virtual {v7, v0, v1, v2}, Lorg/achartengine/chart/RangeBarChart;->getLabel(Ljava/text/NumberFormat;D)Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v0, v13, 0x1

    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual/range {p3 .. p3}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getChartValuesTextSize()F

    move-result v1

    add-float/2addr v0, v1

    invoke-virtual/range {p3 .. p3}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getChartValuesSpacing()F

    move-result v1

    add-float/2addr v0, v1

    const/high16 v1, 0x40400000    # 3.0f

    sub-float v4, v0, v1

    const/4 v6, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v3, v15

    move-object/from16 v5, p4

    invoke-virtual/range {v0 .. v6}, Lorg/achartengine/chart/RangeBarChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 108
    .end local v14    # "index":I
    .end local v15    # "x":F
    :cond_3
    add-int/lit8 v13, v13, 0x4

    goto/16 :goto_1

    .line 130
    .end local v13    # "i":I
    :cond_4
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

    .line 67
    .local p3, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    move-object/from16 v10, p0

    move-object/from16 v11, p2

    move-object/from16 v12, p3

    iget-object v0, v10, Lorg/achartengine/chart/RangeBarChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    invoke-virtual {v0}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesCount()I

    move-result v13

    .line 68
    .local v13, "seriesNr":I
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v14

    .line 69
    .local v14, "length":I
    invoke-virtual/range {p4 .. p4}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getColor()I

    move-result v0

    invoke-virtual {v11, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 70
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v11, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 71
    invoke-virtual {v10, v12, v14, v13}, Lorg/achartengine/chart/RangeBarChart;->getHalfDiffX(Ljava/util/List;II)F

    move-result v15

    .line 72
    .local v15, "halfDiffX":F
    const/4 v0, 0x0

    .line 73
    .local v0, "start":I
    if-lez p7, :cond_0

    .line 74
    const/4 v0, 0x2

    move/from16 v16, v0

    goto :goto_0

    .line 73
    :cond_0
    move/from16 v16, v0

    .line 76
    .end local v0    # "start":I
    .local v16, "start":I
    :goto_0
    move/from16 v0, v16

    move v9, v0

    .local v9, "i":I
    :goto_1
    if-ge v9, v14, :cond_2

    .line 77
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v1, v9, 0x3

    if-le v0, v1, :cond_1

    .line 78
    invoke-interface {v12, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v17

    .line 79
    .local v17, "xMin":F
    add-int/lit8 v0, v9, 0x1

    invoke-interface {v12, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v18

    .line 81
    .local v18, "yMin":F
    add-int/lit8 v0, v9, 0x2

    invoke-interface {v12, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v19

    .line 82
    .local v19, "xMax":F
    add-int/lit8 v0, v9, 0x3

    invoke-interface {v12, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v20

    .line 83
    .local v20, "yMax":F
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v17

    move/from16 v3, v18

    move/from16 v4, v19

    move/from16 v5, v20

    move v6, v15

    move v7, v13

    move/from16 v8, p6

    move/from16 v21, v9

    .end local v9    # "i":I
    .local v21, "i":I
    move-object/from16 v9, p2

    invoke-virtual/range {v0 .. v9}, Lorg/achartengine/chart/RangeBarChart;->drawBar(Landroid/graphics/Canvas;FFFFFIILandroid/graphics/Paint;)V

    goto :goto_2

    .line 77
    .end local v17    # "xMin":F
    .end local v18    # "yMin":F
    .end local v19    # "xMax":F
    .end local v20    # "yMax":F
    .end local v21    # "i":I
    .restart local v9    # "i":I
    :cond_1
    move/from16 v21, v9

    .line 76
    .end local v9    # "i":I
    .restart local v21    # "i":I
    :goto_2
    add-int/lit8 v9, v21, 0x4

    .end local v21    # "i":I
    .restart local v9    # "i":I
    goto :goto_1

    :cond_2
    move/from16 v21, v9

    .line 86
    .end local v9    # "i":I
    invoke-virtual/range {p4 .. p4}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getColor()I

    move-result v0

    invoke-virtual {v11, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 87
    return-void
.end method

.method public getChartType()Ljava/lang/String;
    .locals 1

    .line 147
    const-string v0, "RangeBar"

    return-object v0
.end method

.method protected getCoeficient()F
    .locals 1

    .line 138
    const/high16 v0, 0x3f000000    # 0.5f

    return v0
.end method
