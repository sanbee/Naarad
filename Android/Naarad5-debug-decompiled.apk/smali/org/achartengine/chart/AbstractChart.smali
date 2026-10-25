.class public abstract Lorg/achartengine/chart/AbstractChart;
.super Ljava/lang/Object;
.source "AbstractChart.java"

# interfaces
.implements Ljava/io/Serializable;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static calculateDrawPoints(FFFFII)[F
    .locals 7
    .param p0, "p1x"    # F
    .param p1, "p1y"    # F
    .param p2, "p2x"    # F
    .param p3, "p2y"    # F
    .param p4, "screenHeight"    # I
    .param p5, "screenWidth"    # I

    .line 228
    int-to-float v0, p4

    const/4 v1, 0x0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_2

    .line 230
    sub-float v0, p3, p1

    sub-float v2, p2, p0

    div-float/2addr v0, v2

    .line 231
    .local v0, "m":F
    int-to-float v2, p4

    sub-float/2addr v2, p1

    mul-float v3, v0, p0

    add-float/2addr v2, v3

    div-float/2addr v2, v0

    .line 232
    .local v2, "drawP1x":F
    int-to-float v3, p4

    .line 234
    .local v3, "drawP1y":F
    cmpg-float v4, v2, v1

    if-gez v4, :cond_0

    .line 237
    const/4 v2, 0x0

    .line 238
    mul-float v4, v0, p0

    sub-float v3, p1, v4

    goto :goto_0

    .line 239
    :cond_0
    int-to-float v4, p5

    cmpl-float v4, v2, v4

    if-lez v4, :cond_1

    .line 242
    int-to-float v2, p5

    .line 243
    int-to-float v4, p5

    mul-float v4, v4, v0

    add-float/2addr v4, p1

    mul-float v5, v0, p0

    sub-float v3, v4, v5

    .line 245
    .end local v0    # "m":F
    :cond_1
    :goto_0
    goto :goto_2

    .end local v2    # "drawP1x":F
    .end local v3    # "drawP1y":F
    :cond_2
    cmpg-float v0, p1, v1

    if-gez v0, :cond_5

    .line 246
    sub-float v0, p3, p1

    sub-float v2, p2, p0

    div-float/2addr v0, v2

    .line 247
    .restart local v0    # "m":F
    neg-float v2, p1

    mul-float v3, v0, p0

    add-float/2addr v2, v3

    div-float/2addr v2, v0

    .line 248
    .restart local v2    # "drawP1x":F
    const/4 v3, 0x0

    .line 249
    .restart local v3    # "drawP1y":F
    cmpg-float v4, v2, v1

    if-gez v4, :cond_3

    .line 250
    const/4 v2, 0x0

    .line 251
    mul-float v4, v0, p0

    sub-float v3, p1, v4

    goto :goto_1

    .line 252
    :cond_3
    int-to-float v4, p5

    cmpl-float v4, v2, v4

    if-lez v4, :cond_4

    .line 253
    int-to-float v2, p5

    .line 254
    int-to-float v4, p5

    mul-float v4, v4, v0

    add-float/2addr v4, p1

    mul-float v5, v0, p0

    sub-float/2addr v4, v5

    move v3, v4

    .line 256
    .end local v0    # "m":F
    :cond_4
    :goto_1
    goto :goto_2

    .line 258
    .end local v2    # "drawP1x":F
    .end local v3    # "drawP1y":F
    :cond_5
    move v2, p0

    .line 259
    .restart local v2    # "drawP1x":F
    move v3, p1

    .line 262
    .restart local v3    # "drawP1y":F
    :goto_2
    int-to-float v0, p4

    cmpl-float v0, p3, v0

    if-lez v0, :cond_8

    .line 263
    sub-float v0, p3, p1

    sub-float v4, p2, p0

    div-float/2addr v0, v4

    .line 264
    .restart local v0    # "m":F
    int-to-float v4, p4

    sub-float/2addr v4, p1

    mul-float v5, v0, p0

    add-float/2addr v4, v5

    div-float/2addr v4, v0

    .line 265
    .local v4, "drawP2x":F
    int-to-float v5, p4

    .line 266
    .local v5, "drawP2y":F
    cmpg-float v1, v4, v1

    if-gez v1, :cond_6

    .line 267
    const/4 v4, 0x0

    .line 268
    mul-float v1, v0, p0

    sub-float v5, p1, v1

    goto :goto_3

    .line 269
    :cond_6
    int-to-float v1, p5

    cmpl-float v1, v4, v1

    if-lez v1, :cond_7

    .line 270
    int-to-float v4, p5

    .line 271
    int-to-float v1, p5

    mul-float v1, v1, v0

    add-float/2addr v1, p1

    mul-float v6, v0, p0

    sub-float v5, v1, v6

    .line 273
    .end local v0    # "m":F
    :cond_7
    :goto_3
    goto :goto_5

    .end local v4    # "drawP2x":F
    .end local v5    # "drawP2y":F
    :cond_8
    cmpg-float v0, p3, v1

    if-gez v0, :cond_b

    .line 274
    sub-float v0, p3, p1

    sub-float v4, p2, p0

    div-float/2addr v0, v4

    .line 275
    .restart local v0    # "m":F
    neg-float v4, p1

    mul-float v5, v0, p0

    add-float/2addr v4, v5

    div-float/2addr v4, v0

    .line 276
    .restart local v4    # "drawP2x":F
    const/4 v5, 0x0

    .line 277
    .restart local v5    # "drawP2y":F
    cmpg-float v1, v4, v1

    if-gez v1, :cond_9

    .line 278
    const/4 v1, 0x0

    .line 279
    .end local v4    # "drawP2x":F
    .local v1, "drawP2x":F
    mul-float v4, v0, p0

    sub-float v4, p1, v4

    move v5, v4

    move v4, v1

    .end local v5    # "drawP2y":F
    .local v4, "drawP2y":F
    goto :goto_4

    .line 280
    .end local v1    # "drawP2x":F
    .local v4, "drawP2x":F
    .restart local v5    # "drawP2y":F
    :cond_9
    int-to-float v1, p5

    cmpl-float v1, v4, v1

    if-lez v1, :cond_a

    .line 281
    int-to-float v1, p5

    .line 282
    .end local v4    # "drawP2x":F
    .restart local v1    # "drawP2x":F
    int-to-float v4, p5

    mul-float v4, v4, v0

    add-float/2addr v4, p1

    mul-float v6, v0, p0

    sub-float/2addr v4, v6

    move v5, v4

    move v4, v1

    .line 284
    .end local v0    # "m":F
    .end local v1    # "drawP2x":F
    .restart local v4    # "drawP2x":F
    :cond_a
    :goto_4
    goto :goto_5

    .line 286
    .end local v4    # "drawP2x":F
    .end local v5    # "drawP2y":F
    :cond_b
    move v4, p2

    .line 287
    .restart local v4    # "drawP2x":F
    move v5, p3

    .line 290
    .restart local v5    # "drawP2y":F
    :goto_5
    const/4 v0, 0x4

    new-array v0, v0, [F

    const/4 v1, 0x0

    aput v2, v0, v1

    const/4 v1, 0x1

    aput v3, v0, v1

    const/4 v1, 0x2

    aput v4, v0, v1

    const/4 v1, 0x3

    aput v5, v0, v1

    return-object v0
.end method

.method private getFitText(Ljava/lang/String;FLandroid/graphics/Paint;)Ljava/lang/String;
    .locals 6
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "width"    # F
    .param p3, "paint"    # Landroid/graphics/Paint;

    .line 404
    move-object v0, p1

    .line 405
    .local v0, "newText":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 406
    .local v1, "length":I
    const/4 v2, 0x0

    .line 407
    .local v2, "diff":I
    :goto_0
    invoke-virtual {p3, v0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v3

    cmpl-float v3, v3, p2

    if-lez v3, :cond_0

    if-ge v2, v1, :cond_0

    .line 408
    add-int/lit8 v2, v2, 0x1

    .line 409
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x0

    sub-int v5, v1, v2

    invoke-virtual {p1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "..."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 411
    :cond_0
    if-ne v2, v1, :cond_1

    .line 412
    const-string v0, "..."

    .line 414
    :cond_1
    return-object v0
.end method


# virtual methods
.method public abstract draw(Landroid/graphics/Canvas;IIIILandroid/graphics/Paint;)V
.end method

.method protected drawBackground(Lorg/achartengine/renderer/DefaultRenderer;Landroid/graphics/Canvas;IIIILandroid/graphics/Paint;ZI)V
    .locals 10
    .param p1, "renderer"    # Lorg/achartengine/renderer/DefaultRenderer;
    .param p2, "canvas"    # Landroid/graphics/Canvas;
    .param p3, "x"    # I
    .param p4, "y"    # I
    .param p5, "width"    # I
    .param p6, "height"    # I
    .param p7, "paint"    # Landroid/graphics/Paint;
    .param p8, "newColor"    # Z
    .param p9, "color"    # I

    .line 70
    move v0, p3

    move v1, p4

    move-object/from16 v8, p7

    invoke-virtual {p1}, Lorg/achartengine/renderer/DefaultRenderer;->isApplyBackgroundColor()Z

    move-result v2

    if-nez v2, :cond_1

    if-eqz p8, :cond_0

    goto :goto_0

    :cond_0
    move/from16 v9, p9

    goto :goto_2

    .line 71
    :cond_1
    :goto_0
    if-eqz p8, :cond_2

    .line 72
    move/from16 v9, p9

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_1

    .line 74
    :cond_2
    move/from16 v9, p9

    invoke-virtual {p1}, Lorg/achartengine/renderer/DefaultRenderer;->getBackgroundColor()I

    move-result v2

    invoke-virtual {v8, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 76
    :goto_1
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v8, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 77
    int-to-float v3, v0

    int-to-float v4, v1

    add-int v2, v0, p5

    int-to-float v5, v2

    add-int v2, v1, p6

    int-to-float v6, v2

    move-object v2, p2

    move-object/from16 v7, p7

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 79
    :goto_2
    return-void
.end method

.method protected drawLabel(Landroid/graphics/Canvas;Ljava/lang/String;Lorg/achartengine/renderer/DefaultRenderer;Ljava/util/List;IIFFFFIIILandroid/graphics/Paint;ZZ)V
    .locals 28
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "labelText"    # Ljava/lang/String;
    .param p3, "renderer"    # Lorg/achartengine/renderer/DefaultRenderer;
    .param p5, "centerX"    # I
    .param p6, "centerY"    # I
    .param p7, "shortRadius"    # F
    .param p8, "longRadius"    # F
    .param p9, "currentAngle"    # F
    .param p10, "angle"    # F
    .param p11, "left"    # I
    .param p12, "right"    # I
    .param p13, "color"    # I
    .param p14, "paint"    # Landroid/graphics/Paint;
    .param p15, "line"    # Z
    .param p16, "display"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Canvas;",
            "Ljava/lang/String;",
            "Lorg/achartengine/renderer/DefaultRenderer;",
            "Ljava/util/List<",
            "Landroid/graphics/RectF;",
            ">;IIFFFFIII",
            "Landroid/graphics/Paint;",
            "ZZ)V"
        }
    .end annotation

    .line 460
    .local p4, "prevLabelsBounds":Ljava/util/List;, "Ljava/util/List<Landroid/graphics/RectF;>;"
    move-object/from16 v0, p4

    move/from16 v1, p5

    move/from16 v2, p6

    move/from16 v3, p7

    move/from16 v4, p8

    move-object/from16 v11, p14

    invoke-virtual/range {p3 .. p3}, Lorg/achartengine/renderer/DefaultRenderer;->isShowLabels()Z

    move-result v5

    if-nez v5, :cond_1

    if-eqz p16, :cond_0

    goto :goto_0

    :cond_0
    move-object/from16 v5, p1

    move-object/from16 v3, p2

    goto/16 :goto_7

    .line 461
    :cond_1
    :goto_0
    move/from16 v12, p13

    invoke-virtual {v11, v12}, Landroid/graphics/Paint;->setColor(I)V

    .line 462
    const/high16 v5, 0x42b40000    # 90.0f

    const/high16 v6, 0x40000000    # 2.0f

    div-float v7, p10, v6

    add-float v7, p9, v7

    sub-float/2addr v5, v7

    float-to-double v7, v5

    invoke-static {v7, v8}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v13

    .line 463
    .local v13, "rAngle":D
    invoke-static {v13, v14}, Ljava/lang/Math;->sin(D)D

    move-result-wide v15

    .line 464
    .local v15, "sinValue":D
    invoke-static {v13, v14}, Ljava/lang/Math;->cos(D)D

    move-result-wide v17

    .line 465
    .local v17, "cosValue":D
    int-to-float v5, v1

    float-to-double v7, v3

    invoke-static {v7, v8}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v7, v7, v15

    double-to-float v7, v7

    add-float/2addr v5, v7

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v10

    .line 466
    .local v10, "x1":I
    int-to-float v5, v2

    float-to-double v7, v3

    invoke-static {v7, v8}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v7, v7, v17

    double-to-float v7, v7

    add-float/2addr v5, v7

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v9

    .line 467
    .local v9, "y1":I
    int-to-float v5, v1

    float-to-double v7, v4

    invoke-static {v7, v8}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v7, v7, v15

    double-to-float v7, v7

    add-float/2addr v5, v7

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v8

    .line 468
    .local v8, "x2":I
    int-to-float v5, v2

    float-to-double v6, v4

    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v6, v6, v17

    double-to-float v6, v6

    add-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    .line 470
    .local v5, "y2":I
    invoke-virtual/range {p3 .. p3}, Lorg/achartengine/renderer/DefaultRenderer;->getLabelsTextSize()F

    move-result v20

    .line 471
    .local v20, "size":F
    const/high16 v6, 0x40000000    # 2.0f

    div-float v7, v20, v6

    const/high16 v6, 0x41200000    # 10.0f

    invoke-static {v7, v6}, Ljava/lang/Math;->max(FF)F

    move-result v6

    .line 472
    .local v6, "extra":F
    sget-object v7, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v11, v7}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 473
    if-le v10, v8, :cond_2

    .line 474
    neg-float v6, v6

    .line 475
    sget-object v7, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    invoke-virtual {v11, v7}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    move/from16 v21, v6

    goto :goto_1

    .line 473
    :cond_2
    move/from16 v21, v6

    .line 477
    .end local v6    # "extra":F
    .local v21, "extra":F
    :goto_1
    int-to-float v6, v8

    add-float v7, v6, v21

    .line 478
    .local v7, "xLabel":F
    int-to-float v6, v5

    .line 479
    .local v6, "yLabel":F
    move/from16 v1, p12

    int-to-float v2, v1

    sub-float/2addr v2, v7

    .line 480
    .local v2, "width":F
    if-le v10, v8, :cond_3

    .line 481
    move/from16 v1, p11

    move/from16 v22, v2

    .end local v2    # "width":F
    .local v22, "width":F
    int-to-float v2, v1

    sub-float v2, v7, v2

    .end local v22    # "width":F
    .restart local v2    # "width":F
    goto :goto_2

    .line 480
    :cond_3
    move/from16 v1, p11

    move/from16 v22, v2

    .line 483
    :goto_2
    move-object/from16 v1, p0

    move-object/from16 v3, p2

    invoke-direct {v1, v3, v2, v11}, Lorg/achartengine/chart/AbstractChart;->getFitText(Ljava/lang/String;FLandroid/graphics/Paint;)Ljava/lang/String;

    move-result-object v3

    .line 484
    .end local p2    # "labelText":Ljava/lang/String;
    .local v3, "labelText":Ljava/lang/String;
    invoke-virtual {v11, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v22

    .line 485
    .local v22, "widthLabel":F
    const/16 v23, 0x0

    .line 486
    .local v23, "okBounds":Z
    :goto_3
    if-nez v23, :cond_7

    if-eqz p15, :cond_7

    .line 487
    const/16 v24, 0x0

    .line 488
    .local v24, "intersects":Z
    invoke-interface/range {p4 .. p4}, Ljava/util/List;->size()I

    move-result v1

    .line 489
    .local v1, "length":I
    const/16 v25, 0x0

    move/from16 v27, v25

    move/from16 v25, v2

    move v2, v6

    move/from16 v6, v27

    .local v2, "yLabel":F
    .local v6, "j":I
    .local v25, "width":F
    :goto_4
    if-ge v6, v1, :cond_5

    if-nez v24, :cond_5

    .line 490
    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v26

    move/from16 p2, v1

    .end local v1    # "length":I
    .local p2, "length":I
    move-object/from16 v1, v26

    check-cast v1, Landroid/graphics/RectF;

    .line 491
    .local v1, "prevLabelBounds":Landroid/graphics/RectF;
    add-float v4, v7, v22

    move/from16 v26, v5

    .end local v5    # "y2":I
    .local v26, "y2":I
    add-float v5, v2, v20

    invoke-virtual {v1, v7, v2, v4, v5}, Landroid/graphics/RectF;->intersects(FFFF)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 492
    const/4 v4, 0x1

    .line 493
    .end local v24    # "intersects":Z
    .local v4, "intersects":Z
    iget v5, v1, Landroid/graphics/RectF;->bottom:F

    invoke-static {v2, v5}, Ljava/lang/Math;->max(FF)F

    move-result v2

    move/from16 v24, v4

    .line 489
    .end local v1    # "prevLabelBounds":Landroid/graphics/RectF;
    .end local v4    # "intersects":Z
    .restart local v24    # "intersects":Z
    :cond_4
    add-int/lit8 v6, v6, 0x1

    move/from16 v1, p2

    move/from16 v4, p8

    move/from16 v5, v26

    goto :goto_4

    .end local v26    # "y2":I
    .end local p2    # "length":I
    .local v1, "length":I
    .restart local v5    # "y2":I
    :cond_5
    move/from16 p2, v1

    move/from16 v26, v5

    .line 496
    .end local v1    # "length":I
    .end local v5    # "y2":I
    .end local v6    # "j":I
    .restart local v26    # "y2":I
    .restart local p2    # "length":I
    if-nez v24, :cond_6

    const/4 v1, 0x1

    goto :goto_5

    :cond_6
    const/4 v1, 0x0

    :goto_5
    move/from16 v23, v1

    .line 497
    .end local v24    # "intersects":Z
    .end local p2    # "length":I
    move-object/from16 v1, p0

    move/from16 v4, p8

    move v6, v2

    move/from16 v2, v25

    move/from16 v5, v26

    goto :goto_3

    .line 486
    .end local v25    # "width":F
    .end local v26    # "y2":I
    .local v2, "width":F
    .restart local v5    # "y2":I
    .local v6, "yLabel":F
    :cond_7
    move/from16 v25, v2

    move/from16 v26, v5

    .line 499
    .end local v2    # "width":F
    .end local v5    # "y2":I
    .restart local v25    # "width":F
    .restart local v26    # "y2":I
    if-eqz p15, :cond_8

    .line 500
    const/high16 v1, 0x40000000    # 2.0f

    div-float v1, v20, v1

    sub-float v1, v6, v1

    float-to-int v1, v1

    .line 501
    .end local v26    # "y2":I
    .local v1, "y2":I
    int-to-float v2, v10

    int-to-float v4, v9

    int-to-float v5, v8

    move/from16 v19, v9

    .end local v9    # "y1":I
    .local v19, "y1":I
    int-to-float v9, v1

    move/from16 v24, v5

    move-object/from16 v5, p1

    move v12, v6

    .end local v6    # "yLabel":F
    .local v12, "yLabel":F
    move v6, v2

    move v2, v7

    .end local v7    # "xLabel":F
    .local v2, "xLabel":F
    move v7, v4

    move v4, v8

    .end local v8    # "x2":I
    .local v4, "x2":I
    move/from16 v8, v24

    move/from16 v24, v10

    .end local v10    # "x1":I
    .local v24, "x1":I
    move-object/from16 v10, p14

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 502
    int-to-float v6, v4

    int-to-float v7, v1

    int-to-float v5, v4

    add-float v8, v5, v21

    int-to-float v9, v1

    move-object/from16 v5, p1

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_6

    .line 504
    .end local v1    # "y2":I
    .end local v2    # "xLabel":F
    .end local v4    # "x2":I
    .end local v12    # "yLabel":F
    .end local v19    # "y1":I
    .end local v24    # "x1":I
    .restart local v6    # "yLabel":F
    .restart local v7    # "xLabel":F
    .restart local v8    # "x2":I
    .restart local v9    # "y1":I
    .restart local v10    # "x1":I
    .restart local v26    # "y2":I
    :cond_8
    move v12, v6

    move v2, v7

    move v4, v8

    move/from16 v19, v9

    move/from16 v24, v10

    .end local v6    # "yLabel":F
    .end local v7    # "xLabel":F
    .end local v8    # "x2":I
    .end local v9    # "y1":I
    .end local v10    # "x1":I
    .restart local v2    # "xLabel":F
    .restart local v4    # "x2":I
    .restart local v12    # "yLabel":F
    .restart local v19    # "y1":I
    .restart local v24    # "x1":I
    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v11, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    move/from16 v1, v26

    .line 506
    .end local v26    # "y2":I
    .restart local v1    # "y2":I
    :goto_6
    move-object/from16 v5, p1

    invoke-virtual {v5, v3, v2, v12, v11}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 507
    if-eqz p15, :cond_9

    .line 508
    new-instance v6, Landroid/graphics/RectF;

    add-float v7, v2, v22

    add-float v8, v12, v20

    invoke-direct {v6, v2, v12, v7, v8}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 511
    .end local v1    # "y2":I
    .end local v2    # "xLabel":F
    .end local v4    # "x2":I
    .end local v12    # "yLabel":F
    .end local v13    # "rAngle":D
    .end local v15    # "sinValue":D
    .end local v17    # "cosValue":D
    .end local v19    # "y1":I
    .end local v20    # "size":F
    .end local v21    # "extra":F
    .end local v22    # "widthLabel":F
    .end local v23    # "okBounds":Z
    .end local v24    # "x1":I
    .end local v25    # "width":F
    :cond_9
    :goto_7
    return-void
.end method

.method protected drawLegend(Landroid/graphics/Canvas;Lorg/achartengine/renderer/DefaultRenderer;[Ljava/lang/String;IIIIIILandroid/graphics/Paint;Z)I
    .locals 25
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "renderer"    # Lorg/achartengine/renderer/DefaultRenderer;
    .param p3, "titles"    # [Ljava/lang/String;
    .param p4, "left"    # I
    .param p5, "right"    # I
    .param p6, "y"    # I
    .param p7, "width"    # I
    .param p8, "height"    # I
    .param p9, "legendSize"    # I
    .param p10, "paint"    # Landroid/graphics/Paint;
    .param p11, "calculate"    # Z

    .line 100
    move-object/from16 v7, p0

    move-object/from16 v8, p2

    move-object/from16 v9, p3

    move/from16 v10, p4

    move/from16 v11, p5

    move/from16 v12, p7

    move-object/from16 v13, p10

    const/high16 v0, 0x42000000    # 32.0f

    .line 101
    .local v0, "size":F
    invoke-virtual/range {p2 .. p2}, Lorg/achartengine/renderer/DefaultRenderer;->isShowLegend()Z

    move-result v1

    if-eqz v1, :cond_8

    .line 102
    int-to-float v1, v10

    .line 103
    .local v1, "currentX":F
    add-int v2, p6, p8

    sub-int v2, v2, p9

    int-to-float v2, v2

    add-float/2addr v2, v0

    .line 104
    .local v2, "currentY":F
    sget-object v3, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v13, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 105
    invoke-virtual/range {p2 .. p2}, Lorg/achartengine/renderer/DefaultRenderer;->getLegendTextSize()F

    move-result v3

    invoke-virtual {v13, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 106
    array-length v3, v9

    invoke-virtual/range {p2 .. p2}, Lorg/achartengine/renderer/DefaultRenderer;->getSeriesRendererCount()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v14

    .line 107
    .local v14, "sLength":I
    const/4 v3, 0x0

    move v15, v3

    .local v15, "i":I
    :goto_0
    if-ge v15, v14, :cond_7

    .line 108
    invoke-virtual {v8, v15}, Lorg/achartengine/renderer/DefaultRenderer;->getSeriesRendererAt(I)Lorg/achartengine/renderer/SimpleSeriesRenderer;

    move-result-object v16

    .line 109
    .local v16, "r":Lorg/achartengine/renderer/SimpleSeriesRenderer;
    invoke-virtual {v7, v15}, Lorg/achartengine/chart/AbstractChart;->getLegendShapeWidth(I)I

    move-result v3

    int-to-float v6, v3

    .line 110
    .local v6, "lineSize":F
    invoke-virtual/range {v16 .. v16}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->isShowLegendItem()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 111
    aget-object v3, v9, v15

    .line 112
    .local v3, "text":Ljava/lang/String;
    array-length v4, v9

    invoke-virtual/range {p2 .. p2}, Lorg/achartengine/renderer/DefaultRenderer;->getSeriesRendererCount()I

    move-result v5

    if-ne v4, v5, :cond_0

    .line 113
    invoke-virtual/range {v16 .. v16}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getColor()I

    move-result v4

    invoke-virtual {v13, v4}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_1

    .line 115
    :cond_0
    const v4, -0x333334

    invoke-virtual {v13, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 117
    :goto_1
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    new-array v5, v4, [F

    .line 118
    .local v5, "widths":[F
    invoke-virtual {v13, v3, v5}, Landroid/graphics/Paint;->getTextWidths(Ljava/lang/String;[F)I

    .line 119
    const/4 v4, 0x0

    .line 120
    .local v4, "sum":F
    move-object/from16 v17, v5

    move/from16 v18, v4

    move-object/from16 v4, v17

    .local v4, "arr$":[F
    .local v18, "sum":F
    array-length v9, v4

    .local v9, "len$":I
    const/16 v17, 0x0

    move/from16 v19, v14

    move/from16 v14, v17

    .local v14, "i$":I
    .local v19, "sLength":I
    :goto_2
    if-ge v14, v9, :cond_1

    aget v17, v4, v14

    .line 121
    .local v17, "value":F
    add-float v18, v18, v17

    .line 120
    .end local v17    # "value":F
    add-int/lit8 v14, v14, 0x1

    goto :goto_2

    .line 123
    .end local v4    # "arr$":[F
    .end local v9    # "len$":I
    .end local v14    # "i$":I
    :cond_1
    const/high16 v4, 0x41200000    # 10.0f

    add-float v9, v6, v4

    add-float v9, v9, v18

    .line 124
    .local v9, "extraSize":F
    add-float v14, v1, v9

    .line 126
    .local v14, "currentWidth":F
    if-lez v15, :cond_2

    invoke-virtual {v7, v14, v8, v11, v12}, Lorg/achartengine/chart/AbstractChart;->getExceed(FLorg/achartengine/renderer/DefaultRenderer;II)Z

    move-result v17

    if-eqz v17, :cond_2

    .line 127
    int-to-float v1, v10

    .line 128
    invoke-virtual/range {p2 .. p2}, Lorg/achartengine/renderer/DefaultRenderer;->getLegendTextSize()F

    move-result v17

    add-float v2, v2, v17

    .line 129
    invoke-virtual/range {p2 .. p2}, Lorg/achartengine/renderer/DefaultRenderer;->getLegendTextSize()F

    move-result v17

    add-float v0, v0, v17

    .line 130
    add-float v14, v1, v9

    move/from16 v20, v0

    move/from16 v17, v1

    move/from16 v21, v2

    goto :goto_3

    .line 132
    :cond_2
    move/from16 v20, v0

    move/from16 v17, v1

    move/from16 v21, v2

    .end local v0    # "size":F
    .end local v1    # "currentX":F
    .end local v2    # "currentY":F
    .local v17, "currentX":F
    .local v20, "size":F
    .local v21, "currentY":F
    :goto_3
    invoke-virtual {v7, v14, v8, v11, v12}, Lorg/achartengine/chart/AbstractChart;->getExceed(FLorg/achartengine/renderer/DefaultRenderer;II)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 133
    int-to-float v0, v11

    sub-float v0, v0, v17

    sub-float/2addr v0, v6

    sub-float/2addr v0, v4

    .line 134
    .local v0, "maxWidth":F
    invoke-virtual {v7, v8}, Lorg/achartengine/chart/AbstractChart;->isVertical(Lorg/achartengine/renderer/DefaultRenderer;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 135
    int-to-float v1, v12

    sub-float v1, v1, v17

    sub-float/2addr v1, v6

    sub-float v0, v1, v4

    .line 137
    :cond_3
    const/4 v1, 0x1

    invoke-virtual {v13, v3, v1, v0, v5}, Landroid/graphics/Paint;->breakText(Ljava/lang/String;ZF[F)I

    move-result v1

    .line 138
    .local v1, "nr":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "..."

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v22, v2

    .end local v3    # "text":Ljava/lang/String;
    .local v2, "text":Ljava/lang/String;
    goto :goto_4

    .line 132
    .end local v0    # "maxWidth":F
    .end local v1    # "nr":I
    .end local v2    # "text":Ljava/lang/String;
    .restart local v3    # "text":Ljava/lang/String;
    :cond_4
    move-object/from16 v22, v3

    .line 140
    .end local v3    # "text":Ljava/lang/String;
    .local v22, "text":Ljava/lang/String;
    :goto_4
    if-nez p11, :cond_5

    .line 141
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v16

    move/from16 v3, v17

    move/from16 v4, v21

    move-object/from16 v23, v5

    .end local v5    # "widths":[F
    .local v23, "widths":[F
    move v5, v15

    move/from16 v24, v6

    .end local v6    # "lineSize":F
    .local v24, "lineSize":F
    move-object/from16 v6, p10

    invoke-virtual/range {v0 .. v6}, Lorg/achartengine/chart/AbstractChart;->drawLegendShape(Landroid/graphics/Canvas;Lorg/achartengine/renderer/SimpleSeriesRenderer;FFILandroid/graphics/Paint;)V

    .line 142
    add-float v6, v17, v24

    const/high16 v0, 0x40a00000    # 5.0f

    add-float v3, v6, v0

    add-float v4, v21, v0

    move-object/from16 v0, p0

    move-object/from16 v2, v22

    move-object/from16 v5, p10

    invoke-virtual/range {v0 .. v5}, Lorg/achartengine/chart/AbstractChart;->drawString(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto :goto_5

    .line 140
    .end local v23    # "widths":[F
    .end local v24    # "lineSize":F
    .restart local v5    # "widths":[F
    .restart local v6    # "lineSize":F
    :cond_5
    move-object/from16 v23, v5

    move/from16 v24, v6

    .line 144
    .end local v5    # "widths":[F
    .end local v6    # "lineSize":F
    .restart local v23    # "widths":[F
    .restart local v24    # "lineSize":F
    :goto_5
    add-float v17, v17, v9

    move/from16 v1, v17

    move/from16 v0, v20

    move/from16 v2, v21

    goto :goto_6

    .line 110
    .end local v9    # "extraSize":F
    .end local v17    # "currentX":F
    .end local v18    # "sum":F
    .end local v19    # "sLength":I
    .end local v20    # "size":F
    .end local v21    # "currentY":F
    .end local v22    # "text":Ljava/lang/String;
    .end local v23    # "widths":[F
    .end local v24    # "lineSize":F
    .local v0, "size":F
    .local v1, "currentX":F
    .local v2, "currentY":F
    .restart local v6    # "lineSize":F
    .local v14, "sLength":I
    :cond_6
    move/from16 v24, v6

    move/from16 v19, v14

    .line 107
    .end local v6    # "lineSize":F
    .end local v14    # "sLength":I
    .end local v16    # "r":Lorg/achartengine/renderer/SimpleSeriesRenderer;
    .restart local v19    # "sLength":I
    :goto_6
    add-int/lit8 v15, v15, 0x1

    move-object/from16 v9, p3

    move/from16 v14, v19

    goto/16 :goto_0

    .end local v19    # "sLength":I
    .restart local v14    # "sLength":I
    :cond_7
    move/from16 v19, v14

    .line 148
    .end local v1    # "currentX":F
    .end local v2    # "currentY":F
    .end local v14    # "sLength":I
    .end local v15    # "i":I
    :cond_8
    invoke-virtual/range {p2 .. p2}, Lorg/achartengine/renderer/DefaultRenderer;->getLegendTextSize()F

    move-result v1

    add-float/2addr v1, v0

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    return v1
.end method

.method public abstract drawLegendShape(Landroid/graphics/Canvas;Lorg/achartengine/renderer/SimpleSeriesRenderer;FFILandroid/graphics/Paint;)V
.end method

.method protected drawPath(Landroid/graphics/Canvas;Ljava/util/List;Landroid/graphics/Paint;Z)V
    .locals 17
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p3, "paint"    # Landroid/graphics/Paint;
    .param p4, "circular"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Canvas;",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;",
            "Landroid/graphics/Paint;",
            "Z)V"
        }
    .end annotation

    .line 302
    .local p2, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    move-object/from16 v0, p2

    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    .line 303
    .local v1, "path":Landroid/graphics/Path;
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v8

    .line 304
    .local v8, "height":I
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v9

    .line 307
    .local v9, "width":I
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x4

    if-ge v2, v3, :cond_0

    .line 308
    return-void

    .line 310
    :cond_0
    const/4 v10, 0x0

    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    const/4 v11, 0x1

    invoke-interface {v0, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    const/4 v12, 0x2

    invoke-interface {v0, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    const/4 v13, 0x3

    invoke-interface {v0, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    move v6, v8

    move v7, v9

    invoke-static/range {v2 .. v7}, Lorg/achartengine/chart/AbstractChart;->calculateDrawPoints(FFFFII)[F

    move-result-object v2

    .line 312
    .local v2, "tempDrawPoints":[F
    aget v3, v2, v10

    aget v4, v2, v11

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 313
    aget v3, v2, v12

    aget v4, v2, v13

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 315
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v14

    .line 316
    .local v14, "length":I
    const/4 v3, 0x4

    move-object/from16 v16, v2

    move v15, v3

    .end local v2    # "tempDrawPoints":[F
    .local v15, "i":I
    .local v16, "tempDrawPoints":[F
    :goto_0
    if-ge v15, v14, :cond_5

    .line 317
    add-int/lit8 v2, v15, -0x1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    const/4 v3, 0x0

    cmpg-float v2, v2, v3

    if-gez v2, :cond_1

    add-int/lit8 v2, v15, 0x1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    cmpg-float v2, v2, v3

    if-ltz v2, :cond_4

    :cond_1
    add-int/lit8 v2, v15, -0x1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    int-to-float v3, v8

    cmpl-float v2, v2, v3

    if-lez v2, :cond_2

    add-int/lit8 v2, v15, 0x1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    int-to-float v3, v8

    cmpl-float v2, v2, v3

    if-lez v2, :cond_2

    .line 319
    goto :goto_1

    .line 321
    :cond_2
    add-int/lit8 v2, v15, -0x2

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    add-int/lit8 v3, v15, -0x1

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-interface {v0, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    add-int/lit8 v5, v15, 0x1

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    move v6, v8

    move v7, v9

    invoke-static/range {v2 .. v7}, Lorg/achartengine/chart/AbstractChart;->calculateDrawPoints(FFFFII)[F

    move-result-object v2

    .line 323
    .end local v16    # "tempDrawPoints":[F
    .restart local v2    # "tempDrawPoints":[F
    if-nez p4, :cond_3

    .line 324
    aget v3, v2, v10

    aget v4, v2, v11

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 326
    :cond_3
    aget v3, v2, v12

    aget v4, v2, v13

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    move-object/from16 v16, v2

    .line 316
    .end local v2    # "tempDrawPoints":[F
    .restart local v16    # "tempDrawPoints":[F
    :cond_4
    :goto_1
    add-int/lit8 v15, v15, 0x2

    goto/16 :goto_0

    .line 328
    .end local v15    # "i":I
    :cond_5
    if-eqz p4, :cond_6

    .line 329
    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-interface {v0, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 331
    :cond_6
    move-object/from16 v2, p1

    move-object/from16 v3, p3

    invoke-virtual {v2, v1, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 332
    return-void
.end method

.method protected drawPath(Landroid/graphics/Canvas;[FLandroid/graphics/Paint;Z)V
    .locals 17
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "points"    # [F
    .param p3, "paint"    # Landroid/graphics/Paint;
    .param p4, "circular"    # Z

    .line 343
    move-object/from16 v0, p2

    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    .line 344
    .local v1, "path":Landroid/graphics/Path;
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v8

    .line 345
    .local v8, "height":I
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v9

    .line 348
    .local v9, "width":I
    array-length v2, v0

    const/4 v3, 0x4

    if-ge v2, v3, :cond_0

    .line 349
    return-void

    .line 351
    :cond_0
    const/4 v10, 0x0

    aget v2, v0, v10

    const/4 v11, 0x1

    aget v3, v0, v11

    const/4 v12, 0x2

    aget v4, v0, v12

    const/4 v13, 0x3

    aget v5, v0, v13

    move v6, v8

    move v7, v9

    invoke-static/range {v2 .. v7}, Lorg/achartengine/chart/AbstractChart;->calculateDrawPoints(FFFFII)[F

    move-result-object v2

    .line 352
    .local v2, "tempDrawPoints":[F
    aget v3, v2, v10

    aget v4, v2, v11

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 353
    aget v3, v2, v12

    aget v4, v2, v13

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 355
    array-length v14, v0

    .line 356
    .local v14, "length":I
    const/4 v3, 0x4

    move-object/from16 v16, v2

    move v15, v3

    .end local v2    # "tempDrawPoints":[F
    .local v15, "i":I
    .local v16, "tempDrawPoints":[F
    :goto_0
    if-ge v15, v14, :cond_5

    .line 357
    add-int/lit8 v2, v15, -0x1

    aget v2, v0, v2

    const/4 v3, 0x0

    cmpg-float v2, v2, v3

    if-gez v2, :cond_1

    add-int/lit8 v2, v15, 0x1

    aget v2, v0, v2

    cmpg-float v2, v2, v3

    if-ltz v2, :cond_4

    :cond_1
    add-int/lit8 v2, v15, -0x1

    aget v2, v0, v2

    int-to-float v3, v8

    cmpl-float v2, v2, v3

    if-lez v2, :cond_2

    add-int/lit8 v2, v15, 0x1

    aget v2, v0, v2

    int-to-float v3, v8

    cmpl-float v2, v2, v3

    if-lez v2, :cond_2

    .line 359
    goto :goto_1

    .line 361
    :cond_2
    add-int/lit8 v2, v15, -0x2

    aget v2, v0, v2

    add-int/lit8 v3, v15, -0x1

    aget v3, v0, v3

    aget v4, v0, v15

    add-int/lit8 v5, v15, 0x1

    aget v5, v0, v5

    move v6, v8

    move v7, v9

    invoke-static/range {v2 .. v7}, Lorg/achartengine/chart/AbstractChart;->calculateDrawPoints(FFFFII)[F

    move-result-object v2

    .line 363
    .end local v16    # "tempDrawPoints":[F
    .restart local v2    # "tempDrawPoints":[F
    if-nez p4, :cond_3

    .line 364
    aget v3, v2, v10

    aget v4, v2, v11

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 366
    :cond_3
    aget v3, v2, v12

    aget v4, v2, v13

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    move-object/from16 v16, v2

    .line 356
    .end local v2    # "tempDrawPoints":[F
    .restart local v16    # "tempDrawPoints":[F
    :cond_4
    :goto_1
    add-int/lit8 v15, v15, 0x2

    goto :goto_0

    .line 368
    .end local v15    # "i":I
    :cond_5
    if-eqz p4, :cond_6

    .line 369
    aget v2, v0, v10

    aget v3, v0, v11

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 371
    :cond_6
    move-object/from16 v2, p1

    move-object/from16 v3, p3

    invoke-virtual {v2, v1, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 372
    return-void
.end method

.method protected drawString(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;)V
    .locals 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "x"    # F
    .param p4, "y"    # F
    .param p5, "paint"    # Landroid/graphics/Paint;

    .line 161
    if-eqz p2, :cond_0

    .line 162
    const-string v0, "\n"

    invoke-virtual {p2, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 163
    .local v0, "lines":[Ljava/lang/String;
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 164
    .local v1, "rect":Landroid/graphics/Rect;
    const/4 v2, 0x0

    .line 165
    .local v2, "yOff":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v0

    if-ge v3, v4, :cond_0

    .line 166
    aget-object v4, v0, v3

    int-to-float v5, v2

    add-float/2addr v5, p4

    invoke-virtual {p1, v4, p3, v5, p5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 167
    aget-object v4, v0, v3

    const/4 v5, 0x0

    aget-object v6, v0, v3

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {p5, v4, v5, v6, v1}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 168
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v4

    add-int/2addr v4, v2

    add-int/lit8 v2, v4, 0x5

    .line 165
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 171
    .end local v0    # "lines":[Ljava/lang/String;
    .end local v1    # "rect":Landroid/graphics/Rect;
    .end local v2    # "yOff":I
    .end local v3    # "i":I
    :cond_0
    return-void
.end method

.method protected getExceed(FLorg/achartengine/renderer/DefaultRenderer;II)Z
    .locals 4
    .param p1, "currentWidth"    # F
    .param p2, "renderer"    # Lorg/achartengine/renderer/DefaultRenderer;
    .param p3, "right"    # I
    .param p4, "width"    # I

    .line 183
    int-to-float v0, p3

    const/4 v1, 0x1

    const/4 v2, 0x0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 184
    .local v0, "exceed":Z
    :goto_0
    invoke-virtual {p0, p2}, Lorg/achartengine/chart/AbstractChart;->isVertical(Lorg/achartengine/renderer/DefaultRenderer;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 185
    int-to-float v3, p4

    cmpl-float v3, p1, v3

    if-lez v3, :cond_1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    move v0, v1

    .line 187
    :cond_2
    return v0
.end method

.method protected getLabel(Ljava/text/NumberFormat;D)Ljava/lang/String;
    .locals 6
    .param p1, "format"    # Ljava/text/NumberFormat;
    .param p2, "label"    # D

    .line 210
    const-string v0, ""

    .line 211
    .local v0, "text":Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 212
    invoke-virtual {p1, p2, p3}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 213
    :cond_0
    invoke-static {p2, p3}, Ljava/lang/Math;->round(D)J

    move-result-wide v1

    long-to-double v1, v1

    const-string v3, ""

    cmpl-double v4, p2, v1

    if-nez v4, :cond_1

    .line 214
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p2, p3}, Ljava/lang/Math;->round(D)J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 216
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 218
    :goto_0
    return-object v0
.end method

.method public abstract getLegendShapeWidth(I)I
.end method

.method protected getLegendSize(Lorg/achartengine/renderer/DefaultRenderer;IF)I
    .locals 3
    .param p1, "renderer"    # Lorg/achartengine/renderer/DefaultRenderer;
    .param p2, "defaultHeight"    # I
    .param p3, "extraHeight"    # F

    .line 426
    invoke-virtual {p1}, Lorg/achartengine/renderer/DefaultRenderer;->getLegendHeight()I

    move-result v0

    .line 427
    .local v0, "legendSize":I
    invoke-virtual {p1}, Lorg/achartengine/renderer/DefaultRenderer;->isShowLegend()Z

    move-result v1

    if-eqz v1, :cond_0

    if-nez v0, :cond_0

    .line 428
    move v0, p2

    .line 430
    :cond_0
    invoke-virtual {p1}, Lorg/achartengine/renderer/DefaultRenderer;->isShowLegend()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p1}, Lorg/achartengine/renderer/DefaultRenderer;->isShowLabels()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 431
    invoke-virtual {p1}, Lorg/achartengine/renderer/DefaultRenderer;->getLabelsTextSize()F

    move-result v1

    const/high16 v2, 0x40800000    # 4.0f

    mul-float v1, v1, v2

    const/high16 v2, 0x40400000    # 3.0f

    div-float/2addr v1, v2

    add-float/2addr v1, p3

    float-to-int v0, v1

    .line 433
    :cond_1
    return v0
.end method

.method public getSeriesAndPointForScreenCoordinate(Lorg/achartengine/model/Point;)Lorg/achartengine/model/SeriesSelection;
    .locals 1
    .param p1, "screenPoint"    # Lorg/achartengine/model/Point;

    .line 526
    const/4 v0, 0x0

    return-object v0
.end method

.method public isNullValue(D)Z
    .locals 3
    .param p1, "value"    # D

    .line 514
    invoke-static {p1, p2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p1, p2}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v0

    if-nez v0, :cond_1

    const-wide v0, 0x7fefffffffffffffL    # Double.MAX_VALUE

    cmpl-double v2, p1, v0

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public isVertical(Lorg/achartengine/renderer/DefaultRenderer;)Z
    .locals 2
    .param p1, "renderer"    # Lorg/achartengine/renderer/DefaultRenderer;

    .line 197
    instance-of v0, p1, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getOrientation()Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    move-result-object v0

    sget-object v1, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->VERTICAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
