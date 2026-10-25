.class public abstract Lorg/achartengine/chart/XYChart;
.super Lorg/achartengine/chart/AbstractChart;
.source "XYChart.java"


# instance fields
.field private clickableAreas:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Lorg/achartengine/chart/ClickableArea;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mCalcRange:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "[D>;"
        }
    .end annotation
.end field

.field private mCenter:Lorg/achartengine/model/Point;

.field protected mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

.field protected mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

.field private mScale:F

.field private mScreenR:Landroid/graphics/Rect;

.field private mTranslate:F


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 75
    invoke-direct {p0}, Lorg/achartengine/chart/AbstractChart;-><init>()V

    .line 67
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/achartengine/chart/XYChart;->mCalcRange:Ljava/util/Map;

    .line 73
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/achartengine/chart/XYChart;->clickableAreas:Ljava/util/Map;

    .line 76
    return-void
.end method

.method public constructor <init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V
    .locals 1
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    .line 84
    invoke-direct {p0}, Lorg/achartengine/chart/AbstractChart;-><init>()V

    .line 67
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/achartengine/chart/XYChart;->mCalcRange:Ljava/util/Map;

    .line 73
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/achartengine/chart/XYChart;->clickableAreas:Ljava/util/Map;

    .line 85
    iput-object p1, p0, Lorg/achartengine/chart/XYChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    .line 86
    iput-object p2, p0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    .line 87
    return-void
.end method

.method private getLabelLinePos(Landroid/graphics/Paint$Align;)I
    .locals 2
    .param p1, "align"    # Landroid/graphics/Paint$Align;

    .line 817
    const/4 v0, 0x4

    .line 818
    .local v0, "pos":I
    sget-object v1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    if-ne p1, v1, :cond_0

    .line 819
    neg-int v0, v0

    .line 821
    :cond_0
    return v0
.end method

.method private getValidLabels(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .line 478
    .local p1, "labels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 479
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;

    .line 480
    .local v2, "label":Ljava/lang/Double;
    invoke-virtual {v2}, Ljava/lang/Double;->isNaN()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 481
    invoke-interface {v0, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .end local v2    # "label":Ljava/lang/Double;
    :cond_0
    goto :goto_0

    .line 484
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_1
    return-object v0
.end method

.method private setStroke(Landroid/graphics/Paint$Cap;Landroid/graphics/Paint$Join;FLandroid/graphics/Paint$Style;Landroid/graphics/PathEffect;Landroid/graphics/Paint;)V
    .locals 0
    .param p1, "cap"    # Landroid/graphics/Paint$Cap;
    .param p2, "join"    # Landroid/graphics/Paint$Join;
    .param p3, "miter"    # F
    .param p4, "style"    # Landroid/graphics/Paint$Style;
    .param p5, "pathEffect"    # Landroid/graphics/PathEffect;
    .param p6, "paint"    # Landroid/graphics/Paint;

    .line 544
    invoke-virtual {p6, p1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 545
    invoke-virtual {p6, p2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 546
    invoke-virtual {p6, p3}, Landroid/graphics/Paint;->setStrokeMiter(F)V

    .line 547
    invoke-virtual {p6, p5}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 548
    invoke-virtual {p6, p4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 549
    return-void
.end method

.method private transform(Landroid/graphics/Canvas;FZ)V
    .locals 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "angle"    # F
    .param p3, "inverse"    # Z

    .line 641
    const/high16 v0, 0x3f800000    # 1.0f

    if-eqz p3, :cond_0

    .line 642
    iget v1, p0, Lorg/achartengine/chart/XYChart;->mScale:F

    div-float/2addr v0, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->scale(FF)V

    .line 643
    iget v0, p0, Lorg/achartengine/chart/XYChart;->mTranslate:F

    neg-float v1, v0

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 644
    neg-float v0, p2

    iget-object v1, p0, Lorg/achartengine/chart/XYChart;->mCenter:Lorg/achartengine/model/Point;

    invoke-virtual {v1}, Lorg/achartengine/model/Point;->getX()F

    move-result v1

    iget-object v2, p0, Lorg/achartengine/chart/XYChart;->mCenter:Lorg/achartengine/model/Point;

    invoke-virtual {v2}, Lorg/achartengine/model/Point;->getY()F

    move-result v2

    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/Canvas;->rotate(FFF)V

    goto :goto_0

    .line 646
    :cond_0
    iget-object v1, p0, Lorg/achartengine/chart/XYChart;->mCenter:Lorg/achartengine/model/Point;

    invoke-virtual {v1}, Lorg/achartengine/model/Point;->getX()F

    move-result v1

    iget-object v2, p0, Lorg/achartengine/chart/XYChart;->mCenter:Lorg/achartengine/model/Point;

    invoke-virtual {v2}, Lorg/achartengine/model/Point;->getY()F

    move-result v2

    invoke-virtual {p1, p2, v1, v2}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 647
    iget v1, p0, Lorg/achartengine/chart/XYChart;->mTranslate:F

    neg-float v2, v1

    invoke-virtual {p1, v2, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 648
    iget v1, p0, Lorg/achartengine/chart/XYChart;->mScale:F

    div-float/2addr v0, v1

    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->scale(FF)V

    .line 650
    :goto_0
    return-void
.end method


# virtual methods
.method protected abstract clickableAreasForPoints(Ljava/util/List;Ljava/util/List;FII)[Lorg/achartengine/chart/ClickableArea;
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
.end method

.method public draw(Landroid/graphics/Canvas;IIIILandroid/graphics/Paint;)V
    .locals 58
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "width"    # I
    .param p5, "height"    # I
    .param p6, "paint"    # Landroid/graphics/Paint;

    .line 107
    move-object/from16 v15, p0

    move-object/from16 v13, p1

    move/from16 v14, p2

    move/from16 v12, p3

    move/from16 v11, p4

    move/from16 v10, p5

    move-object/from16 v9, p6

    iget-object v0, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isAntialiasing()Z

    move-result v0

    invoke-virtual {v9, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 108
    iget-object v0, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    div-int/lit8 v1, v10, 0x5

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getAxisTitleTextSize()F

    move-result v2

    invoke-virtual {v15, v0, v1, v2}, Lorg/achartengine/chart/XYChart;->getLegendSize(Lorg/achartengine/renderer/DefaultRenderer;IF)I

    move-result v0

    .line 109
    .local v0, "legendSize":I
    iget-object v1, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getMargins()[I

    move-result-object v17

    .line 110
    .local v17, "margins":[I
    const/4 v8, 0x1

    aget v1, v17, v8

    add-int v7, v14, v1

    .line 111
    .local v7, "left":I
    const/4 v6, 0x0

    aget v1, v17, v6

    add-int v5, v12, v1

    .line 112
    .local v5, "top":I
    add-int v1, v14, v11

    const/16 v16, 0x3

    aget v2, v17, v16

    sub-int v4, v1, v2

    .line 113
    .local v4, "right":I
    iget-object v1, v15, Lorg/achartengine/chart/XYChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    invoke-virtual {v1}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesCount()I

    move-result v3

    .line 114
    .local v3, "sLength":I
    new-array v2, v3, [Ljava/lang/String;

    .line 115
    .local v2, "titles":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_0

    .line 116
    iget-object v6, v15, Lorg/achartengine/chart/XYChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    invoke-virtual {v6, v1}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesAt(I)Lorg/achartengine/model/XYSeries;

    move-result-object v6

    invoke-virtual {v6}, Lorg/achartengine/model/XYSeries;->getTitle()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v1

    .line 115
    add-int/lit8 v1, v1, 0x1

    const/4 v6, 0x0

    goto :goto_0

    .line 118
    .end local v1    # "i":I
    :cond_0
    iget-object v1, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isFitLegend()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isShowLegend()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 119
    iget-object v6, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    const/16 v19, 0x1

    move-object/from16 v1, p0

    move-object/from16 v20, v2

    .end local v2    # "titles":[Ljava/lang/String;
    .local v20, "titles":[Ljava/lang/String;
    move-object/from16 v2, p1

    move/from16 v21, v3

    .end local v3    # "sLength":I
    .local v21, "sLength":I
    move-object v3, v6

    move v6, v4

    .end local v4    # "right":I
    .local v6, "right":I
    move-object/from16 v4, v20

    move/from16 v22, v5

    .end local v5    # "top":I
    .local v22, "top":I
    move v5, v7

    move/from16 v23, v6

    .end local v6    # "right":I
    .local v23, "right":I
    move/from16 v25, v7

    .end local v7    # "left":I
    .local v25, "left":I
    move/from16 v7, p3

    move/from16 v8, p4

    move/from16 v9, p5

    move v10, v0

    move v13, v11

    move-object/from16 v11, p6

    move v14, v12

    move/from16 v12, v19

    invoke-virtual/range {v1 .. v12}, Lorg/achartengine/chart/XYChart;->drawLegend(Landroid/graphics/Canvas;Lorg/achartengine/renderer/DefaultRenderer;[Ljava/lang/String;IIIIIILandroid/graphics/Paint;Z)I

    move-result v0

    move/from16 v18, v0

    goto :goto_1

    .line 118
    .end local v20    # "titles":[Ljava/lang/String;
    .end local v21    # "sLength":I
    .end local v22    # "top":I
    .end local v23    # "right":I
    .end local v25    # "left":I
    .restart local v2    # "titles":[Ljava/lang/String;
    .restart local v3    # "sLength":I
    .restart local v4    # "right":I
    .restart local v5    # "top":I
    .restart local v7    # "left":I
    :cond_1
    move-object/from16 v20, v2

    move/from16 v21, v3

    move/from16 v23, v4

    move/from16 v22, v5

    move/from16 v25, v7

    move v13, v11

    move v14, v12

    .line 122
    .end local v2    # "titles":[Ljava/lang/String;
    .end local v3    # "sLength":I
    .end local v4    # "right":I
    .end local v5    # "top":I
    .end local v7    # "left":I
    .restart local v20    # "titles":[Ljava/lang/String;
    .restart local v21    # "sLength":I
    .restart local v22    # "top":I
    .restart local v23    # "right":I
    .restart local v25    # "left":I
    move/from16 v18, v0

    .end local v0    # "legendSize":I
    .local v18, "legendSize":I
    :goto_1
    move/from16 v11, p5

    add-int v0, v14, v11

    const/4 v12, 0x2

    aget v1, v17, v12

    sub-int/2addr v0, v1

    sub-int v0, v0, v18

    .line 123
    .local v0, "bottom":I
    iget-object v1, v15, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    if-nez v1, :cond_2

    .line 124
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, v15, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    .line 126
    :cond_2
    iget-object v1, v15, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    move/from16 v9, v22

    move/from16 v8, v23

    move/from16 v10, v25

    .end local v22    # "top":I
    .end local v23    # "right":I
    .end local v25    # "left":I
    .local v8, "right":I
    .local v9, "top":I
    .local v10, "left":I
    invoke-virtual {v1, v10, v9, v8, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 127
    iget-object v2, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    const/16 v19, 0x0

    const/16 v22, 0x0

    move-object/from16 v1, p0

    move-object/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    .end local v8    # "right":I
    .restart local v23    # "right":I
    move-object/from16 v8, p6

    move/from16 v27, v9

    .end local v9    # "top":I
    .local v27, "top":I
    move/from16 v9, v19

    move/from16 v28, v10

    .end local v10    # "left":I
    .local v28, "left":I
    move/from16 v10, v22

    invoke-virtual/range {v1 .. v10}, Lorg/achartengine/chart/XYChart;->drawBackground(Lorg/achartengine/renderer/DefaultRenderer;Landroid/graphics/Canvas;IIIILandroid/graphics/Paint;ZI)V

    .line 129
    invoke-virtual/range {p6 .. p6}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v1

    if-eqz v1, :cond_5

    iget-object v1, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getTextTypeface()Landroid/graphics/Typeface;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-virtual/range {p6 .. p6}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v1

    iget-object v2, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getTextTypeface()Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    :cond_3
    invoke-virtual/range {p6 .. p6}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getTextTypefaceName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-virtual/range {p6 .. p6}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Typeface;->getStyle()I

    move-result v1

    iget-object v2, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getTextTypefaceStyle()I

    move-result v2

    if-eq v1, v2, :cond_4

    goto :goto_2

    :cond_4
    move-object/from16 v10, p6

    goto :goto_3

    .line 134
    :cond_5
    :goto_2
    iget-object v1, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getTextTypeface()Landroid/graphics/Typeface;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 135
    iget-object v1, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getTextTypeface()Landroid/graphics/Typeface;

    move-result-object v1

    move-object/from16 v10, p6

    invoke-virtual {v10, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    goto :goto_3

    .line 137
    :cond_6
    move-object/from16 v10, p6

    iget-object v1, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getTextTypefaceName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getTextTypefaceStyle()I

    move-result v2

    invoke-static {v1, v2}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v10, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 141
    :goto_3
    iget-object v1, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getOrientation()Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    move-result-object v9

    .line 142
    .local v9, "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    sget-object v1, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->VERTICAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    if-ne v9, v1, :cond_7

    .line 143
    sub-int v4, v23, v18

    .line 144
    .end local v23    # "right":I
    .restart local v4    # "right":I
    add-int/lit8 v1, v18, -0x14

    add-int/2addr v0, v1

    move v7, v0

    move v8, v4

    goto :goto_4

    .line 142
    .end local v4    # "right":I
    .restart local v23    # "right":I
    :cond_7
    move v7, v0

    move/from16 v8, v23

    .line 146
    .end local v0    # "bottom":I
    .end local v23    # "right":I
    .local v7, "bottom":I
    .restart local v8    # "right":I
    :goto_4
    invoke-virtual {v9}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->getAngle()I

    move-result v6

    .line 147
    .local v6, "angle":I
    const/16 v0, 0x5a

    if-ne v6, v0, :cond_8

    const/4 v0, 0x1

    goto :goto_5

    :cond_8
    const/4 v0, 0x0

    :goto_5
    move/from16 v19, v0

    .line 148
    .local v19, "rotate":Z
    int-to-float v0, v11

    int-to-float v1, v13

    div-float/2addr v0, v1

    iput v0, v15, Lorg/achartengine/chart/XYChart;->mScale:F

    .line 149
    sub-int v0, v13, v11

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    div-int/2addr v0, v12

    int-to-float v0, v0

    iput v0, v15, Lorg/achartengine/chart/XYChart;->mTranslate:F

    .line 150
    iget v0, v15, Lorg/achartengine/chart/XYChart;->mScale:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_9

    .line 151
    iget v0, v15, Lorg/achartengine/chart/XYChart;->mTranslate:F

    const/high16 v1, -0x40800000    # -1.0f

    mul-float v0, v0, v1

    iput v0, v15, Lorg/achartengine/chart/XYChart;->mTranslate:F

    .line 153
    :cond_9
    new-instance v0, Lorg/achartengine/model/Point;

    add-int v1, p2, v13

    div-int/2addr v1, v12

    int-to-float v1, v1

    add-int v2, v14, v11

    div-int/2addr v2, v12

    int-to-float v2, v2

    invoke-direct {v0, v1, v2}, Lorg/achartengine/model/Point;-><init>(FF)V

    iput-object v0, v15, Lorg/achartengine/chart/XYChart;->mCenter:Lorg/achartengine/model/Point;

    .line 154
    if-eqz v19, :cond_a

    .line 155
    int-to-float v0, v6

    move-object/from16 v13, p1

    const/4 v5, 0x0

    invoke-direct {v15, v13, v0, v5}, Lorg/achartengine/chart/XYChart;->transform(Landroid/graphics/Canvas;FZ)V

    goto :goto_6

    .line 154
    :cond_a
    move-object/from16 v13, p1

    const/4 v5, 0x0

    .line 158
    :goto_6
    const v0, -0x7fffffff

    .line 159
    .local v0, "maxScaleNumber":I
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_7
    move/from16 v4, v21

    .end local v21    # "sLength":I
    .local v4, "sLength":I
    if-ge v1, v4, :cond_b

    .line 160
    iget-object v2, v15, Lorg/achartengine/chart/XYChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    invoke-virtual {v2, v1}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesAt(I)Lorg/achartengine/model/XYSeries;

    move-result-object v2

    invoke-virtual {v2}, Lorg/achartengine/model/XYSeries;->getScaleNumber()I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 159
    add-int/lit8 v1, v1, 0x1

    move/from16 v21, v4

    goto :goto_7

    .line 162
    .end local v1    # "i":I
    :cond_b
    const/4 v3, 0x1

    add-int/lit8 v2, v0, 0x1

    .line 163
    .end local v0    # "maxScaleNumber":I
    .local v2, "maxScaleNumber":I
    if-gez v2, :cond_c

    .line 164
    return-void

    .line 166
    :cond_c
    new-array v1, v2, [D

    .line 167
    .local v1, "minX":[D
    new-array v12, v2, [D

    .line 168
    .local v12, "maxX":[D
    new-array v3, v2, [D

    .line 169
    .local v3, "minY":[D
    new-array v5, v2, [D

    .line 170
    .local v5, "maxY":[D
    new-array v13, v2, [Z

    .line 171
    .local v13, "isMinXSet":[Z
    new-array v14, v2, [Z

    .line 172
    .local v14, "isMaxXSet":[Z
    new-array v11, v2, [Z

    .line 173
    .local v11, "isMinYSet":[Z
    new-array v10, v2, [Z

    .line 175
    .local v10, "isMaxYSet":[Z
    const/16 v21, 0x0

    move/from16 v0, v21

    .local v0, "i":I
    :goto_8
    if-ge v0, v2, :cond_e

    .line 176
    move/from16 v21, v6

    .end local v6    # "angle":I
    .local v21, "angle":I
    iget-object v6, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v6, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXAxisMin(I)D

    move-result-wide v29

    aput-wide v29, v1, v0

    .line 177
    iget-object v6, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v6, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXAxisMax(I)D

    move-result-wide v29

    aput-wide v29, v12, v0

    .line 178
    iget-object v6, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v6, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisMin(I)D

    move-result-wide v29

    aput-wide v29, v3, v0

    .line 179
    iget-object v6, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v6, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisMax(I)D

    move-result-wide v29

    aput-wide v29, v5, v0

    .line 180
    iget-object v6, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v6, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMinXSet(I)Z

    move-result v6

    aput-boolean v6, v13, v0

    .line 181
    iget-object v6, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v6, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMaxXSet(I)Z

    move-result v6

    aput-boolean v6, v14, v0

    .line 182
    iget-object v6, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v6, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMinYSet(I)Z

    move-result v6

    aput-boolean v6, v11, v0

    .line 183
    iget-object v6, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v6, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMaxYSet(I)Z

    move-result v6

    aput-boolean v6, v10, v0

    .line 184
    iget-object v6, v15, Lorg/achartengine/chart/XYChart;->mCalcRange:Ljava/util/Map;

    move-object/from16 v23, v9

    .end local v9    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .local v23, "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v6, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-nez v6, :cond_d

    .line 185
    iget-object v6, v15, Lorg/achartengine/chart/XYChart;->mCalcRange:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    move/from16 v25, v7

    .end local v7    # "bottom":I
    .local v25, "bottom":I
    const/4 v7, 0x4

    new-array v7, v7, [D

    invoke-interface {v6, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_9

    .line 184
    .end local v25    # "bottom":I
    .restart local v7    # "bottom":I
    :cond_d
    move/from16 v25, v7

    .line 175
    .end local v7    # "bottom":I
    .restart local v25    # "bottom":I
    :goto_9
    add-int/lit8 v0, v0, 0x1

    move/from16 v6, v21

    move-object/from16 v9, v23

    move/from16 v7, v25

    goto :goto_8

    .end local v21    # "angle":I
    .end local v23    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .end local v25    # "bottom":I
    .restart local v6    # "angle":I
    .restart local v7    # "bottom":I
    .restart local v9    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    :cond_e
    move/from16 v21, v6

    move/from16 v25, v7

    move-object/from16 v23, v9

    .line 188
    .end local v0    # "i":I
    .end local v6    # "angle":I
    .end local v7    # "bottom":I
    .end local v9    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .restart local v21    # "angle":I
    .restart local v23    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .restart local v25    # "bottom":I
    new-array v9, v2, [D

    .line 189
    .local v9, "xPixelsPerUnit":[D
    new-array v7, v2, [D

    .line 190
    .local v7, "yPixelsPerUnit":[D
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_a
    if-ge v0, v4, :cond_14

    .line 191
    iget-object v6, v15, Lorg/achartengine/chart/XYChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    invoke-virtual {v6, v0}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesAt(I)Lorg/achartengine/model/XYSeries;

    move-result-object v6

    .line 192
    .local v6, "series":Lorg/achartengine/model/XYSeries;
    invoke-virtual {v6}, Lorg/achartengine/model/XYSeries;->getScaleNumber()I

    move-result v29

    .line 193
    .local v29, "scale":I
    invoke-virtual {v6}, Lorg/achartengine/model/XYSeries;->getItemCount()I

    move-result v30

    if-nez v30, :cond_f

    .line 194
    move/from16 v32, v4

    move-object/from16 v33, v5

    move-object/from16 v31, v7

    move/from16 v30, v8

    move-object/from16 v34, v11

    move-object v11, v9

    goto/16 :goto_e

    .line 196
    :cond_f
    aget-boolean v30, v13, v29

    if-nez v30, :cond_10

    .line 197
    move-object/from16 v31, v7

    move/from16 v30, v8

    .end local v7    # "yPixelsPerUnit":[D
    .end local v8    # "right":I
    .local v30, "right":I
    .local v31, "yPixelsPerUnit":[D
    invoke-virtual {v6}, Lorg/achartengine/model/XYSeries;->getMinX()D

    move-result-wide v7

    .line 198
    .local v7, "minimumX":D
    move/from16 v32, v4

    move-object/from16 v33, v5

    .end local v4    # "sLength":I
    .end local v5    # "maxY":[D
    .local v32, "sLength":I
    .local v33, "maxY":[D
    aget-wide v4, v1, v29

    invoke-static {v4, v5, v7, v8}, Ljava/lang/Math;->min(DD)D

    move-result-wide v4

    aput-wide v4, v1, v29

    .line 199
    iget-object v4, v15, Lorg/achartengine/chart/XYChart;->mCalcRange:Ljava/util/Map;

    invoke-static/range {v29 .. v29}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [D

    aget-wide v34, v1, v29

    const/4 v5, 0x0

    aput-wide v34, v4, v5

    goto :goto_b

    .line 196
    .end local v30    # "right":I
    .end local v31    # "yPixelsPerUnit":[D
    .end local v32    # "sLength":I
    .end local v33    # "maxY":[D
    .restart local v4    # "sLength":I
    .restart local v5    # "maxY":[D
    .local v7, "yPixelsPerUnit":[D
    .restart local v8    # "right":I
    :cond_10
    move/from16 v32, v4

    move-object/from16 v33, v5

    move-object/from16 v31, v7

    move/from16 v30, v8

    const/4 v5, 0x0

    .line 201
    .end local v4    # "sLength":I
    .end local v5    # "maxY":[D
    .end local v7    # "yPixelsPerUnit":[D
    .end local v8    # "right":I
    .restart local v30    # "right":I
    .restart local v31    # "yPixelsPerUnit":[D
    .restart local v32    # "sLength":I
    .restart local v33    # "maxY":[D
    :goto_b
    aget-boolean v4, v14, v29

    if-nez v4, :cond_11

    .line 202
    invoke-virtual {v6}, Lorg/achartengine/model/XYSeries;->getMaxX()D

    move-result-wide v7

    .line 203
    .local v7, "maximumX":D
    move-object v4, v6

    .end local v6    # "series":Lorg/achartengine/model/XYSeries;
    .local v4, "series":Lorg/achartengine/model/XYSeries;
    aget-wide v5, v12, v29

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->max(DD)D

    move-result-wide v5

    aput-wide v5, v12, v29

    .line 204
    iget-object v5, v15, Lorg/achartengine/chart/XYChart;->mCalcRange:Ljava/util/Map;

    invoke-static/range {v29 .. v29}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [D

    aget-wide v34, v12, v29

    const/4 v6, 0x1

    aput-wide v34, v5, v6

    goto :goto_c

    .line 201
    .end local v4    # "series":Lorg/achartengine/model/XYSeries;
    .end local v7    # "maximumX":D
    .restart local v6    # "series":Lorg/achartengine/model/XYSeries;
    :cond_11
    move-object v4, v6

    const/4 v6, 0x1

    .line 206
    .end local v6    # "series":Lorg/achartengine/model/XYSeries;
    .restart local v4    # "series":Lorg/achartengine/model/XYSeries;
    :goto_c
    aget-boolean v5, v11, v29

    if-nez v5, :cond_12

    .line 207
    invoke-virtual {v4}, Lorg/achartengine/model/XYSeries;->getMinY()D

    move-result-wide v7

    .line 208
    .local v7, "minimumY":D
    aget-wide v5, v3, v29

    move-object/from16 v34, v11

    .end local v11    # "isMinYSet":[Z
    .local v34, "isMinYSet":[Z
    double-to-float v11, v7

    move-wide/from16 v35, v7

    .end local v7    # "minimumY":D
    .local v35, "minimumY":D
    float-to-double v7, v11

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->min(DD)D

    move-result-wide v5

    aput-wide v5, v3, v29

    .line 209
    iget-object v5, v15, Lorg/achartengine/chart/XYChart;->mCalcRange:Ljava/util/Map;

    invoke-static/range {v29 .. v29}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [D

    aget-wide v6, v3, v29

    const/4 v8, 0x2

    aput-wide v6, v5, v8

    goto :goto_d

    .line 206
    .end local v34    # "isMinYSet":[Z
    .end local v35    # "minimumY":D
    .restart local v11    # "isMinYSet":[Z
    :cond_12
    move-object/from16 v34, v11

    const/4 v8, 0x2

    .line 211
    .end local v11    # "isMinYSet":[Z
    .restart local v34    # "isMinYSet":[Z
    :goto_d
    aget-boolean v5, v10, v29

    if-nez v5, :cond_13

    .line 212
    invoke-virtual {v4}, Lorg/achartengine/model/XYSeries;->getMaxY()D

    move-result-wide v5

    .line 213
    .local v5, "maximumY":D
    move-object v11, v9

    .end local v9    # "xPixelsPerUnit":[D
    .local v11, "xPixelsPerUnit":[D
    aget-wide v8, v33, v29

    double-to-float v7, v5

    move-object/from16 v35, v4

    move-wide/from16 v36, v5

    .end local v4    # "series":Lorg/achartengine/model/XYSeries;
    .end local v5    # "maximumY":D
    .local v35, "series":Lorg/achartengine/model/XYSeries;
    .local v36, "maximumY":D
    float-to-double v4, v7

    invoke-static {v8, v9, v4, v5}, Ljava/lang/Math;->max(DD)D

    move-result-wide v4

    aput-wide v4, v33, v29

    .line 214
    iget-object v4, v15, Lorg/achartengine/chart/XYChart;->mCalcRange:Ljava/util/Map;

    invoke-static/range {v29 .. v29}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [D

    aget-wide v5, v33, v29

    aput-wide v5, v4, v16

    goto :goto_e

    .line 211
    .end local v11    # "xPixelsPerUnit":[D
    .end local v35    # "series":Lorg/achartengine/model/XYSeries;
    .end local v36    # "maximumY":D
    .restart local v4    # "series":Lorg/achartengine/model/XYSeries;
    .restart local v9    # "xPixelsPerUnit":[D
    :cond_13
    move-object/from16 v35, v4

    move-object v11, v9

    .line 190
    .end local v4    # "series":Lorg/achartengine/model/XYSeries;
    .end local v9    # "xPixelsPerUnit":[D
    .end local v29    # "scale":I
    .restart local v11    # "xPixelsPerUnit":[D
    :goto_e
    add-int/lit8 v0, v0, 0x1

    move-object v9, v11

    move/from16 v8, v30

    move-object/from16 v7, v31

    move/from16 v4, v32

    move-object/from16 v5, v33

    move-object/from16 v11, v34

    goto/16 :goto_a

    .end local v30    # "right":I
    .end local v31    # "yPixelsPerUnit":[D
    .end local v32    # "sLength":I
    .end local v33    # "maxY":[D
    .end local v34    # "isMinYSet":[Z
    .local v4, "sLength":I
    .local v5, "maxY":[D
    .local v7, "yPixelsPerUnit":[D
    .restart local v8    # "right":I
    .restart local v9    # "xPixelsPerUnit":[D
    .local v11, "isMinYSet":[Z
    :cond_14
    move/from16 v32, v4

    move-object/from16 v33, v5

    move-object/from16 v31, v7

    move/from16 v30, v8

    move-object/from16 v34, v11

    move-object v11, v9

    .line 217
    .end local v0    # "i":I
    .end local v4    # "sLength":I
    .end local v5    # "maxY":[D
    .end local v7    # "yPixelsPerUnit":[D
    .end local v8    # "right":I
    .end local v9    # "xPixelsPerUnit":[D
    .local v11, "xPixelsPerUnit":[D
    .restart local v30    # "right":I
    .restart local v31    # "yPixelsPerUnit":[D
    .restart local v32    # "sLength":I
    .restart local v33    # "maxY":[D
    .restart local v34    # "isMinYSet":[Z
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_f
    if-ge v0, v2, :cond_17

    .line 218
    aget-wide v4, v12, v0

    aget-wide v6, v1, v0

    sub-double/2addr v4, v6

    const-wide/16 v6, 0x0

    cmpl-double v8, v4, v6

    if-eqz v8, :cond_15

    .line 219
    move/from16 v9, v28

    .end local v28    # "left":I
    .local v9, "left":I
    sub-int v8, v30, v9

    int-to-double v4, v8

    aget-wide v28, v12, v0

    aget-wide v35, v1, v0

    sub-double v28, v28, v35

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    div-double v4, v4, v28

    aput-wide v4, v11, v0

    goto :goto_10

    .line 218
    .end local v9    # "left":I
    .restart local v28    # "left":I
    :cond_15
    move/from16 v9, v28

    .line 221
    .end local v28    # "left":I
    .restart local v9    # "left":I
    :goto_10
    aget-wide v4, v33, v0

    aget-wide v28, v3, v0

    sub-double v4, v4, v28

    cmpl-double v8, v4, v6

    if-eqz v8, :cond_16

    .line 222
    move/from16 v8, v27

    .end local v27    # "top":I
    .local v8, "top":I
    sub-int v7, v25, v8

    int-to-double v4, v7

    aget-wide v6, v33, v0

    aget-wide v27, v3, v0

    sub-double v6, v6, v27

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v4, v6

    double-to-float v4, v4

    float-to-double v4, v4

    aput-wide v4, v31, v0

    goto :goto_11

    .line 221
    .end local v8    # "top":I
    .restart local v27    # "top":I
    :cond_16
    move/from16 v8, v27

    .line 217
    .end local v27    # "top":I
    .restart local v8    # "top":I
    :goto_11
    add-int/lit8 v0, v0, 0x1

    move/from16 v27, v8

    move/from16 v28, v9

    goto :goto_f

    .end local v8    # "top":I
    .end local v9    # "left":I
    .restart local v27    # "top":I
    .restart local v28    # "left":I
    :cond_17
    move/from16 v8, v27

    move/from16 v9, v28

    .line 226
    .end local v0    # "i":I
    .end local v27    # "top":I
    .end local v28    # "left":I
    .restart local v8    # "top":I
    .restart local v9    # "left":I
    const/4 v0, 0x0

    .line 231
    .local v0, "hasValues":Z
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    iput-object v4, v15, Lorg/achartengine/chart/XYChart;->clickableAreas:Ljava/util/Map;

    .line 232
    const/4 v4, 0x0

    move v7, v4

    .local v7, "i":I
    :goto_12
    move/from16 v4, v32

    .end local v32    # "sLength":I
    .restart local v4    # "sLength":I
    if-ge v7, v4, :cond_24

    .line 233
    iget-object v5, v15, Lorg/achartengine/chart/XYChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    invoke-virtual {v5, v7}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesAt(I)Lorg/achartengine/model/XYSeries;

    move-result-object v6

    .line 234
    .restart local v6    # "series":Lorg/achartengine/model/XYSeries;
    invoke-virtual {v6}, Lorg/achartengine/model/XYSeries;->getScaleNumber()I

    move-result v22

    .line 235
    .local v22, "scale":I
    invoke-virtual {v6}, Lorg/achartengine/model/XYSeries;->getItemCount()I

    move-result v5

    if-nez v5, :cond_18

    .line 236
    move-object/from16 v45, v1

    move/from16 v51, v2

    move-object/from16 v35, v3

    move/from16 v26, v4

    move/from16 v40, v8

    move-object/from16 v52, v10

    move-object/from16 v24, v11

    move-object/from16 v38, v12

    move-object/from16 v41, v14

    move/from16 v50, v21

    move/from16 v11, v25

    move-object/from16 v42, v33

    move/from16 v33, v7

    move-object/from16 v25, v13

    move v13, v9

    goto/16 :goto_1d

    .line 239
    :cond_18
    const/16 v27, 0x1

    .line 240
    .end local v0    # "hasValues":Z
    .local v27, "hasValues":Z
    iget-object v0, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0, v7}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getSeriesRendererAt(I)Lorg/achartengine/renderer/SimpleSeriesRenderer;

    move-result-object v28

    .line 246
    .local v28, "seriesRenderer":Lorg/achartengine/renderer/SimpleSeriesRenderer;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v5, v0

    .line 247
    .local v5, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v29, v0

    .line 248
    .local v29, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    move/from16 v32, v8

    move/from16 v8, v25

    .end local v25    # "bottom":I
    .local v8, "bottom":I
    .local v32, "top":I
    int-to-float v0, v8

    move-object/from16 v25, v13

    move-object/from16 v41, v14

    .end local v13    # "isMinXSet":[Z
    .end local v14    # "isMaxXSet":[Z
    .local v25, "isMinXSet":[Z
    .local v41, "isMaxXSet":[Z
    int-to-double v13, v8

    aget-wide v35, v31, v22

    aget-wide v37, v3, v22

    mul-double v35, v35, v37

    invoke-static {v13, v14}, Ljava/lang/Double;->isNaN(D)Z

    add-double v13, v13, v35

    double-to-float v13, v13

    invoke-static {v0, v13}, Ljava/lang/Math;->min(FF)F

    move-result v13

    .line 249
    .local v13, "yAxisValue":F
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    move-object v14, v0

    .line 251
    .local v14, "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    iget-object v0, v15, Lorg/achartengine/chart/XYChart;->clickableAreas:Ljava/util/Map;

    move/from16 v42, v2

    .end local v2    # "maxScaleNumber":I
    .local v42, "maxScaleNumber":I
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 253
    monitor-enter v6

    .line 254
    :try_start_0
    aget-wide v36, v1, v22

    aget-wide v38, v12, v22

    invoke-virtual/range {v28 .. v28}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->isDisplayBoundingPoints()Z

    move-result v40

    move-object/from16 v35, v6

    invoke-virtual/range {v35 .. v40}, Lorg/achartengine/model/XYSeries;->getRange(DDZ)Ljava/util/SortedMap;

    move-result-object v0

    .line 256
    .local v0, "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    const/4 v2, -0x1

    .line 258
    .local v2, "startIndex":I
    invoke-interface {v0}, Ljava/util/SortedMap;->entrySet()Ljava/util/Set;

    move-result-object v35

    invoke-interface/range {v35 .. v35}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v35

    move/from16 v36, v2

    .end local v2    # "startIndex":I
    .local v35, "i$":Ljava/util/Iterator;
    .local v36, "startIndex":I
    :goto_13
    invoke-interface/range {v35 .. v35}, Ljava/util/Iterator;->hasNext()Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_12

    if-eqz v2, :cond_1f

    :try_start_1
    invoke-interface/range {v35 .. v35}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    move-object/from16 v37, v2

    .line 259
    .local v37, "value":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Double;Ljava/lang/Double;>;"
    invoke-interface/range {v37 .. v37}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v38

    move-wide/from16 v43, v38

    .line 260
    .local v43, "xValue":D
    invoke-interface/range {v37 .. v37}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v38
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_c

    move-wide/from16 v45, v38

    .line 261
    .local v45, "yValue":D
    if-gez v36, :cond_1b

    move-object/from16 v38, v12

    move/from16 v39, v13

    move-wide/from16 v12, v45

    .end local v13    # "yAxisValue":F
    .end local v45    # "yValue":D
    .local v12, "yValue":D
    .local v38, "maxX":[D
    .local v39, "yAxisValue":F
    :try_start_2
    invoke-virtual {v15, v12, v13}, Lorg/achartengine/chart/XYChart;->isNullValue(D)Z

    move-result v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-eqz v2, :cond_1a

    :try_start_3
    invoke-virtual/range {p0 .. p0}, Lorg/achartengine/chart/XYChart;->isRenderNullValues()Z

    move-result v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v2, :cond_19

    goto :goto_14

    :cond_19
    move-object/from16 v40, v3

    move-wide/from16 v2, v43

    goto/16 :goto_15

    .line 316
    .end local v0    # "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    .end local v12    # "yValue":D
    .end local v35    # "i$":Ljava/util/Iterator;
    .end local v36    # "startIndex":I
    .end local v37    # "value":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Double;Ljava/lang/Double;>;"
    .end local v43    # "xValue":D
    :catchall_0
    move-exception v0

    move-object/from16 v45, v1

    move-object/from16 v35, v3

    move/from16 v26, v4

    move-object v12, v5

    move-object/from16 v37, v6

    move v13, v9

    move-object/from16 v52, v10

    move-object/from16 v24, v11

    move/from16 v50, v21

    move/from16 v40, v32

    move/from16 v51, v42

    move v11, v8

    move-object/from16 v42, v33

    move/from16 v33, v7

    goto/16 :goto_1e

    .line 262
    .restart local v0    # "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    .restart local v12    # "yValue":D
    .restart local v35    # "i$":Ljava/util/Iterator;
    .restart local v36    # "startIndex":I
    .restart local v37    # "value":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Double;Ljava/lang/Double;>;"
    .restart local v43    # "xValue":D
    :cond_1a
    :goto_14
    move-object/from16 v40, v3

    move-wide/from16 v2, v43

    .end local v3    # "minY":[D
    .end local v43    # "xValue":D
    .local v2, "xValue":D
    .local v40, "minY":[D
    :try_start_4
    invoke-virtual {v6, v2, v3}, Lorg/achartengine/model/XYSeries;->getIndexForKey(D)I

    move-result v43
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move/from16 v36, v43

    goto :goto_15

    .line 316
    .end local v0    # "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    .end local v2    # "xValue":D
    .end local v12    # "yValue":D
    .end local v35    # "i$":Ljava/util/Iterator;
    .end local v36    # "startIndex":I
    .end local v37    # "value":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Double;Ljava/lang/Double;>;"
    :catchall_1
    move-exception v0

    move-object/from16 v45, v1

    move/from16 v26, v4

    move-object v12, v5

    move-object/from16 v37, v6

    move v13, v9

    move-object/from16 v52, v10

    move-object/from16 v24, v11

    move/from16 v50, v21

    move-object/from16 v35, v40

    move/from16 v51, v42

    move v11, v8

    move/from16 v40, v32

    move-object/from16 v42, v33

    move/from16 v33, v7

    goto/16 :goto_1e

    .end local v40    # "minY":[D
    .restart local v3    # "minY":[D
    :catchall_2
    move-exception v0

    move-object/from16 v45, v1

    move-object/from16 v35, v3

    move/from16 v26, v4

    move-object v12, v5

    move-object/from16 v37, v6

    move v13, v9

    move-object/from16 v52, v10

    move-object/from16 v24, v11

    move/from16 v50, v21

    move/from16 v40, v32

    move/from16 v51, v42

    move v11, v8

    move-object/from16 v42, v33

    move/from16 v33, v7

    .end local v3    # "minY":[D
    .restart local v40    # "minY":[D
    goto/16 :goto_1e

    .line 261
    .end local v38    # "maxX":[D
    .end local v39    # "yAxisValue":F
    .end local v40    # "minY":[D
    .restart local v0    # "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    .restart local v3    # "minY":[D
    .local v12, "maxX":[D
    .restart local v13    # "yAxisValue":F
    .restart local v35    # "i$":Ljava/util/Iterator;
    .restart local v36    # "startIndex":I
    .restart local v37    # "value":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Double;Ljava/lang/Double;>;"
    .restart local v43    # "xValue":D
    .restart local v45    # "yValue":D
    :cond_1b
    move-object/from16 v40, v3

    move-object/from16 v38, v12

    move/from16 v39, v13

    move-wide/from16 v2, v43

    move-wide/from16 v12, v45

    .line 269
    .end local v3    # "minY":[D
    .end local v13    # "yAxisValue":F
    .end local v43    # "xValue":D
    .end local v45    # "yValue":D
    .restart local v2    # "xValue":D
    .local v12, "yValue":D
    .restart local v38    # "maxX":[D
    .restart local v39    # "yAxisValue":F
    .restart local v40    # "minY":[D
    :goto_15
    move-object/from16 v43, v0

    .end local v0    # "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    .local v43, "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    :try_start_5
    invoke-interface/range {v37 .. v37}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_b

    move-object/from16 v44, v14

    move-object/from16 v14, v29

    .end local v29    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    .local v14, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    .local v44, "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    :try_start_6
    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 270
    invoke-interface/range {v37 .. v37}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 272
    invoke-virtual {v15, v12, v13}, Lorg/achartengine/chart/XYChart;->isNullValue(D)Z

    move-result v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_a

    if-nez v0, :cond_1c

    .line 273
    move-object/from16 v29, v14

    .end local v14    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    .restart local v29    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    int-to-double v14, v9

    :try_start_7
    aget-wide v45, v11, v22

    aget-wide v47, v1, v22
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    sub-double v47, v2, v47

    mul-double v45, v45, v47

    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    add-double v14, v14, v45

    double-to-float v0, v14

    :try_start_8
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 274
    int-to-double v14, v8

    aget-wide v45, v31, v22

    aget-wide v47, v40, v22
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    sub-double v47, v12, v47

    mul-double v45, v45, v47

    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    sub-double v14, v14, v45

    double-to-float v0, v14

    :try_start_9
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    move-object/from16 v47, v1

    goto :goto_16

    .line 316
    .end local v2    # "xValue":D
    .end local v12    # "yValue":D
    .end local v35    # "i$":Ljava/util/Iterator;
    .end local v36    # "startIndex":I
    .end local v37    # "value":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Double;Ljava/lang/Double;>;"
    .end local v43    # "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    :catchall_3
    move-exception v0

    move-object/from16 v15, p0

    move-object/from16 v45, v1

    move/from16 v26, v4

    move-object v12, v5

    move-object/from16 v37, v6

    move v13, v9

    move-object/from16 v52, v10

    move-object/from16 v24, v11

    move/from16 v50, v21

    move-object/from16 v35, v40

    move/from16 v51, v42

    move-object/from16 v14, v44

    move v11, v8

    move/from16 v40, v32

    move-object/from16 v42, v33

    move/from16 v33, v7

    goto/16 :goto_1e

    .line 275
    .end local v29    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    .restart local v2    # "xValue":D
    .restart local v12    # "yValue":D
    .restart local v14    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    .restart local v35    # "i$":Ljava/util/Iterator;
    .restart local v36    # "startIndex":I
    .restart local v37    # "value":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Double;Ljava/lang/Double;>;"
    .restart local v43    # "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    :cond_1c
    move-object/from16 v29, v14

    .end local v14    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    .restart local v29    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    :try_start_a
    invoke-virtual/range {p0 .. p0}, Lorg/achartengine/chart/XYChart;->isRenderNullValues()Z

    move-result v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_9

    if-eqz v0, :cond_1d

    .line 276
    int-to-double v14, v9

    :try_start_b
    aget-wide v45, v11, v22

    aget-wide v47, v1, v22
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    sub-double v47, v2, v47

    mul-double v45, v45, v47

    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    add-double v14, v14, v45

    double-to-float v0, v14

    :try_start_c
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 277
    int-to-double v14, v8

    aget-wide v45, v31, v22
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_5

    move-object/from16 v47, v1

    .end local v1    # "minX":[D
    .local v47, "minX":[D
    :try_start_d
    aget-wide v0, v40, v22
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_4

    neg-double v0, v0

    mul-double v45, v45, v0

    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    sub-double v14, v14, v45

    double-to-float v0, v14

    :try_start_e
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_4

    .line 291
    .end local v2    # "xValue":D
    .end local v12    # "yValue":D
    .end local v37    # "value":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Double;Ljava/lang/Double;>;"
    .end local v47    # "minX":[D
    .restart local v1    # "minX":[D
    :goto_16
    move-object/from16 v15, p6

    move/from16 v26, v4

    move-object v12, v5

    move v13, v9

    move-object/from16 v52, v10

    move-object/from16 v24, v11

    move/from16 v50, v21

    move-object/from16 v14, v40

    move/from16 v51, v42

    move-object/from16 v10, v44

    move-object/from16 v45, v47

    const/4 v0, 0x1

    move-object/from16 v21, v6

    move v11, v8

    move/from16 v40, v32

    move-object/from16 v42, v33

    move/from16 v33, v7

    .end local v1    # "minX":[D
    .restart local v47    # "minX":[D
    goto/16 :goto_18

    .line 316
    .end local v35    # "i$":Ljava/util/Iterator;
    .end local v36    # "startIndex":I
    .end local v43    # "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    :catchall_4
    move-exception v0

    move-object/from16 v15, p0

    move/from16 v26, v4

    move-object v12, v5

    move-object/from16 v37, v6

    move v13, v9

    move-object/from16 v52, v10

    move-object/from16 v24, v11

    move/from16 v50, v21

    move-object/from16 v35, v40

    move/from16 v51, v42

    move-object/from16 v14, v44

    move-object/from16 v45, v47

    move v11, v8

    move/from16 v40, v32

    move-object/from16 v42, v33

    move/from16 v33, v7

    goto/16 :goto_1e

    .end local v47    # "minX":[D
    .restart local v1    # "minX":[D
    :catchall_5
    move-exception v0

    move-object/from16 v15, p0

    move-object/from16 v45, v1

    move/from16 v26, v4

    move-object v12, v5

    move-object/from16 v37, v6

    move v13, v9

    move-object/from16 v52, v10

    move-object/from16 v24, v11

    move/from16 v50, v21

    move-object/from16 v35, v40

    move/from16 v51, v42

    move-object/from16 v14, v44

    move v11, v8

    move/from16 v40, v32

    move-object/from16 v42, v33

    move/from16 v33, v7

    .end local v1    # "minX":[D
    .restart local v47    # "minX":[D
    goto/16 :goto_1e

    .line 279
    .end local v47    # "minX":[D
    .restart local v1    # "minX":[D
    .restart local v2    # "xValue":D
    .restart local v12    # "yValue":D
    .restart local v35    # "i$":Ljava/util/Iterator;
    .restart local v36    # "startIndex":I
    .restart local v37    # "value":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Double;Ljava/lang/Double;>;"
    .restart local v43    # "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    :cond_1d
    move-object/from16 v47, v1

    .end local v1    # "minX":[D
    .restart local v47    # "minX":[D
    :try_start_f
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v0
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_8

    if-lez v0, :cond_1e

    .line 280
    move-object/from16 v45, v47

    .end local v47    # "minX":[D
    .local v45, "minX":[D
    move-object/from16 v1, p0

    move-wide/from16 v46, v2

    move/from16 v15, v42

    .end local v2    # "xValue":D
    .end local v42    # "maxScaleNumber":I
    .local v15, "maxScaleNumber":I
    .local v46, "xValue":D
    move-object v2, v6

    move-object/from16 v14, v40

    const/4 v0, 0x1

    .end local v40    # "minY":[D
    .local v14, "minY":[D
    move-object/from16 v3, p1

    move/from16 v26, v4

    .end local v4    # "sLength":I
    .local v26, "sLength":I
    move-object/from16 v4, p6

    move-object/from16 v24, v11

    move-wide/from16 v48, v12

    move-object/from16 v13, v33

    const/4 v11, 0x0

    move-object v12, v5

    .end local v5    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .end local v11    # "xPixelsPerUnit":[D
    .end local v33    # "maxY":[D
    .local v12, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .local v13, "maxY":[D
    .local v24, "xPixelsPerUnit":[D
    .local v48, "yValue":D
    move/from16 v50, v21

    move-object/from16 v21, v6

    .end local v6    # "series":Lorg/achartengine/model/XYSeries;
    .local v21, "series":Lorg/achartengine/model/XYSeries;
    .local v50, "angle":I
    move-object/from16 v6, v28

    move/from16 v33, v7

    .end local v7    # "i":I
    .local v33, "i":I
    move/from16 v7, v39

    move v11, v8

    move/from16 v40, v32

    .end local v8    # "bottom":I
    .end local v32    # "top":I
    .local v11, "bottom":I
    .local v40, "top":I
    move/from16 v8, v33

    move-object/from16 v42, v13

    move v13, v9

    .end local v9    # "left":I
    .local v13, "left":I
    .local v42, "maxY":[D
    move-object/from16 v9, v23

    move-object/from16 v52, v10

    move/from16 v51, v15

    move-object/from16 v15, p6

    .end local v10    # "isMaxYSet":[Z
    .end local v15    # "maxScaleNumber":I
    .local v51, "maxScaleNumber":I
    .local v52, "isMaxYSet":[Z
    move/from16 v10, v36

    :try_start_10
    invoke-virtual/range {v1 .. v10}, Lorg/achartengine/chart/XYChart;->drawSeries(Lorg/achartengine/model/XYSeries;Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/SimpleSeriesRenderer;FILorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;I)V

    .line 282
    move-object/from16 v1, p0

    move-object v2, v12

    move-object/from16 v3, v29

    move/from16 v4, v39

    move/from16 v5, v33

    move/from16 v6, v36

    invoke-virtual/range {v1 .. v6}, Lorg/achartengine/chart/XYChart;->clickableAreasForPoints(Ljava/util/List;Ljava/util/List;FII)[Lorg/achartengine/chart/ClickableArea;

    move-result-object v1

    .line 284
    .local v1, "clickableAreasForSubSeries":[Lorg/achartengine/chart/ClickableArea;
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_6

    move-object/from16 v10, v44

    .end local v44    # "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .local v10, "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    :try_start_11
    invoke-virtual {v10, v2}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 285
    invoke-interface {v12}, Ljava/util/List;->clear()V

    .line 286
    invoke-interface/range {v29 .. v29}, Ljava/util/List;->clear()V

    .line 287
    const/16 v36, -0x1

    goto :goto_17

    .line 316
    .end local v1    # "clickableAreasForSubSeries":[Lorg/achartengine/chart/ClickableArea;
    .end local v10    # "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .end local v35    # "i$":Ljava/util/Iterator;
    .end local v36    # "startIndex":I
    .end local v37    # "value":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Double;Ljava/lang/Double;>;"
    .end local v43    # "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    .end local v46    # "xValue":D
    .end local v48    # "yValue":D
    .restart local v44    # "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    :catchall_6
    move-exception v0

    move-object/from16 v15, p0

    move-object/from16 v35, v14

    move-object/from16 v37, v21

    move-object/from16 v14, v44

    .end local v44    # "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .restart local v10    # "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    goto/16 :goto_1e

    .line 279
    .end local v13    # "left":I
    .end local v14    # "minY":[D
    .end local v24    # "xPixelsPerUnit":[D
    .end local v26    # "sLength":I
    .end local v45    # "minX":[D
    .end local v50    # "angle":I
    .end local v51    # "maxScaleNumber":I
    .end local v52    # "isMaxYSet":[Z
    .restart local v2    # "xValue":D
    .restart local v4    # "sLength":I
    .restart local v5    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .restart local v6    # "series":Lorg/achartengine/model/XYSeries;
    .restart local v7    # "i":I
    .restart local v8    # "bottom":I
    .restart local v9    # "left":I
    .local v10, "isMaxYSet":[Z
    .local v11, "xPixelsPerUnit":[D
    .local v12, "yValue":D
    .local v21, "angle":I
    .restart local v32    # "top":I
    .local v33, "maxY":[D
    .restart local v35    # "i$":Ljava/util/Iterator;
    .restart local v36    # "startIndex":I
    .restart local v37    # "value":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Double;Ljava/lang/Double;>;"
    .local v40, "minY":[D
    .local v42, "maxScaleNumber":I
    .restart local v43    # "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    .restart local v44    # "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .restart local v47    # "minX":[D
    :cond_1e
    move-object/from16 v15, p6

    move/from16 v26, v4

    move-object/from16 v52, v10

    move-object/from16 v24, v11

    move-wide/from16 v48, v12

    move/from16 v50, v21

    move-object/from16 v14, v40

    move/from16 v51, v42

    move-object/from16 v10, v44

    move-object/from16 v45, v47

    const/4 v0, 0x1

    move-wide/from16 v46, v2

    move-object v12, v5

    move-object/from16 v21, v6

    move v11, v8

    move v13, v9

    move/from16 v40, v32

    move-object/from16 v42, v33

    move/from16 v33, v7

    .line 289
    .end local v2    # "xValue":D
    .end local v4    # "sLength":I
    .end local v5    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .end local v6    # "series":Lorg/achartengine/model/XYSeries;
    .end local v7    # "i":I
    .end local v8    # "bottom":I
    .end local v9    # "left":I
    .end local v32    # "top":I
    .end local v44    # "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .end local v47    # "minX":[D
    .local v10, "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .local v11, "bottom":I
    .local v12, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .restart local v13    # "left":I
    .restart local v14    # "minY":[D
    .local v21, "series":Lorg/achartengine/model/XYSeries;
    .restart local v24    # "xPixelsPerUnit":[D
    .restart local v26    # "sLength":I
    .local v33, "i":I
    .local v40, "top":I
    .local v42, "maxY":[D
    .restart local v45    # "minX":[D
    .restart local v46    # "xValue":D
    .restart local v48    # "yValue":D
    .restart local v50    # "angle":I
    .restart local v51    # "maxScaleNumber":I
    .restart local v52    # "isMaxYSet":[Z
    :goto_17
    const/4 v1, 0x0

    invoke-virtual {v10, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_7

    .line 291
    .end local v37    # "value":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Double;Ljava/lang/Double;>;"
    .end local v46    # "xValue":D
    .end local v48    # "yValue":D
    :goto_18
    move-object/from16 v15, p0

    move v8, v11

    move-object v5, v12

    move v9, v13

    move-object v3, v14

    move-object/from16 v6, v21

    move-object/from16 v11, v24

    move/from16 v4, v26

    move/from16 v7, v33

    move-object/from16 v12, v38

    move/from16 v13, v39

    move/from16 v32, v40

    move-object/from16 v33, v42

    move-object/from16 v0, v43

    move-object/from16 v1, v45

    move/from16 v21, v50

    move/from16 v42, v51

    move-object v14, v10

    move-object/from16 v10, v52

    goto/16 :goto_13

    .line 316
    .end local v35    # "i$":Ljava/util/Iterator;
    .end local v36    # "startIndex":I
    .end local v43    # "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    :catchall_7
    move-exception v0

    move-object/from16 v15, p0

    move-object/from16 v35, v14

    move-object/from16 v37, v21

    move-object v14, v10

    goto/16 :goto_1e

    .end local v12    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .end local v13    # "left":I
    .end local v14    # "minY":[D
    .end local v24    # "xPixelsPerUnit":[D
    .end local v26    # "sLength":I
    .end local v45    # "minX":[D
    .end local v50    # "angle":I
    .end local v51    # "maxScaleNumber":I
    .end local v52    # "isMaxYSet":[Z
    .restart local v4    # "sLength":I
    .restart local v5    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .restart local v6    # "series":Lorg/achartengine/model/XYSeries;
    .restart local v7    # "i":I
    .restart local v8    # "bottom":I
    .restart local v9    # "left":I
    .local v10, "isMaxYSet":[Z
    .local v11, "xPixelsPerUnit":[D
    .local v21, "angle":I
    .restart local v32    # "top":I
    .local v33, "maxY":[D
    .local v40, "minY":[D
    .local v42, "maxScaleNumber":I
    .restart local v44    # "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .restart local v47    # "minX":[D
    :catchall_8
    move-exception v0

    move-object/from16 v15, p6

    move/from16 v26, v4

    move-object v12, v5

    move v13, v9

    move-object/from16 v52, v10

    move-object/from16 v24, v11

    move/from16 v50, v21

    move-object/from16 v14, v40

    move/from16 v51, v42

    move-object/from16 v45, v47

    move v11, v8

    move/from16 v40, v32

    move-object/from16 v42, v33

    move/from16 v33, v7

    move-object/from16 v15, p0

    move-object/from16 v37, v6

    move-object/from16 v35, v14

    move-object/from16 v14, v44

    .end local v4    # "sLength":I
    .end local v5    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .end local v6    # "series":Lorg/achartengine/model/XYSeries;
    .end local v7    # "i":I
    .end local v8    # "bottom":I
    .end local v9    # "left":I
    .end local v32    # "top":I
    .end local v44    # "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .end local v47    # "minX":[D
    .local v10, "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .local v11, "bottom":I
    .restart local v12    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .restart local v13    # "left":I
    .restart local v14    # "minY":[D
    .local v21, "series":Lorg/achartengine/model/XYSeries;
    .restart local v24    # "xPixelsPerUnit":[D
    .restart local v26    # "sLength":I
    .local v33, "i":I
    .local v40, "top":I
    .local v42, "maxY":[D
    .restart local v45    # "minX":[D
    .restart local v50    # "angle":I
    .restart local v51    # "maxScaleNumber":I
    .restart local v52    # "isMaxYSet":[Z
    goto/16 :goto_1e

    .end local v12    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .end local v13    # "left":I
    .end local v14    # "minY":[D
    .end local v24    # "xPixelsPerUnit":[D
    .end local v26    # "sLength":I
    .end local v45    # "minX":[D
    .end local v50    # "angle":I
    .end local v51    # "maxScaleNumber":I
    .end local v52    # "isMaxYSet":[Z
    .local v1, "minX":[D
    .restart local v4    # "sLength":I
    .restart local v5    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .restart local v6    # "series":Lorg/achartengine/model/XYSeries;
    .restart local v7    # "i":I
    .restart local v8    # "bottom":I
    .restart local v9    # "left":I
    .local v10, "isMaxYSet":[Z
    .local v11, "xPixelsPerUnit":[D
    .local v21, "angle":I
    .restart local v32    # "top":I
    .local v33, "maxY":[D
    .local v40, "minY":[D
    .local v42, "maxScaleNumber":I
    .restart local v44    # "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    :catchall_9
    move-exception v0

    move-object/from16 v15, p6

    move-object/from16 v45, v1

    move/from16 v26, v4

    move-object v12, v5

    move v13, v9

    move-object/from16 v52, v10

    move-object/from16 v24, v11

    move/from16 v50, v21

    move-object/from16 v14, v40

    move/from16 v51, v42

    move v11, v8

    move/from16 v40, v32

    move-object/from16 v42, v33

    move/from16 v33, v7

    move-object/from16 v15, p0

    move-object/from16 v37, v6

    move-object/from16 v35, v14

    move-object/from16 v14, v44

    .end local v1    # "minX":[D
    .end local v4    # "sLength":I
    .end local v5    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .end local v6    # "series":Lorg/achartengine/model/XYSeries;
    .end local v7    # "i":I
    .end local v8    # "bottom":I
    .end local v9    # "left":I
    .end local v32    # "top":I
    .end local v44    # "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .local v10, "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .local v11, "bottom":I
    .restart local v12    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .restart local v13    # "left":I
    .restart local v14    # "minY":[D
    .local v21, "series":Lorg/achartengine/model/XYSeries;
    .restart local v24    # "xPixelsPerUnit":[D
    .restart local v26    # "sLength":I
    .local v33, "i":I
    .local v40, "top":I
    .local v42, "maxY":[D
    .restart local v45    # "minX":[D
    .restart local v50    # "angle":I
    .restart local v51    # "maxScaleNumber":I
    .restart local v52    # "isMaxYSet":[Z
    goto/16 :goto_1e

    .end local v12    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .end local v13    # "left":I
    .end local v24    # "xPixelsPerUnit":[D
    .end local v26    # "sLength":I
    .end local v29    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    .end local v45    # "minX":[D
    .end local v50    # "angle":I
    .end local v51    # "maxScaleNumber":I
    .end local v52    # "isMaxYSet":[Z
    .restart local v1    # "minX":[D
    .restart local v4    # "sLength":I
    .restart local v5    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .restart local v6    # "series":Lorg/achartengine/model/XYSeries;
    .restart local v7    # "i":I
    .restart local v8    # "bottom":I
    .restart local v9    # "left":I
    .local v10, "isMaxYSet":[Z
    .local v11, "xPixelsPerUnit":[D
    .local v14, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    .local v21, "angle":I
    .restart local v32    # "top":I
    .local v33, "maxY":[D
    .local v40, "minY":[D
    .local v42, "maxScaleNumber":I
    .restart local v44    # "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    :catchall_a
    move-exception v0

    move-object/from16 v15, p6

    move-object/from16 v45, v1

    move/from16 v26, v4

    move-object v12, v5

    move v13, v9

    move-object/from16 v52, v10

    move-object/from16 v24, v11

    move-object/from16 v29, v14

    move/from16 v50, v21

    move-object/from16 v14, v40

    move/from16 v51, v42

    move v11, v8

    move/from16 v40, v32

    move-object/from16 v42, v33

    move/from16 v33, v7

    move-object/from16 v15, p0

    move-object/from16 v37, v6

    move-object/from16 v35, v14

    move-object/from16 v14, v44

    .end local v1    # "minX":[D
    .end local v4    # "sLength":I
    .end local v5    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .end local v6    # "series":Lorg/achartengine/model/XYSeries;
    .end local v7    # "i":I
    .end local v8    # "bottom":I
    .end local v9    # "left":I
    .end local v32    # "top":I
    .end local v44    # "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .local v10, "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .local v11, "bottom":I
    .restart local v12    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .restart local v13    # "left":I
    .local v14, "minY":[D
    .local v21, "series":Lorg/achartengine/model/XYSeries;
    .restart local v24    # "xPixelsPerUnit":[D
    .restart local v26    # "sLength":I
    .restart local v29    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    .local v33, "i":I
    .local v40, "top":I
    .local v42, "maxY":[D
    .restart local v45    # "minX":[D
    .restart local v50    # "angle":I
    .restart local v51    # "maxScaleNumber":I
    .restart local v52    # "isMaxYSet":[Z
    goto/16 :goto_1e

    .end local v12    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .end local v13    # "left":I
    .end local v24    # "xPixelsPerUnit":[D
    .end local v26    # "sLength":I
    .end local v45    # "minX":[D
    .end local v50    # "angle":I
    .end local v51    # "maxScaleNumber":I
    .end local v52    # "isMaxYSet":[Z
    .restart local v1    # "minX":[D
    .restart local v4    # "sLength":I
    .restart local v5    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .restart local v6    # "series":Lorg/achartengine/model/XYSeries;
    .restart local v7    # "i":I
    .restart local v8    # "bottom":I
    .restart local v9    # "left":I
    .local v10, "isMaxYSet":[Z
    .local v11, "xPixelsPerUnit":[D
    .local v14, "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .local v21, "angle":I
    .restart local v32    # "top":I
    .local v33, "maxY":[D
    .local v40, "minY":[D
    .local v42, "maxScaleNumber":I
    :catchall_b
    move-exception v0

    move-object/from16 v15, p6

    move-object/from16 v45, v1

    move/from16 v26, v4

    move-object v12, v5

    move v13, v9

    move-object/from16 v52, v10

    move-object/from16 v24, v11

    move-object v10, v14

    move/from16 v50, v21

    move-object/from16 v14, v40

    move/from16 v51, v42

    move v11, v8

    move/from16 v40, v32

    move-object/from16 v42, v33

    move/from16 v33, v7

    move-object/from16 v15, p0

    move-object/from16 v37, v6

    move-object/from16 v35, v14

    move-object v14, v10

    .end local v1    # "minX":[D
    .end local v4    # "sLength":I
    .end local v5    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .end local v6    # "series":Lorg/achartengine/model/XYSeries;
    .end local v7    # "i":I
    .end local v8    # "bottom":I
    .end local v9    # "left":I
    .end local v32    # "top":I
    .local v10, "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .local v11, "bottom":I
    .restart local v12    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .restart local v13    # "left":I
    .local v14, "minY":[D
    .local v21, "series":Lorg/achartengine/model/XYSeries;
    .restart local v24    # "xPixelsPerUnit":[D
    .restart local v26    # "sLength":I
    .local v33, "i":I
    .local v40, "top":I
    .local v42, "maxY":[D
    .restart local v45    # "minX":[D
    .restart local v50    # "angle":I
    .restart local v51    # "maxScaleNumber":I
    .restart local v52    # "isMaxYSet":[Z
    goto/16 :goto_1e

    .end local v24    # "xPixelsPerUnit":[D
    .end local v26    # "sLength":I
    .end local v38    # "maxX":[D
    .end local v39    # "yAxisValue":F
    .end local v40    # "top":I
    .end local v45    # "minX":[D
    .end local v50    # "angle":I
    .end local v51    # "maxScaleNumber":I
    .end local v52    # "isMaxYSet":[Z
    .restart local v1    # "minX":[D
    .restart local v3    # "minY":[D
    .restart local v4    # "sLength":I
    .restart local v5    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .restart local v6    # "series":Lorg/achartengine/model/XYSeries;
    .restart local v7    # "i":I
    .restart local v8    # "bottom":I
    .restart local v9    # "left":I
    .local v10, "isMaxYSet":[Z
    .local v11, "xPixelsPerUnit":[D
    .local v12, "maxX":[D
    .local v13, "yAxisValue":F
    .local v14, "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .local v21, "angle":I
    .restart local v32    # "top":I
    .local v33, "maxY":[D
    .local v42, "maxScaleNumber":I
    :catchall_c
    move-exception v0

    move-object/from16 v15, p6

    move-object/from16 v45, v1

    move/from16 v26, v4

    move-object/from16 v52, v10

    move-object/from16 v24, v11

    move-object/from16 v38, v12

    move/from16 v39, v13

    move-object v10, v14

    move/from16 v50, v21

    move/from16 v40, v32

    move/from16 v51, v42

    move-object v12, v5

    move v11, v8

    move v13, v9

    move-object/from16 v42, v33

    move/from16 v33, v7

    move-object/from16 v15, p0

    move-object/from16 v35, v3

    move-object/from16 v37, v6

    .end local v1    # "minX":[D
    .end local v3    # "minY":[D
    .end local v4    # "sLength":I
    .end local v5    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .end local v6    # "series":Lorg/achartengine/model/XYSeries;
    .end local v7    # "i":I
    .end local v8    # "bottom":I
    .end local v9    # "left":I
    .end local v32    # "top":I
    .local v10, "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .local v11, "bottom":I
    .local v12, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .local v13, "left":I
    .local v14, "minY":[D
    .local v21, "series":Lorg/achartengine/model/XYSeries;
    .restart local v24    # "xPixelsPerUnit":[D
    .restart local v26    # "sLength":I
    .local v33, "i":I
    .restart local v38    # "maxX":[D
    .restart local v39    # "yAxisValue":F
    .restart local v40    # "top":I
    .local v42, "maxY":[D
    .restart local v45    # "minX":[D
    .restart local v50    # "angle":I
    .restart local v51    # "maxScaleNumber":I
    .restart local v52    # "isMaxYSet":[Z
    goto/16 :goto_1e

    .line 258
    .end local v24    # "xPixelsPerUnit":[D
    .end local v26    # "sLength":I
    .end local v38    # "maxX":[D
    .end local v39    # "yAxisValue":F
    .end local v40    # "top":I
    .end local v45    # "minX":[D
    .end local v50    # "angle":I
    .end local v51    # "maxScaleNumber":I
    .end local v52    # "isMaxYSet":[Z
    .restart local v0    # "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    .restart local v1    # "minX":[D
    .restart local v3    # "minY":[D
    .restart local v4    # "sLength":I
    .restart local v5    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .restart local v6    # "series":Lorg/achartengine/model/XYSeries;
    .restart local v7    # "i":I
    .restart local v8    # "bottom":I
    .restart local v9    # "left":I
    .local v10, "isMaxYSet":[Z
    .local v11, "xPixelsPerUnit":[D
    .local v12, "maxX":[D
    .local v13, "yAxisValue":F
    .local v14, "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .local v21, "angle":I
    .restart local v32    # "top":I
    .local v33, "maxY":[D
    .restart local v35    # "i$":Ljava/util/Iterator;
    .restart local v36    # "startIndex":I
    .local v42, "maxScaleNumber":I
    :cond_1f
    move-object/from16 v15, p6

    move-object/from16 v43, v0

    move-object/from16 v45, v1

    move/from16 v26, v4

    move-object/from16 v52, v10

    move-object/from16 v24, v11

    move-object/from16 v38, v12

    move/from16 v39, v13

    move-object v10, v14

    move/from16 v50, v21

    move/from16 v40, v32

    move/from16 v51, v42

    const/4 v0, 0x1

    move-object v14, v3

    move-object v12, v5

    move-object/from16 v21, v6

    move v11, v8

    move v13, v9

    move-object/from16 v42, v33

    move/from16 v33, v7

    .line 293
    .end local v0    # "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    .end local v1    # "minX":[D
    .end local v3    # "minY":[D
    .end local v4    # "sLength":I
    .end local v5    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .end local v6    # "series":Lorg/achartengine/model/XYSeries;
    .end local v7    # "i":I
    .end local v8    # "bottom":I
    .end local v9    # "left":I
    .end local v32    # "top":I
    .end local v35    # "i$":Ljava/util/Iterator;
    .local v10, "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .local v11, "bottom":I
    .local v12, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .local v13, "left":I
    .local v14, "minY":[D
    .local v21, "series":Lorg/achartengine/model/XYSeries;
    .restart local v24    # "xPixelsPerUnit":[D
    .restart local v26    # "sLength":I
    .local v33, "i":I
    .restart local v38    # "maxX":[D
    .restart local v39    # "yAxisValue":F
    .restart local v40    # "top":I
    .local v42, "maxY":[D
    .restart local v43    # "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    .restart local v45    # "minX":[D
    .restart local v50    # "angle":I
    .restart local v51    # "maxScaleNumber":I
    .restart local v52    # "isMaxYSet":[Z
    :try_start_12
    invoke-virtual/range {v21 .. v21}, Lorg/achartengine/model/XYSeries;->getAnnotationCount()I

    move-result v1
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_11

    move v9, v1

    .line 294
    .local v9, "count":I
    if-lez v9, :cond_22

    .line 295
    move-object/from16 v8, p0

    :try_start_13
    iget-object v1, v8, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getLabelsColor()I

    move-result v1

    invoke-virtual {v15, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 296
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    move-object v7, v1

    .line 297
    .local v7, "bound":Landroid/graphics/Rect;
    const/4 v1, 0x0

    move v6, v1

    .local v6, "j":I
    :goto_19
    if-ge v6, v9, :cond_21

    .line 298
    int-to-double v1, v13

    aget-wide v3, v24, v22
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_f

    move-object/from16 v5, v21

    .end local v21    # "series":Lorg/achartengine/model/XYSeries;
    .local v5, "series":Lorg/achartengine/model/XYSeries;
    :try_start_14
    invoke-virtual {v5, v6}, Lorg/achartengine/model/XYSeries;->getAnnotationX(I)D

    move-result-wide v46

    aget-wide v48, v45, v22
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_e

    sub-double v46, v46, v48

    mul-double v3, v3, v46

    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v1, v3

    double-to-float v4, v1

    .line 300
    .local v4, "xS":F
    int-to-double v1, v11

    :try_start_15
    aget-wide v46, v31, v22

    invoke-virtual {v5, v6}, Lorg/achartengine/model/XYSeries;->getAnnotationY(I)D

    move-result-wide v48

    aget-wide v53, v14, v22
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_e

    sub-double v48, v48, v53

    mul-double v46, v46, v48

    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    sub-double v1, v1, v46

    double-to-float v3, v1

    .line 302
    .local v3, "yS":F
    :try_start_16
    invoke-virtual {v5, v6}, Lorg/achartengine/model/XYSeries;->getAnnotationAt(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v6}, Lorg/achartengine/model/XYSeries;->getAnnotationAt(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v0, 0x0

    invoke-virtual {v15, v1, v0, v2, v7}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 304
    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    add-float/2addr v0, v4

    cmpg-float v0, v4, v0

    if-gez v0, :cond_20

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v0

    int-to-float v0, v0

    cmpg-float v0, v3, v0

    if-gez v0, :cond_20

    .line 305
    invoke-virtual {v5, v6}, Lorg/achartengine/model/XYSeries;->getAnnotationAt(I)Ljava/lang/String;

    move-result-object v0
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_e

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v35, v3

    .end local v3    # "yS":F
    .local v35, "yS":F
    move-object v3, v0

    move v0, v4

    .end local v4    # "xS":F
    .local v0, "xS":F
    move-object/from16 v37, v5

    .end local v5    # "series":Lorg/achartengine/model/XYSeries;
    .local v37, "series":Lorg/achartengine/model/XYSeries;
    move/from16 v5, v35

    move/from16 v44, v6

    .end local v6    # "j":I
    .local v44, "j":I
    move-object/from16 v6, p6

    :try_start_17
    invoke-virtual/range {v1 .. v6}, Lorg/achartengine/chart/XYChart;->drawString(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;)V
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_d

    goto :goto_1a

    .line 316
    .end local v0    # "xS":F
    .end local v7    # "bound":Landroid/graphics/Rect;
    .end local v9    # "count":I
    .end local v35    # "yS":F
    .end local v36    # "startIndex":I
    .end local v43    # "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    .end local v44    # "j":I
    :catchall_d
    move-exception v0

    move-object v15, v8

    move-object/from16 v35, v14

    move-object v14, v10

    goto/16 :goto_1e

    .line 304
    .end local v37    # "series":Lorg/achartengine/model/XYSeries;
    .restart local v3    # "yS":F
    .restart local v4    # "xS":F
    .restart local v5    # "series":Lorg/achartengine/model/XYSeries;
    .restart local v6    # "j":I
    .restart local v7    # "bound":Landroid/graphics/Rect;
    .restart local v9    # "count":I
    .restart local v36    # "startIndex":I
    .restart local v43    # "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    :cond_20
    move/from16 v35, v3

    move v0, v4

    move-object/from16 v37, v5

    move/from16 v44, v6

    .line 297
    .end local v3    # "yS":F
    .end local v4    # "xS":F
    .end local v5    # "series":Lorg/achartengine/model/XYSeries;
    .end local v6    # "j":I
    .restart local v37    # "series":Lorg/achartengine/model/XYSeries;
    .restart local v44    # "j":I
    :goto_1a
    add-int/lit8 v6, v44, 0x1

    move-object/from16 v21, v37

    const/4 v0, 0x1

    .end local v44    # "j":I
    .restart local v6    # "j":I
    goto :goto_19

    .line 316
    .end local v6    # "j":I
    .end local v7    # "bound":Landroid/graphics/Rect;
    .end local v9    # "count":I
    .end local v36    # "startIndex":I
    .end local v37    # "series":Lorg/achartengine/model/XYSeries;
    .end local v43    # "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    .restart local v5    # "series":Lorg/achartengine/model/XYSeries;
    :catchall_e
    move-exception v0

    move-object/from16 v37, v5

    move-object v15, v8

    move-object/from16 v35, v14

    move-object v14, v10

    .end local v5    # "series":Lorg/achartengine/model/XYSeries;
    .restart local v37    # "series":Lorg/achartengine/model/XYSeries;
    goto/16 :goto_1e

    .line 297
    .end local v37    # "series":Lorg/achartengine/model/XYSeries;
    .restart local v6    # "j":I
    .restart local v7    # "bound":Landroid/graphics/Rect;
    .restart local v9    # "count":I
    .restart local v21    # "series":Lorg/achartengine/model/XYSeries;
    .restart local v36    # "startIndex":I
    .restart local v43    # "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    :cond_21
    move/from16 v44, v6

    move-object/from16 v37, v21

    .end local v6    # "j":I
    .end local v21    # "series":Lorg/achartengine/model/XYSeries;
    .restart local v37    # "series":Lorg/achartengine/model/XYSeries;
    .restart local v44    # "j":I
    goto :goto_1b

    .line 316
    .end local v7    # "bound":Landroid/graphics/Rect;
    .end local v9    # "count":I
    .end local v36    # "startIndex":I
    .end local v37    # "series":Lorg/achartengine/model/XYSeries;
    .end local v43    # "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    .end local v44    # "j":I
    .restart local v21    # "series":Lorg/achartengine/model/XYSeries;
    :catchall_f
    move-exception v0

    move-object/from16 v37, v21

    move-object v15, v8

    move-object/from16 v35, v14

    move-object v14, v10

    .end local v21    # "series":Lorg/achartengine/model/XYSeries;
    .restart local v37    # "series":Lorg/achartengine/model/XYSeries;
    goto/16 :goto_1e

    .line 294
    .end local v37    # "series":Lorg/achartengine/model/XYSeries;
    .restart local v9    # "count":I
    .restart local v21    # "series":Lorg/achartengine/model/XYSeries;
    .restart local v36    # "startIndex":I
    .restart local v43    # "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    :cond_22
    move-object/from16 v8, p0

    move-object/from16 v37, v21

    .line 310
    .end local v21    # "series":Lorg/achartengine/model/XYSeries;
    .restart local v37    # "series":Lorg/achartengine/model/XYSeries;
    :goto_1b
    :try_start_18
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v0
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_10

    if-lez v0, :cond_23

    .line 311
    move-object/from16 v1, p0

    move-object/from16 v2, v37

    move-object/from16 v3, p1

    move-object/from16 v4, p6

    move-object v5, v12

    move-object/from16 v6, v28

    move/from16 v7, v39

    move-object v15, v8

    move/from16 v8, v33

    move v0, v9

    .end local v9    # "count":I
    .local v0, "count":I
    move-object/from16 v9, v23

    move-object/from16 v35, v14

    move-object v14, v10

    .end local v10    # "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .local v14, "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .local v35, "minY":[D
    move/from16 v10, v36

    :try_start_19
    invoke-virtual/range {v1 .. v10}, Lorg/achartengine/chart/XYChart;->drawSeries(Lorg/achartengine/model/XYSeries;Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/SimpleSeriesRenderer;FILorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;I)V

    .line 312
    move-object/from16 v1, p0

    move-object v2, v12

    move-object/from16 v3, v29

    move/from16 v4, v39

    move/from16 v5, v33

    move/from16 v6, v36

    invoke-virtual/range {v1 .. v6}, Lorg/achartengine/chart/XYChart;->clickableAreasForPoints(Ljava/util/List;Ljava/util/List;FII)[Lorg/achartengine/chart/ClickableArea;

    move-result-object v1

    .line 314
    .local v1, "clickableAreasForSubSeries":[Lorg/achartengine/chart/ClickableArea;
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v14, v2}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    goto :goto_1c

    .line 310
    .end local v0    # "count":I
    .end local v1    # "clickableAreasForSubSeries":[Lorg/achartengine/chart/ClickableArea;
    .end local v35    # "minY":[D
    .restart local v9    # "count":I
    .restart local v10    # "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .local v14, "minY":[D
    :cond_23
    move-object v15, v8

    move v0, v9

    move-object/from16 v35, v14

    move-object v14, v10

    .line 316
    .end local v9    # "count":I
    .end local v10    # "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .end local v36    # "startIndex":I
    .end local v43    # "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    .local v14, "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .restart local v35    # "minY":[D
    :goto_1c
    monitor-exit v37

    move/from16 v0, v27

    .line 232
    .end local v12    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .end local v14    # "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .end local v22    # "scale":I
    .end local v27    # "hasValues":Z
    .end local v28    # "seriesRenderer":Lorg/achartengine/renderer/SimpleSeriesRenderer;
    .end local v29    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    .end local v37    # "series":Lorg/achartengine/model/XYSeries;
    .end local v39    # "yAxisValue":F
    .local v0, "hasValues":Z
    :goto_1d
    add-int/lit8 v7, v33, 0x1

    move v9, v13

    move-object/from16 v13, v25

    move/from16 v32, v26

    move-object/from16 v3, v35

    move-object/from16 v12, v38

    move/from16 v8, v40

    move-object/from16 v14, v41

    move-object/from16 v33, v42

    move-object/from16 v1, v45

    move/from16 v21, v50

    move/from16 v2, v51

    move-object/from16 v10, v52

    move/from16 v25, v11

    move-object/from16 v11, v24

    .end local v33    # "i":I
    .local v7, "i":I
    goto/16 :goto_12

    .line 316
    .end local v0    # "hasValues":Z
    .end local v7    # "i":I
    .end local v35    # "minY":[D
    .restart local v10    # "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .restart local v12    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .local v14, "minY":[D
    .restart local v22    # "scale":I
    .restart local v27    # "hasValues":Z
    .restart local v28    # "seriesRenderer":Lorg/achartengine/renderer/SimpleSeriesRenderer;
    .restart local v29    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    .restart local v33    # "i":I
    .restart local v37    # "series":Lorg/achartengine/model/XYSeries;
    .restart local v39    # "yAxisValue":F
    :catchall_10
    move-exception v0

    move-object v15, v8

    move-object/from16 v35, v14

    move-object v14, v10

    .end local v10    # "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .local v14, "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .restart local v35    # "minY":[D
    goto :goto_1e

    .end local v35    # "minY":[D
    .end local v37    # "series":Lorg/achartengine/model/XYSeries;
    .restart local v10    # "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .local v14, "minY":[D
    .restart local v21    # "series":Lorg/achartengine/model/XYSeries;
    :catchall_11
    move-exception v0

    move-object/from16 v15, p0

    move-object/from16 v35, v14

    move-object/from16 v37, v21

    move-object v14, v10

    .end local v10    # "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .end local v21    # "series":Lorg/achartengine/model/XYSeries;
    .local v14, "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .restart local v35    # "minY":[D
    .restart local v37    # "series":Lorg/achartengine/model/XYSeries;
    goto :goto_1e

    .end local v24    # "xPixelsPerUnit":[D
    .end local v26    # "sLength":I
    .end local v35    # "minY":[D
    .end local v37    # "series":Lorg/achartengine/model/XYSeries;
    .end local v38    # "maxX":[D
    .end local v39    # "yAxisValue":F
    .end local v40    # "top":I
    .end local v45    # "minX":[D
    .end local v50    # "angle":I
    .end local v51    # "maxScaleNumber":I
    .end local v52    # "isMaxYSet":[Z
    .local v1, "minX":[D
    .local v3, "minY":[D
    .local v4, "sLength":I
    .local v5, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .local v6, "series":Lorg/achartengine/model/XYSeries;
    .restart local v7    # "i":I
    .restart local v8    # "bottom":I
    .local v9, "left":I
    .local v10, "isMaxYSet":[Z
    .local v11, "xPixelsPerUnit":[D
    .local v12, "maxX":[D
    .local v13, "yAxisValue":F
    .local v21, "angle":I
    .restart local v32    # "top":I
    .local v33, "maxY":[D
    .local v42, "maxScaleNumber":I
    :catchall_12
    move-exception v0

    move-object/from16 v45, v1

    move-object/from16 v35, v3

    move/from16 v26, v4

    move-object/from16 v37, v6

    move-object/from16 v52, v10

    move-object/from16 v24, v11

    move-object/from16 v38, v12

    move/from16 v39, v13

    move/from16 v50, v21

    move/from16 v40, v32

    move/from16 v51, v42

    move-object v12, v5

    move v11, v8

    move v13, v9

    move-object/from16 v42, v33

    move/from16 v33, v7

    .end local v1    # "minX":[D
    .end local v3    # "minY":[D
    .end local v4    # "sLength":I
    .end local v5    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .end local v6    # "series":Lorg/achartengine/model/XYSeries;
    .end local v7    # "i":I
    .end local v8    # "bottom":I
    .end local v9    # "left":I
    .end local v10    # "isMaxYSet":[Z
    .end local v21    # "angle":I
    .end local v32    # "top":I
    .local v11, "bottom":I
    .local v12, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .local v13, "left":I
    .restart local v24    # "xPixelsPerUnit":[D
    .restart local v26    # "sLength":I
    .local v33, "i":I
    .restart local v35    # "minY":[D
    .restart local v37    # "series":Lorg/achartengine/model/XYSeries;
    .restart local v38    # "maxX":[D
    .restart local v39    # "yAxisValue":F
    .restart local v40    # "top":I
    .local v42, "maxY":[D
    .restart local v45    # "minX":[D
    .restart local v50    # "angle":I
    .restart local v51    # "maxScaleNumber":I
    .restart local v52    # "isMaxYSet":[Z
    :goto_1e
    monitor-exit v37
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_13

    throw v0

    :catchall_13
    move-exception v0

    goto :goto_1e

    .line 232
    .end local v22    # "scale":I
    .end local v24    # "xPixelsPerUnit":[D
    .end local v26    # "sLength":I
    .end local v27    # "hasValues":Z
    .end local v28    # "seriesRenderer":Lorg/achartengine/renderer/SimpleSeriesRenderer;
    .end local v29    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    .end local v35    # "minY":[D
    .end local v37    # "series":Lorg/achartengine/model/XYSeries;
    .end local v38    # "maxX":[D
    .end local v39    # "yAxisValue":F
    .end local v40    # "top":I
    .end local v41    # "isMaxXSet":[Z
    .end local v42    # "maxY":[D
    .end local v45    # "minX":[D
    .end local v50    # "angle":I
    .end local v51    # "maxScaleNumber":I
    .end local v52    # "isMaxYSet":[Z
    .restart local v0    # "hasValues":Z
    .restart local v1    # "minX":[D
    .local v2, "maxScaleNumber":I
    .restart local v3    # "minY":[D
    .restart local v4    # "sLength":I
    .restart local v7    # "i":I
    .local v8, "top":I
    .restart local v9    # "left":I
    .restart local v10    # "isMaxYSet":[Z
    .local v11, "xPixelsPerUnit":[D
    .local v12, "maxX":[D
    .local v13, "isMinXSet":[Z
    .local v14, "isMaxXSet":[Z
    .restart local v21    # "angle":I
    .local v25, "bottom":I
    .local v33, "maxY":[D
    :cond_24
    move-object/from16 v45, v1

    move/from16 v51, v2

    move-object/from16 v35, v3

    move/from16 v26, v4

    move/from16 v40, v8

    move-object/from16 v52, v10

    move-object/from16 v24, v11

    move-object/from16 v38, v12

    move-object/from16 v41, v14

    move/from16 v50, v21

    move/from16 v11, v25

    move-object/from16 v42, v33

    const/4 v10, 0x1

    move/from16 v33, v7

    move-object/from16 v25, v13

    move v13, v9

    .line 319
    .end local v1    # "minX":[D
    .end local v2    # "maxScaleNumber":I
    .end local v3    # "minY":[D
    .end local v4    # "sLength":I
    .end local v7    # "i":I
    .end local v8    # "top":I
    .end local v9    # "left":I
    .end local v10    # "isMaxYSet":[Z
    .end local v12    # "maxX":[D
    .end local v14    # "isMaxXSet":[Z
    .end local v21    # "angle":I
    .end local v33    # "maxY":[D
    .local v11, "bottom":I
    .local v13, "left":I
    .restart local v24    # "xPixelsPerUnit":[D
    .local v25, "isMinXSet":[Z
    .restart local v26    # "sLength":I
    .restart local v35    # "minY":[D
    .restart local v38    # "maxX":[D
    .restart local v40    # "top":I
    .restart local v41    # "isMaxXSet":[Z
    .restart local v42    # "maxY":[D
    .restart local v45    # "minX":[D
    .restart local v50    # "angle":I
    .restart local v51    # "maxScaleNumber":I
    .restart local v52    # "isMaxYSet":[Z
    iget-object v2, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move-object/from16 v21, v34

    .end local v34    # "isMinYSet":[Z
    .local v21, "isMinYSet":[Z
    sub-int v7, p5, v11

    const/4 v9, 0x1

    invoke-virtual {v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getMarginsColor()I

    move-result v12

    move-object/from16 v1, p0

    move-object/from16 v3, p1

    move/from16 v4, p2

    move v5, v11

    move/from16 v6, p4

    move-object/from16 v8, p6

    const/4 v14, 0x1

    move v10, v12

    invoke-virtual/range {v1 .. v10}, Lorg/achartengine/chart/XYChart;->drawBackground(Lorg/achartengine/renderer/DefaultRenderer;Landroid/graphics/Canvas;IIIILandroid/graphics/Paint;ZI)V

    .line 321
    iget-object v2, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    const/4 v1, 0x0

    aget v7, v17, v1

    invoke-virtual {v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getMarginsColor()I

    move-result v10

    move-object/from16 v1, p0

    move/from16 v5, p3

    invoke-virtual/range {v1 .. v10}, Lorg/achartengine/chart/XYChart;->drawBackground(Lorg/achartengine/renderer/DefaultRenderer;Landroid/graphics/Canvas;IIIILandroid/graphics/Paint;ZI)V

    .line 323
    sget-object v1, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->HORIZONTAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    move-object/from16 v12, v23

    .end local v23    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .local v12, "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    if-ne v12, v1, :cond_25

    .line 324
    iget-object v2, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    sub-int v6, v13, p2

    move-object/from16 v22, v41

    .end local v41    # "isMaxXSet":[Z
    .local v22, "isMaxXSet":[Z
    sub-int v7, p5, p3

    const/4 v9, 0x1

    invoke-virtual {v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getMarginsColor()I

    move-result v10

    move-object/from16 v1, p0

    move-object/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p3

    move-object/from16 v8, p6

    invoke-virtual/range {v1 .. v10}, Lorg/achartengine/chart/XYChart;->drawBackground(Lorg/achartengine/renderer/DefaultRenderer;Landroid/graphics/Canvas;IIIILandroid/graphics/Paint;ZI)V

    .line 326
    iget-object v2, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    aget v6, v17, v16

    sub-int v7, p5, p3

    invoke-virtual {v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getMarginsColor()I

    move-result v10

    move/from16 v4, v30

    invoke-virtual/range {v1 .. v10}, Lorg/achartengine/chart/XYChart;->drawBackground(Lorg/achartengine/renderer/DefaultRenderer;Landroid/graphics/Canvas;IIIILandroid/graphics/Paint;ZI)V

    goto :goto_1f

    .line 328
    .end local v22    # "isMaxXSet":[Z
    .restart local v41    # "isMaxXSet":[Z
    :cond_25
    move-object/from16 v22, v41

    .end local v41    # "isMaxXSet":[Z
    .restart local v22    # "isMaxXSet":[Z
    sget-object v1, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->VERTICAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    if-ne v12, v1, :cond_26

    .line 329
    iget-object v2, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v10, v30

    .end local v30    # "right":I
    .local v10, "right":I
    sub-int v6, p4, v10

    sub-int v7, p5, p3

    const/4 v9, 0x1

    invoke-virtual {v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getMarginsColor()I

    move-result v16

    move-object/from16 v1, p0

    move-object/from16 v3, p1

    move v4, v10

    move/from16 v5, p3

    move-object/from16 v8, p6

    .end local v10    # "right":I
    .restart local v30    # "right":I
    move/from16 v10, v16

    invoke-virtual/range {v1 .. v10}, Lorg/achartengine/chart/XYChart;->drawBackground(Lorg/achartengine/renderer/DefaultRenderer;Landroid/graphics/Canvas;IIIILandroid/graphics/Paint;ZI)V

    .line 331
    iget-object v2, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    sub-int v6, v13, p2

    sub-int v7, p5, p3

    invoke-virtual {v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getMarginsColor()I

    move-result v10

    move/from16 v4, p2

    invoke-virtual/range {v1 .. v10}, Lorg/achartengine/chart/XYChart;->drawBackground(Lorg/achartengine/renderer/DefaultRenderer;Landroid/graphics/Canvas;IIIILandroid/graphics/Paint;ZI)V

    .line 335
    :cond_26
    :goto_1f
    iget-object v1, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isShowLabels()Z

    move-result v1

    if-eqz v1, :cond_27

    if-eqz v0, :cond_27

    const/4 v1, 0x1

    goto :goto_20

    :cond_27
    const/4 v1, 0x0

    :goto_20
    move/from16 v23, v1

    .line 336
    .local v23, "showLabels":Z
    iget-object v1, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isShowGridX()Z

    move-result v27

    .line 337
    .local v27, "showGridX":Z
    iget-object v1, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isShowCustomTextGrid()Z

    move-result v28

    .line 338
    .local v28, "showCustomTextGrid":Z
    if-nez v23, :cond_29

    if-eqz v27, :cond_28

    goto :goto_21

    :cond_28
    move/from16 v2, p2

    move/from16 v6, p3

    move-object/from16 v4, p6

    move/from16 v39, v11

    move v14, v13

    move-object v5, v15

    move-object/from16 v37, v25

    move/from16 v3, v30

    move-object/from16 v32, v35

    move-object/from16 v34, v38

    move/from16 v56, v40

    move-object/from16 v36, v42

    move/from16 v35, v51

    move/from16 v38, v0

    move-object v15, v12

    goto/16 :goto_2a

    .line 339
    :cond_29
    :goto_21
    const/4 v1, 0x0

    aget-wide v2, v45, v1

    aget-wide v4, v38, v1

    iget-object v1, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabels()I

    move-result v6

    move-object/from16 v1, p0

    invoke-virtual/range {v1 .. v6}, Lorg/achartengine/chart/XYChart;->getXLabels(DDI)Ljava/util/List;

    move-result-object v1

    invoke-direct {v15, v1}, Lorg/achartengine/chart/XYChart;->getValidLabels(Ljava/util/List;)Ljava/util/List;

    move-result-object v29

    .line 340
    .local v29, "xLabels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    move-object/from16 v10, v35

    move-object/from16 v8, v42

    move/from16 v9, v51

    .end local v35    # "minY":[D
    .end local v42    # "maxY":[D
    .end local v51    # "maxScaleNumber":I
    .local v8, "maxY":[D
    .local v9, "maxScaleNumber":I
    .local v10, "minY":[D
    invoke-virtual {v15, v10, v8, v9}, Lorg/achartengine/chart/XYChart;->getYLabels([D[DI)Ljava/util/Map;

    move-result-object v33

    .line 342
    .local v33, "allYLabels":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Ljava/lang/Double;>;>;"
    move v6, v13

    .line 343
    .local v6, "xLabelsLeft":I
    if-eqz v23, :cond_2a

    .line 344
    iget-object v1, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelsColor()I

    move-result v1

    move-object/from16 v7, p6

    invoke-virtual {v7, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 345
    iget-object v1, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getLabelsTextSize()F

    move-result v1

    invoke-virtual {v7, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 346
    iget-object v1, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelsAlign()Landroid/graphics/Paint$Align;

    move-result-object v1

    invoke-virtual {v7, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    goto :goto_22

    .line 343
    :cond_2a
    move-object/from16 v7, p6

    .line 351
    :goto_22
    iget-object v1, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXTextLabelLocations()[Ljava/lang/Double;

    move-result-object v3

    const/16 v16, 0x0

    aget-wide v34, v24, v16

    aget-wide v36, v45, v16

    aget-wide v41, v38, v16

    move-object/from16 v1, p0

    move-object/from16 v2, v29

    move-object/from16 v4, p1

    move-object/from16 v5, p6

    move/from16 v7, v40

    move-object/from16 v32, v8

    .end local v8    # "maxY":[D
    .local v32, "maxY":[D
    move v8, v11

    move/from16 v39, v9

    move-object/from16 v43, v10

    .end local v9    # "maxScaleNumber":I
    .end local v10    # "minY":[D
    .local v39, "maxScaleNumber":I
    .local v43, "minY":[D
    move-wide/from16 v9, v34

    move/from16 v35, v11

    move-object/from16 v55, v12

    move-object/from16 v34, v38

    move/from16 v38, v0

    const/4 v0, 0x0

    .end local v0    # "hasValues":Z
    .end local v11    # "bottom":I
    .end local v12    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .local v34, "maxX":[D
    .local v35, "bottom":I
    .local v38, "hasValues":Z
    .local v55, "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    move-wide/from16 v11, v36

    move-object/from16 v37, v25

    move-object/from16 v36, v32

    move-object/from16 v32, v43

    const/4 v0, 0x1

    move/from16 v25, v13

    .end local v13    # "left":I
    .end local v43    # "minY":[D
    .local v25, "left":I
    .local v32, "minY":[D
    .local v36, "maxY":[D
    .local v37, "isMinXSet":[Z
    move-wide/from16 v13, v41

    invoke-virtual/range {v1 .. v14}, Lorg/achartengine/chart/XYChart;->drawXLabels(Ljava/util/List;[Ljava/lang/Double;Landroid/graphics/Canvas;Landroid/graphics/Paint;IIIDDD)V

    .line 353
    move-object/from16 v7, p0

    move-object/from16 v8, v33

    move-object/from16 v9, p1

    move-object/from16 v10, p6

    move/from16 v11, v39

    move/from16 v12, v25

    move/from16 v13, v30

    move/from16 v14, v35

    move-object/from16 v4, p6

    move-object v5, v15

    move/from16 v3, v39

    .end local v39    # "maxScaleNumber":I
    .local v3, "maxScaleNumber":I
    move-object/from16 v15, v31

    move-object/from16 v16, v32

    invoke-virtual/range {v7 .. v16}, Lorg/achartengine/chart/XYChart;->drawYLabels(Ljava/util/Map;Landroid/graphics/Canvas;Landroid/graphics/Paint;IIII[D[D)V

    .line 356
    if-eqz v23, :cond_31

    .line 357
    iget-object v1, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getLabelsColor()I

    move-result v1

    invoke-virtual {v4, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 358
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_23
    if-ge v1, v3, :cond_30

    .line 359
    iget-object v2, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v2, v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisAlign(I)Landroid/graphics/Paint$Align;

    move-result-object v2

    .line 360
    .local v2, "axisAlign":Landroid/graphics/Paint$Align;
    iget-object v7, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v7, v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYTextLabelLocations(I)[Ljava/lang/Double;

    move-result-object v14

    .line 361
    .local v14, "yTextLabelLocations":[Ljava/lang/Double;
    move-object v15, v14

    .local v15, "arr$":[Ljava/lang/Double;
    array-length v13, v15

    .local v13, "len$":I
    const/4 v7, 0x0

    move v12, v7

    .local v12, "i$":I
    :goto_24
    if-ge v12, v13, :cond_2f

    aget-object v11, v15, v12

    .line 362
    .local v11, "location":Ljava/lang/Double;
    aget-wide v7, v32, v1

    invoke-virtual {v11}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v9

    cmpg-double v16, v7, v9

    if-gtz v16, :cond_2d

    invoke-virtual {v11}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v7

    aget-wide v9, v36, v1

    cmpg-double v16, v7, v9

    if-gtz v16, :cond_2d

    .line 363
    move/from16 v10, v35

    .end local v35    # "bottom":I
    .local v10, "bottom":I
    int-to-double v7, v10

    aget-wide v41, v31, v1

    invoke-virtual {v11}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v46

    aget-wide v48, v32, v1

    sub-double v46, v46, v48

    mul-double v41, v41, v46

    invoke-static {v7, v8}, Ljava/lang/Double;->isNaN(D)Z

    sub-double v7, v7, v41

    double-to-float v9, v7

    .line 365
    .local v9, "yLabel":F
    iget-object v7, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v7, v11, v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYTextLabel(Ljava/lang/Double;I)Ljava/lang/String;

    move-result-object v16

    .line 366
    .local v16, "label":Ljava/lang/String;
    iget-object v7, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v7, v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsColor(I)I

    move-result v7

    invoke-virtual {v4, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 367
    iget-object v7, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v7, v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsAlign(I)Landroid/graphics/Paint$Align;

    move-result-object v7

    invoke-virtual {v4, v7}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 368
    sget-object v7, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->HORIZONTAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    move-object/from16 v8, v55

    .end local v55    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .local v8, "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    if-ne v8, v7, :cond_2c

    .line 369
    sget-object v7, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    if-ne v2, v7, :cond_2b

    .line 370
    invoke-direct {v5, v2}, Lorg/achartengine/chart/XYChart;->getLabelLinePos(Landroid/graphics/Paint$Align;)I

    move-result v7

    move-object/from16 v35, v14

    move/from16 v14, v25

    .end local v25    # "left":I
    .local v14, "left":I
    .local v35, "yTextLabelLocations":[Ljava/lang/Double;
    add-int/2addr v7, v14

    int-to-float v7, v7

    int-to-float v0, v14

    move/from16 v39, v7

    move-object/from16 v7, p1

    move-object/from16 v41, v15

    move-object v15, v8

    .end local v8    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .local v15, "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .local v41, "arr$":[Ljava/lang/Double;
    move/from16 v8, v39

    move/from16 v39, v9

    .end local v9    # "yLabel":F
    .local v39, "yLabel":F
    move/from16 v42, v6

    move v6, v10

    .end local v10    # "bottom":I
    .local v6, "bottom":I
    .local v42, "xLabelsLeft":I
    move v10, v0

    move-object v0, v11

    .end local v11    # "location":Ljava/lang/Double;
    .local v0, "location":Ljava/lang/Double;
    move/from16 v11, v39

    move/from16 v44, v12

    .end local v12    # "i$":I
    .local v44, "i$":I
    move-object/from16 v12, p6

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 371
    int-to-float v10, v14

    iget-object v7, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v7}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsVerticalPadding()F

    move-result v7

    sub-float v11, v39, v7

    iget-object v7, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v7}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsAngle()F

    move-result v46

    move-object/from16 v7, p0

    move-object/from16 v8, p1

    move-object/from16 v9, v16

    move/from16 v47, v13

    .end local v13    # "len$":I
    .local v47, "len$":I
    move/from16 v13, v46

    invoke-virtual/range {v7 .. v13}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    move/from16 v51, v3

    move/from16 v3, v30

    goto :goto_25

    .line 373
    .end local v0    # "location":Ljava/lang/Double;
    .end local v35    # "yTextLabelLocations":[Ljava/lang/Double;
    .end local v39    # "yLabel":F
    .end local v41    # "arr$":[Ljava/lang/Double;
    .end local v42    # "xLabelsLeft":I
    .end local v44    # "i$":I
    .end local v47    # "len$":I
    .local v6, "xLabelsLeft":I
    .restart local v8    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .restart local v9    # "yLabel":F
    .restart local v10    # "bottom":I
    .restart local v11    # "location":Ljava/lang/Double;
    .restart local v12    # "i$":I
    .restart local v13    # "len$":I
    .local v14, "yTextLabelLocations":[Ljava/lang/Double;
    .local v15, "arr$":[Ljava/lang/Double;
    .restart local v25    # "left":I
    :cond_2b
    move/from16 v42, v6

    move/from16 v39, v9

    move v6, v10

    move-object v0, v11

    move/from16 v44, v12

    move/from16 v47, v13

    move-object/from16 v35, v14

    move-object/from16 v41, v15

    move/from16 v14, v25

    move-object v15, v8

    .end local v8    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .end local v9    # "yLabel":F
    .end local v10    # "bottom":I
    .end local v11    # "location":Ljava/lang/Double;
    .end local v12    # "i$":I
    .end local v13    # "len$":I
    .end local v25    # "left":I
    .restart local v0    # "location":Ljava/lang/Double;
    .local v6, "bottom":I
    .local v14, "left":I
    .local v15, "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .restart local v35    # "yTextLabelLocations":[Ljava/lang/Double;
    .restart local v39    # "yLabel":F
    .restart local v41    # "arr$":[Ljava/lang/Double;
    .restart local v42    # "xLabelsLeft":I
    .restart local v44    # "i$":I
    .restart local v47    # "len$":I
    move/from16 v13, v30

    .end local v30    # "right":I
    .local v13, "right":I
    int-to-float v8, v13

    invoke-direct {v5, v2}, Lorg/achartengine/chart/XYChart;->getLabelLinePos(Landroid/graphics/Paint$Align;)I

    move-result v7

    add-int/2addr v7, v13

    int-to-float v10, v7

    move-object/from16 v7, p1

    move/from16 v11, v39

    move-object/from16 v12, p6

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 374
    int-to-float v10, v13

    iget-object v7, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v7}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsVerticalPadding()F

    move-result v7

    sub-float v11, v39, v7

    iget-object v7, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v7}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsAngle()F

    move-result v30

    move-object/from16 v7, p0

    move-object/from16 v8, p1

    move-object/from16 v9, v16

    move/from16 v51, v3

    move v3, v13

    .end local v13    # "right":I
    .local v3, "right":I
    .restart local v51    # "maxScaleNumber":I
    move/from16 v13, v30

    invoke-virtual/range {v7 .. v13}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 377
    :goto_25
    if-eqz v28, :cond_2e

    .line 378
    iget-object v7, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v7}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getGridColor()I

    move-result v7

    invoke-virtual {v4, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 379
    int-to-float v8, v14

    int-to-float v10, v3

    move-object/from16 v7, p1

    move/from16 v9, v39

    move/from16 v11, v39

    move-object/from16 v12, p6

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_26

    .line 382
    .end local v0    # "location":Ljava/lang/Double;
    .end local v35    # "yTextLabelLocations":[Ljava/lang/Double;
    .end local v39    # "yLabel":F
    .end local v41    # "arr$":[Ljava/lang/Double;
    .end local v42    # "xLabelsLeft":I
    .end local v44    # "i$":I
    .end local v47    # "len$":I
    .end local v51    # "maxScaleNumber":I
    .local v3, "maxScaleNumber":I
    .local v6, "xLabelsLeft":I
    .restart local v8    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .restart local v9    # "yLabel":F
    .restart local v10    # "bottom":I
    .restart local v11    # "location":Ljava/lang/Double;
    .restart local v12    # "i$":I
    .local v13, "len$":I
    .local v14, "yTextLabelLocations":[Ljava/lang/Double;
    .local v15, "arr$":[Ljava/lang/Double;
    .restart local v25    # "left":I
    .restart local v30    # "right":I
    :cond_2c
    move/from16 v51, v3

    move/from16 v42, v6

    move/from16 v39, v9

    move v6, v10

    move-object v0, v11

    move/from16 v44, v12

    move/from16 v47, v13

    move-object/from16 v35, v14

    move-object/from16 v41, v15

    move/from16 v14, v25

    move/from16 v3, v30

    move-object v15, v8

    .end local v8    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .end local v9    # "yLabel":F
    .end local v10    # "bottom":I
    .end local v11    # "location":Ljava/lang/Double;
    .end local v12    # "i$":I
    .end local v13    # "len$":I
    .end local v25    # "left":I
    .end local v30    # "right":I
    .restart local v0    # "location":Ljava/lang/Double;
    .local v3, "right":I
    .local v6, "bottom":I
    .local v14, "left":I
    .local v15, "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .restart local v35    # "yTextLabelLocations":[Ljava/lang/Double;
    .restart local v39    # "yLabel":F
    .restart local v41    # "arr$":[Ljava/lang/Double;
    .restart local v42    # "xLabelsLeft":I
    .restart local v44    # "i$":I
    .restart local v47    # "len$":I
    .restart local v51    # "maxScaleNumber":I
    invoke-direct {v5, v2}, Lorg/achartengine/chart/XYChart;->getLabelLinePos(Landroid/graphics/Paint$Align;)I

    move-result v7

    sub-int v8, v3, v7

    int-to-float v8, v8

    int-to-float v10, v3

    move-object/from16 v7, p1

    move/from16 v11, v39

    move-object/from16 v12, p6

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 383
    add-int/lit8 v8, v3, 0xa

    int-to-float v10, v8

    iget-object v7, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v7}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsVerticalPadding()F

    move-result v7

    sub-float v11, v39, v7

    iget-object v7, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v7}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsAngle()F

    move-result v13

    move-object/from16 v7, p0

    move-object/from16 v8, p1

    move-object/from16 v9, v16

    invoke-virtual/range {v7 .. v13}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 384
    if-eqz v28, :cond_2e

    .line 385
    iget-object v7, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v7}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getGridColor()I

    move-result v7

    invoke-virtual {v4, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 386
    int-to-float v8, v3

    int-to-float v10, v14

    move-object/from16 v7, p1

    move/from16 v9, v39

    move/from16 v11, v39

    move-object/from16 v12, p6

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_26

    .line 362
    .end local v0    # "location":Ljava/lang/Double;
    .end local v16    # "label":Ljava/lang/String;
    .end local v39    # "yLabel":F
    .end local v41    # "arr$":[Ljava/lang/Double;
    .end local v42    # "xLabelsLeft":I
    .end local v44    # "i$":I
    .end local v47    # "len$":I
    .end local v51    # "maxScaleNumber":I
    .local v3, "maxScaleNumber":I
    .local v6, "xLabelsLeft":I
    .restart local v11    # "location":Ljava/lang/Double;
    .restart local v12    # "i$":I
    .restart local v13    # "len$":I
    .local v14, "yTextLabelLocations":[Ljava/lang/Double;
    .local v15, "arr$":[Ljava/lang/Double;
    .restart local v25    # "left":I
    .restart local v30    # "right":I
    .local v35, "bottom":I
    .restart local v55    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    :cond_2d
    move/from16 v51, v3

    move/from16 v42, v6

    move-object v0, v11

    move/from16 v44, v12

    move/from16 v47, v13

    move-object/from16 v41, v15

    move/from16 v3, v30

    move/from16 v6, v35

    move-object/from16 v15, v55

    move-object/from16 v35, v14

    move/from16 v14, v25

    .line 361
    .end local v11    # "location":Ljava/lang/Double;
    .end local v12    # "i$":I
    .end local v13    # "len$":I
    .end local v25    # "left":I
    .end local v30    # "right":I
    .end local v55    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .local v3, "right":I
    .local v6, "bottom":I
    .local v14, "left":I
    .local v15, "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .local v35, "yTextLabelLocations":[Ljava/lang/Double;
    .restart local v41    # "arr$":[Ljava/lang/Double;
    .restart local v42    # "xLabelsLeft":I
    .restart local v44    # "i$":I
    .restart local v47    # "len$":I
    .restart local v51    # "maxScaleNumber":I
    :cond_2e
    :goto_26
    add-int/lit8 v12, v44, 0x1

    move/from16 v30, v3

    move/from16 v25, v14

    move-object/from16 v55, v15

    move-object/from16 v14, v35

    move-object/from16 v15, v41

    move/from16 v13, v47

    move/from16 v3, v51

    const/4 v0, 0x1

    move/from16 v35, v6

    move/from16 v6, v42

    .end local v44    # "i$":I
    .restart local v12    # "i$":I
    goto/16 :goto_24

    .end local v41    # "arr$":[Ljava/lang/Double;
    .end local v42    # "xLabelsLeft":I
    .end local v47    # "len$":I
    .end local v51    # "maxScaleNumber":I
    .local v3, "maxScaleNumber":I
    .local v6, "xLabelsLeft":I
    .restart local v13    # "len$":I
    .local v14, "yTextLabelLocations":[Ljava/lang/Double;
    .local v15, "arr$":[Ljava/lang/Double;
    .restart local v25    # "left":I
    .restart local v30    # "right":I
    .local v35, "bottom":I
    .restart local v55    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    :cond_2f
    move/from16 v51, v3

    move/from16 v42, v6

    move/from16 v44, v12

    move/from16 v47, v13

    move-object/from16 v41, v15

    move/from16 v3, v30

    move/from16 v6, v35

    move-object/from16 v15, v55

    move-object/from16 v35, v14

    move/from16 v14, v25

    .line 358
    .end local v2    # "axisAlign":Landroid/graphics/Paint$Align;
    .end local v12    # "i$":I
    .end local v13    # "len$":I
    .end local v25    # "left":I
    .end local v30    # "right":I
    .end local v35    # "bottom":I
    .end local v55    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .local v3, "right":I
    .local v6, "bottom":I
    .local v14, "left":I
    .local v15, "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .restart local v42    # "xLabelsLeft":I
    .restart local v51    # "maxScaleNumber":I
    add-int/lit8 v1, v1, 0x1

    move/from16 v35, v6

    move/from16 v6, v42

    move/from16 v3, v51

    const/4 v0, 0x1

    goto/16 :goto_23

    .end local v14    # "left":I
    .end local v15    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .end local v42    # "xLabelsLeft":I
    .end local v51    # "maxScaleNumber":I
    .local v3, "maxScaleNumber":I
    .local v6, "xLabelsLeft":I
    .restart local v25    # "left":I
    .restart local v30    # "right":I
    .restart local v35    # "bottom":I
    .restart local v55    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    :cond_30
    move/from16 v51, v3

    move/from16 v42, v6

    move/from16 v14, v25

    move/from16 v3, v30

    move/from16 v6, v35

    move-object/from16 v15, v55

    .end local v25    # "left":I
    .end local v30    # "right":I
    .end local v35    # "bottom":I
    .end local v55    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .local v3, "right":I
    .local v6, "bottom":I
    .restart local v14    # "left":I
    .restart local v15    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .restart local v42    # "xLabelsLeft":I
    .restart local v51    # "maxScaleNumber":I
    goto :goto_27

    .line 356
    .end local v1    # "i":I
    .end local v14    # "left":I
    .end local v15    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .end local v42    # "xLabelsLeft":I
    .end local v51    # "maxScaleNumber":I
    .local v3, "maxScaleNumber":I
    .local v6, "xLabelsLeft":I
    .restart local v25    # "left":I
    .restart local v30    # "right":I
    .restart local v35    # "bottom":I
    .restart local v55    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    :cond_31
    move/from16 v51, v3

    move/from16 v42, v6

    move/from16 v14, v25

    move/from16 v3, v30

    move/from16 v6, v35

    move-object/from16 v15, v55

    .line 394
    .end local v25    # "left":I
    .end local v30    # "right":I
    .end local v35    # "bottom":I
    .end local v55    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .local v3, "right":I
    .local v6, "bottom":I
    .restart local v14    # "left":I
    .restart local v15    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .restart local v42    # "xLabelsLeft":I
    .restart local v51    # "maxScaleNumber":I
    :goto_27
    if-eqz v23, :cond_36

    .line 395
    iget-object v0, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getLabelsColor()I

    move-result v0

    invoke-virtual {v4, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 396
    iget-object v0, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getAxisTitleTextSize()F

    move-result v0

    .line 397
    .local v0, "size":F
    invoke-virtual {v4, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 398
    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v4, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 399
    sget-object v1, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->HORIZONTAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    if-ne v15, v1, :cond_34

    .line 400
    iget-object v1, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXTitle()Ljava/lang/String;

    move-result-object v9

    div-int/lit8 v1, p4, 0x2

    move/from16 v2, p2

    add-int/2addr v1, v2

    int-to-float v10, v1

    int-to-float v1, v6

    iget-object v7, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v7}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getLabelsTextSize()F

    move-result v7

    const/high16 v8, 0x40800000    # 4.0f

    mul-float v7, v7, v8

    const/high16 v8, 0x40400000    # 3.0f

    div-float/2addr v7, v8

    add-float/2addr v1, v7

    iget-object v7, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v7}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelsPadding()F

    move-result v7

    add-float/2addr v1, v7

    add-float v11, v1, v0

    const/4 v13, 0x0

    move-object/from16 v7, p0

    move-object/from16 v8, p1

    move-object/from16 v12, p6

    invoke-virtual/range {v7 .. v13}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 406
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_28
    move/from16 v13, v51

    .end local v51    # "maxScaleNumber":I
    .local v13, "maxScaleNumber":I
    if-ge v1, v13, :cond_33

    .line 407
    iget-object v7, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v7, v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisAlign(I)Landroid/graphics/Paint$Align;

    move-result-object v12

    .line 408
    .local v12, "axisAlign":Landroid/graphics/Paint$Align;
    sget-object v7, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    if-ne v12, v7, :cond_32

    .line 409
    iget-object v7, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v7, v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYTitle(I)Ljava/lang/String;

    move-result-object v9

    int-to-float v7, v2

    add-float v10, v7, v0

    div-int/lit8 v7, p5, 0x2

    move/from16 v11, p3

    add-int/2addr v7, v11

    int-to-float v8, v7

    const/high16 v16, -0x3d4c0000    # -90.0f

    move-object/from16 v7, p0

    move/from16 v30, v8

    move-object/from16 v8, p1

    move/from16 v11, v30

    move-object/from16 v30, v12

    .end local v12    # "axisAlign":Landroid/graphics/Paint$Align;
    .local v30, "axisAlign":Landroid/graphics/Paint$Align;
    move-object/from16 v12, p6

    move/from16 v35, v13

    .end local v13    # "maxScaleNumber":I
    .local v35, "maxScaleNumber":I
    move/from16 v13, v16

    invoke-virtual/range {v7 .. v13}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    move/from16 v39, v6

    move/from16 v6, p3

    goto :goto_29

    .line 411
    .end local v30    # "axisAlign":Landroid/graphics/Paint$Align;
    .end local v35    # "maxScaleNumber":I
    .restart local v12    # "axisAlign":Landroid/graphics/Paint$Align;
    .restart local v13    # "maxScaleNumber":I
    :cond_32
    move-object/from16 v30, v12

    move/from16 v35, v13

    .end local v12    # "axisAlign":Landroid/graphics/Paint$Align;
    .end local v13    # "maxScaleNumber":I
    .restart local v30    # "axisAlign":Landroid/graphics/Paint$Align;
    .restart local v35    # "maxScaleNumber":I
    iget-object v7, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v7, v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYTitle(I)Ljava/lang/String;

    move-result-object v9

    add-int v7, v2, p4

    int-to-float v10, v7

    div-int/lit8 v7, p5, 0x2

    move/from16 v13, p3

    add-int/2addr v7, v13

    int-to-float v11, v7

    const/high16 v16, -0x3d4c0000    # -90.0f

    move-object/from16 v7, p0

    move-object/from16 v8, p1

    move-object/from16 v12, p6

    move/from16 v39, v6

    move v6, v13

    .end local v6    # "bottom":I
    .local v39, "bottom":I
    move/from16 v13, v16

    invoke-virtual/range {v7 .. v13}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 406
    .end local v30    # "axisAlign":Landroid/graphics/Paint$Align;
    :goto_29
    add-int/lit8 v1, v1, 0x1

    move/from16 v51, v35

    move/from16 v6, v39

    goto :goto_28

    .end local v35    # "maxScaleNumber":I
    .end local v39    # "bottom":I
    .restart local v6    # "bottom":I
    .restart local v13    # "maxScaleNumber":I
    :cond_33
    move/from16 v39, v6

    move/from16 v35, v13

    move/from16 v6, p3

    .line 414
    .end local v1    # "i":I
    .end local v6    # "bottom":I
    .end local v13    # "maxScaleNumber":I
    .restart local v35    # "maxScaleNumber":I
    .restart local v39    # "bottom":I
    iget-object v1, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getChartTitleTextSize()F

    move-result v1

    invoke-virtual {v4, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 415
    iget-object v1, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getChartTitle()Ljava/lang/String;

    move-result-object v9

    div-int/lit8 v1, p4, 0x2

    add-int/2addr v1, v2

    int-to-float v10, v1

    int-to-float v1, v6

    iget-object v7, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v7}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getChartTitleTextSize()F

    move-result v7

    add-float v11, v1, v7

    const/4 v13, 0x0

    move-object/from16 v7, p0

    move-object/from16 v8, p1

    move-object/from16 v12, p6

    invoke-virtual/range {v7 .. v13}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    move/from16 v56, v40

    goto/16 :goto_2a

    .line 417
    .end local v35    # "maxScaleNumber":I
    .end local v39    # "bottom":I
    .restart local v6    # "bottom":I
    .restart local v51    # "maxScaleNumber":I
    :cond_34
    move/from16 v2, p2

    move/from16 v39, v6

    move/from16 v35, v51

    move/from16 v6, p3

    .end local v6    # "bottom":I
    .end local v51    # "maxScaleNumber":I
    .restart local v35    # "maxScaleNumber":I
    .restart local v39    # "bottom":I
    sget-object v1, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->VERTICAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    if-ne v15, v1, :cond_35

    .line 418
    iget-object v1, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXTitle()Ljava/lang/String;

    move-result-object v9

    div-int/lit8 v1, p4, 0x2

    add-int/2addr v1, v2

    int-to-float v10, v1

    add-int v1, v6, p5

    int-to-float v1, v1

    sub-float/2addr v1, v0

    iget-object v7, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v7}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelsPadding()F

    move-result v7

    add-float v11, v1, v7

    const/high16 v13, -0x3d4c0000    # -90.0f

    move-object/from16 v7, p0

    move-object/from16 v8, p1

    move-object/from16 v12, p6

    invoke-virtual/range {v7 .. v13}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 420
    iget-object v1, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYTitle()Ljava/lang/String;

    move-result-object v9

    add-int/lit8 v8, v3, 0x14

    int-to-float v10, v8

    div-int/lit8 v1, p5, 0x2

    add-int/2addr v1, v6

    int-to-float v11, v1

    const/4 v13, 0x0

    move-object/from16 v8, p1

    invoke-virtual/range {v7 .. v13}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 421
    iget-object v1, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getChartTitleTextSize()F

    move-result v1

    invoke-virtual {v4, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 422
    iget-object v1, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getChartTitle()Ljava/lang/String;

    move-result-object v9

    int-to-float v1, v2

    add-float v10, v1, v0

    div-int/lit8 v1, p5, 0x2

    move/from16 v13, v40

    .end local v40    # "top":I
    .local v13, "top":I
    add-int/2addr v1, v13

    int-to-float v11, v1

    const/4 v1, 0x0

    move/from16 v56, v13

    .end local v13    # "top":I
    .local v56, "top":I
    move v13, v1

    invoke-virtual/range {v7 .. v13}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    goto :goto_2a

    .line 417
    .end local v56    # "top":I
    .restart local v40    # "top":I
    :cond_35
    move/from16 v56, v40

    .end local v40    # "top":I
    .restart local v56    # "top":I
    goto :goto_2a

    .line 394
    .end local v0    # "size":F
    .end local v35    # "maxScaleNumber":I
    .end local v39    # "bottom":I
    .end local v56    # "top":I
    .restart local v6    # "bottom":I
    .restart local v40    # "top":I
    .restart local v51    # "maxScaleNumber":I
    :cond_36
    move/from16 v2, p2

    move/from16 v39, v6

    move/from16 v56, v40

    move/from16 v35, v51

    move/from16 v6, p3

    .line 426
    .end local v6    # "bottom":I
    .end local v29    # "xLabels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    .end local v33    # "allYLabels":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Ljava/lang/Double;>;>;"
    .end local v40    # "top":I
    .end local v42    # "xLabelsLeft":I
    .end local v51    # "maxScaleNumber":I
    .restart local v35    # "maxScaleNumber":I
    .restart local v39    # "bottom":I
    .restart local v56    # "top":I
    :goto_2a
    sget-object v0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->HORIZONTAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    if-ne v15, v0, :cond_37

    .line 427
    iget-object v0, v5, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelsPadding()F

    move-result v1

    float-to-int v1, v1

    add-int v7, v6, v1

    const/4 v12, 0x0

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move v11, v3

    move/from16 v13, v35

    .end local v3    # "right":I
    .end local v35    # "maxScaleNumber":I
    .local v11, "right":I
    .local v13, "maxScaleNumber":I
    move-object v3, v0

    move-object v10, v4

    move-object/from16 v4, v20

    move-object v9, v5

    move v5, v14

    move/from16 v8, v39

    .end local v39    # "bottom":I
    .local v8, "bottom":I
    move v6, v11

    move/from16 v57, v8

    .end local v8    # "bottom":I
    .local v57, "bottom":I
    move/from16 v8, p4

    move/from16 v9, p5

    move/from16 v10, v18

    move/from16 v30, v11

    .end local v11    # "right":I
    .local v30, "right":I
    move-object/from16 v11, p6

    invoke-virtual/range {v1 .. v12}, Lorg/achartengine/chart/XYChart;->drawLegend(Landroid/graphics/Canvas;Lorg/achartengine/renderer/DefaultRenderer;[Ljava/lang/String;IIIIIILandroid/graphics/Paint;Z)I

    move-object/from16 v7, p1

    move/from16 v42, v13

    move-object/from16 v55, v15

    move/from16 v13, v50

    const/4 v8, 0x0

    move-object/from16 v15, p0

    goto :goto_2b

    .line 429
    .end local v13    # "maxScaleNumber":I
    .end local v30    # "right":I
    .end local v57    # "bottom":I
    .restart local v3    # "right":I
    .restart local v35    # "maxScaleNumber":I
    .restart local v39    # "bottom":I
    :cond_37
    move/from16 v30, v3

    move/from16 v13, v35

    move/from16 v57, v39

    .end local v3    # "right":I
    .end local v35    # "maxScaleNumber":I
    .end local v39    # "bottom":I
    .restart local v13    # "maxScaleNumber":I
    .restart local v30    # "right":I
    .restart local v57    # "bottom":I
    sget-object v0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->VERTICAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    if-ne v15, v0, :cond_38

    .line 430
    move/from16 v12, v50

    .end local v50    # "angle":I
    .local v12, "angle":I
    int-to-float v0, v12

    const/4 v1, 0x1

    move-object/from16 v11, p0

    move-object/from16 v10, p1

    invoke-direct {v11, v10, v0, v1}, Lorg/achartengine/chart/XYChart;->transform(Landroid/graphics/Canvas;FZ)V

    .line 431
    iget-object v3, v11, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelsPadding()F

    move-result v0

    float-to-int v0, v0

    add-int v7, p3, v0

    const/4 v0, 0x0

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v4, v20

    move v5, v14

    move/from16 v6, v30

    move/from16 v8, p4

    move/from16 v9, p5

    move/from16 v10, v18

    move-object/from16 v55, v15

    move-object v15, v11

    .end local v15    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .restart local v55    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    move-object/from16 v11, p6

    move/from16 v42, v13

    move v13, v12

    .end local v12    # "angle":I
    .local v13, "angle":I
    .local v42, "maxScaleNumber":I
    move v12, v0

    invoke-virtual/range {v1 .. v12}, Lorg/achartengine/chart/XYChart;->drawLegend(Landroid/graphics/Canvas;Lorg/achartengine/renderer/DefaultRenderer;[Ljava/lang/String;IIIIIILandroid/graphics/Paint;Z)I

    .line 433
    int-to-float v0, v13

    move-object/from16 v7, p1

    const/4 v8, 0x0

    invoke-direct {v15, v7, v0, v8}, Lorg/achartengine/chart/XYChart;->transform(Landroid/graphics/Canvas;FZ)V

    goto :goto_2b

    .line 429
    .end local v42    # "maxScaleNumber":I
    .end local v55    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .local v13, "maxScaleNumber":I
    .restart local v15    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .restart local v50    # "angle":I
    :cond_38
    move-object/from16 v7, p1

    move/from16 v42, v13

    move-object/from16 v55, v15

    move/from16 v13, v50

    const/4 v8, 0x0

    move-object/from16 v15, p0

    .line 435
    .end local v15    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .end local v50    # "angle":I
    .local v13, "angle":I
    .restart local v42    # "maxScaleNumber":I
    .restart local v55    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    :goto_2b
    iget-object v0, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isShowAxes()Z

    move-result v0

    if-eqz v0, :cond_3c

    .line 436
    iget-object v0, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getAxesColor()I

    move-result v0

    move-object/from16 v9, p6

    invoke-virtual {v9, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 437
    int-to-float v2, v14

    move/from16 v10, v57

    .end local v57    # "bottom":I
    .restart local v10    # "bottom":I
    int-to-float v3, v10

    move/from16 v11, v30

    .end local v30    # "right":I
    .restart local v11    # "right":I
    int-to-float v4, v11

    int-to-float v5, v10

    move-object/from16 v1, p1

    move-object/from16 v6, p6

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 438
    const/4 v0, 0x0

    .line 439
    .local v0, "rightAxis":Z
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_2c
    move/from16 v12, v42

    .end local v42    # "maxScaleNumber":I
    .local v12, "maxScaleNumber":I
    if-ge v1, v12, :cond_3a

    if-nez v0, :cond_3a

    .line 440
    iget-object v2, v15, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v2, v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisAlign(I)Landroid/graphics/Paint$Align;

    move-result-object v2

    sget-object v3, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    if-ne v2, v3, :cond_39

    const/4 v2, 0x1

    goto :goto_2d

    :cond_39
    const/4 v2, 0x0

    :goto_2d
    move v0, v2

    .line 439
    add-int/lit8 v1, v1, 0x1

    move/from16 v42, v12

    goto :goto_2c

    .line 442
    .end local v1    # "i":I
    :cond_3a
    sget-object v1, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->HORIZONTAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    move-object/from16 v8, v55

    .end local v55    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .local v8, "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    if-ne v8, v1, :cond_3b

    .line 443
    int-to-float v2, v14

    move/from16 v6, v56

    .end local v56    # "top":I
    .local v6, "top":I
    int-to-float v3, v6

    int-to-float v4, v14

    int-to-float v5, v10

    move-object/from16 v1, p1

    move v9, v6

    .end local v6    # "top":I
    .local v9, "top":I
    move-object/from16 v6, p6

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 444
    if-eqz v0, :cond_3d

    .line 445
    int-to-float v2, v11

    int-to-float v3, v9

    int-to-float v4, v11

    int-to-float v5, v10

    move-object/from16 v1, p1

    move-object/from16 v6, p6

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_2e

    .line 447
    .end local v9    # "top":I
    .restart local v56    # "top":I
    :cond_3b
    move/from16 v9, v56

    .end local v56    # "top":I
    .restart local v9    # "top":I
    sget-object v1, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->VERTICAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    if-ne v8, v1, :cond_3d

    .line 448
    int-to-float v2, v11

    int-to-float v3, v9

    int-to-float v4, v11

    int-to-float v5, v10

    move-object/from16 v1, p1

    move-object/from16 v6, p6

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_2e

    .line 435
    .end local v0    # "rightAxis":Z
    .end local v8    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .end local v9    # "top":I
    .end local v10    # "bottom":I
    .end local v11    # "right":I
    .end local v12    # "maxScaleNumber":I
    .restart local v30    # "right":I
    .restart local v42    # "maxScaleNumber":I
    .restart local v55    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .restart local v56    # "top":I
    .restart local v57    # "bottom":I
    :cond_3c
    move/from16 v11, v30

    move/from16 v12, v42

    move-object/from16 v8, v55

    move/from16 v9, v56

    move/from16 v10, v57

    .line 451
    .end local v30    # "right":I
    .end local v42    # "maxScaleNumber":I
    .end local v55    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .end local v56    # "top":I
    .end local v57    # "bottom":I
    .restart local v8    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .restart local v9    # "top":I
    .restart local v10    # "bottom":I
    .restart local v11    # "right":I
    .restart local v12    # "maxScaleNumber":I
    :cond_3d
    :goto_2e
    if-eqz v19, :cond_3e

    .line 452
    int-to-float v0, v13

    const/4 v1, 0x1

    invoke-direct {v15, v7, v0, v1}, Lorg/achartengine/chart/XYChart;->transform(Landroid/graphics/Canvas;FZ)V

    .line 454
    :cond_3e
    return-void
.end method

.method protected drawChartValuesText(Landroid/graphics/Canvas;Lorg/achartengine/model/XYSeries;Lorg/achartengine/renderer/SimpleSeriesRenderer;Landroid/graphics/Paint;Ljava/util/List;II)V
    .locals 17
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

    .line 564
    .local p5, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    move-object/from16 v7, p0

    move-object/from16 v8, p2

    move-object/from16 v9, p5

    move/from16 v10, p7

    invoke-interface/range {p5 .. p5}, Ljava/util/List;->size()I

    move-result v0

    const/4 v11, 0x1

    if-le v0, v11, :cond_5

    .line 566
    const/4 v12, 0x0

    invoke-interface {v9, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 567
    .local v0, "previousPointX":F
    invoke-interface {v9, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    .line 568
    .local v1, "previousPointY":F
    const/4 v2, 0x0

    move v14, v0

    move v15, v1

    move v13, v2

    .end local v0    # "previousPointX":F
    .end local v1    # "previousPointY":F
    .local v13, "k":I
    .local v14, "previousPointX":F
    .local v15, "previousPointY":F
    :goto_0
    invoke-interface/range {p5 .. p5}, Ljava/util/List;->size()I

    move-result v0

    if-ge v13, v0, :cond_4

    .line 569
    const/4 v6, 0x2

    if-ne v13, v6, :cond_1

    .line 571
    invoke-interface {v9, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-interface {v9, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-virtual/range {p3 .. p3}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getDisplayChartValuesDistance()I

    move-result v1

    int-to-float v1, v1

    const/4 v5, 0x3

    cmpl-float v0, v0, v1

    if-gtz v0, :cond_0

    invoke-interface {v9, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-interface {v9, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-virtual/range {p3 .. p3}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getDisplayChartValuesDistance()I

    move-result v1

    int-to-float v1, v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_3

    .line 574
    :cond_0
    invoke-virtual/range {p3 .. p3}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getChartValuesFormat()Ljava/text/NumberFormat;

    move-result-object v0

    invoke-virtual {v8, v10}, Lorg/achartengine/model/XYSeries;->getY(I)D

    move-result-wide v1

    invoke-virtual {v7, v0, v1, v2}, Lorg/achartengine/chart/XYChart;->getLabel(Ljava/text/NumberFormat;D)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v9, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-interface {v9, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

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

    const/4 v11, 0x3

    move-object/from16 v5, p4

    const/4 v12, 0x2

    move/from16 v6, v16

    invoke-virtual/range {v0 .. v6}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 577
    invoke-virtual/range {p3 .. p3}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getChartValuesFormat()Ljava/text/NumberFormat;

    move-result-object v0

    add-int/lit8 v1, v10, 0x1

    invoke-virtual {v8, v1}, Lorg/achartengine/model/XYSeries;->getY(I)D

    move-result-wide v1

    invoke-virtual {v7, v0, v1, v2}, Lorg/achartengine/chart/XYChart;->getLabel(Ljava/text/NumberFormat;D)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v9, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-interface {v9, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

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

    invoke-virtual/range {v0 .. v6}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 581
    invoke-interface {v9, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 582
    .end local v14    # "previousPointX":F
    .restart local v0    # "previousPointX":F
    invoke-interface {v9, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    move v14, v0

    move v15, v1

    .end local v15    # "previousPointY":F
    .restart local v1    # "previousPointY":F
    goto/16 :goto_1

    .line 584
    .end local v0    # "previousPointX":F
    .end local v1    # "previousPointY":F
    .restart local v14    # "previousPointX":F
    .restart local v15    # "previousPointY":F
    :cond_1
    const/4 v12, 0x2

    if-le v13, v12, :cond_3

    .line 587
    invoke-interface {v9, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    sub-float/2addr v0, v14

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-virtual/range {p3 .. p3}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getDisplayChartValuesDistance()I

    move-result v1

    int-to-float v1, v1

    cmpl-float v0, v0, v1

    if-gtz v0, :cond_2

    add-int/lit8 v0, v13, 0x1

    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    sub-float/2addr v0, v15

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-virtual/range {p3 .. p3}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getDisplayChartValuesDistance()I

    move-result v1

    int-to-float v1, v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_3

    .line 590
    :cond_2
    invoke-virtual/range {p3 .. p3}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getChartValuesFormat()Ljava/text/NumberFormat;

    move-result-object v0

    div-int/lit8 v1, v13, 0x2

    add-int/2addr v1, v10

    invoke-virtual {v8, v1}, Lorg/achartengine/model/XYSeries;->getY(I)D

    move-result-wide v1

    invoke-virtual {v7, v0, v1, v2}, Lorg/achartengine/chart/XYChart;->getLabel(Ljava/text/NumberFormat;D)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v9, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v3

    add-int/lit8 v0, v13, 0x1

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

    move-object/from16 v5, p4

    invoke-virtual/range {v0 .. v6}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 593
    invoke-interface {v9, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 594
    .end local v14    # "previousPointX":F
    .restart local v0    # "previousPointX":F
    add-int/lit8 v1, v13, 0x1

    invoke-interface {v9, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    move v14, v0

    move v15, v1

    .line 568
    .end local v0    # "previousPointX":F
    .restart local v14    # "previousPointX":F
    :cond_3
    :goto_1
    add-int/lit8 v13, v13, 0x2

    const/4 v11, 0x1

    const/4 v12, 0x0

    goto/16 :goto_0

    .line 598
    .end local v13    # "k":I
    .end local v14    # "previousPointX":F
    .end local v15    # "previousPointY":F
    :cond_4
    goto :goto_3

    .line 599
    :cond_5
    const/4 v0, 0x0

    move v11, v0

    .local v11, "k":I
    :goto_2
    invoke-interface/range {p5 .. p5}, Ljava/util/List;->size()I

    move-result v0

    if-ge v11, v0, :cond_6

    .line 600
    invoke-virtual/range {p3 .. p3}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getChartValuesFormat()Ljava/text/NumberFormat;

    move-result-object v0

    div-int/lit8 v1, v11, 0x2

    add-int/2addr v1, v10

    invoke-virtual {v8, v1}, Lorg/achartengine/model/XYSeries;->getY(I)D

    move-result-wide v1

    invoke-virtual {v7, v0, v1, v2}, Lorg/achartengine/chart/XYChart;->getLabel(Ljava/text/NumberFormat;D)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v9, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v3

    add-int/lit8 v0, v11, 0x1

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

    move-object/from16 v5, p4

    invoke-virtual/range {v0 .. v6}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 599
    add-int/lit8 v11, v11, 0x2

    goto :goto_2

    .line 605
    .end local v11    # "k":I
    :cond_6
    :goto_3
    return-void
.end method

.method public abstract drawSeries(Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/SimpleSeriesRenderer;FII)V
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
.end method

.method protected drawSeries(Lorg/achartengine/model/XYSeries;Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/SimpleSeriesRenderer;FILorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;I)V
    .locals 17
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

    .line 503
    .local p4, "pointsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    move-object/from16 v8, p3

    invoke-virtual/range {p5 .. p5}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getStroke()Lorg/achartengine/renderer/BasicStroke;

    move-result-object v9

    .line 504
    .local v9, "stroke":Lorg/achartengine/renderer/BasicStroke;
    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Paint;->getStrokeCap()Landroid/graphics/Paint$Cap;

    move-result-object v10

    .line 505
    .local v10, "cap":Landroid/graphics/Paint$Cap;
    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Paint;->getStrokeJoin()Landroid/graphics/Paint$Join;

    move-result-object v11

    .line 506
    .local v11, "join":Landroid/graphics/Paint$Join;
    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Paint;->getStrokeMiter()F

    move-result v12

    .line 507
    .local v12, "miter":F
    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Paint;->getPathEffect()Landroid/graphics/PathEffect;

    move-result-object v13

    .line 508
    .local v13, "pathEffect":Landroid/graphics/PathEffect;
    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Paint;->getStyle()Landroid/graphics/Paint$Style;

    move-result-object v14

    .line 509
    .local v14, "style":Landroid/graphics/Paint$Style;
    if-eqz v9, :cond_1

    .line 510
    const/4 v0, 0x0

    .line 511
    .local v0, "effect":Landroid/graphics/PathEffect;
    invoke-virtual {v9}, Lorg/achartengine/renderer/BasicStroke;->getIntervals()[F

    move-result-object v1

    if-eqz v1, :cond_0

    .line 512
    new-instance v1, Landroid/graphics/DashPathEffect;

    invoke-virtual {v9}, Lorg/achartengine/renderer/BasicStroke;->getIntervals()[F

    move-result-object v2

    invoke-virtual {v9}, Lorg/achartengine/renderer/BasicStroke;->getPhase()F

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    move-object v0, v1

    move-object v7, v0

    goto :goto_0

    .line 511
    :cond_0
    move-object v7, v0

    .line 514
    .end local v0    # "effect":Landroid/graphics/PathEffect;
    .local v7, "effect":Landroid/graphics/PathEffect;
    :goto_0
    invoke-virtual {v9}, Lorg/achartengine/renderer/BasicStroke;->getCap()Landroid/graphics/Paint$Cap;

    move-result-object v1

    invoke-virtual {v9}, Lorg/achartengine/renderer/BasicStroke;->getJoin()Landroid/graphics/Paint$Join;

    move-result-object v2

    invoke-virtual {v9}, Lorg/achartengine/renderer/BasicStroke;->getMiter()F

    move-result v3

    sget-object v4, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    move-object/from16 v0, p0

    move-object v5, v7

    move-object/from16 v6, p3

    invoke-direct/range {v0 .. v6}, Lorg/achartengine/chart/XYChart;->setStroke(Landroid/graphics/Paint$Cap;Landroid/graphics/Paint$Join;FLandroid/graphics/Paint$Style;Landroid/graphics/PathEffect;Landroid/graphics/Paint;)V

    .line 518
    .end local v7    # "effect":Landroid/graphics/PathEffect;
    :cond_1
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    move-object/from16 v4, p5

    move/from16 v5, p6

    move/from16 v6, p7

    move/from16 v7, p9

    invoke-virtual/range {v0 .. v7}, Lorg/achartengine/chart/XYChart;->drawSeries(Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/SimpleSeriesRenderer;FII)V

    .line 519
    move-object/from16 v15, p0

    move-object/from16 v7, p5

    invoke-virtual {v15, v7}, Lorg/achartengine/chart/XYChart;->isRenderPoints(Lorg/achartengine/renderer/SimpleSeriesRenderer;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 520
    invoke-virtual/range {p0 .. p0}, Lorg/achartengine/chart/XYChart;->getPointsChart()Lorg/achartengine/chart/ScatterChart;

    move-result-object v16

    .line 521
    .local v16, "pointsChart":Lorg/achartengine/chart/ScatterChart;
    if-eqz v16, :cond_2

    .line 522
    move-object/from16 v0, v16

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    move-object/from16 v4, p5

    move/from16 v5, p6

    move/from16 v6, p7

    move/from16 v7, p9

    invoke-virtual/range {v0 .. v7}, Lorg/achartengine/chart/ScatterChart;->drawSeries(Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/SimpleSeriesRenderer;FII)V

    .line 526
    .end local v16    # "pointsChart":Lorg/achartengine/chart/ScatterChart;
    :cond_2
    invoke-virtual/range {p5 .. p5}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getChartValuesTextSize()F

    move-result v0

    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 527
    sget-object v0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->HORIZONTAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    move-object/from16 v7, p8

    if-ne v7, v0, :cond_3

    .line 528
    sget-object v0, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    goto :goto_1

    .line 530
    :cond_3
    sget-object v0, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 532
    :goto_1
    invoke-virtual/range {p5 .. p5}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->isDisplayChartValues()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 533
    invoke-virtual/range {p5 .. p5}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getChartValuesTextAlign()Landroid/graphics/Paint$Align;

    move-result-object v0

    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 534
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p1

    move-object/from16 v3, p5

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move/from16 v6, p7

    move/from16 v7, p9

    invoke-virtual/range {v0 .. v7}, Lorg/achartengine/chart/XYChart;->drawChartValuesText(Landroid/graphics/Canvas;Lorg/achartengine/model/XYSeries;Lorg/achartengine/renderer/SimpleSeriesRenderer;Landroid/graphics/Paint;Ljava/util/List;II)V

    .line 537
    :cond_4
    if-eqz v9, :cond_5

    .line 538
    move-object/from16 v0, p0

    move-object v1, v10

    move-object v2, v11

    move v3, v12

    move-object v4, v14

    move-object v5, v13

    move-object/from16 v6, p3

    invoke-direct/range {v0 .. v6}, Lorg/achartengine/chart/XYChart;->setStroke(Landroid/graphics/Paint$Cap;Landroid/graphics/Paint$Join;FLandroid/graphics/Paint$Style;Landroid/graphics/PathEffect;Landroid/graphics/Paint;)V

    .line 540
    :cond_5
    return-void
.end method

.method protected drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V
    .locals 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "x"    # F
    .param p4, "y"    # F
    .param p5, "paint"    # Landroid/graphics/Paint;
    .param p6, "extraAngle"    # F

    .line 620
    iget-object v0, p0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getOrientation()Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    move-result-object v0

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->getAngle()I

    move-result v0

    neg-int v0, v0

    int-to-float v0, v0

    add-float/2addr v0, p6

    .line 621
    .local v0, "angle":F
    const/4 v1, 0x0

    cmpl-float v2, v0, v1

    if-eqz v2, :cond_0

    .line 623
    invoke-virtual {p1, v0, p3, p4}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 625
    :cond_0
    invoke-virtual/range {p0 .. p5}, Lorg/achartengine/chart/XYChart;->drawString(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 626
    cmpl-float v1, v0, v1

    if-eqz v1, :cond_1

    .line 627
    neg-float v1, v0

    invoke-virtual {p1, v1, p3, p4}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 630
    :cond_1
    return-void
.end method

.method protected drawXLabels(Ljava/util/List;[Ljava/lang/Double;Landroid/graphics/Canvas;Landroid/graphics/Paint;IIIDDD)V
    .locals 20
    .param p2, "xTextLabelLocations"    # [Ljava/lang/Double;
    .param p3, "canvas"    # Landroid/graphics/Canvas;
    .param p4, "paint"    # Landroid/graphics/Paint;
    .param p5, "left"    # I
    .param p6, "top"    # I
    .param p7, "bottom"    # I
    .param p8, "xPixelsPerUnit"    # D
    .param p10, "minX"    # D
    .param p12, "maxX"    # D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;[",
            "Ljava/lang/Double;",
            "Landroid/graphics/Canvas;",
            "Landroid/graphics/Paint;",
            "IIIDDD)V"
        }
    .end annotation

    .line 668
    .local p1, "xLabels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    move-object/from16 v14, p0

    move-object/from16 v15, p4

    move/from16 v12, p7

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v13

    .line 669
    .local v13, "length":I
    iget-object v0, v14, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isShowLabels()Z

    move-result v16

    .line 670
    .local v16, "showLabels":Z
    iget-object v0, v14, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isShowGridY()Z

    move-result v17

    .line 671
    .local v17, "showGridY":Z
    const/4 v0, 0x0

    move v7, v0

    .local v7, "i":I
    :goto_0
    if-ge v7, v13, :cond_2

    .line 672
    move-object/from16 v10, p1

    invoke-interface {v10, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    .line 673
    .local v8, "label":D
    move/from16 v11, p5

    int-to-double v0, v11

    sub-double v2, v8, p10

    mul-double v2, v2, p8

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v0, v2

    double-to-float v6, v0

    .line 674
    .local v6, "xLabel":F
    if-eqz v16, :cond_0

    .line 675
    iget-object v0, v14, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelsColor()I

    move-result v0

    invoke-virtual {v15, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 676
    int-to-float v2, v12

    int-to-float v0, v12

    iget-object v1, v14, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getLabelsTextSize()F

    move-result v1

    const/high16 v18, 0x40400000    # 3.0f

    div-float v1, v1, v18

    add-float v4, v0, v1

    move-object/from16 v0, p3

    move v1, v6

    move v3, v6

    move-object/from16 v5, p4

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 677
    iget-object v0, v14, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getLabelFormat()Ljava/text/NumberFormat;

    move-result-object v0

    invoke-virtual {v14, v0, v8, v9}, Lorg/achartengine/chart/XYChart;->getLabel(Ljava/text/NumberFormat;D)Ljava/lang/String;

    move-result-object v2

    int-to-float v0, v12

    iget-object v1, v14, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getLabelsTextSize()F

    move-result v1

    const/high16 v3, 0x40800000    # 4.0f

    mul-float v1, v1, v3

    div-float v1, v1, v18

    add-float/2addr v0, v1

    iget-object v1, v14, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelsPadding()F

    move-result v1

    add-float v4, v0, v1

    iget-object v0, v14, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelsAngle()F

    move-result v18

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move v3, v6

    move/from16 v19, v6

    .end local v6    # "xLabel":F
    .local v19, "xLabel":F
    move/from16 v6, v18

    invoke-virtual/range {v0 .. v6}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    goto :goto_1

    .line 674
    .end local v19    # "xLabel":F
    .restart local v6    # "xLabel":F
    :cond_0
    move/from16 v19, v6

    .line 681
    .end local v6    # "xLabel":F
    .restart local v19    # "xLabel":F
    :goto_1
    if-eqz v17, :cond_1

    .line 682
    iget-object v0, v14, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getGridColor()I

    move-result v0

    invoke-virtual {v15, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 683
    int-to-float v2, v12

    move/from16 v6, p6

    int-to-float v4, v6

    move-object/from16 v0, p3

    move/from16 v1, v19

    move/from16 v3, v19

    move-object/from16 v5, p4

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_2

    .line 681
    :cond_1
    move/from16 v6, p6

    .line 671
    .end local v8    # "label":D
    .end local v19    # "xLabel":F
    :goto_2
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_0

    :cond_2
    move-object/from16 v10, p1

    move/from16 v11, p5

    move/from16 v6, p6

    .line 686
    .end local v7    # "i":I
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    move/from16 v4, v16

    move/from16 v5, p5

    move/from16 v7, p7

    move-wide/from16 v8, p8

    move-wide/from16 v10, p10

    move/from16 v18, v13

    .end local v13    # "length":I
    .local v18, "length":I
    move-wide/from16 v12, p12

    invoke-virtual/range {v0 .. v13}, Lorg/achartengine/chart/XYChart;->drawXTextLabels([Ljava/lang/Double;Landroid/graphics/Canvas;Landroid/graphics/Paint;ZIIIDDD)V

    .line 688
    return-void
.end method

.method protected drawXTextLabels([Ljava/lang/Double;Landroid/graphics/Canvas;Landroid/graphics/Paint;ZIIIDDD)V
    .locals 18
    .param p1, "xTextLabelLocations"    # [Ljava/lang/Double;
    .param p2, "canvas"    # Landroid/graphics/Canvas;
    .param p3, "paint"    # Landroid/graphics/Paint;
    .param p4, "showLabels"    # Z
    .param p5, "left"    # I
    .param p6, "top"    # I
    .param p7, "bottom"    # I
    .param p8, "xPixelsPerUnit"    # D
    .param p10, "minX"    # D
    .param p12, "maxX"    # D

    .line 771
    move-object/from16 v7, p0

    move-object/from16 v8, p3

    move/from16 v9, p7

    iget-object v0, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isShowCustomTextGrid()Z

    move-result v10

    .line 772
    .local v10, "showCustomTextGrid":Z
    if-eqz p4, :cond_3

    .line 773
    iget-object v0, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelsColor()I

    move-result v0

    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 774
    move-object/from16 v11, p1

    .local v11, "arr$":[Ljava/lang/Double;
    array-length v12, v11

    .local v12, "len$":I
    const/4 v0, 0x0

    move v13, v0

    .local v13, "i$":I
    :goto_0
    if-ge v13, v12, :cond_2

    aget-object v14, v11, v13

    .line 775
    .local v14, "location":Ljava/lang/Double;
    invoke-virtual {v14}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    cmpg-double v2, p10, v0

    if-gtz v2, :cond_1

    invoke-virtual {v14}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    cmpg-double v2, v0, p12

    if-gtz v2, :cond_1

    .line 776
    move/from16 v15, p5

    int-to-double v0, v15

    invoke-virtual {v14}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    sub-double v2, v2, p10

    mul-double v2, v2, p8

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v0, v2

    double-to-float v6, v0

    .line 777
    .local v6, "xLabel":F
    iget-object v0, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelsColor()I

    move-result v0

    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 778
    int-to-float v2, v9

    int-to-float v0, v9

    iget-object v1, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getLabelsTextSize()F

    move-result v1

    const/high16 v16, 0x40400000    # 3.0f

    div-float v1, v1, v16

    add-float v4, v0, v1

    move-object/from16 v0, p2

    move v1, v6

    move v3, v6

    move-object/from16 v5, p3

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 780
    iget-object v0, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0, v14}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXTextLabel(Ljava/lang/Double;)Ljava/lang/String;

    move-result-object v2

    int-to-float v0, v9

    iget-object v1, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getLabelsTextSize()F

    move-result v1

    const/high16 v3, 0x40800000    # 4.0f

    mul-float v1, v1, v3

    div-float v1, v1, v16

    add-float v4, v0, v1

    iget-object v0, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelsAngle()F

    move-result v16

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move v3, v6

    move/from16 v17, v6

    .end local v6    # "xLabel":F
    .local v17, "xLabel":F
    move/from16 v6, v16

    invoke-virtual/range {v0 .. v6}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 782
    if-eqz v10, :cond_0

    .line 783
    iget-object v0, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getGridColor()I

    move-result v0

    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 784
    int-to-float v2, v9

    move/from16 v6, p6

    int-to-float v4, v6

    move-object/from16 v0, p2

    move/from16 v1, v17

    move/from16 v3, v17

    move-object/from16 v5, p3

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_1

    .line 782
    :cond_0
    move/from16 v6, p6

    goto :goto_1

    .line 775
    .end local v17    # "xLabel":F
    :cond_1
    move/from16 v15, p5

    move/from16 v6, p6

    .line 774
    .end local v14    # "location":Ljava/lang/Double;
    :goto_1
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_0

    :cond_2
    move/from16 v15, p5

    move/from16 v6, p6

    goto :goto_2

    .line 772
    .end local v11    # "arr$":[Ljava/lang/Double;
    .end local v12    # "len$":I
    .end local v13    # "i$":I
    :cond_3
    move/from16 v15, p5

    move/from16 v6, p6

    .line 789
    :goto_2
    return-void
.end method

.method protected drawYLabels(Ljava/util/Map;Landroid/graphics/Canvas;Landroid/graphics/Paint;IIII[D[D)V
    .locals 24
    .param p2, "canvas"    # Landroid/graphics/Canvas;
    .param p3, "paint"    # Landroid/graphics/Paint;
    .param p4, "maxScaleNumber"    # I
    .param p5, "left"    # I
    .param p6, "right"    # I
    .param p7, "bottom"    # I
    .param p8, "yPixelsPerUnit"    # [D
    .param p9, "minY"    # [D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;>;",
            "Landroid/graphics/Canvas;",
            "Landroid/graphics/Paint;",
            "IIII[D[D)V"
        }
    .end annotation

    .line 705
    .local p1, "allYLabels":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Ljava/lang/Double;>;>;"
    move-object/from16 v7, p0

    move-object/from16 v8, p3

    move/from16 v9, p5

    move/from16 v10, p6

    iget-object v0, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getOrientation()Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    move-result-object v11

    .line 706
    .local v11, "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    iget-object v0, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isShowGridX()Z

    move-result v12

    .line 707
    .local v12, "showGridX":Z
    iget-object v0, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isShowLabels()Z

    move-result v13

    .line 708
    .local v13, "showLabels":Z
    const/4 v0, 0x0

    move v14, v0

    .local v14, "i":I
    :goto_0
    move/from16 v15, p4

    if-ge v14, v15, :cond_9

    .line 709
    iget-object v0, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0, v14}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsAlign(I)Landroid/graphics/Paint$Align;

    move-result-object v0

    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 710
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    move-object/from16 v6, p1

    invoke-interface {v6, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Ljava/util/List;

    .line 711
    .local v5, "yLabels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v4

    .line 712
    .local v4, "length":I
    const/4 v0, 0x0

    move v3, v0

    .local v3, "j":I
    :goto_1
    if-ge v3, v4, :cond_8

    .line 713
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    .line 714
    .local v1, "label":D
    iget-object v0, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0, v14}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisAlign(I)Landroid/graphics/Paint$Align;

    move-result-object v0

    .line 715
    .local v0, "axisAlign":Landroid/graphics/Paint$Align;
    move/from16 v16, v3

    .end local v3    # "j":I
    .local v16, "j":I
    iget-object v3, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v17, v4

    .end local v4    # "length":I
    .local v17, "length":I
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    invoke-virtual {v3, v4, v14}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYTextLabel(Ljava/lang/Double;I)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    goto :goto_2

    :cond_0
    const/4 v3, 0x0

    :goto_2
    move/from16 v18, v3

    .line 716
    .local v18, "textLabel":Z
    move/from16 v4, p7

    move-object/from16 v19, v5

    .end local v5    # "yLabels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    .local v19, "yLabels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    int-to-double v5, v4

    aget-wide v20, p8, v14

    aget-wide v22, p9, v14

    sub-double v22, v1, v22

    mul-double v20, v20, v22

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    sub-double v5, v5, v20

    double-to-float v6, v5

    .line 717
    .local v6, "yLabel":F
    sget-object v3, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->HORIZONTAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    if-ne v11, v3, :cond_4

    .line 718
    if-eqz v13, :cond_2

    if-nez v18, :cond_2

    .line 719
    iget-object v3, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v3, v14}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsColor(I)I

    move-result v3

    invoke-virtual {v8, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 720
    sget-object v3, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    if-ne v0, v3, :cond_1

    .line 721
    invoke-direct {v7, v0}, Lorg/achartengine/chart/XYChart;->getLabelLinePos(Landroid/graphics/Paint$Align;)I

    move-result v3

    add-int/2addr v3, v9

    int-to-float v3, v3

    int-to-float v5, v9

    move-object v15, v0

    .end local v0    # "axisAlign":Landroid/graphics/Paint$Align;
    .local v15, "axisAlign":Landroid/graphics/Paint$Align;
    move-object/from16 v0, p2

    move/from16 v20, v13

    move/from16 v21, v14

    move-wide v13, v1

    .end local v1    # "label":D
    .end local v14    # "i":I
    .local v13, "label":D
    .local v20, "showLabels":Z
    .local v21, "i":I
    move v1, v3

    move v2, v6

    move v3, v5

    move v4, v6

    move-object/from16 v5, p3

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 722
    iget-object v0, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getLabelFormat()Ljava/text/NumberFormat;

    move-result-object v0

    invoke-virtual {v7, v0, v13, v14}, Lorg/achartengine/chart/XYChart;->getLabel(Ljava/text/NumberFormat;D)Ljava/lang/String;

    move-result-object v2

    int-to-float v0, v9

    iget-object v1, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsPadding()F

    move-result v1

    sub-float v3, v0, v1

    iget-object v0, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsVerticalPadding()F

    move-result v0

    sub-float v4, v6, v0

    iget-object v0, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsAngle()F

    move-result v22

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v23, v6

    .end local v6    # "yLabel":F
    .local v23, "yLabel":F
    move/from16 v6, v22

    invoke-virtual/range {v0 .. v6}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    goto :goto_3

    .line 727
    .end local v15    # "axisAlign":Landroid/graphics/Paint$Align;
    .end local v20    # "showLabels":Z
    .end local v21    # "i":I
    .end local v23    # "yLabel":F
    .restart local v0    # "axisAlign":Landroid/graphics/Paint$Align;
    .restart local v1    # "label":D
    .restart local v6    # "yLabel":F
    .local v13, "showLabels":Z
    .restart local v14    # "i":I
    :cond_1
    move-object v15, v0

    move/from16 v23, v6

    move/from16 v20, v13

    move/from16 v21, v14

    move-wide v13, v1

    .end local v0    # "axisAlign":Landroid/graphics/Paint$Align;
    .end local v1    # "label":D
    .end local v6    # "yLabel":F
    .end local v14    # "i":I
    .local v13, "label":D
    .restart local v15    # "axisAlign":Landroid/graphics/Paint$Align;
    .restart local v20    # "showLabels":Z
    .restart local v21    # "i":I
    .restart local v23    # "yLabel":F
    int-to-float v1, v10

    invoke-direct {v7, v15}, Lorg/achartengine/chart/XYChart;->getLabelLinePos(Landroid/graphics/Paint$Align;)I

    move-result v0

    add-int/2addr v0, v10

    int-to-float v3, v0

    move-object/from16 v0, p2

    move/from16 v2, v23

    move/from16 v4, v23

    move-object/from16 v5, p3

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 728
    iget-object v0, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getLabelFormat()Ljava/text/NumberFormat;

    move-result-object v0

    invoke-virtual {v7, v0, v13, v14}, Lorg/achartengine/chart/XYChart;->getLabel(Ljava/text/NumberFormat;D)Ljava/lang/String;

    move-result-object v2

    int-to-float v0, v10

    iget-object v1, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsPadding()F

    move-result v1

    add-float v3, v0, v1

    iget-object v0, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsVerticalPadding()F

    move-result v0

    sub-float v4, v23, v0

    iget-object v0, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsAngle()F

    move-result v6

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual/range {v0 .. v6}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    goto :goto_3

    .line 718
    .end local v15    # "axisAlign":Landroid/graphics/Paint$Align;
    .end local v20    # "showLabels":Z
    .end local v21    # "i":I
    .end local v23    # "yLabel":F
    .restart local v0    # "axisAlign":Landroid/graphics/Paint$Align;
    .restart local v1    # "label":D
    .restart local v6    # "yLabel":F
    .local v13, "showLabels":Z
    .restart local v14    # "i":I
    :cond_2
    move-object v15, v0

    move/from16 v23, v6

    move/from16 v20, v13

    move/from16 v21, v14

    move-wide v13, v1

    .line 734
    .end local v0    # "axisAlign":Landroid/graphics/Paint$Align;
    .end local v1    # "label":D
    .end local v6    # "yLabel":F
    .end local v14    # "i":I
    .local v13, "label":D
    .restart local v15    # "axisAlign":Landroid/graphics/Paint$Align;
    .restart local v20    # "showLabels":Z
    .restart local v21    # "i":I
    .restart local v23    # "yLabel":F
    :goto_3
    if-eqz v12, :cond_3

    .line 735
    iget-object v0, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getGridColor()I

    move-result v0

    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 736
    int-to-float v1, v9

    int-to-float v3, v10

    move-object/from16 v0, p2

    move/from16 v2, v23

    move/from16 v4, v23

    move-object/from16 v5, p3

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move/from16 v22, v21

    goto/16 :goto_5

    .line 734
    :cond_3
    move/from16 v22, v21

    goto/16 :goto_5

    .line 738
    .end local v15    # "axisAlign":Landroid/graphics/Paint$Align;
    .end local v20    # "showLabels":Z
    .end local v21    # "i":I
    .end local v23    # "yLabel":F
    .restart local v0    # "axisAlign":Landroid/graphics/Paint$Align;
    .restart local v1    # "label":D
    .restart local v6    # "yLabel":F
    .local v13, "showLabels":Z
    .restart local v14    # "i":I
    :cond_4
    move-object v15, v0

    move/from16 v23, v6

    move/from16 v20, v13

    move/from16 v21, v14

    move-wide v13, v1

    .end local v0    # "axisAlign":Landroid/graphics/Paint$Align;
    .end local v1    # "label":D
    .end local v6    # "yLabel":F
    .end local v14    # "i":I
    .local v13, "label":D
    .restart local v15    # "axisAlign":Landroid/graphics/Paint$Align;
    .restart local v20    # "showLabels":Z
    .restart local v21    # "i":I
    .restart local v23    # "yLabel":F
    sget-object v0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->VERTICAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    if-ne v11, v0, :cond_6

    .line 739
    if-eqz v20, :cond_5

    if-nez v18, :cond_5

    .line 740
    iget-object v0, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v6, v21

    .end local v21    # "i":I
    .local v6, "i":I
    invoke-virtual {v0, v6}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsColor(I)I

    move-result v0

    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 741
    invoke-direct {v7, v15}, Lorg/achartengine/chart/XYChart;->getLabelLinePos(Landroid/graphics/Paint$Align;)I

    move-result v0

    sub-int v0, v10, v0

    int-to-float v1, v0

    int-to-float v3, v10

    move-object/from16 v0, p2

    move/from16 v2, v23

    move/from16 v4, v23

    move-object/from16 v5, p3

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 742
    iget-object v0, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getLabelFormat()Ljava/text/NumberFormat;

    move-result-object v0

    invoke-virtual {v7, v0, v13, v14}, Lorg/achartengine/chart/XYChart;->getLabel(Ljava/text/NumberFormat;D)Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v0, v10, 0xa

    int-to-float v0, v0

    iget-object v1, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsPadding()F

    move-result v1

    add-float v3, v0, v1

    iget-object v0, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsVerticalPadding()F

    move-result v0

    sub-float v4, v23, v0

    iget-object v0, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsAngle()F

    move-result v21

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v22, v6

    .end local v6    # "i":I
    .local v22, "i":I
    move/from16 v6, v21

    invoke-virtual/range {v0 .. v6}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    goto :goto_4

    .line 739
    .end local v22    # "i":I
    .restart local v21    # "i":I
    :cond_5
    move/from16 v22, v21

    .line 746
    .end local v21    # "i":I
    .restart local v22    # "i":I
    :goto_4
    if-eqz v12, :cond_7

    .line 747
    iget-object v0, v7, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getGridColor()I

    move-result v0

    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 748
    int-to-float v1, v10

    int-to-float v3, v9

    move-object/from16 v0, p2

    move/from16 v2, v23

    move/from16 v4, v23

    move-object/from16 v5, p3

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_5

    .line 738
    .end local v22    # "i":I
    .restart local v21    # "i":I
    :cond_6
    move/from16 v22, v21

    .line 712
    .end local v13    # "label":D
    .end local v15    # "axisAlign":Landroid/graphics/Paint$Align;
    .end local v18    # "textLabel":Z
    .end local v21    # "i":I
    .end local v23    # "yLabel":F
    .restart local v22    # "i":I
    :cond_7
    :goto_5
    add-int/lit8 v3, v16, 0x1

    move-object/from16 v6, p1

    move/from16 v15, p4

    move/from16 v4, v17

    move-object/from16 v5, v19

    move/from16 v13, v20

    move/from16 v14, v22

    .end local v16    # "j":I
    .restart local v3    # "j":I
    goto/16 :goto_1

    .end local v17    # "length":I
    .end local v19    # "yLabels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    .end local v20    # "showLabels":Z
    .end local v22    # "i":I
    .restart local v4    # "length":I
    .restart local v5    # "yLabels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    .local v13, "showLabels":Z
    .restart local v14    # "i":I
    :cond_8
    move/from16 v16, v3

    move/from16 v17, v4

    move-object/from16 v19, v5

    move/from16 v20, v13

    move/from16 v22, v14

    .line 708
    .end local v3    # "j":I
    .end local v4    # "length":I
    .end local v5    # "yLabels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    .end local v13    # "showLabels":Z
    .end local v14    # "i":I
    .restart local v20    # "showLabels":Z
    .restart local v22    # "i":I
    add-int/lit8 v14, v22, 0x1

    .end local v22    # "i":I
    .restart local v14    # "i":I
    goto/16 :goto_0

    .end local v20    # "showLabels":Z
    .restart local v13    # "showLabels":Z
    :cond_9
    move/from16 v20, v13

    move/from16 v22, v14

    .line 753
    .end local v13    # "showLabels":Z
    .end local v14    # "i":I
    .restart local v20    # "showLabels":Z
    return-void
.end method

.method public getCalcRange(I)[D
    .locals 2
    .param p1, "scale"    # I

    .line 801
    iget-object v0, p0, Lorg/achartengine/chart/XYChart;->mCalcRange:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [D

    return-object v0
.end method

.method public abstract getChartType()Ljava/lang/String;
.end method

.method public getDataset()Lorg/achartengine/model/XYMultipleSeriesDataset;
    .locals 1

    .line 797
    iget-object v0, p0, Lorg/achartengine/chart/XYChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    return-object v0
.end method

.method public getDefaultMinimum()D
    .locals 2

    .line 943
    const-wide v0, 0x7fefffffffffffffL    # Double.MAX_VALUE

    return-wide v0
.end method

.method public getPointsChart()Lorg/achartengine/chart/ScatterChart;
    .locals 1

    .line 952
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRenderer()Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .locals 1

    .line 793
    iget-object v0, p0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    return-object v0
.end method

.method protected getScreenR()Landroid/graphics/Rect;
    .locals 1

    .line 470
    iget-object v0, p0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    return-object v0
.end method

.method public getSeriesAndPointForScreenCoordinate(Lorg/achartengine/model/Point;)Lorg/achartengine/model/SeriesSelection;
    .locals 13
    .param p1, "screenPoint"    # Lorg/achartengine/model/Point;

    .line 869
    iget-object v0, p0, Lorg/achartengine/chart/XYChart;->clickableAreas:Ljava/util/Map;

    if-eqz v0, :cond_2

    .line 870
    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .local v0, "seriesIndex":I
    :goto_0
    if-ltz v0, :cond_2

    .line 875
    const/4 v1, 0x0

    .line 876
    .local v1, "pointIndex":I
    iget-object v2, p0, Lorg/achartengine/chart/XYChart;->clickableAreas:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 878
    iget-object v2, p0, Lorg/achartengine/chart/XYChart;->clickableAreas:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    move v9, v1

    .end local v1    # "pointIndex":I
    .local v8, "i$":Ljava/util/Iterator;
    .local v9, "pointIndex":I
    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v10, v1

    check-cast v10, Lorg/achartengine/chart/ClickableArea;

    .line 879
    .local v10, "area":Lorg/achartengine/chart/ClickableArea;
    if-eqz v10, :cond_0

    .line 880
    invoke-virtual {v10}, Lorg/achartengine/chart/ClickableArea;->getRect()Landroid/graphics/RectF;

    move-result-object v11

    .line 881
    .local v11, "rectangle":Landroid/graphics/RectF;
    if-eqz v11, :cond_0

    invoke-virtual {p1}, Lorg/achartengine/model/Point;->getX()F

    move-result v1

    invoke-virtual {p1}, Lorg/achartengine/model/Point;->getY()F

    move-result v2

    invoke-virtual {v11, v1, v2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 882
    new-instance v12, Lorg/achartengine/model/SeriesSelection;

    invoke-virtual {v10}, Lorg/achartengine/chart/ClickableArea;->getX()D

    move-result-wide v4

    invoke-virtual {v10}, Lorg/achartengine/chart/ClickableArea;->getY()D

    move-result-wide v6

    move-object v1, v12

    move v2, v0

    move v3, v9

    invoke-direct/range {v1 .. v7}, Lorg/achartengine/model/SeriesSelection;-><init>(IIDD)V

    return-object v12

    .line 885
    .end local v11    # "rectangle":Landroid/graphics/RectF;
    :cond_0
    nop

    .end local v10    # "area":Lorg/achartengine/chart/ClickableArea;
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 870
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v9    # "pointIndex":I
    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 889
    .end local v0    # "seriesIndex":I
    :cond_2
    invoke-super {p0, p1}, Lorg/achartengine/chart/AbstractChart;->getSeriesAndPointForScreenCoordinate(Lorg/achartengine/model/Point;)Lorg/achartengine/model/SeriesSelection;

    move-result-object v0

    return-object v0
.end method

.method protected getXLabels(DDI)Ljava/util/List;
    .locals 1
    .param p1, "min"    # D
    .param p3, "max"    # D
    .param p5, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(DDI)",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .line 457
    invoke-static {p1, p2, p3, p4, p5}, Lorg/achartengine/util/MathHelper;->getLabels(DDI)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected getYLabels([D[DI)Ljava/util/Map;
    .locals 8
    .param p1, "minY"    # [D
    .param p2, "maxY"    # [D
    .param p3, "maxScaleNumber"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([D[DI)",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;>;"
        }
    .end annotation

    .line 461
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 462
    .local v0, "allYLabels":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Ljava/lang/Double;>;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p3, :cond_0

    .line 463
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aget-wide v3, p1, v1

    aget-wide v5, p2, v1

    iget-object v7, p0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v7}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabels()I

    move-result v7

    invoke-static {v3, v4, v5, v6, v7}, Lorg/achartengine/util/MathHelper;->getLabels(DDI)Ljava/util/List;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/achartengine/chart/XYChart;->getValidLabels(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 462
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 466
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method protected isRenderNullValues()Z
    .locals 1

    .line 925
    const/4 v0, 0x0

    return v0
.end method

.method public isRenderPoints(Lorg/achartengine/renderer/SimpleSeriesRenderer;)Z
    .locals 1
    .param p1, "renderer"    # Lorg/achartengine/renderer/SimpleSeriesRenderer;

    .line 934
    const/4 v0, 0x0

    return v0
.end method

.method public setCalcRange([DI)V
    .locals 2
    .param p1, "range"    # [D
    .param p2, "scale"    # I

    .line 805
    iget-object v0, p0, Lorg/achartengine/chart/XYChart;->mCalcRange:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 806
    return-void
.end method

.method protected setDatasetRenderer(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V
    .locals 0
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    .line 92
    iput-object p1, p0, Lorg/achartengine/chart/XYChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    .line 93
    iput-object p2, p0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    .line 94
    return-void
.end method

.method protected setScreenR(Landroid/graphics/Rect;)V
    .locals 0
    .param p1, "screenR"    # Landroid/graphics/Rect;

    .line 474
    iput-object p1, p0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    .line 475
    return-void
.end method

.method public toRealPoint(FF)[D
    .locals 1
    .param p1, "screenX"    # F
    .param p2, "screenY"    # F

    .line 809
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/achartengine/chart/XYChart;->toRealPoint(FFI)[D

    move-result-object v0

    return-object v0
.end method

.method public toRealPoint(FFI)[D
    .locals 18
    .param p1, "screenX"    # F
    .param p2, "screenY"    # F
    .param p3, "scale"    # I

    .line 832
    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4, v3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXAxisMin(I)D

    move-result-wide v4

    .line 833
    .local v4, "realMinX":D
    iget-object v6, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v6, v3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXAxisMax(I)D

    move-result-wide v6

    .line 834
    .local v6, "realMaxX":D
    iget-object v8, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v8, v3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisMin(I)D

    move-result-wide v8

    .line 835
    .local v8, "realMinY":D
    iget-object v10, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v10, v3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisMax(I)D

    move-result-wide v10

    .line 836
    .local v10, "realMaxY":D
    iget-object v12, v0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    const/4 v15, 0x2

    if-eqz v12, :cond_0

    .line 837
    new-array v15, v15, [D

    iget v12, v12, Landroid/graphics/Rect;->left:I

    int-to-float v12, v12

    sub-float v12, v1, v12

    float-to-double v13, v12

    sub-double v16, v6, v4

    invoke-static {v13, v14}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v13, v13, v16

    iget-object v12, v0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    invoke-virtual {v12}, Landroid/graphics/Rect;->width()I

    move-result v12

    move-wide/from16 v16, v6

    .end local v6    # "realMaxX":D
    .local v16, "realMaxX":D
    int-to-double v6, v12

    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v13, v6

    add-double/2addr v13, v4

    const/4 v6, 0x0

    aput-wide v13, v15, v6

    iget-object v6, v0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->top:I

    iget-object v7, v0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    move-result v7

    add-int/2addr v6, v7

    int-to-float v6, v6

    sub-float/2addr v6, v2

    float-to-double v6, v6

    sub-double v12, v10, v8

    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v6, v6, v12

    iget-object v12, v0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    invoke-virtual {v12}, Landroid/graphics/Rect;->height()I

    move-result v12

    int-to-double v12, v12

    invoke-static {v12, v13}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v6, v12

    add-double/2addr v6, v8

    const/4 v12, 0x1

    aput-wide v6, v15, v12

    return-object v15

    .line 842
    .end local v16    # "realMaxX":D
    .restart local v6    # "realMaxX":D
    :cond_0
    move-wide/from16 v16, v6

    const/4 v12, 0x1

    .end local v6    # "realMaxX":D
    .restart local v16    # "realMaxX":D
    new-array v6, v15, [D

    float-to-double v13, v1

    const/4 v7, 0x0

    aput-wide v13, v6, v7

    float-to-double v13, v2

    aput-wide v13, v6, v12

    return-object v6
.end method

.method public toScreenPoint([D)[D
    .locals 1
    .param p1, "realPoint"    # [D

    .line 813
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/achartengine/chart/XYChart;->toScreenPoint([DI)[D

    move-result-object v0

    return-object v0
.end method

.method public toScreenPoint([DI)[D
    .locals 16
    .param p1, "realPoint"    # [D
    .param p2, "scale"    # I

    .line 847
    move-object/from16 v0, p0

    move/from16 v1, p2

    iget-object v2, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v2, v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXAxisMin(I)D

    move-result-wide v2

    .line 848
    .local v2, "realMinX":D
    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4, v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXAxisMax(I)D

    move-result-wide v4

    .line 849
    .local v4, "realMaxX":D
    iget-object v6, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v6, v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisMin(I)D

    move-result-wide v6

    .line 850
    .local v6, "realMinY":D
    iget-object v8, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v8, v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisMax(I)D

    move-result-wide v8

    .line 851
    .local v8, "realMaxY":D
    iget-object v10, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v10, v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMinXSet(I)Z

    move-result v10

    const/4 v11, 0x2

    const/4 v12, 0x1

    const/4 v13, 0x0

    if-eqz v10, :cond_0

    iget-object v10, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v10, v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMaxXSet(I)Z

    move-result v10

    if-eqz v10, :cond_0

    iget-object v10, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v10, v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMinXSet(I)Z

    move-result v10

    if-eqz v10, :cond_0

    iget-object v10, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v10, v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMaxYSet(I)Z

    move-result v10

    if-nez v10, :cond_1

    .line 853
    :cond_0
    invoke-virtual {v0, v1}, Lorg/achartengine/chart/XYChart;->getCalcRange(I)[D

    move-result-object v10

    .line 854
    .local v10, "calcRange":[D
    aget-wide v2, v10, v13

    .line 855
    aget-wide v4, v10, v12

    .line 856
    aget-wide v6, v10, v11

    .line 857
    const/4 v14, 0x3

    aget-wide v8, v10, v14

    .line 859
    .end local v10    # "calcRange":[D
    :cond_1
    iget-object v10, v0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    if-eqz v10, :cond_2

    .line 860
    new-array v11, v11, [D

    aget-wide v14, p1, v13

    sub-double/2addr v14, v2

    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    move-result v10

    int-to-double v12, v10

    invoke-static {v12, v13}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v14, v14, v12

    sub-double v12, v4, v2

    div-double/2addr v14, v12

    iget-object v10, v0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->left:I

    int-to-double v12, v10

    invoke-static {v12, v13}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v14, v12

    const/4 v10, 0x0

    aput-wide v14, v11, v10

    const/4 v10, 0x1

    aget-wide v12, p1, v10

    sub-double v12, v8, v12

    iget-object v10, v0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    move-result v10

    int-to-double v14, v10

    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v12, v12, v14

    sub-double v14, v8, v6

    div-double/2addr v12, v14

    iget-object v10, v0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->top:I

    int-to-double v14, v10

    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v12, v14

    const/4 v10, 0x1

    aput-wide v12, v11, v10

    return-object v11

    .line 864
    :cond_2
    return-object p1
.end method
