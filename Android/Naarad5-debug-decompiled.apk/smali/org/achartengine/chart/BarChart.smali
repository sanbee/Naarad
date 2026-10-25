.class public Lorg/achartengine/chart/BarChart;
.super Lorg/achartengine/chart/XYChart;
.source "BarChart.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/achartengine/chart/BarChart$Type;
    }
.end annotation


# static fields
.field private static final SHAPE_WIDTH:I = 0xc

.field public static final TYPE:Ljava/lang/String; = "Bar"


# instance fields
.field protected mType:Lorg/achartengine/chart/BarChart$Type;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 51
    invoke-direct {p0}, Lorg/achartengine/chart/XYChart;-><init>()V

    .line 42
    sget-object v0, Lorg/achartengine/chart/BarChart$Type;->DEFAULT:Lorg/achartengine/chart/BarChart$Type;

    iput-object v0, p0, Lorg/achartengine/chart/BarChart;->mType:Lorg/achartengine/chart/BarChart$Type;

    .line 52
    return-void
.end method

.method constructor <init>(Lorg/achartengine/chart/BarChart$Type;)V
    .locals 1
    .param p1, "type"    # Lorg/achartengine/chart/BarChart$Type;

    .line 54
    invoke-direct {p0}, Lorg/achartengine/chart/XYChart;-><init>()V

    .line 42
    sget-object v0, Lorg/achartengine/chart/BarChart$Type;->DEFAULT:Lorg/achartengine/chart/BarChart$Type;

    iput-object v0, p0, Lorg/achartengine/chart/BarChart;->mType:Lorg/achartengine/chart/BarChart$Type;

    .line 55
    iput-object p1, p0, Lorg/achartengine/chart/BarChart;->mType:Lorg/achartengine/chart/BarChart$Type;

    .line 56
    return-void
.end method

.method public constructor <init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Lorg/achartengine/chart/BarChart$Type;)V
    .locals 1
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .param p3, "type"    # Lorg/achartengine/chart/BarChart$Type;

    .line 66
    invoke-direct {p0, p1, p2}, Lorg/achartengine/chart/XYChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 42
    sget-object v0, Lorg/achartengine/chart/BarChart$Type;->DEFAULT:Lorg/achartengine/chart/BarChart$Type;

    iput-object v0, p0, Lorg/achartengine/chart/BarChart;->mType:Lorg/achartengine/chart/BarChart$Type;

    .line 67
    iput-object p3, p0, Lorg/achartengine/chart/BarChart;->mType:Lorg/achartengine/chart/BarChart$Type;

    .line 68
    return-void
.end method

.method private drawBar(Landroid/graphics/Canvas;FFFFIILandroid/graphics/Paint;)V
    .locals 21
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "xMin"    # F
    .param p3, "yMin"    # F
    .param p4, "xMax"    # F
    .param p5, "yMax"    # F
    .param p6, "scale"    # I
    .param p7, "seriesIndex"    # I
    .param p8, "paint"    # Landroid/graphics/Paint;

    .line 157
    move-object/from16 v0, p0

    move/from16 v1, p3

    move/from16 v2, p5

    move/from16 v3, p6

    move-object/from16 v10, p8

    iget-object v4, v0, Lorg/achartengine/chart/BarChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v11, p7

    invoke-virtual {v4, v11}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getSeriesRendererAt(I)Lorg/achartengine/renderer/SimpleSeriesRenderer;

    move-result-object v12

    .line 158
    .local v12, "renderer":Lorg/achartengine/renderer/SimpleSeriesRenderer;
    invoke-virtual {v12}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->isGradientEnabled()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 159
    const/4 v13, 0x2

    new-array v4, v13, [D

    const-wide/16 v5, 0x0

    const/4 v14, 0x0

    aput-wide v5, v4, v14

    invoke-virtual {v12}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getGradientStopValue()D

    move-result-wide v7

    const/4 v15, 0x1

    aput-wide v7, v4, v15

    invoke-virtual {v0, v4, v3}, Lorg/achartengine/chart/BarChart;->toScreenPoint([DI)[D

    move-result-object v4

    aget-wide v7, v4, v15

    double-to-float v9, v7

    .line 160
    .local v9, "minY":F
    new-array v4, v13, [D

    aput-wide v5, v4, v14

    invoke-virtual {v12}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getGradientStartValue()D

    move-result-wide v5

    aput-wide v5, v4, v15

    invoke-virtual {v0, v4, v3}, Lorg/achartengine/chart/BarChart;->toScreenPoint([DI)[D

    move-result-object v4

    aget-wide v5, v4, v15

    double-to-float v8, v5

    .line 162
    .local v8, "maxY":F
    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v4

    invoke-static {v9, v4}, Ljava/lang/Math;->max(FF)F

    move-result v16

    .line 163
    .local v16, "gradientMinY":F
    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v4

    invoke-static {v8, v4}, Ljava/lang/Math;->min(FF)F

    move-result v17

    .line 164
    .local v17, "gradientMaxY":F
    invoke-virtual {v12}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getGradientStopColor()I

    move-result v7

    .line 165
    .local v7, "gradientMinColor":I
    invoke-virtual {v12}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getGradientStartColor()I

    move-result v6

    .line 166
    .local v6, "gradientMaxColor":I
    move/from16 v18, v6

    .line 167
    .local v18, "gradientStartColor":I
    move/from16 v19, v7

    .line 169
    .local v19, "gradientStopColor":I
    cmpg-float v4, v1, v9

    if-gez v4, :cond_0

    .line 170
    invoke-virtual {v10, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 171
    invoke-static/range {p2 .. p2}, Ljava/lang/Math;->round(F)I

    move-result v4

    int-to-float v5, v4

    invoke-static/range {p3 .. p3}, Ljava/lang/Math;->round(F)I

    move-result v4

    int-to-float v4, v4

    invoke-static/range {p4 .. p4}, Ljava/lang/Math;->round(F)I

    move-result v15

    int-to-float v15, v15

    invoke-static/range {v16 .. v16}, Ljava/lang/Math;->round(F)I

    move-result v14

    int-to-float v14, v14

    move/from16 v20, v4

    move-object/from16 v4, p1

    move v13, v6

    .end local v6    # "gradientMaxColor":I
    .local v13, "gradientMaxColor":I
    move/from16 v6, v20

    move v3, v7

    .end local v7    # "gradientMinColor":I
    .local v3, "gradientMinColor":I
    move v7, v15

    move v15, v8

    .end local v8    # "maxY":F
    .local v15, "maxY":F
    move v8, v14

    move v14, v9

    .end local v9    # "minY":F
    .local v14, "minY":F
    move-object/from16 v9, p8

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto :goto_0

    .line 174
    .end local v3    # "gradientMinColor":I
    .end local v13    # "gradientMaxColor":I
    .end local v14    # "minY":F
    .end local v15    # "maxY":F
    .restart local v6    # "gradientMaxColor":I
    .restart local v7    # "gradientMinColor":I
    .restart local v8    # "maxY":F
    .restart local v9    # "minY":F
    :cond_0
    move v13, v6

    move v3, v7

    move v15, v8

    move v14, v9

    .end local v6    # "gradientMaxColor":I
    .end local v7    # "gradientMinColor":I
    .end local v8    # "maxY":F
    .end local v9    # "minY":F
    .restart local v3    # "gradientMinColor":I
    .restart local v13    # "gradientMaxColor":I
    .restart local v14    # "minY":F
    .restart local v15    # "maxY":F
    sub-float v8, v15, v16

    sub-float v4, v15, v14

    div-float/2addr v8, v4

    invoke-direct {v0, v3, v13, v8}, Lorg/achartengine/chart/BarChart;->getGradientPartialColor(IIF)I

    move-result v19

    .line 177
    :goto_0
    cmpl-float v4, v2, v15

    if-lez v4, :cond_1

    .line 178
    invoke-virtual {v10, v13}, Landroid/graphics/Paint;->setColor(I)V

    .line 179
    invoke-static/range {p2 .. p2}, Ljava/lang/Math;->round(F)I

    move-result v4

    int-to-float v5, v4

    invoke-static/range {v17 .. v17}, Ljava/lang/Math;->round(F)I

    move-result v4

    int-to-float v6, v4

    invoke-static/range {p4 .. p4}, Ljava/lang/Math;->round(F)I

    move-result v4

    int-to-float v7, v4

    invoke-static/range {p5 .. p5}, Ljava/lang/Math;->round(F)I

    move-result v4

    int-to-float v8, v4

    move-object/from16 v4, p1

    move-object/from16 v9, p8

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto :goto_1

    .line 182
    :cond_1
    sub-float v4, v17, v14

    sub-float v8, v15, v14

    div-float/2addr v4, v8

    invoke-direct {v0, v13, v3, v4}, Lorg/achartengine/chart/BarChart;->getGradientPartialColor(IIF)I

    move-result v18

    .line 185
    :goto_1
    new-instance v4, Landroid/graphics/drawable/GradientDrawable;

    sget-object v5, Landroid/graphics/drawable/GradientDrawable$Orientation;->BOTTOM_TOP:Landroid/graphics/drawable/GradientDrawable$Orientation;

    const/4 v6, 0x2

    new-array v6, v6, [I

    const/4 v7, 0x0

    aput v18, v6, v7

    const/4 v7, 0x1

    aput v19, v6, v7

    invoke-direct {v4, v5, v6}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 187
    .local v4, "gradient":Landroid/graphics/drawable/GradientDrawable;
    invoke-static/range {p2 .. p2}, Ljava/lang/Math;->round(F)I

    move-result v5

    invoke-static/range {v16 .. v16}, Ljava/lang/Math;->round(F)I

    move-result v6

    invoke-static/range {p4 .. p4}, Ljava/lang/Math;->round(F)I

    move-result v7

    invoke-static/range {v17 .. v17}, Ljava/lang/Math;->round(F)I

    move-result v8

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/graphics/drawable/GradientDrawable;->setBounds(IIII)V

    .line 189
    move-object/from16 v9, p1

    invoke-virtual {v4, v9}, Landroid/graphics/drawable/GradientDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 190
    .end local v3    # "gradientMinColor":I
    .end local v4    # "gradient":Landroid/graphics/drawable/GradientDrawable;
    .end local v13    # "gradientMaxColor":I
    .end local v14    # "minY":F
    .end local v15    # "maxY":F
    .end local v16    # "gradientMinY":F
    .end local v17    # "gradientMaxY":F
    .end local v18    # "gradientStartColor":I
    .end local v19    # "gradientStopColor":I
    goto :goto_3

    .line 191
    :cond_2
    move-object/from16 v9, p1

    sub-float v3, v1, v2

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    const/high16 v4, 0x3f800000    # 1.0f

    cmpg-float v3, v3, v4

    if-gez v3, :cond_4

    .line 192
    cmpg-float v3, v1, v2

    if-gez v3, :cond_3

    .line 193
    add-float v2, v1, v4

    .end local p5    # "yMax":F
    .local v2, "yMax":F
    goto :goto_2

    .line 195
    .end local v2    # "yMax":F
    .restart local p5    # "yMax":F
    :cond_3
    sub-float v2, v1, v4

    .line 198
    .end local p5    # "yMax":F
    .restart local v2    # "yMax":F
    :cond_4
    :goto_2
    invoke-static/range {p2 .. p2}, Ljava/lang/Math;->round(F)I

    move-result v3

    int-to-float v5, v3

    invoke-static/range {p3 .. p3}, Ljava/lang/Math;->round(F)I

    move-result v3

    int-to-float v6, v3

    invoke-static/range {p4 .. p4}, Ljava/lang/Math;->round(F)I

    move-result v3

    int-to-float v7, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v3

    int-to-float v8, v3

    move-object/from16 v4, p1

    move-object/from16 v9, p8

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 201
    :goto_3
    return-void
.end method

.method private getGradientPartialColor(IIF)I
    .locals 6
    .param p1, "minColor"    # I
    .param p2, "maxColor"    # I
    .param p3, "fraction"    # F

    .line 204
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    int-to-float v0, v0

    mul-float v0, v0, p3

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float v2, v1, p3

    invoke-static {p2}, Landroid/graphics/Color;->alpha(I)I

    move-result v3

    int-to-float v3, v3

    mul-float v2, v2, v3

    add-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 206
    .local v0, "alpha":I
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v2

    int-to-float v2, v2

    mul-float v2, v2, p3

    sub-float v3, v1, p3

    invoke-static {p2}, Landroid/graphics/Color;->red(I)I

    move-result v4

    int-to-float v4, v4

    mul-float v3, v3, v4

    add-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 207
    .local v2, "r":I
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v3

    int-to-float v3, v3

    mul-float v3, v3, p3

    sub-float v4, v1, p3

    invoke-static {p2}, Landroid/graphics/Color;->green(I)I

    move-result v5

    int-to-float v5, v5

    mul-float v4, v4, v5

    add-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    .line 208
    .local v3, "g":I
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v4

    int-to-float v4, v4

    mul-float v4, v4, p3

    sub-float/2addr v1, p3

    invoke-static {p2}, Landroid/graphics/Color;->blue(I)I

    move-result v5

    int-to-float v5, v5

    mul-float v1, v1, v5

    add-float/2addr v4, v1

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 209
    .local v1, "b":I
    invoke-static {v0, v2, v3, v1}, Landroid/graphics/Color;->argb(IIII)I

    move-result v4

    return v4
.end method


# virtual methods
.method protected clickableAreasForPoints(Ljava/util/List;Ljava/util/List;FII)[Lorg/achartengine/chart/ClickableArea;
    .locals 19
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

    .line 73
    .local p1, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .local p2, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    iget-object v4, v0, Lorg/achartengine/chart/BarChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    invoke-virtual {v4}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesCount()I

    move-result v4

    .line 74
    .local v4, "seriesNr":I
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v5

    .line 75
    .local v5, "length":I
    div-int/lit8 v6, v5, 0x2

    new-array v6, v6, [Lorg/achartengine/chart/ClickableArea;

    .line 76
    .local v6, "ret":[Lorg/achartengine/chart/ClickableArea;
    invoke-virtual {v0, v1, v5, v4}, Lorg/achartengine/chart/BarChart;->getHalfDiffX(Ljava/util/List;II)F

    move-result v7

    .line 77
    .local v7, "halfDiffX":F
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    if-ge v8, v5, :cond_1

    .line 78
    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v9

    .line 79
    .local v9, "x":F
    add-int/lit8 v10, v8, 0x1

    invoke-interface {v1, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Float;

    invoke-virtual {v10}, Ljava/lang/Float;->floatValue()F

    move-result v10

    .line 80
    .local v10, "y":F
    iget-object v11, v0, Lorg/achartengine/chart/BarChart;->mType:Lorg/achartengine/chart/BarChart$Type;

    sget-object v12, Lorg/achartengine/chart/BarChart$Type;->STACKED:Lorg/achartengine/chart/BarChart$Type;

    if-ne v11, v12, :cond_0

    .line 81
    div-int/lit8 v11, v8, 0x2

    new-instance v18, Lorg/achartengine/chart/ClickableArea;

    new-instance v13, Landroid/graphics/RectF;

    sub-float v12, v9, v7

    invoke-static {v10, v3}, Ljava/lang/Math;->min(FF)F

    move-result v14

    add-float v15, v9, v7

    invoke-static {v10, v3}, Ljava/lang/Math;->max(FF)F

    move-result v0

    invoke-direct {v13, v12, v14, v15, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v14

    add-int/lit8 v0, v8, 0x1

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v16

    move-object/from16 v12, v18

    invoke-direct/range {v12 .. v17}, Lorg/achartengine/chart/ClickableArea;-><init>(Landroid/graphics/RectF;DD)V

    aput-object v18, v6, v11

    goto :goto_1

    .line 84
    :cond_0
    int-to-float v0, v4

    mul-float v0, v0, v7

    sub-float v0, v9, v0

    mul-int/lit8 v11, p4, 0x2

    int-to-float v11, v11

    mul-float v11, v11, v7

    add-float/2addr v0, v11

    .line 85
    .local v0, "startX":F
    div-int/lit8 v11, v8, 0x2

    new-instance v18, Lorg/achartengine/chart/ClickableArea;

    new-instance v13, Landroid/graphics/RectF;

    invoke-static {v10, v3}, Ljava/lang/Math;->min(FF)F

    move-result v12

    const/high16 v14, 0x40000000    # 2.0f

    mul-float v14, v14, v7

    add-float/2addr v14, v0

    invoke-static {v10, v3}, Ljava/lang/Math;->max(FF)F

    move-result v15

    invoke-direct {v13, v0, v12, v14, v15}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Double;

    invoke-virtual {v12}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v14

    add-int/lit8 v12, v8, 0x1

    invoke-interface {v2, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Double;

    invoke-virtual {v12}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v16

    move-object/from16 v12, v18

    invoke-direct/range {v12 .. v17}, Lorg/achartengine/chart/ClickableArea;-><init>(Landroid/graphics/RectF;DD)V

    aput-object v18, v6, v11

    .line 77
    .end local v0    # "startX":F
    .end local v9    # "x":F
    .end local v10    # "y":F
    :goto_1
    add-int/lit8 v8, v8, 0x2

    move-object/from16 v0, p0

    goto/16 :goto_0

    .line 89
    .end local v8    # "i":I
    :cond_1
    return-object v6
.end method

.method protected drawBar(Landroid/graphics/Canvas;FFFFFIILandroid/graphics/Paint;)V
    .locals 14
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "xMin"    # F
    .param p3, "yMin"    # F
    .param p4, "xMax"    # F
    .param p5, "yMax"    # F
    .param p6, "halfDiffX"    # F
    .param p7, "seriesNr"    # I
    .param p8, "seriesIndex"    # I
    .param p9, "paint"    # Landroid/graphics/Paint;

    .line 134
    move-object v9, p0

    move/from16 v10, p8

    iget-object v0, v9, Lorg/achartengine/chart/BarChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    invoke-virtual {v0, v10}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesAt(I)Lorg/achartengine/model/XYSeries;

    move-result-object v0

    invoke-virtual {v0}, Lorg/achartengine/model/XYSeries;->getScaleNumber()I

    move-result v11

    .line 135
    .local v11, "scale":I
    iget-object v0, v9, Lorg/achartengine/chart/BarChart;->mType:Lorg/achartengine/chart/BarChart$Type;

    sget-object v1, Lorg/achartengine/chart/BarChart$Type;->STACKED:Lorg/achartengine/chart/BarChart$Type;

    if-ne v0, v1, :cond_0

    .line 136
    sub-float v2, p2, p6

    add-float v4, p4, p6

    move-object v0, p0

    move-object v1, p1

    move/from16 v3, p5

    move/from16 v5, p3

    move v6, v11

    move/from16 v7, p8

    move-object/from16 v8, p9

    invoke-direct/range {v0 .. v8}, Lorg/achartengine/chart/BarChart;->drawBar(Landroid/graphics/Canvas;FFFFIILandroid/graphics/Paint;)V

    move/from16 v12, p7

    goto :goto_0

    .line 138
    :cond_0
    move/from16 v12, p7

    int-to-float v0, v12

    mul-float v0, v0, p6

    sub-float v0, p2, v0

    mul-int/lit8 v1, v10, 0x2

    int-to-float v1, v1

    mul-float v1, v1, p6

    add-float v13, v0, v1

    .line 139
    .local v13, "startX":F
    const/high16 v0, 0x40000000    # 2.0f

    mul-float v0, v0, p6

    add-float v4, v13, v0

    move-object v0, p0

    move-object v1, p1

    move v2, v13

    move/from16 v3, p5

    move/from16 v5, p3

    move v6, v11

    move/from16 v7, p8

    move-object/from16 v8, p9

    invoke-direct/range {v0 .. v8}, Lorg/achartengine/chart/BarChart;->drawBar(Landroid/graphics/Canvas;FFFFIILandroid/graphics/Paint;)V

    .line 141
    .end local v13    # "startX":F
    :goto_0
    return-void
.end method

.method protected drawChartValuesText(Landroid/graphics/Canvas;Lorg/achartengine/model/XYSeries;Lorg/achartengine/renderer/SimpleSeriesRenderer;Landroid/graphics/Paint;Ljava/util/List;II)V
    .locals 19
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

    .line 225
    .local p5, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    move-object/from16 v7, p0

    move-object/from16 v8, p5

    iget-object v0, v7, Lorg/achartengine/chart/BarChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    invoke-virtual {v0}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesCount()I

    move-result v9

    .line 226
    .local v9, "seriesNr":I
    invoke-interface/range {p5 .. p5}, Ljava/util/List;->size()I

    move-result v10

    .line 227
    .local v10, "length":I
    invoke-virtual {v7, v8, v10, v9}, Lorg/achartengine/chart/BarChart;->getHalfDiffX(Ljava/util/List;II)F

    move-result v11

    .line 228
    .local v11, "halfDiffX":F
    const/4 v0, 0x0

    move v12, v0

    .local v12, "i":I
    :goto_0
    if-ge v12, v10, :cond_3

    .line 229
    div-int/lit8 v0, v12, 0x2

    add-int v13, p7, v0

    .line 230
    .local v13, "index":I
    move-object/from16 v14, p2

    invoke-virtual {v14, v13}, Lorg/achartengine/model/XYSeries;->getY(I)D

    move-result-wide v5

    .line 231
    .local v5, "value":D
    invoke-virtual {v7, v5, v6}, Lorg/achartengine/chart/BarChart;->isNullValue(D)Z

    move-result v0

    if-nez v0, :cond_2

    .line 232
    invoke-interface {v8, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 233
    .local v0, "x":F
    iget-object v1, v7, Lorg/achartengine/chart/BarChart;->mType:Lorg/achartengine/chart/BarChart$Type;

    sget-object v2, Lorg/achartengine/chart/BarChart$Type;->DEFAULT:Lorg/achartengine/chart/BarChart$Type;

    if-ne v1, v2, :cond_0

    .line 234
    mul-int/lit8 v1, p6, 0x2

    int-to-float v1, v1

    mul-float v1, v1, v11

    int-to-float v2, v9

    const/high16 v3, 0x3fc00000    # 1.5f

    sub-float/2addr v2, v3

    mul-float v2, v2, v11

    sub-float/2addr v1, v2

    add-float/2addr v0, v1

    move v15, v0

    goto :goto_1

    .line 233
    :cond_0
    move v15, v0

    .line 236
    .end local v0    # "x":F
    .local v15, "x":F
    :goto_1
    const-wide/16 v0, 0x0

    cmpl-double v2, v5, v0

    if-ltz v2, :cond_1

    .line 237
    invoke-virtual/range {p3 .. p3}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getChartValuesFormat()Ljava/text/NumberFormat;

    move-result-object v0

    invoke-virtual {v7, v0, v5, v6}, Lorg/achartengine/chart/BarChart;->getLabel(Ljava/text/NumberFormat;D)Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v0, v12, 0x1

    invoke-interface {v8, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual/range {p3 .. p3}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getChartValuesSpacing()F

    move-result v1

    sub-float v4, v0, v1

    const/16 v16, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v3, v15

    move/from16 v17, v9

    move/from16 v18, v10

    move-wide v9, v5

    .end local v5    # "value":D
    .end local v10    # "length":I
    .local v9, "value":D
    .local v17, "seriesNr":I
    .local v18, "length":I
    move-object/from16 v5, p4

    move/from16 v6, v16

    invoke-virtual/range {v0 .. v6}, Lorg/achartengine/chart/BarChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    goto :goto_2

    .line 240
    .end local v17    # "seriesNr":I
    .end local v18    # "length":I
    .restart local v5    # "value":D
    .local v9, "seriesNr":I
    .restart local v10    # "length":I
    :cond_1
    move/from16 v17, v9

    move/from16 v18, v10

    move-wide v9, v5

    .end local v5    # "value":D
    .end local v10    # "length":I
    .local v9, "value":D
    .restart local v17    # "seriesNr":I
    .restart local v18    # "length":I
    invoke-virtual/range {p3 .. p3}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getChartValuesFormat()Ljava/text/NumberFormat;

    move-result-object v0

    invoke-virtual {v7, v0, v9, v10}, Lorg/achartengine/chart/BarChart;->getLabel(Ljava/text/NumberFormat;D)Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v0, v12, 0x1

    invoke-interface {v8, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

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

    invoke-virtual/range {v0 .. v6}, Lorg/achartengine/chart/BarChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    goto :goto_2

    .line 231
    .end local v15    # "x":F
    .end local v17    # "seriesNr":I
    .end local v18    # "length":I
    .restart local v5    # "value":D
    .local v9, "seriesNr":I
    .restart local v10    # "length":I
    :cond_2
    move/from16 v17, v9

    move/from16 v18, v10

    move-wide v9, v5

    .line 228
    .end local v5    # "value":D
    .end local v9    # "seriesNr":I
    .end local v10    # "length":I
    .end local v13    # "index":I
    .restart local v17    # "seriesNr":I
    .restart local v18    # "length":I
    :goto_2
    add-int/lit8 v12, v12, 0x2

    move/from16 v9, v17

    move/from16 v10, v18

    goto/16 :goto_0

    .end local v17    # "seriesNr":I
    .end local v18    # "length":I
    .restart local v9    # "seriesNr":I
    .restart local v10    # "length":I
    :cond_3
    move-object/from16 v14, p2

    move/from16 v17, v9

    move/from16 v18, v10

    .line 245
    .end local v9    # "seriesNr":I
    .end local v10    # "length":I
    .end local v12    # "i":I
    .restart local v17    # "seriesNr":I
    .restart local v18    # "length":I
    return-void
.end method

.method public drawLegendShape(Landroid/graphics/Canvas;Lorg/achartengine/renderer/SimpleSeriesRenderer;FFILandroid/graphics/Paint;)V
    .locals 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "renderer"    # Lorg/achartengine/renderer/SimpleSeriesRenderer;
    .param p3, "x"    # F
    .param p4, "y"    # F
    .param p5, "seriesIndex"    # I
    .param p6, "paint"    # Landroid/graphics/Paint;

    .line 269
    const/high16 v0, 0x40c00000    # 6.0f

    .line 270
    .local v0, "halfShapeWidth":F
    sub-float v3, p4, v0

    const/high16 v1, 0x41400000    # 12.0f

    add-float v4, p3, v1

    add-float v5, p4, v0

    move-object v1, p1

    move v2, p3

    move-object v6, p6

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 271
    return-void
.end method

.method public drawSeries(Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/SimpleSeriesRenderer;FII)V
    .locals 19
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

    .line 106
    .local p3, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    move-object/from16 v10, p0

    move-object/from16 v11, p2

    move-object/from16 v12, p3

    iget-object v0, v10, Lorg/achartengine/chart/BarChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    invoke-virtual {v0}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesCount()I

    move-result v13

    .line 107
    .local v13, "seriesNr":I
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v14

    .line 108
    .local v14, "length":I
    invoke-virtual/range {p4 .. p4}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getColor()I

    move-result v0

    invoke-virtual {v11, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 109
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v11, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 110
    invoke-virtual {v10, v12, v14, v13}, Lorg/achartengine/chart/BarChart;->getHalfDiffX(Ljava/util/List;II)F

    move-result v15

    .line 111
    .local v15, "halfDiffX":F
    const/4 v0, 0x0

    move v9, v0

    .local v9, "i":I
    :goto_0
    if-ge v9, v14, :cond_0

    .line 112
    invoke-interface {v12, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v16

    .line 113
    .local v16, "x":F
    add-int/lit8 v0, v9, 0x1

    invoke-interface {v12, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v17

    .line 114
    .local v17, "y":F
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v16

    move/from16 v3, p5

    move/from16 v4, v16

    move/from16 v5, v17

    move v6, v15

    move v7, v13

    move/from16 v8, p6

    move/from16 v18, v9

    .end local v9    # "i":I
    .local v18, "i":I
    move-object/from16 v9, p2

    invoke-virtual/range {v0 .. v9}, Lorg/achartengine/chart/BarChart;->drawBar(Landroid/graphics/Canvas;FFFFFIILandroid/graphics/Paint;)V

    .line 111
    .end local v16    # "x":F
    .end local v17    # "y":F
    add-int/lit8 v9, v18, 0x2

    .end local v18    # "i":I
    .restart local v9    # "i":I
    goto :goto_0

    :cond_0
    move/from16 v18, v9

    .line 116
    .end local v9    # "i":I
    invoke-virtual/range {p4 .. p4}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getColor()I

    move-result v0

    invoke-virtual {v11, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 117
    return-void
.end method

.method public getChartType()Ljava/lang/String;
    .locals 1

    .line 335
    const-string v0, "Bar"

    return-object v0
.end method

.method protected getCoeficient()F
    .locals 1

    .line 308
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
.end method

.method public getDefaultMinimum()D
    .locals 2

    .line 326
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method protected getHalfDiffX(Ljava/util/List;II)F
    .locals 12
    .param p2, "length"    # I
    .param p3, "seriesNr"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;II)F"
        }
    .end annotation

    .line 283
    .local p1, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    iget-object v0, p0, Lorg/achartengine/chart/BarChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getBarWidth()F

    move-result v0

    .line 284
    .local v0, "barWidth":F
    const/4 v1, 0x0

    cmpl-float v2, v0, v1

    if-lez v2, :cond_0

    .line 285
    const/high16 v1, 0x40000000    # 2.0f

    div-float v1, v0, v1

    return v1

    .line 287
    :cond_0
    move v2, p2

    .line 288
    .local v2, "div":I
    const/4 v3, 0x2

    if-le p2, v3, :cond_1

    .line 289
    add-int/lit8 v2, p2, -0x2

    .line 291
    :cond_1
    add-int/lit8 v3, p2, -0x2

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    const/4 v4, 0x0

    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    sub-float/2addr v3, v4

    int-to-float v4, v2

    div-float/2addr v3, v4

    .line 292
    .local v3, "halfDiffX":F
    cmpl-float v1, v3, v1

    if-nez v1, :cond_2

    .line 293
    const/high16 v3, 0x41200000    # 10.0f

    .line 296
    :cond_2
    iget-object v1, p0, Lorg/achartengine/chart/BarChart;->mType:Lorg/achartengine/chart/BarChart$Type;

    sget-object v4, Lorg/achartengine/chart/BarChart$Type;->STACKED:Lorg/achartengine/chart/BarChart$Type;

    if-eq v1, v4, :cond_3

    .line 297
    int-to-float v1, p3

    div-float/2addr v3, v1

    .line 299
    :cond_3
    float-to-double v4, v3

    invoke-virtual {p0}, Lorg/achartengine/chart/BarChart;->getCoeficient()F

    move-result v1

    float-to-double v6, v1

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    iget-object v1, p0, Lorg/achartengine/chart/BarChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getBarSpacing()D

    move-result-wide v10

    add-double/2addr v10, v8

    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v6, v6, v10

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v4, v6

    double-to-float v1, v4

    return v1
.end method

.method public getLegendShapeWidth(I)I
    .locals 1
    .param p1, "seriesIndex"    # I

    .line 254
    const/16 v0, 0xc

    return v0
.end method

.method protected isRenderNullValues()Z
    .locals 1

    .line 317
    const/4 v0, 0x1

    return v0
.end method
