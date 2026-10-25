.class public Lorg/achartengine/chart/PieChart;
.super Lorg/achartengine/chart/RoundChart;
.source "PieChart.java"


# instance fields
.field private mPieMapper:Lorg/achartengine/chart/PieMapper;


# direct methods
.method public constructor <init>(Lorg/achartengine/model/CategorySeries;Lorg/achartengine/renderer/DefaultRenderer;)V
    .locals 1
    .param p1, "dataset"    # Lorg/achartengine/model/CategorySeries;
    .param p2, "renderer"    # Lorg/achartengine/renderer/DefaultRenderer;

    .line 48
    invoke-direct {p0, p1, p2}, Lorg/achartengine/chart/RoundChart;-><init>(Lorg/achartengine/model/CategorySeries;Lorg/achartengine/renderer/DefaultRenderer;)V

    .line 49
    new-instance v0, Lorg/achartengine/chart/PieMapper;

    invoke-direct {v0}, Lorg/achartengine/chart/PieMapper;-><init>()V

    iput-object v0, p0, Lorg/achartengine/chart/PieChart;->mPieMapper:Lorg/achartengine/chart/PieMapper;

    .line 50
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;IIIILandroid/graphics/Paint;)V
    .locals 43
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "width"    # I
    .param p5, "height"    # I
    .param p6, "paint"    # Landroid/graphics/Paint;

    .line 64
    move-object/from16 v14, p0

    move-object/from16 v12, p6

    iget-object v0, v14, Lorg/achartengine/chart/PieChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->isAntialiasing()Z

    move-result v0

    invoke-virtual {v12, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 65
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v12, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 66
    iget-object v0, v14, Lorg/achartengine/chart/PieChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->getLabelsTextSize()F

    move-result v0

    invoke-virtual {v12, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 67
    iget-object v0, v14, Lorg/achartengine/chart/PieChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    div-int/lit8 v1, p5, 0x5

    const/4 v2, 0x0

    invoke-virtual {v14, v0, v1, v2}, Lorg/achartengine/chart/PieChart;->getLegendSize(Lorg/achartengine/renderer/DefaultRenderer;IF)I

    move-result v13

    .line 68
    .local v13, "legendSize":I
    move/from16 v22, p2

    .line 69
    .local v22, "left":I
    move/from16 v23, p3

    .line 70
    .local v23, "top":I
    add-int v24, p2, p4

    .line 71
    .local v24, "right":I
    iget-object v0, v14, Lorg/achartengine/chart/PieChart;->mDataset:Lorg/achartengine/model/CategorySeries;

    invoke-virtual {v0}, Lorg/achartengine/model/CategorySeries;->getItemCount()I

    move-result v15

    .line 72
    .local v15, "sLength":I
    const-wide/16 v0, 0x0

    .line 73
    .local v0, "total":D
    new-array v11, v15, [Ljava/lang/String;

    .line 74
    .local v11, "titles":[Ljava/lang/String;
    const/4 v2, 0x0

    move-wide/from16 v25, v0

    .end local v0    # "total":D
    .local v2, "i":I
    .local v25, "total":D
    :goto_0
    if-ge v2, v15, :cond_0

    .line 75
    iget-object v0, v14, Lorg/achartengine/chart/PieChart;->mDataset:Lorg/achartengine/model/CategorySeries;

    invoke-virtual {v0, v2}, Lorg/achartengine/model/CategorySeries;->getValue(I)D

    move-result-wide v0

    add-double v25, v25, v0

    .line 76
    iget-object v0, v14, Lorg/achartengine/chart/PieChart;->mDataset:Lorg/achartengine/model/CategorySeries;

    invoke-virtual {v0, v2}, Lorg/achartengine/model/CategorySeries;->getCategory(I)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v11, v2

    .line 74
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 78
    .end local v2    # "i":I
    :cond_0
    iget-object v0, v14, Lorg/achartengine/chart/PieChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->isFitLegend()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 79
    iget-object v2, v14, Lorg/achartengine/chart/PieChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    const/16 v16, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object v3, v11

    move/from16 v4, v22

    move/from16 v5, v24

    move/from16 v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move v9, v13

    move-object/from16 v10, p6

    move-object/from16 v27, v11

    .end local v11    # "titles":[Ljava/lang/String;
    .local v27, "titles":[Ljava/lang/String;
    move/from16 v11, v16

    invoke-virtual/range {v0 .. v11}, Lorg/achartengine/chart/PieChart;->drawLegend(Landroid/graphics/Canvas;Lorg/achartengine/renderer/DefaultRenderer;[Ljava/lang/String;IIIIIILandroid/graphics/Paint;Z)I

    move-result v0

    move/from16 v28, v0

    .end local v13    # "legendSize":I
    .local v0, "legendSize":I
    goto :goto_1

    .line 78
    .end local v0    # "legendSize":I
    .end local v27    # "titles":[Ljava/lang/String;
    .restart local v11    # "titles":[Ljava/lang/String;
    .restart local v13    # "legendSize":I
    :cond_1
    move-object/from16 v27, v11

    .end local v11    # "titles":[Ljava/lang/String;
    .restart local v27    # "titles":[Ljava/lang/String;
    move/from16 v28, v13

    .line 82
    .end local v13    # "legendSize":I
    .local v28, "legendSize":I
    :goto_1
    add-int v0, p3, p5

    sub-int v29, v0, v28

    .line 83
    .local v29, "bottom":I
    iget-object v1, v14, Lorg/achartengine/chart/PieChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object/from16 v0, p0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move-object/from16 v7, p6

    invoke-virtual/range {v0 .. v9}, Lorg/achartengine/chart/PieChart;->drawBackground(Lorg/achartengine/renderer/DefaultRenderer;Landroid/graphics/Canvas;IIIILandroid/graphics/Paint;ZI)V

    .line 85
    iget-object v0, v14, Lorg/achartengine/chart/PieChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->getStartAngle()F

    move-result v0

    .line 86
    .local v0, "currentAngle":F
    sub-int v1, v24, v22

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    sub-int v2, v29, v23

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v11

    .line 87
    .local v11, "mRadius":I
    int-to-double v1, v11

    const-wide v3, 0x3fd6666666666666L    # 0.35

    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v1, v1, v3

    iget-object v3, v14, Lorg/achartengine/chart/PieChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v3}, Lorg/achartengine/renderer/DefaultRenderer;->getScale()F

    move-result v3

    float-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v1, v1, v3

    double-to-int v1, v1

    .line 89
    .local v1, "radius":I
    iget v2, v14, Lorg/achartengine/chart/PieChart;->mCenterX:I

    const v3, 0x7fffffff

    if-ne v2, v3, :cond_2

    .line 90
    add-int v2, v22, v24

    div-int/lit8 v2, v2, 0x2

    iput v2, v14, Lorg/achartengine/chart/PieChart;->mCenterX:I

    .line 92
    :cond_2
    iget v2, v14, Lorg/achartengine/chart/PieChart;->mCenterY:I

    if-ne v2, v3, :cond_3

    .line 93
    add-int v2, v29, v23

    div-int/lit8 v2, v2, 0x2

    iput v2, v14, Lorg/achartengine/chart/PieChart;->mCenterY:I

    .line 97
    :cond_3
    iget-object v2, v14, Lorg/achartengine/chart/PieChart;->mPieMapper:Lorg/achartengine/chart/PieMapper;

    iget v3, v14, Lorg/achartengine/chart/PieChart;->mCenterX:I

    iget v4, v14, Lorg/achartengine/chart/PieChart;->mCenterY:I

    invoke-virtual {v2, v1, v3, v4}, Lorg/achartengine/chart/PieMapper;->setDimensions(III)V

    .line 98
    iget-object v2, v14, Lorg/achartengine/chart/PieChart;->mPieMapper:Lorg/achartengine/chart/PieMapper;

    invoke-virtual {v2, v15}, Lorg/achartengine/chart/PieMapper;->areAllSegmentPresent(I)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    move/from16 v30, v2

    .line 99
    .local v30, "loadPieCfg":Z
    if-eqz v30, :cond_4

    .line 100
    iget-object v2, v14, Lorg/achartengine/chart/PieChart;->mPieMapper:Lorg/achartengine/chart/PieMapper;

    invoke-virtual {v2}, Lorg/achartengine/chart/PieMapper;->clearPieSegments()V

    .line 103
    :cond_4
    int-to-float v2, v1

    const v3, 0x3f666666    # 0.9f

    mul-float v31, v2, v3

    .line 104
    .local v31, "shortRadius":F
    int-to-float v2, v1

    const v3, 0x3f8ccccd    # 1.1f

    mul-float v39, v2, v3

    .line 105
    .local v39, "longRadius":F
    new-instance v2, Landroid/graphics/RectF;

    iget v3, v14, Lorg/achartengine/chart/PieChart;->mCenterX:I

    sub-int/2addr v3, v1

    int-to-float v3, v3

    iget v4, v14, Lorg/achartengine/chart/PieChart;->mCenterY:I

    sub-int/2addr v4, v1

    int-to-float v4, v4

    iget v5, v14, Lorg/achartengine/chart/PieChart;->mCenterX:I

    add-int/2addr v5, v1

    int-to-float v5, v5

    iget v6, v14, Lorg/achartengine/chart/PieChart;->mCenterY:I

    add-int/2addr v6, v1

    int-to-float v6, v6

    invoke-direct {v2, v3, v4, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    move-object v13, v2

    .line 107
    .local v13, "oval":Landroid/graphics/RectF;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 109
    .local v4, "prevLabelsBounds":Ljava/util/List;, "Ljava/util/List<Landroid/graphics/RectF;>;"
    const/4 v2, 0x0

    move v3, v0

    move v0, v2

    .local v0, "i":I
    .local v3, "currentAngle":F
    :goto_2
    if-ge v0, v15, :cond_9

    .line 110
    iget-object v2, v14, Lorg/achartengine/chart/PieChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v2, v0}, Lorg/achartengine/renderer/DefaultRenderer;->getSeriesRendererAt(I)Lorg/achartengine/renderer/SimpleSeriesRenderer;

    move-result-object v40

    .line 111
    .local v40, "seriesRenderer":Lorg/achartengine/renderer/SimpleSeriesRenderer;
    invoke-virtual/range {v40 .. v40}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->isGradientEnabled()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 112
    new-instance v2, Landroid/graphics/RadialGradient;

    iget v5, v14, Lorg/achartengine/chart/PieChart;->mCenterX:I

    int-to-float v5, v5

    iget v6, v14, Lorg/achartengine/chart/PieChart;->mCenterY:I

    int-to-float v6, v6

    invoke-virtual/range {v40 .. v40}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getGradientStartColor()I

    move-result v36

    invoke-virtual/range {v40 .. v40}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getGradientStopColor()I

    move-result v37

    sget-object v38, Landroid/graphics/Shader$TileMode;->MIRROR:Landroid/graphics/Shader$TileMode;

    move-object/from16 v32, v2

    move/from16 v33, v5

    move/from16 v34, v6

    move/from16 v35, v39

    invoke-direct/range {v32 .. v38}, Landroid/graphics/RadialGradient;-><init>(FFFIILandroid/graphics/Shader$TileMode;)V

    .line 115
    .local v2, "grad":Landroid/graphics/RadialGradient;
    invoke-virtual {v12, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 116
    .end local v2    # "grad":Landroid/graphics/RadialGradient;
    goto :goto_3

    .line 117
    :cond_5
    invoke-virtual/range {v40 .. v40}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getColor()I

    move-result v2

    invoke-virtual {v12, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 120
    :goto_3
    iget-object v2, v14, Lorg/achartengine/chart/PieChart;->mDataset:Lorg/achartengine/model/CategorySeries;

    invoke-virtual {v2, v0}, Lorg/achartengine/model/CategorySeries;->getValue(I)D

    move-result-wide v5

    double-to-float v2, v5

    .line 121
    .local v2, "value":F
    float-to-double v5, v2

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    div-double v5, v5, v25

    const-wide v7, 0x4076800000000000L    # 360.0

    mul-double v5, v5, v7

    double-to-float v10, v5

    .line 122
    .local v10, "angle":F
    invoke-virtual/range {v40 .. v40}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->isHighlighted()Z

    move-result v5

    const/high16 v17, 0x40000000    # 2.0f

    if-eqz v5, :cond_6

    .line 123
    const/high16 v5, 0x42b40000    # 90.0f

    div-float v6, v10, v17

    add-float/2addr v6, v3

    sub-float/2addr v5, v6

    float-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v18

    .line 124
    .local v18, "rAngle":D
    int-to-double v5, v1

    const-wide v7, 0x3fb999999999999aL    # 0.1

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v5, v5, v7

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->sin(D)D

    move-result-wide v20

    mul-double v5, v5, v20

    double-to-float v9, v5

    .line 125
    .local v9, "translateX":F
    int-to-double v5, v1

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v5, v5, v7

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->cos(D)D

    move-result-wide v7

    mul-double v5, v5, v7

    double-to-float v8, v5

    .line 126
    .local v8, "translateY":F
    invoke-virtual {v13, v9, v8}, Landroid/graphics/RectF;->offset(FF)V

    .line 127
    const/16 v16, 0x1

    move-object/from16 v5, p1

    move-object v6, v13

    move v7, v3

    move/from16 v20, v1

    move v1, v8

    .end local v8    # "translateY":F
    .local v1, "translateY":F
    .local v20, "radius":I
    move v8, v10

    move/from16 v21, v2

    move v2, v9

    .end local v9    # "translateX":F
    .local v2, "translateX":F
    .local v21, "value":F
    move/from16 v9, v16

    move/from16 v32, v10

    .end local v10    # "angle":F
    .local v32, "angle":F
    move-object/from16 v10, p6

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 128
    neg-float v5, v2

    neg-float v6, v1

    invoke-virtual {v13, v5, v6}, Landroid/graphics/RectF;->offset(FF)V

    .line 129
    .end local v1    # "translateY":F
    .end local v2    # "translateX":F
    .end local v18    # "rAngle":D
    goto :goto_4

    .line 130
    .end local v20    # "radius":I
    .end local v21    # "value":F
    .end local v32    # "angle":F
    .local v1, "radius":I
    .local v2, "value":F
    .restart local v10    # "angle":F
    :cond_6
    move/from16 v20, v1

    move/from16 v21, v2

    move/from16 v32, v10

    .end local v1    # "radius":I
    .end local v2    # "value":F
    .end local v10    # "angle":F
    .restart local v20    # "radius":I
    .restart local v21    # "value":F
    .restart local v32    # "angle":F
    const/4 v9, 0x1

    move-object/from16 v5, p1

    move-object v6, v13

    move v7, v3

    move/from16 v8, v32

    move-object/from16 v10, p6

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 132
    :goto_4
    invoke-virtual/range {v40 .. v40}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getColor()I

    move-result v1

    invoke-virtual {v12, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 133
    const/4 v1, 0x0

    invoke-virtual {v12, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 134
    iget-object v1, v14, Lorg/achartengine/chart/PieChart;->mDataset:Lorg/achartengine/model/CategorySeries;

    invoke-virtual {v1, v0}, Lorg/achartengine/model/CategorySeries;->getCategory(I)Ljava/lang/String;

    move-result-object v2

    move/from16 v10, v21

    .end local v21    # "value":F
    .local v10, "value":F
    iget-object v1, v14, Lorg/achartengine/chart/PieChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    move v9, v3

    .end local v3    # "currentAngle":F
    .local v9, "currentAngle":F
    move-object v3, v1

    iget v5, v14, Lorg/achartengine/chart/PieChart;->mCenterX:I

    iget v6, v14, Lorg/achartengine/chart/PieChart;->mCenterY:I

    iget-object v1, v14, Lorg/achartengine/chart/PieChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/DefaultRenderer;->getLabelsColor()I

    move-result v1

    move-object/from16 v33, v13

    .end local v13    # "oval":Landroid/graphics/RectF;
    .local v33, "oval":Landroid/graphics/RectF;
    move v13, v1

    const/4 v1, 0x1

    move/from16 v34, v15

    .end local v15    # "sLength":I
    .local v34, "sLength":I
    move v15, v1

    const/16 v16, 0x0

    move v8, v0

    .end local v0    # "i":I
    .local v8, "i":I
    move-object/from16 v0, p0

    move/from16 v35, v20

    .end local v20    # "radius":I
    .local v35, "radius":I
    move-object/from16 v1, p1

    move/from16 v7, v31

    move/from16 v41, v8

    .end local v8    # "i":I
    .local v41, "i":I
    move/from16 v8, v39

    move/from16 v36, v9

    .end local v9    # "currentAngle":F
    .local v36, "currentAngle":F
    move/from16 v42, v10

    .end local v10    # "value":F
    .local v42, "value":F
    move/from16 v10, v32

    move/from16 v37, v11

    .end local v11    # "mRadius":I
    .local v37, "mRadius":I
    move/from16 v11, v22

    move/from16 v12, v24

    move-object/from16 v14, p6

    invoke-virtual/range {v0 .. v16}, Lorg/achartengine/chart/PieChart;->drawLabel(Landroid/graphics/Canvas;Ljava/lang/String;Lorg/achartengine/renderer/DefaultRenderer;Ljava/util/List;IIFFFFIIILandroid/graphics/Paint;ZZ)V

    .line 137
    iget-object v1, v0, Lorg/achartengine/chart/PieChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/DefaultRenderer;->isDisplayValues()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 138
    iget-object v1, v0, Lorg/achartengine/chart/PieChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    move/from16 v2, v41

    .end local v41    # "i":I
    .local v2, "i":I
    invoke-virtual {v1, v2}, Lorg/achartengine/renderer/DefaultRenderer;->getSeriesRendererAt(I)Lorg/achartengine/renderer/SimpleSeriesRenderer;

    move-result-object v1

    invoke-virtual {v1}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getChartValuesFormat()Ljava/text/NumberFormat;

    move-result-object v1

    iget-object v3, v0, Lorg/achartengine/chart/PieChart;->mDataset:Lorg/achartengine/model/CategorySeries;

    invoke-virtual {v3, v2}, Lorg/achartengine/model/CategorySeries;->getValue(I)D

    move-result-wide v5

    invoke-virtual {v0, v1, v5, v6}, Lorg/achartengine/chart/PieChart;->getLabel(Ljava/text/NumberFormat;D)Ljava/lang/String;

    move-result-object v7

    iget-object v8, v0, Lorg/achartengine/chart/PieChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    iget v10, v0, Lorg/achartengine/chart/PieChart;->mCenterX:I

    iget v11, v0, Lorg/achartengine/chart/PieChart;->mCenterY:I

    div-float v12, v31, v17

    div-float v13, v39, v17

    iget-object v1, v0, Lorg/achartengine/chart/PieChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/DefaultRenderer;->getLabelsColor()I

    move-result v18

    const/16 v20, 0x0

    const/16 v21, 0x1

    move-object/from16 v5, p0

    move-object/from16 v6, p1

    move-object v9, v4

    move/from16 v14, v36

    move/from16 v15, v32

    move/from16 v16, v22

    move/from16 v17, v24

    move-object/from16 v19, p6

    invoke-virtual/range {v5 .. v21}, Lorg/achartengine/chart/PieChart;->drawLabel(Landroid/graphics/Canvas;Ljava/lang/String;Lorg/achartengine/renderer/DefaultRenderer;Ljava/util/List;IIFFFFIIILandroid/graphics/Paint;ZZ)V

    goto :goto_5

    .line 137
    .end local v2    # "i":I
    .restart local v41    # "i":I
    :cond_7
    move/from16 v2, v41

    .line 146
    .end local v41    # "i":I
    .restart local v2    # "i":I
    :goto_5
    if-eqz v30, :cond_8

    .line 147
    iget-object v1, v0, Lorg/achartengine/chart/PieChart;->mPieMapper:Lorg/achartengine/chart/PieMapper;

    move/from16 v6, v32

    move/from16 v3, v36

    move/from16 v5, v42

    .end local v32    # "angle":F
    .end local v36    # "currentAngle":F
    .end local v42    # "value":F
    .restart local v3    # "currentAngle":F
    .local v5, "value":F
    .local v6, "angle":F
    invoke-virtual {v1, v2, v5, v3, v6}, Lorg/achartengine/chart/PieMapper;->addPieSegment(IFFF)V

    goto :goto_6

    .line 146
    .end local v3    # "currentAngle":F
    .end local v5    # "value":F
    .end local v6    # "angle":F
    .restart local v32    # "angle":F
    .restart local v36    # "currentAngle":F
    .restart local v42    # "value":F
    :cond_8
    move/from16 v6, v32

    move/from16 v3, v36

    move/from16 v5, v42

    .line 149
    .end local v32    # "angle":F
    .end local v36    # "currentAngle":F
    .end local v42    # "value":F
    .restart local v3    # "currentAngle":F
    .restart local v5    # "value":F
    .restart local v6    # "angle":F
    :goto_6
    add-float/2addr v3, v6

    .line 109
    .end local v5    # "value":F
    .end local v6    # "angle":F
    .end local v40    # "seriesRenderer":Lorg/achartengine/renderer/SimpleSeriesRenderer;
    add-int/lit8 v1, v2, 0x1

    move-object/from16 v12, p6

    move-object v14, v0

    move v0, v1

    move-object/from16 v13, v33

    move/from16 v15, v34

    move/from16 v1, v35

    move/from16 v11, v37

    .end local v2    # "i":I
    .local v1, "i":I
    goto/16 :goto_2

    .end local v33    # "oval":Landroid/graphics/RectF;
    .end local v34    # "sLength":I
    .end local v35    # "radius":I
    .end local v37    # "mRadius":I
    .restart local v0    # "i":I
    .local v1, "radius":I
    .restart local v11    # "mRadius":I
    .restart local v13    # "oval":Landroid/graphics/RectF;
    .restart local v15    # "sLength":I
    :cond_9
    move v2, v0

    move/from16 v35, v1

    move/from16 v37, v11

    move-object/from16 v33, v13

    move-object v0, v14

    move/from16 v34, v15

    .line 151
    .end local v0    # "i":I
    .end local v1    # "radius":I
    .end local v11    # "mRadius":I
    .end local v13    # "oval":Landroid/graphics/RectF;
    .end local v15    # "sLength":I
    .restart local v33    # "oval":Landroid/graphics/RectF;
    .restart local v34    # "sLength":I
    .restart local v35    # "radius":I
    .restart local v37    # "mRadius":I
    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 152
    iget-object v7, v0, Lorg/achartengine/chart/PieChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    const/16 v16, 0x0

    move-object/from16 v5, p0

    move-object/from16 v6, p1

    move-object/from16 v8, v27

    move/from16 v9, v22

    move/from16 v10, v24

    move/from16 v11, p3

    move/from16 v12, p4

    move/from16 v13, p5

    move/from16 v14, v28

    move-object/from16 v15, p6

    invoke-virtual/range {v5 .. v16}, Lorg/achartengine/chart/PieChart;->drawLegend(Landroid/graphics/Canvas;Lorg/achartengine/renderer/DefaultRenderer;[Ljava/lang/String;IIIIIILandroid/graphics/Paint;Z)I

    .line 153
    move/from16 v7, p2

    move/from16 v8, p3

    move/from16 v9, p4

    move-object/from16 v10, p6

    invoke-virtual/range {v5 .. v10}, Lorg/achartengine/chart/PieChart;->drawTitle(Landroid/graphics/Canvas;IIILandroid/graphics/Paint;)V

    .line 154
    return-void
.end method

.method public getSeriesAndPointForScreenCoordinate(Lorg/achartengine/model/Point;)Lorg/achartengine/model/SeriesSelection;
    .locals 1
    .param p1, "screenPoint"    # Lorg/achartengine/model/Point;

    .line 157
    iget-object v0, p0, Lorg/achartengine/chart/PieChart;->mPieMapper:Lorg/achartengine/chart/PieMapper;

    invoke-virtual {v0, p1}, Lorg/achartengine/chart/PieMapper;->getSeriesAndPointForScreenCoordinate(Lorg/achartengine/model/Point;)Lorg/achartengine/model/SeriesSelection;

    move-result-object v0

    return-object v0
.end method
