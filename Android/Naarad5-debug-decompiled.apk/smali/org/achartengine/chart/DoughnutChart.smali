.class public Lorg/achartengine/chart/DoughnutChart;
.super Lorg/achartengine/chart/RoundChart;
.source "DoughnutChart.java"


# instance fields
.field private mDataset:Lorg/achartengine/model/MultipleCategorySeries;

.field private mStep:I


# direct methods
.method public constructor <init>(Lorg/achartengine/model/MultipleCategorySeries;Lorg/achartengine/renderer/DefaultRenderer;)V
    .locals 1
    .param p1, "dataset"    # Lorg/achartengine/model/MultipleCategorySeries;
    .param p2, "renderer"    # Lorg/achartengine/renderer/DefaultRenderer;

    .line 47
    const/4 v0, 0x0

    invoke-direct {p0, v0, p2}, Lorg/achartengine/chart/RoundChart;-><init>(Lorg/achartengine/model/CategorySeries;Lorg/achartengine/renderer/DefaultRenderer;)V

    .line 48
    iput-object p1, p0, Lorg/achartengine/chart/DoughnutChart;->mDataset:Lorg/achartengine/model/MultipleCategorySeries;

    .line 49
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;IIIILandroid/graphics/Paint;)V
    .locals 42
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "width"    # I
    .param p5, "height"    # I
    .param p6, "paint"    # Landroid/graphics/Paint;

    .line 63
    move-object/from16 v14, p0

    move-object/from16 v12, p6

    iget-object v0, v14, Lorg/achartengine/chart/DoughnutChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->isAntialiasing()Z

    move-result v0

    invoke-virtual {v12, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 64
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v12, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 65
    iget-object v0, v14, Lorg/achartengine/chart/DoughnutChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->getLabelsTextSize()F

    move-result v0

    invoke-virtual {v12, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 66
    iget-object v0, v14, Lorg/achartengine/chart/DoughnutChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    div-int/lit8 v1, p5, 0x5

    const/4 v2, 0x0

    invoke-virtual {v14, v0, v1, v2}, Lorg/achartengine/chart/DoughnutChart;->getLegendSize(Lorg/achartengine/renderer/DefaultRenderer;IF)I

    move-result v13

    .line 67
    .local v13, "legendSize":I
    move/from16 v23, p2

    .line 68
    .local v23, "left":I
    move/from16 v24, p3

    .line 69
    .local v24, "top":I
    add-int v25, p2, p4

    .line 70
    .local v25, "right":I
    iget-object v0, v14, Lorg/achartengine/chart/DoughnutChart;->mDataset:Lorg/achartengine/model/MultipleCategorySeries;

    invoke-virtual {v0}, Lorg/achartengine/model/MultipleCategorySeries;->getCategoriesCount()I

    move-result v15

    .line 71
    .local v15, "cLength":I
    new-array v11, v15, [Ljava/lang/String;

    .line 72
    .local v11, "categories":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "category":I
    :goto_0
    if-ge v0, v15, :cond_0

    .line 73
    iget-object v1, v14, Lorg/achartengine/chart/DoughnutChart;->mDataset:Lorg/achartengine/model/MultipleCategorySeries;

    invoke-virtual {v1, v0}, Lorg/achartengine/model/MultipleCategorySeries;->getCategory(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v11, v0

    .line 72
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 75
    .end local v0    # "category":I
    :cond_0
    iget-object v0, v14, Lorg/achartengine/chart/DoughnutChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->isFitLegend()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 76
    iget-object v2, v14, Lorg/achartengine/chart/DoughnutChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    const/16 v16, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object v3, v11

    move/from16 v4, v23

    move/from16 v5, v25

    move/from16 v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move v9, v13

    move-object/from16 v10, p6

    move-object/from16 v26, v11

    .end local v11    # "categories":[Ljava/lang/String;
    .local v26, "categories":[Ljava/lang/String;
    move/from16 v11, v16

    invoke-virtual/range {v0 .. v11}, Lorg/achartengine/chart/DoughnutChart;->drawLegend(Landroid/graphics/Canvas;Lorg/achartengine/renderer/DefaultRenderer;[Ljava/lang/String;IIIIIILandroid/graphics/Paint;Z)I

    move-result v0

    move/from16 v27, v0

    .end local v13    # "legendSize":I
    .local v0, "legendSize":I
    goto :goto_1

    .line 75
    .end local v0    # "legendSize":I
    .end local v26    # "categories":[Ljava/lang/String;
    .restart local v11    # "categories":[Ljava/lang/String;
    .restart local v13    # "legendSize":I
    :cond_1
    move-object/from16 v26, v11

    .end local v11    # "categories":[Ljava/lang/String;
    .restart local v26    # "categories":[Ljava/lang/String;
    move/from16 v27, v13

    .line 80
    .end local v13    # "legendSize":I
    .local v27, "legendSize":I
    :goto_1
    add-int v0, p3, p5

    sub-int v28, v0, v27

    .line 81
    .local v28, "bottom":I
    iget-object v1, v14, Lorg/achartengine/chart/DoughnutChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object/from16 v0, p0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move-object/from16 v7, p6

    invoke-virtual/range {v0 .. v9}, Lorg/achartengine/chart/DoughnutChart;->drawBackground(Lorg/achartengine/renderer/DefaultRenderer;Landroid/graphics/Canvas;IIIILandroid/graphics/Paint;ZI)V

    .line 82
    const/4 v0, 0x7

    iput v0, v14, Lorg/achartengine/chart/DoughnutChart;->mStep:I

    .line 84
    sub-int v0, v25, v23

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    sub-int v1, v28, v24

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v11

    .line 85
    .local v11, "mRadius":I
    const-wide v0, 0x3fd6666666666666L    # 0.35

    iget-object v2, v14, Lorg/achartengine/chart/DoughnutChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v2}, Lorg/achartengine/renderer/DefaultRenderer;->getScale()F

    move-result v2

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v29, v2, v0

    .line 86
    .local v29, "rCoef":D
    const-wide v0, 0x3fc999999999999aL    # 0.2

    int-to-double v2, v15

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    div-double v31, v0, v2

    .line 87
    .local v31, "decCoef":D
    int-to-double v0, v11

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v29

    double-to-int v0, v0

    .line 88
    .local v0, "radius":I
    iget v1, v14, Lorg/achartengine/chart/DoughnutChart;->mCenterX:I

    const v2, 0x7fffffff

    if-ne v1, v2, :cond_2

    .line 89
    add-int v1, v23, v25

    div-int/lit8 v1, v1, 0x2

    iput v1, v14, Lorg/achartengine/chart/DoughnutChart;->mCenterX:I

    .line 91
    :cond_2
    iget v1, v14, Lorg/achartengine/chart/DoughnutChart;->mCenterY:I

    if-ne v1, v2, :cond_3

    .line 92
    add-int v1, v28, v24

    div-int/lit8 v1, v1, 0x2

    iput v1, v14, Lorg/achartengine/chart/DoughnutChart;->mCenterY:I

    .line 94
    :cond_3
    int-to-float v1, v0

    const v2, 0x3f666666    # 0.9f

    mul-float v1, v1, v2

    .line 95
    .local v1, "shortRadius":F
    int-to-float v2, v0

    const v3, 0x3f8ccccd    # 1.1f

    mul-float v33, v2, v3

    .line 96
    .local v33, "longRadius":F
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 97
    .local v4, "prevLabelsBounds":Ljava/util/List;, "Ljava/util/List<Landroid/graphics/RectF;>;"
    const/4 v2, 0x0

    move v8, v0

    move v7, v1

    move v9, v2

    .end local v0    # "radius":I
    .end local v1    # "shortRadius":F
    .local v7, "shortRadius":F
    .local v8, "radius":I
    .local v9, "category":I
    :goto_2
    if-ge v9, v15, :cond_7

    .line 98
    iget-object v0, v14, Lorg/achartengine/chart/DoughnutChart;->mDataset:Lorg/achartengine/model/MultipleCategorySeries;

    invoke-virtual {v0, v9}, Lorg/achartengine/model/MultipleCategorySeries;->getItemCount(I)I

    move-result v1

    .line 99
    .local v1, "sLength":I
    const-wide/16 v2, 0x0

    .line 100
    .local v2, "total":D
    new-array v0, v1, [Ljava/lang/String;

    .line 101
    .local v0, "titles":[Ljava/lang/String;
    const/4 v5, 0x0

    move-wide/from16 v34, v2

    .end local v2    # "total":D
    .local v5, "i":I
    .local v34, "total":D
    :goto_3
    if-ge v5, v1, :cond_4

    .line 102
    iget-object v2, v14, Lorg/achartengine/chart/DoughnutChart;->mDataset:Lorg/achartengine/model/MultipleCategorySeries;

    invoke-virtual {v2, v9}, Lorg/achartengine/model/MultipleCategorySeries;->getValues(I)[D

    move-result-object v2

    aget-wide v16, v2, v5

    add-double v34, v34, v16

    .line 103
    iget-object v2, v14, Lorg/achartengine/chart/DoughnutChart;->mDataset:Lorg/achartengine/model/MultipleCategorySeries;

    invoke-virtual {v2, v9}, Lorg/achartengine/model/MultipleCategorySeries;->getTitles(I)[Ljava/lang/String;

    move-result-object v2

    aget-object v2, v2, v5

    aput-object v2, v0, v5

    .line 101
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 105
    .end local v5    # "i":I
    :cond_4
    iget-object v2, v14, Lorg/achartengine/chart/DoughnutChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v2}, Lorg/achartengine/renderer/DefaultRenderer;->getStartAngle()F

    move-result v2

    .line 106
    .local v2, "currentAngle":F
    new-instance v3, Landroid/graphics/RectF;

    iget v5, v14, Lorg/achartengine/chart/DoughnutChart;->mCenterX:I

    sub-int/2addr v5, v8

    int-to-float v5, v5

    iget v6, v14, Lorg/achartengine/chart/DoughnutChart;->mCenterY:I

    sub-int/2addr v6, v8

    int-to-float v6, v6

    iget v10, v14, Lorg/achartengine/chart/DoughnutChart;->mCenterX:I

    add-int/2addr v10, v8

    int-to-float v10, v10

    iget v13, v14, Lorg/achartengine/chart/DoughnutChart;->mCenterY:I

    add-int/2addr v13, v8

    int-to-float v13, v13

    invoke-direct {v3, v5, v6, v10, v13}, Landroid/graphics/RectF;-><init>(FFFF)V

    move-object/from16 v18, v3

    .line 108
    .local v18, "oval":Landroid/graphics/RectF;
    const/4 v3, 0x0

    move/from16 v36, v2

    move v13, v3

    .end local v2    # "currentAngle":F
    .local v13, "i":I
    .local v36, "currentAngle":F
    :goto_4
    if-ge v13, v1, :cond_5

    .line 109
    iget-object v2, v14, Lorg/achartengine/chart/DoughnutChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v2, v13}, Lorg/achartengine/renderer/DefaultRenderer;->getSeriesRendererAt(I)Lorg/achartengine/renderer/SimpleSeriesRenderer;

    move-result-object v2

    invoke-virtual {v2}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getColor()I

    move-result v2

    invoke-virtual {v12, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 110
    iget-object v2, v14, Lorg/achartengine/chart/DoughnutChart;->mDataset:Lorg/achartengine/model/MultipleCategorySeries;

    invoke-virtual {v2, v9}, Lorg/achartengine/model/MultipleCategorySeries;->getValues(I)[D

    move-result-object v2

    aget-wide v5, v2, v13

    double-to-float v6, v5

    .line 111
    .local v6, "value":F
    float-to-double v2, v6

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    div-double v2, v2, v34

    const-wide v16, 0x4076800000000000L    # 360.0

    mul-double v2, v2, v16

    double-to-float v5, v2

    .local v5, "angle":F
    move v10, v5

    .line 112
    const/16 v21, 0x1

    move-object/from16 v17, p1

    move/from16 v19, v36

    move/from16 v20, v5

    move-object/from16 v22, p6

    invoke-virtual/range {v17 .. v22}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 113
    iget-object v2, v14, Lorg/achartengine/chart/DoughnutChart;->mDataset:Lorg/achartengine/model/MultipleCategorySeries;

    invoke-virtual {v2, v9}, Lorg/achartengine/model/MultipleCategorySeries;->getTitles(I)[Ljava/lang/String;

    move-result-object v2

    aget-object v2, v2, v13

    iget-object v3, v14, Lorg/achartengine/chart/DoughnutChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    move-object/from16 v17, v0

    .end local v0    # "titles":[Ljava/lang/String;
    .local v17, "titles":[Ljava/lang/String;
    iget v0, v14, Lorg/achartengine/chart/DoughnutChart;->mCenterX:I

    move/from16 v19, v5

    .end local v5    # "angle":F
    .local v19, "angle":F
    move v5, v0

    iget v0, v14, Lorg/achartengine/chart/DoughnutChart;->mCenterY:I

    move/from16 v20, v6

    .end local v6    # "value":F
    .local v20, "value":F
    move v6, v0

    iget-object v0, v14, Lorg/achartengine/chart/DoughnutChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->getLabelsColor()I

    move-result v0

    move/from16 v21, v13

    .end local v13    # "i":I
    .local v21, "i":I
    move v13, v0

    const/4 v0, 0x1

    move/from16 v22, v15

    .end local v15    # "cLength":I
    .local v22, "cLength":I
    move v15, v0

    const/16 v16, 0x0

    move-object/from16 v0, p0

    move/from16 v37, v1

    .end local v1    # "sLength":I
    .local v37, "sLength":I
    move-object/from16 v1, p1

    move/from16 v38, v7

    .end local v7    # "shortRadius":F
    .local v38, "shortRadius":F
    move/from16 v39, v8

    .end local v8    # "radius":I
    .local v39, "radius":I
    move/from16 v8, v33

    move/from16 v40, v9

    .end local v9    # "category":I
    .local v40, "category":I
    move/from16 v9, v36

    move/from16 v41, v11

    .end local v11    # "mRadius":I
    .local v41, "mRadius":I
    move/from16 v11, v23

    move/from16 v12, v25

    move-object/from16 v14, p6

    invoke-virtual/range {v0 .. v16}, Lorg/achartengine/chart/DoughnutChart;->drawLabel(Landroid/graphics/Canvas;Ljava/lang/String;Lorg/achartengine/renderer/DefaultRenderer;Ljava/util/List;IIFFFFIIILandroid/graphics/Paint;ZZ)V

    .line 116
    add-float v36, v36, v19

    .line 108
    .end local v19    # "angle":F
    .end local v20    # "value":F
    add-int/lit8 v13, v21, 0x1

    move-object/from16 v14, p0

    move-object/from16 v12, p6

    move-object/from16 v0, v17

    move/from16 v15, v22

    move/from16 v1, v37

    move/from16 v8, v39

    move/from16 v9, v40

    move/from16 v11, v41

    .end local v21    # "i":I
    .restart local v13    # "i":I
    goto/16 :goto_4

    .end local v17    # "titles":[Ljava/lang/String;
    .end local v22    # "cLength":I
    .end local v37    # "sLength":I
    .end local v38    # "shortRadius":F
    .end local v39    # "radius":I
    .end local v40    # "category":I
    .end local v41    # "mRadius":I
    .restart local v0    # "titles":[Ljava/lang/String;
    .restart local v1    # "sLength":I
    .restart local v7    # "shortRadius":F
    .restart local v8    # "radius":I
    .restart local v9    # "category":I
    .restart local v11    # "mRadius":I
    .restart local v15    # "cLength":I
    :cond_5
    move-object/from16 v17, v0

    move/from16 v37, v1

    move/from16 v38, v7

    move/from16 v39, v8

    move/from16 v40, v9

    move/from16 v41, v11

    move/from16 v21, v13

    move/from16 v22, v15

    .line 118
    .end local v0    # "titles":[Ljava/lang/String;
    .end local v1    # "sLength":I
    .end local v7    # "shortRadius":F
    .end local v8    # "radius":I
    .end local v9    # "category":I
    .end local v11    # "mRadius":I
    .end local v13    # "i":I
    .end local v15    # "cLength":I
    .restart local v17    # "titles":[Ljava/lang/String;
    .restart local v22    # "cLength":I
    .restart local v37    # "sLength":I
    .restart local v38    # "shortRadius":F
    .restart local v39    # "radius":I
    .restart local v40    # "category":I
    .restart local v41    # "mRadius":I
    move/from16 v0, v39

    .end local v39    # "radius":I
    .local v0, "radius":I
    int-to-double v1, v0

    move/from16 v3, v41

    .end local v41    # "mRadius":I
    .local v3, "mRadius":I
    int-to-double v5, v3

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v5, v5, v31

    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v1, v5

    double-to-int v0, v1

    .line 119
    move/from16 v1, v38

    .end local v38    # "shortRadius":F
    .local v1, "shortRadius":F
    float-to-double v5, v1

    int-to-double v7, v3

    invoke-static {v7, v8}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v7, v7, v31

    const-wide/high16 v9, 0x4000000000000000L    # 2.0

    sub-double/2addr v7, v9

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v5, v7

    double-to-float v1, v5

    .line 120
    move-object/from16 v2, p0

    iget-object v5, v2, Lorg/achartengine/chart/DoughnutChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v5}, Lorg/achartengine/renderer/DefaultRenderer;->getBackgroundColor()I

    move-result v5

    const/4 v11, -0x1

    if-eqz v5, :cond_6

    .line 121
    iget-object v5, v2, Lorg/achartengine/chart/DoughnutChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v5}, Lorg/achartengine/renderer/DefaultRenderer;->getBackgroundColor()I

    move-result v5

    move-object/from16 v15, p6

    invoke-virtual {v15, v5}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_5

    .line 123
    :cond_6
    move-object/from16 v15, p6

    invoke-virtual {v15, v11}, Landroid/graphics/Paint;->setColor(I)V

    .line 125
    :goto_5
    sget-object v5, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v15, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 126
    new-instance v6, Landroid/graphics/RectF;

    iget v5, v2, Lorg/achartengine/chart/DoughnutChart;->mCenterX:I

    sub-int/2addr v5, v0

    int-to-float v5, v5

    iget v7, v2, Lorg/achartengine/chart/DoughnutChart;->mCenterY:I

    sub-int/2addr v7, v0

    int-to-float v7, v7

    iget v8, v2, Lorg/achartengine/chart/DoughnutChart;->mCenterX:I

    add-int/2addr v8, v0

    int-to-float v8, v8

    iget v9, v2, Lorg/achartengine/chart/DoughnutChart;->mCenterY:I

    add-int/2addr v9, v0

    int-to-float v9, v9

    invoke-direct {v6, v5, v7, v8, v9}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 127
    .end local v18    # "oval":Landroid/graphics/RectF;
    .local v6, "oval":Landroid/graphics/RectF;
    const/4 v7, 0x0

    const/high16 v8, 0x43b40000    # 360.0f

    const/4 v9, 0x1

    move-object/from16 v5, p1

    move-object/from16 v10, p6

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 128
    nop

    .end local v6    # "oval":Landroid/graphics/RectF;
    .end local v17    # "titles":[Ljava/lang/String;
    .end local v34    # "total":D
    .end local v36    # "currentAngle":F
    .end local v37    # "sLength":I
    add-int/lit8 v8, v0, -0x1

    .line 97
    .end local v0    # "radius":I
    .restart local v8    # "radius":I
    add-int/lit8 v9, v40, 0x1

    move v7, v1

    move-object v14, v2

    move v11, v3

    move-object v12, v15

    move/from16 v15, v22

    .end local v40    # "category":I
    .restart local v9    # "category":I
    goto/16 :goto_2

    .end local v1    # "shortRadius":F
    .end local v3    # "mRadius":I
    .end local v22    # "cLength":I
    .restart local v7    # "shortRadius":F
    .restart local v11    # "mRadius":I
    .restart local v15    # "cLength":I
    :cond_7
    move v1, v7

    move v0, v8

    move/from16 v40, v9

    move v3, v11

    move-object v2, v14

    move/from16 v22, v15

    move-object v15, v12

    .line 130
    .end local v7    # "shortRadius":F
    .end local v8    # "radius":I
    .end local v9    # "category":I
    .end local v11    # "mRadius":I
    .end local v15    # "cLength":I
    .restart local v0    # "radius":I
    .restart local v1    # "shortRadius":F
    .restart local v3    # "mRadius":I
    .restart local v22    # "cLength":I
    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 131
    iget-object v7, v2, Lorg/achartengine/chart/DoughnutChart;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    const/16 v16, 0x0

    move-object/from16 v5, p0

    move-object/from16 v6, p1

    move-object/from16 v8, v26

    move/from16 v9, v23

    move/from16 v10, v25

    move/from16 v11, p3

    move/from16 v12, p4

    move/from16 v13, p5

    move/from16 v14, v27

    move-object/from16 v15, p6

    invoke-virtual/range {v5 .. v16}, Lorg/achartengine/chart/DoughnutChart;->drawLegend(Landroid/graphics/Canvas;Lorg/achartengine/renderer/DefaultRenderer;[Ljava/lang/String;IIIIIILandroid/graphics/Paint;Z)I

    .line 133
    move/from16 v7, p2

    move/from16 v8, p3

    move/from16 v9, p4

    move-object/from16 v10, p6

    invoke-virtual/range {v5 .. v10}, Lorg/achartengine/chart/DoughnutChart;->drawTitle(Landroid/graphics/Canvas;IIILandroid/graphics/Paint;)V

    .line 134
    return-void
.end method

.method public drawLegendShape(Landroid/graphics/Canvas;Lorg/achartengine/renderer/SimpleSeriesRenderer;FFILandroid/graphics/Paint;)V
    .locals 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "renderer"    # Lorg/achartengine/renderer/SimpleSeriesRenderer;
    .param p3, "x"    # F
    .param p4, "y"    # F
    .param p5, "seriesIndex"    # I
    .param p6, "paint"    # Landroid/graphics/Paint;

    .line 158
    iget v0, p0, Lorg/achartengine/chart/DoughnutChart;->mStep:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/achartengine/chart/DoughnutChart;->mStep:I

    .line 159
    const/high16 v0, 0x41200000    # 10.0f

    add-float/2addr v0, p3

    iget v1, p0, Lorg/achartengine/chart/DoughnutChart;->mStep:I

    int-to-float v2, v1

    sub-float/2addr v0, v2

    int-to-float v1, v1

    invoke-virtual {p1, v0, p4, v1, p6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 160
    return-void
.end method

.method public getLegendShapeWidth(I)I
    .locals 1
    .param p1, "seriesIndex"    # I

    .line 143
    const/16 v0, 0xa

    return v0
.end method
