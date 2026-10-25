.class public Lorg/achartengine/chart/DialChart;
.super Lorg/achartengine/chart/RoundChart;
.source "DialChart.java"


# static fields
.field private static final NEEDLE_RADIUS:I = 0xa


# instance fields
.field private mRenderer:Lorg/achartengine/renderer/DialRenderer;


# direct methods
.method public constructor <init>(Lorg/achartengine/model/CategorySeries;Lorg/achartengine/renderer/DialRenderer;)V
    .locals 0
    .param p1, "dataset"    # Lorg/achartengine/model/CategorySeries;
    .param p2, "renderer"    # Lorg/achartengine/renderer/DialRenderer;

    .line 45
    invoke-direct {p0, p1, p2}, Lorg/achartengine/chart/RoundChart;-><init>(Lorg/achartengine/model/CategorySeries;Lorg/achartengine/renderer/DefaultRenderer;)V

    .line 46
    iput-object p2, p0, Lorg/achartengine/chart/DialChart;->mRenderer:Lorg/achartengine/renderer/DialRenderer;

    .line 47
    return-void
.end method

.method private drawNeedle(Landroid/graphics/Canvas;DIIDZLandroid/graphics/Paint;)V
    .locals 25
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "angle"    # D
    .param p4, "centerX"    # I
    .param p5, "centerY"    # I
    .param p6, "radius"    # D
    .param p8, "arrow"    # Z
    .param p9, "paint"    # Landroid/graphics/Paint;

    .line 212
    move/from16 v0, p4

    move/from16 v1, p5

    move-object/from16 v8, p9

    const-wide v2, 0x4056800000000000L    # 90.0

    invoke-static {v2, v3}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v9

    .line 213
    .local v9, "diff":D
    sub-double v2, p2, v9

    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    const-wide/high16 v4, 0x4024000000000000L    # 10.0

    mul-double v2, v2, v4

    double-to-int v11, v2

    .line 214
    .local v11, "needleSinValue":I
    sub-double v2, p2, v9

    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    mul-double v2, v2, v4

    double-to-int v12, v2

    .line 215
    .local v12, "needleCosValue":I
    invoke-static/range {p2 .. p3}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    mul-double v2, v2, p6

    double-to-int v13, v2

    .line 216
    .local v13, "needleX":I
    invoke-static/range {p2 .. p3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    mul-double v2, v2, p6

    double-to-int v14, v2

    .line 217
    .local v14, "needleY":I
    add-int v15, v0, v13

    .line 218
    .local v15, "needleCenterX":I
    add-int v7, v1, v14

    .line 220
    .local v7, "needleCenterY":I
    const/4 v6, 0x0

    const/4 v2, 0x6

    const/4 v3, 0x1

    if-eqz p8, :cond_0

    .line 221
    const-wide v18, 0x3feb333333333333L    # 0.85

    mul-double v20, p6, v18

    invoke-static/range {p2 .. p3}, Ljava/lang/Math;->sin(D)D

    move-result-wide v22

    mul-double v4, v20, v22

    double-to-int v4, v4

    add-int v20, v0, v4

    .line 222
    .local v20, "arrowBaseX":I
    mul-double v4, p6, v18

    invoke-static/range {p2 .. p3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v18

    mul-double v4, v4, v18

    double-to-int v4, v4

    add-int v18, v1, v4

    .line 223
    .local v18, "arrowBaseY":I
    new-array v2, v2, [F

    sub-int v4, v20, v11

    int-to-float v4, v4

    aput v4, v2, v6

    sub-int v4, v18, v12

    int-to-float v4, v4

    aput v4, v2, v3

    int-to-float v4, v15

    const/4 v5, 0x2

    aput v4, v2, v5

    int-to-float v4, v7

    const/4 v5, 0x3

    aput v4, v2, v5

    add-int v4, v20, v11

    int-to-float v4, v4

    const/4 v5, 0x4

    aput v4, v2, v5

    add-int v4, v18, v12

    int-to-float v4, v4

    const/4 v5, 0x5

    aput v4, v2, v5

    move-object/from16 v16, v2

    .line 225
    .local v16, "points":[F
    invoke-virtual/range {p9 .. p9}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v6

    .line 226
    .local v6, "width":F
    const/high16 v2, 0x40a00000    # 5.0f

    invoke-virtual {v8, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 227
    int-to-float v4, v0

    int-to-float v5, v1

    int-to-float v2, v15

    move/from16 v17, v6

    .end local v6    # "width":F
    .local v17, "width":F
    int-to-float v6, v7

    move/from16 v19, v2

    move-object/from16 v2, p1

    move-wide/from16 v21, v9

    const/4 v9, 0x1

    .end local v9    # "diff":D
    .local v21, "diff":D
    move v3, v4

    move v4, v5

    move/from16 v5, v19

    move/from16 v10, v17

    .end local v17    # "width":F
    .local v10, "width":F
    move/from16 v24, v7

    .end local v7    # "needleCenterY":I
    .local v24, "needleCenterY":I
    move-object/from16 v7, p9

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 228
    invoke-virtual {v8, v10}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 229
    .end local v10    # "width":F
    .end local v18    # "arrowBaseY":I
    .end local v20    # "arrowBaseX":I
    move-object/from16 v2, v16

    move/from16 v3, v24

    goto :goto_0

    .line 230
    .end local v16    # "points":[F
    .end local v21    # "diff":D
    .end local v24    # "needleCenterY":I
    .restart local v7    # "needleCenterY":I
    .restart local v9    # "diff":D
    :cond_0
    move/from16 v24, v7

    move-wide/from16 v21, v9

    const/4 v9, 0x1

    .end local v7    # "needleCenterY":I
    .end local v9    # "diff":D
    .restart local v21    # "diff":D
    .restart local v24    # "needleCenterY":I
    new-array v2, v2, [F

    sub-int v3, v0, v11

    int-to-float v3, v3

    aput v3, v2, v6

    sub-int v3, v1, v12

    int-to-float v3, v3

    aput v3, v2, v9

    int-to-float v3, v15

    const/4 v4, 0x2

    aput v3, v2, v4

    move/from16 v3, v24

    .end local v24    # "needleCenterY":I
    .local v3, "needleCenterY":I
    int-to-float v4, v3

    const/4 v5, 0x3

    aput v4, v2, v5

    add-int v4, v0, v11

    int-to-float v4, v4

    const/4 v5, 0x4

    aput v4, v2, v5

    add-int v4, v1, v12

    int-to-float v4, v4

    const/4 v5, 0x5

    aput v4, v2, v5

    move-object/from16 v16, v2

    .line 233
    .local v2, "points":[F
    :goto_0
    move-object/from16 v4, p0

    move-object/from16 v5, p1

    invoke-virtual {v4, v5, v2, v8, v9}, Lorg/achartengine/chart/DialChart;->drawPath(Landroid/graphics/Canvas;[FLandroid/graphics/Paint;Z)V

    .line 234
    return-void
.end method

.method private drawTicks(Landroid/graphics/Canvas;DDDDIIDDDLandroid/graphics/Paint;Z)V
    .locals 21
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "min"    # D
    .param p4, "max"    # D
    .param p6, "minAngle"    # D
    .param p8, "maxAngle"    # D
    .param p10, "centerX"    # I
    .param p11, "centerY"    # I
    .param p12, "longRadius"    # D
    .param p14, "shortRadius"    # D
    .param p16, "ticks"    # D
    .param p18, "paint"    # Landroid/graphics/Paint;
    .param p19, "labels"    # Z

    .line 175
    move/from16 v0, p10

    move/from16 v1, p11

    move-object/from16 v8, p18

    move-wide/from16 v2, p2

    move-wide v6, v2

    .local v6, "i":D
    :goto_0
    cmpg-double v2, v6, p4

    if-gtz v2, :cond_3

    .line 176
    move-object/from16 v9, p0

    move-wide v10, v6

    move-wide/from16 v12, p6

    move-wide/from16 v14, p8

    move-wide/from16 v16, p2

    move-wide/from16 v18, p4

    invoke-direct/range {v9 .. v19}, Lorg/achartengine/chart/DialChart;->getAngleForValue(DDDDD)D

    move-result-wide v9

    .line 177
    .local v9, "angle":D
    invoke-static {v9, v10}, Ljava/lang/Math;->sin(D)D

    move-result-wide v11

    .line 178
    .local v11, "sinValue":D
    invoke-static {v9, v10}, Ljava/lang/Math;->cos(D)D

    move-result-wide v13

    .line 179
    .local v13, "cosValue":D
    int-to-float v2, v0

    mul-double v3, p14, v11

    double-to-float v3, v3

    add-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v15

    .line 180
    .local v15, "x1":I
    int-to-float v2, v1

    mul-double v3, p14, v13

    double-to-float v3, v3

    add-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v5

    .line 181
    .local v5, "y1":I
    int-to-float v2, v0

    mul-double v3, p12, v11

    double-to-float v3, v3

    add-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v4

    .line 182
    .local v4, "x2":I
    int-to-float v2, v1

    mul-double v0, p12, v13

    double-to-float v0, v0

    add-float/2addr v2, v0

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 183
    .local v0, "y2":I
    int-to-float v3, v15

    int-to-float v1, v5

    int-to-float v2, v4

    move-wide/from16 v16, v6

    .end local v6    # "i":D
    .local v16, "i":D
    int-to-float v6, v0

    move v7, v2

    move-object/from16 v2, p1

    move/from16 v18, v0

    move v0, v4

    .end local v4    # "x2":I
    .local v0, "x2":I
    .local v18, "y2":I
    move v4, v1

    move v1, v5

    .end local v5    # "y1":I
    .local v1, "y1":I
    move v5, v7

    move-wide/from16 v19, v9

    move-wide/from16 v9, v16

    .end local v16    # "i":D
    .local v9, "i":D
    .local v19, "angle":D
    move-object/from16 v7, p18

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 184
    if-eqz p19, :cond_2

    .line 185
    sget-object v2, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v8, v2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 186
    if-gt v15, v0, :cond_0

    .line 187
    sget-object v2, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    invoke-virtual {v8, v2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 189
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v9, v10}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 190
    .local v2, "text":Ljava/lang/String;
    invoke-static {v9, v10}, Ljava/lang/Math;->round(D)J

    move-result-wide v4

    double-to-long v6, v9

    cmp-long v16, v4, v6

    if-nez v16, :cond_1

    .line 191
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    double-to-long v5, v9

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 193
    :cond_1
    int-to-float v3, v15

    int-to-float v4, v1

    move-object/from16 v5, p1

    invoke-virtual {v5, v2, v3, v4, v8}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto :goto_1

    .line 184
    .end local v2    # "text":Ljava/lang/String;
    :cond_2
    move-object/from16 v5, p1

    .line 175
    .end local v0    # "x2":I
    .end local v1    # "y1":I
    .end local v11    # "sinValue":D
    .end local v13    # "cosValue":D
    .end local v15    # "x1":I
    .end local v18    # "y2":I
    .end local v19    # "angle":D
    :goto_1
    add-double v6, v9, p16

    move/from16 v0, p10

    move/from16 v1, p11

    .end local v9    # "i":D
    .restart local v6    # "i":D
    goto/16 :goto_0

    :cond_3
    move-object/from16 v5, p1

    move-wide v9, v6

    .line 196
    .end local v6    # "i":D
    return-void
.end method

.method private getAngleForValue(DDDDD)D
    .locals 6
    .param p1, "value"    # D
    .param p3, "minAngle"    # D
    .param p5, "maxAngle"    # D
    .param p7, "min"    # D
    .param p9, "max"    # D

    .line 150
    sub-double v0, p5, p3

    .line 151
    .local v0, "angleDiff":D
    sub-double v2, p9, p7

    .line 152
    .local v2, "diff":D
    sub-double v4, p1, p7

    mul-double v4, v4, v0

    div-double/2addr v4, v2

    add-double/2addr v4, p3

    invoke-static {v4, v5}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v4

    return-wide v4
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;IIIILandroid/graphics/Paint;)V
    .locals 44
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "width"    # I
    .param p5, "height"    # I
    .param p6, "paint"    # Landroid/graphics/Paint;

    .line 61
    move-object/from16 v14, p0

    move-object/from16 v15, p6

    iget-object v0, v14, Lorg/achartengine/chart/DialChart;->mRenderer:Lorg/achartengine/renderer/DialRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DialRenderer;->isAntialiasing()Z

    move-result v0

    invoke-virtual {v15, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 62
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v15, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 63
    iget-object v0, v14, Lorg/achartengine/chart/DialChart;->mRenderer:Lorg/achartengine/renderer/DialRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DialRenderer;->getLabelsTextSize()F

    move-result v0

    invoke-virtual {v15, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 64
    iget-object v0, v14, Lorg/achartengine/chart/DialChart;->mRenderer:Lorg/achartengine/renderer/DialRenderer;

    div-int/lit8 v1, p5, 0x5

    const/4 v2, 0x0

    invoke-virtual {v14, v0, v1, v2}, Lorg/achartengine/chart/DialChart;->getLegendSize(Lorg/achartengine/renderer/DefaultRenderer;IF)I

    move-result v12

    .line 65
    .local v12, "legendSize":I
    move/from16 v20, p2

    .line 66
    .local v20, "left":I
    move/from16 v21, p3

    .line 67
    .local v21, "top":I
    add-int v22, p2, p4

    .line 69
    .local v22, "right":I
    iget-object v0, v14, Lorg/achartengine/chart/DialChart;->mDataset:Lorg/achartengine/model/CategorySeries;

    invoke-virtual {v0}, Lorg/achartengine/model/CategorySeries;->getItemCount()I

    move-result v13

    .line 70
    .local v13, "sLength":I
    new-array v11, v13, [Ljava/lang/String;

    .line 71
    .local v11, "titles":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v13, :cond_0

    .line 72
    iget-object v1, v14, Lorg/achartengine/chart/DialChart;->mDataset:Lorg/achartengine/model/CategorySeries;

    invoke-virtual {v1, v0}, Lorg/achartengine/model/CategorySeries;->getCategory(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v11, v0

    .line 71
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 75
    .end local v0    # "i":I
    :cond_0
    iget-object v0, v14, Lorg/achartengine/chart/DialChart;->mRenderer:Lorg/achartengine/renderer/DialRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DialRenderer;->isFitLegend()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 76
    iget-object v2, v14, Lorg/achartengine/chart/DialChart;->mRenderer:Lorg/achartengine/renderer/DialRenderer;

    const/16 v16, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object v3, v11

    move/from16 v4, v20

    move/from16 v5, v22

    move/from16 v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move v9, v12

    move-object/from16 v10, p6

    move-object/from16 v23, v11

    .end local v11    # "titles":[Ljava/lang/String;
    .local v23, "titles":[Ljava/lang/String;
    move/from16 v11, v16

    invoke-virtual/range {v0 .. v11}, Lorg/achartengine/chart/DialChart;->drawLegend(Landroid/graphics/Canvas;Lorg/achartengine/renderer/DefaultRenderer;[Ljava/lang/String;IIIIIILandroid/graphics/Paint;Z)I

    move-result v0

    move/from16 v24, v0

    .end local v12    # "legendSize":I
    .local v0, "legendSize":I
    goto :goto_1

    .line 75
    .end local v0    # "legendSize":I
    .end local v23    # "titles":[Ljava/lang/String;
    .restart local v11    # "titles":[Ljava/lang/String;
    .restart local v12    # "legendSize":I
    :cond_1
    move-object/from16 v23, v11

    .end local v11    # "titles":[Ljava/lang/String;
    .restart local v23    # "titles":[Ljava/lang/String;
    move/from16 v24, v12

    .line 79
    .end local v12    # "legendSize":I
    .local v24, "legendSize":I
    :goto_1
    add-int v0, p3, p5

    sub-int v25, v0, v24

    .line 80
    .local v25, "bottom":I
    iget-object v1, v14, Lorg/achartengine/chart/DialChart;->mRenderer:Lorg/achartengine/renderer/DialRenderer;

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object/from16 v0, p0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move-object/from16 v7, p6

    invoke-virtual/range {v0 .. v9}, Lorg/achartengine/chart/DialChart;->drawBackground(Lorg/achartengine/renderer/DefaultRenderer;Landroid/graphics/Canvas;IIIILandroid/graphics/Paint;ZI)V

    .line 82
    sub-int v0, v22, v20

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    sub-int v1, v25, v21

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 83
    .local v8, "mRadius":I
    int-to-double v0, v8

    const-wide v2, 0x3fd6666666666666L    # 0.35

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v2

    iget-object v2, v14, Lorg/achartengine/chart/DialChart;->mRenderer:Lorg/achartengine/renderer/DialRenderer;

    invoke-virtual {v2}, Lorg/achartengine/renderer/DialRenderer;->getScale()F

    move-result v2

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v2

    double-to-int v9, v0

    .line 84
    .local v9, "radius":I
    iget v0, v14, Lorg/achartengine/chart/DialChart;->mCenterX:I

    const v1, 0x7fffffff

    if-ne v0, v1, :cond_2

    .line 85
    add-int v0, v20, v22

    div-int/lit8 v0, v0, 0x2

    iput v0, v14, Lorg/achartengine/chart/DialChart;->mCenterX:I

    .line 87
    :cond_2
    iget v0, v14, Lorg/achartengine/chart/DialChart;->mCenterY:I

    if-ne v0, v1, :cond_3

    .line 88
    add-int v0, v25, v21

    div-int/lit8 v0, v0, 0x2

    iput v0, v14, Lorg/achartengine/chart/DialChart;->mCenterY:I

    .line 90
    :cond_3
    int-to-float v0, v9

    const v1, 0x3f666666    # 0.9f

    mul-float v6, v0, v1

    .line 91
    .local v6, "shortRadius":F
    int-to-float v0, v9

    const v1, 0x3f8ccccd    # 1.1f

    mul-float v7, v0, v1

    .line 92
    .local v7, "longRadius":F
    iget-object v0, v14, Lorg/achartengine/chart/DialChart;->mRenderer:Lorg/achartengine/renderer/DialRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DialRenderer;->getMinValue()D

    move-result-wide v0

    .line 93
    .local v0, "min":D
    iget-object v2, v14, Lorg/achartengine/chart/DialChart;->mRenderer:Lorg/achartengine/renderer/DialRenderer;

    invoke-virtual {v2}, Lorg/achartengine/renderer/DialRenderer;->getMaxValue()D

    move-result-wide v2

    .line 94
    .local v2, "max":D
    iget-object v4, v14, Lorg/achartengine/chart/DialChart;->mRenderer:Lorg/achartengine/renderer/DialRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/DialRenderer;->getAngleMin()D

    move-result-wide v26

    .line 95
    .local v26, "angleMin":D
    iget-object v4, v14, Lorg/achartengine/chart/DialChart;->mRenderer:Lorg/achartengine/renderer/DialRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/DialRenderer;->getAngleMax()D

    move-result-wide v28

    .line 96
    .local v28, "angleMax":D
    iget-object v4, v14, Lorg/achartengine/chart/DialChart;->mRenderer:Lorg/achartengine/renderer/DialRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/DialRenderer;->isMinValueSet()Z

    move-result v4

    if-eqz v4, :cond_4

    iget-object v4, v14, Lorg/achartengine/chart/DialChart;->mRenderer:Lorg/achartengine/renderer/DialRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/DialRenderer;->isMaxValueSet()Z

    move-result v4

    if-nez v4, :cond_7

    .line 97
    :cond_4
    iget-object v4, v14, Lorg/achartengine/chart/DialChart;->mRenderer:Lorg/achartengine/renderer/DialRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/DialRenderer;->getSeriesRendererCount()I

    move-result v4

    .line 98
    .local v4, "count":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2
    if-ge v5, v4, :cond_7

    .line 99
    iget-object v10, v14, Lorg/achartengine/chart/DialChart;->mDataset:Lorg/achartengine/model/CategorySeries;

    invoke-virtual {v10, v5}, Lorg/achartengine/model/CategorySeries;->getValue(I)D

    move-result-wide v10

    .line 100
    .local v10, "value":D
    iget-object v12, v14, Lorg/achartengine/chart/DialChart;->mRenderer:Lorg/achartengine/renderer/DialRenderer;

    invoke-virtual {v12}, Lorg/achartengine/renderer/DialRenderer;->isMinValueSet()Z

    move-result v12

    if-nez v12, :cond_5

    .line 101
    invoke-static {v0, v1, v10, v11}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    .line 103
    :cond_5
    iget-object v12, v14, Lorg/achartengine/chart/DialChart;->mRenderer:Lorg/achartengine/renderer/DialRenderer;

    invoke-virtual {v12}, Lorg/achartengine/renderer/DialRenderer;->isMaxValueSet()Z

    move-result v12

    if-nez v12, :cond_6

    .line 104
    invoke-static {v2, v3, v10, v11}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    .line 98
    .end local v10    # "value":D
    :cond_6
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 108
    .end local v4    # "count":I
    .end local v5    # "i":I
    :cond_7
    cmpl-double v4, v0, v2

    if-nez v4, :cond_8

    .line 109
    const-wide/high16 v4, 0x3fe0000000000000L    # 0.5

    mul-double v0, v0, v4

    .line 110
    const-wide/high16 v4, 0x3ff8000000000000L    # 1.5

    mul-double v2, v2, v4

    move-wide/from16 v32, v0

    move-wide/from16 v30, v2

    goto :goto_3

    .line 108
    :cond_8
    move-wide/from16 v32, v0

    move-wide/from16 v30, v2

    .line 113
    .end local v0    # "min":D
    .end local v2    # "max":D
    .local v30, "max":D
    .local v32, "min":D
    :goto_3
    iget-object v0, v14, Lorg/achartengine/chart/DialChart;->mRenderer:Lorg/achartengine/renderer/DialRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DialRenderer;->getLabelsColor()I

    move-result v0

    invoke-virtual {v15, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 114
    iget-object v0, v14, Lorg/achartengine/chart/DialChart;->mRenderer:Lorg/achartengine/renderer/DialRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DialRenderer;->getMinorTicksSpacing()D

    move-result-wide v0

    .line 115
    .local v0, "minorTicks":D
    iget-object v2, v14, Lorg/achartengine/chart/DialChart;->mRenderer:Lorg/achartengine/renderer/DialRenderer;

    invoke-virtual {v2}, Lorg/achartengine/renderer/DialRenderer;->getMajorTicksSpacing()D

    move-result-wide v2

    .line 116
    .local v2, "majorTicks":D
    const-wide v4, 0x7fefffffffffffffL    # Double.MAX_VALUE

    cmpl-double v10, v0, v4

    if-nez v10, :cond_9

    .line 117
    sub-double v10, v30, v32

    const-wide/high16 v16, 0x403e000000000000L    # 30.0

    div-double v10, v10, v16

    move-wide/from16 v34, v10

    .end local v0    # "minorTicks":D
    .local v10, "minorTicks":D
    goto :goto_4

    .line 116
    .end local v10    # "minorTicks":D
    .restart local v0    # "minorTicks":D
    :cond_9
    move-wide/from16 v34, v0

    .line 119
    .end local v0    # "minorTicks":D
    .local v34, "minorTicks":D
    :goto_4
    cmpl-double v0, v2, v4

    if-nez v0, :cond_a

    .line 120
    sub-double v0, v30, v32

    const-wide/high16 v4, 0x4024000000000000L    # 10.0

    div-double/2addr v0, v4

    move-wide/from16 v36, v0

    .end local v2    # "majorTicks":D
    .local v0, "majorTicks":D
    goto :goto_5

    .line 119
    .end local v0    # "majorTicks":D
    .restart local v2    # "majorTicks":D
    :cond_a
    move-wide/from16 v36, v2

    .line 122
    .end local v2    # "majorTicks":D
    .local v36, "majorTicks":D
    :goto_5
    iget v10, v14, Lorg/achartengine/chart/DialChart;->mCenterX:I

    iget v11, v14, Lorg/achartengine/chart/DialChart;->mCenterY:I

    float-to-double v0, v7

    move/from16 v38, v13

    .end local v13    # "sLength":I
    .local v38, "sLength":I
    move-wide v12, v0

    int-to-double v0, v9

    move-object v4, v14

    move-object v5, v15

    move-wide v14, v0

    const/16 v19, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-wide/from16 v2, v32

    move-wide/from16 v4, v30

    move/from16 v39, v6

    move/from16 v40, v7

    .end local v6    # "shortRadius":F
    .end local v7    # "longRadius":F
    .local v39, "shortRadius":F
    .local v40, "longRadius":F
    move-wide/from16 v6, v26

    move/from16 v41, v8

    move/from16 v42, v9

    .end local v8    # "mRadius":I
    .end local v9    # "radius":I
    .local v41, "mRadius":I
    .local v42, "radius":I
    move-wide/from16 v8, v28

    move-wide/from16 v16, v34

    move-object/from16 v18, p6

    invoke-direct/range {v0 .. v19}, Lorg/achartengine/chart/DialChart;->drawTicks(Landroid/graphics/Canvas;DDDDIIDDDLandroid/graphics/Paint;Z)V

    .line 124
    move-object/from16 v8, p0

    iget v10, v8, Lorg/achartengine/chart/DialChart;->mCenterX:I

    iget v11, v8, Lorg/achartengine/chart/DialChart;->mCenterY:I

    move/from16 v9, v40

    .end local v40    # "longRadius":F
    .local v9, "longRadius":F
    float-to-double v12, v9

    move/from16 v6, v39

    .end local v39    # "shortRadius":F
    .restart local v6    # "shortRadius":F
    float-to-double v14, v6

    const/16 v19, 0x1

    move/from16 v43, v6

    .end local v6    # "shortRadius":F
    .local v43, "shortRadius":F
    move-wide/from16 v6, v26

    move/from16 v39, v9

    .end local v9    # "longRadius":F
    .local v39, "longRadius":F
    move-wide/from16 v8, v28

    move-wide/from16 v16, v36

    invoke-direct/range {v0 .. v19}, Lorg/achartengine/chart/DialChart;->drawTicks(Landroid/graphics/Canvas;DDDDIIDDDLandroid/graphics/Paint;Z)V

    .line 127
    move-object/from16 v12, p0

    iget-object v0, v12, Lorg/achartengine/chart/DialChart;->mRenderer:Lorg/achartengine/renderer/DialRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DialRenderer;->getSeriesRendererCount()I

    move-result v13

    .line 128
    .local v13, "count":I
    const/4 v0, 0x0

    move v11, v0

    .local v11, "i":I
    :goto_6
    if-ge v11, v13, :cond_c

    .line 129
    iget-object v0, v12, Lorg/achartengine/chart/DialChart;->mDataset:Lorg/achartengine/model/CategorySeries;

    invoke-virtual {v0, v11}, Lorg/achartengine/model/CategorySeries;->getValue(I)D

    move-result-wide v1

    move-object/from16 v0, p0

    move-wide/from16 v3, v26

    move-wide/from16 v5, v28

    move-wide/from16 v7, v32

    move-wide/from16 v9, v30

    invoke-direct/range {v0 .. v10}, Lorg/achartengine/chart/DialChart;->getAngleForValue(DDDDD)D

    move-result-wide v14

    .line 130
    .local v14, "angle":D
    iget-object v0, v12, Lorg/achartengine/chart/DialChart;->mRenderer:Lorg/achartengine/renderer/DialRenderer;

    invoke-virtual {v0, v11}, Lorg/achartengine/renderer/DialRenderer;->getSeriesRendererAt(I)Lorg/achartengine/renderer/SimpleSeriesRenderer;

    move-result-object v0

    invoke-virtual {v0}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getColor()I

    move-result v0

    move-object/from16 v10, p6

    invoke-virtual {v10, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 131
    iget-object v0, v12, Lorg/achartengine/chart/DialChart;->mRenderer:Lorg/achartengine/renderer/DialRenderer;

    invoke-virtual {v0, v11}, Lorg/achartengine/renderer/DialRenderer;->getVisualTypeForIndex(I)Lorg/achartengine/renderer/DialRenderer$Type;

    move-result-object v0

    sget-object v1, Lorg/achartengine/renderer/DialRenderer$Type;->ARROW:Lorg/achartengine/renderer/DialRenderer$Type;

    if-ne v0, v1, :cond_b

    const/4 v0, 0x1

    const/4 v8, 0x1

    goto :goto_7

    :cond_b
    const/4 v0, 0x0

    const/4 v8, 0x0

    .line 132
    .local v8, "type":Z
    :goto_7
    iget v4, v12, Lorg/achartengine/chart/DialChart;->mCenterX:I

    iget v5, v12, Lorg/achartengine/chart/DialChart;->mCenterY:I

    move/from16 v9, v43

    .end local v43    # "shortRadius":F
    .local v9, "shortRadius":F
    float-to-double v6, v9

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-wide v2, v14

    move/from16 v16, v9

    .end local v9    # "shortRadius":F
    .local v16, "shortRadius":F
    move-object/from16 v9, p6

    invoke-direct/range {v0 .. v9}, Lorg/achartengine/chart/DialChart;->drawNeedle(Landroid/graphics/Canvas;DIIDZLandroid/graphics/Paint;)V

    .line 128
    .end local v8    # "type":Z
    .end local v14    # "angle":D
    add-int/lit8 v11, v11, 0x1

    move/from16 v43, v16

    goto :goto_6

    .end local v16    # "shortRadius":F
    .restart local v43    # "shortRadius":F
    :cond_c
    move-object/from16 v10, p6

    move/from16 v16, v43

    .line 134
    .end local v11    # "i":I
    .end local v43    # "shortRadius":F
    .restart local v16    # "shortRadius":F
    iget-object v2, v12, Lorg/achartengine/chart/DialChart;->mRenderer:Lorg/achartengine/renderer/DialRenderer;

    const/4 v11, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v3, v23

    move/from16 v4, v20

    move/from16 v5, v22

    move/from16 v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, v24

    invoke-virtual/range {v0 .. v11}, Lorg/achartengine/chart/DialChart;->drawLegend(Landroid/graphics/Canvas;Lorg/achartengine/renderer/DefaultRenderer;[Ljava/lang/String;IIIIIILandroid/graphics/Paint;Z)I

    .line 135
    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move-object/from16 v5, p6

    invoke-virtual/range {v0 .. v5}, Lorg/achartengine/chart/DialChart;->drawTitle(Landroid/graphics/Canvas;IIILandroid/graphics/Paint;)V

    .line 136
    return-void
.end method
