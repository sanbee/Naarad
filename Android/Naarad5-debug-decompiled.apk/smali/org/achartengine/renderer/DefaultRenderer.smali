.class public Lorg/achartengine/renderer/DefaultRenderer;
.super Ljava/lang/Object;
.source "DefaultRenderer.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final BACKGROUND_COLOR:I = -0x1000000

.field public static final NO_COLOR:I = 0x0

.field private static final REGULAR_TEXT_FONT:Landroid/graphics/Typeface;

.field public static final TEXT_COLOR:I = -0x333334


# instance fields
.field private mAntialiasing:Z

.field private mApplyBackgroundColor:Z

.field private mAxesColor:I

.field private mBackgroundColor:I

.field private mChartTitle:Ljava/lang/String;

.field private mChartTitleTextSize:F

.field private mClickEnabled:Z

.field private mDisplayValues:Z

.field private mExternalZoomEnabled:Z

.field private mFitLegend:Z

.field private mInScroll:Z

.field private mLabelsColor:I

.field private mLabelsTextSize:F

.field private mLegendHeight:I

.field private mLegendTextSize:F

.field private mMargins:[I

.field private mOriginalScale:F

.field private mPanEnabled:Z

.field private mRenderers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/achartengine/renderer/SimpleSeriesRenderer;",
            ">;"
        }
    .end annotation
.end field

.field private mScale:F

.field private mShowAxes:Z

.field private mShowCustomTextGrid:Z

.field private mShowGridX:Z

.field private mShowGridY:Z

.field private mShowLabels:Z

.field private mShowLegend:Z

.field private mStartAngle:F

.field private mTextTypeface:Landroid/graphics/Typeface;

.field private mTextTypefaceName:Ljava/lang/String;

.field private mTextTypefaceStyle:I

.field private mZoomButtonsVisible:Z

.field private mZoomEnabled:Z

.field private mZoomRate:F

.field private selectableBuffer:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 40
    sget-object v0, Landroid/graphics/Typeface;->SERIF:Landroid/graphics/Typeface;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v0

    sput-object v0, Lorg/achartengine/renderer/DefaultRenderer;->REGULAR_TEXT_FONT:Landroid/graphics/Typeface;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const-string v0, ""

    iput-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mChartTitle:Ljava/lang/String;

    .line 32
    const/high16 v0, 0x41700000    # 15.0f

    iput v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mChartTitleTextSize:F

    .line 43
    sget-object v0, Lorg/achartengine/renderer/DefaultRenderer;->REGULAR_TEXT_FONT:Landroid/graphics/Typeface;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mTextTypefaceName:Ljava/lang/String;

    .line 45
    const/4 v0, 0x0

    iput v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mTextTypefaceStyle:I

    .line 53
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowAxes:Z

    .line 55
    const v2, -0x333334

    iput v2, p0, Lorg/achartengine/renderer/DefaultRenderer;->mAxesColor:I

    .line 57
    iput-boolean v1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowLabels:Z

    .line 59
    iput v2, p0, Lorg/achartengine/renderer/DefaultRenderer;->mLabelsColor:I

    .line 61
    const/high16 v2, 0x41200000    # 10.0f

    iput v2, p0, Lorg/achartengine/renderer/DefaultRenderer;->mLabelsTextSize:F

    .line 63
    iput-boolean v1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowLegend:Z

    .line 65
    const/high16 v2, 0x41400000    # 12.0f

    iput v2, p0, Lorg/achartengine/renderer/DefaultRenderer;->mLegendTextSize:F

    .line 67
    iput-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mFitLegend:Z

    .line 69
    iput-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowGridX:Z

    .line 71
    iput-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowGridY:Z

    .line 73
    iput-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowCustomTextGrid:Z

    .line 75
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lorg/achartengine/renderer/DefaultRenderer;->mRenderers:Ljava/util/List;

    .line 77
    iput-boolean v1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mAntialiasing:Z

    .line 79
    iput v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mLegendHeight:I

    .line 81
    const/4 v2, 0x4

    new-array v2, v2, [I

    fill-array-data v2, :array_0

    iput-object v2, p0, Lorg/achartengine/renderer/DefaultRenderer;->mMargins:[I

    .line 83
    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, p0, Lorg/achartengine/renderer/DefaultRenderer;->mScale:F

    .line 85
    iput-boolean v1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mPanEnabled:Z

    .line 87
    iput-boolean v1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mZoomEnabled:Z

    .line 89
    iput-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mZoomButtonsVisible:Z

    .line 91
    const/high16 v1, 0x3fc00000    # 1.5f

    iput v1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mZoomRate:F

    .line 93
    iput-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mExternalZoomEnabled:Z

    .line 95
    iget v1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mScale:F

    iput v1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mOriginalScale:F

    .line 97
    iput-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mClickEnabled:Z

    .line 99
    const/16 v0, 0xf

    iput v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->selectableBuffer:I

    .line 109
    const/4 v0, 0x0

    iput v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mStartAngle:F

    return-void

    nop

    :array_0
    .array-data 4
        0x14
        0x1e
        0xa
        0x14
    .end array-data
.end method


# virtual methods
.method public addSeriesRenderer(ILorg/achartengine/renderer/SimpleSeriesRenderer;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "renderer"    # Lorg/achartengine/renderer/SimpleSeriesRenderer;

    .line 163
    iget-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mRenderers:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 164
    return-void
.end method

.method public addSeriesRenderer(Lorg/achartengine/renderer/SimpleSeriesRenderer;)V
    .locals 1
    .param p1, "renderer"    # Lorg/achartengine/renderer/SimpleSeriesRenderer;

    .line 153
    iget-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mRenderers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    return-void
.end method

.method public getAxesColor()I
    .locals 1

    .line 252
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mAxesColor:I

    return v0
.end method

.method public getBackgroundColor()I
    .locals 1

    .line 216
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mBackgroundColor:I

    return v0
.end method

.method public getChartTitle()Ljava/lang/String;
    .locals 1

    .line 117
    iget-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mChartTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getChartTitleTextSize()F
    .locals 1

    .line 135
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mChartTitleTextSize:F

    return v0
.end method

.method public getLabelsColor()I
    .locals 1

    .line 270
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mLabelsColor:I

    return v0
.end method

.method public getLabelsTextSize()F
    .locals 1

    .line 288
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mLabelsTextSize:F

    return v0
.end method

.method public getLegendHeight()I
    .locals 1

    .line 679
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mLegendHeight:I

    return v0
.end method

.method public getLegendTextSize()F
    .locals 1

    .line 469
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mLegendTextSize:F

    return v0
.end method

.method public getMargins()[I
    .locals 1

    .line 698
    iget-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mMargins:[I

    return-object v0
.end method

.method public getOriginalScale()F
    .locals 1

    .line 534
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mOriginalScale:F

    return v0
.end method

.method public getScale()F
    .locals 1

    .line 525
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mScale:F

    return v0
.end method

.method public getSelectableBuffer()I
    .locals 1

    .line 661
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->selectableBuffer:I

    return v0
.end method

.method public getSeriesRendererAt(I)Lorg/achartengine/renderer/SimpleSeriesRenderer;
    .locals 1
    .param p1, "index"    # I

    .line 189
    iget-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mRenderers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/achartengine/renderer/SimpleSeriesRenderer;

    return-object v0
.end method

.method public getSeriesRendererCount()I
    .locals 1

    .line 198
    iget-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mRenderers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getSeriesRenderers()[Lorg/achartengine/renderer/SimpleSeriesRenderer;
    .locals 2

    .line 207
    iget-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mRenderers:Ljava/util/List;

    const/4 v1, 0x0

    new-array v1, v1, [Lorg/achartengine/renderer/SimpleSeriesRenderer;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/achartengine/renderer/SimpleSeriesRenderer;

    return-object v0
.end method

.method public getStartAngle()F
    .locals 1

    .line 738
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mStartAngle:F

    return v0
.end method

.method public getTextTypeface()Landroid/graphics/Typeface;
    .locals 1

    .line 460
    iget-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mTextTypeface:Landroid/graphics/Typeface;

    return-object v0
.end method

.method public getTextTypefaceName()Ljava/lang/String;
    .locals 1

    .line 442
    iget-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mTextTypefaceName:Ljava/lang/String;

    return-object v0
.end method

.method public getTextTypefaceStyle()I
    .locals 1

    .line 451
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mTextTypefaceStyle:I

    return v0
.end method

.method public getZoomRate()F
    .locals 1

    .line 607
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mZoomRate:F

    return v0
.end method

.method public isAntialiasing()Z
    .locals 1

    .line 507
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mAntialiasing:Z

    return v0
.end method

.method public isApplyBackgroundColor()Z
    .locals 1

    .line 234
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mApplyBackgroundColor:Z

    return v0
.end method

.method public isClickEnabled()Z
    .locals 1

    .line 643
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mClickEnabled:Z

    return v0
.end method

.method public isDisplayValues()Z
    .locals 1

    .line 758
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mDisplayValues:Z

    return v0
.end method

.method public isExternalZoomEnabled()Z
    .locals 1

    .line 589
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mExternalZoomEnabled:Z

    return v0
.end method

.method public isFitLegend()Z
    .locals 1

    .line 424
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mFitLegend:Z

    return v0
.end method

.method public isInScroll()Z
    .locals 1

    .line 717
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mInScroll:Z

    return v0
.end method

.method public isPanEnabled()Z
    .locals 1

    .line 616
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mPanEnabled:Z

    return v0
.end method

.method public isShowAxes()Z
    .locals 1

    .line 306
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowAxes:Z

    return v0
.end method

.method public isShowCustomTextGrid()Z
    .locals 1

    .line 388
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowCustomTextGrid:Z

    return v0
.end method

.method public isShowGridX()Z
    .locals 1

    .line 342
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowGridX:Z

    return v0
.end method

.method public isShowGridY()Z
    .locals 1

    .line 351
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowGridY:Z

    return v0
.end method

.method public isShowLabels()Z
    .locals 1

    .line 324
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowLabels:Z

    return v0
.end method

.method public isShowLegend()Z
    .locals 1

    .line 406
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowLegend:Z

    return v0
.end method

.method public isZoomButtonsVisible()Z
    .locals 1

    .line 571
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mZoomButtonsVisible:Z

    return v0
.end method

.method public isZoomEnabled()Z
    .locals 1

    .line 553
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mZoomEnabled:Z

    return v0
.end method

.method public removeAllRenderers()V
    .locals 1

    .line 179
    iget-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mRenderers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 180
    return-void
.end method

.method public removeSeriesRenderer(Lorg/achartengine/renderer/SimpleSeriesRenderer;)V
    .locals 1
    .param p1, "renderer"    # Lorg/achartengine/renderer/SimpleSeriesRenderer;

    .line 172
    iget-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mRenderers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 173
    return-void
.end method

.method public setAntialiasing(Z)V
    .locals 0
    .param p1, "antialiasing"    # Z

    .line 516
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mAntialiasing:Z

    .line 517
    return-void
.end method

.method public setApplyBackgroundColor(Z)V
    .locals 0
    .param p1, "apply"    # Z

    .line 243
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mApplyBackgroundColor:Z

    .line 244
    return-void
.end method

.method public setAxesColor(I)V
    .locals 0
    .param p1, "color"    # I

    .line 261
    iput p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mAxesColor:I

    .line 262
    return-void
.end method

.method public setBackgroundColor(I)V
    .locals 0
    .param p1, "color"    # I

    .line 225
    iput p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mBackgroundColor:I

    .line 226
    return-void
.end method

.method public setChartTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;

    .line 126
    iput-object p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mChartTitle:Ljava/lang/String;

    .line 127
    return-void
.end method

.method public setChartTitleTextSize(F)V
    .locals 0
    .param p1, "textSize"    # F

    .line 144
    iput p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mChartTitleTextSize:F

    .line 145
    return-void
.end method

.method public setClickEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .line 652
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mClickEnabled:Z

    .line 653
    return-void
.end method

.method public setDisplayValues(Z)V
    .locals 0
    .param p1, "display"    # Z

    .line 767
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mDisplayValues:Z

    .line 768
    return-void
.end method

.method public setExternalZoomEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .line 598
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mExternalZoomEnabled:Z

    .line 599
    return-void
.end method

.method public setFitLegend(Z)V
    .locals 0
    .param p1, "fit"    # Z

    .line 433
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mFitLegend:Z

    .line 434
    return-void
.end method

.method public setInScroll(Z)V
    .locals 0
    .param p1, "inScroll"    # Z

    .line 727
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mInScroll:Z

    .line 728
    return-void
.end method

.method public setLabelsColor(I)V
    .locals 0
    .param p1, "color"    # I

    .line 279
    iput p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mLabelsColor:I

    .line 280
    return-void
.end method

.method public setLabelsTextSize(F)V
    .locals 0
    .param p1, "textSize"    # F

    .line 297
    iput p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mLabelsTextSize:F

    .line 298
    return-void
.end method

.method public setLegendHeight(I)V
    .locals 0
    .param p1, "height"    # I

    .line 688
    iput p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mLegendHeight:I

    .line 689
    return-void
.end method

.method public setLegendTextSize(F)V
    .locals 0
    .param p1, "textSize"    # F

    .line 478
    iput p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mLegendTextSize:F

    .line 479
    return-void
.end method

.method public setMargins([I)V
    .locals 0
    .param p1, "margins"    # [I

    .line 708
    iput-object p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mMargins:[I

    .line 709
    return-void
.end method

.method public setPanEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .line 625
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mPanEnabled:Z

    .line 626
    return-void
.end method

.method public setScale(F)V
    .locals 0
    .param p1, "scale"    # F

    .line 544
    iput p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mScale:F

    .line 545
    return-void
.end method

.method public setSelectableBuffer(I)V
    .locals 0
    .param p1, "buffer"    # I

    .line 670
    iput p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->selectableBuffer:I

    .line 671
    return-void
.end method

.method public setShowAxes(Z)V
    .locals 0
    .param p1, "showAxes"    # Z

    .line 315
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowAxes:Z

    .line 316
    return-void
.end method

.method public setShowCustomTextGrid(Z)V
    .locals 0
    .param p1, "showGrid"    # Z

    .line 397
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowCustomTextGrid:Z

    .line 398
    return-void
.end method

.method public setShowGrid(Z)V
    .locals 0
    .param p1, "showGrid"    # Z

    .line 378
    invoke-virtual {p0, p1}, Lorg/achartengine/renderer/DefaultRenderer;->setShowGridX(Z)V

    .line 379
    invoke-virtual {p0, p1}, Lorg/achartengine/renderer/DefaultRenderer;->setShowGridY(Z)V

    .line 380
    return-void
.end method

.method public setShowGridX(Z)V
    .locals 0
    .param p1, "showGrid"    # Z

    .line 360
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowGridX:Z

    .line 361
    return-void
.end method

.method public setShowGridY(Z)V
    .locals 0
    .param p1, "showGrid"    # Z

    .line 369
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowGridY:Z

    .line 370
    return-void
.end method

.method public setShowLabels(Z)V
    .locals 0
    .param p1, "showLabels"    # Z

    .line 333
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowLabels:Z

    .line 334
    return-void
.end method

.method public setShowLegend(Z)V
    .locals 0
    .param p1, "showLegend"    # Z

    .line 415
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowLegend:Z

    .line 416
    return-void
.end method

.method public setStartAngle(F)V
    .locals 0
    .param p1, "startAngle"    # F

    .line 749
    iput p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mStartAngle:F

    .line 750
    return-void
.end method

.method public setTextTypeface(Landroid/graphics/Typeface;)V
    .locals 0
    .param p1, "typeface"    # Landroid/graphics/Typeface;

    .line 498
    iput-object p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mTextTypeface:Landroid/graphics/Typeface;

    .line 499
    return-void
.end method

.method public setTextTypeface(Ljava/lang/String;I)V
    .locals 0
    .param p1, "typefaceName"    # Ljava/lang/String;
    .param p2, "style"    # I

    .line 488
    iput-object p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mTextTypefaceName:Ljava/lang/String;

    .line 489
    iput p2, p0, Lorg/achartengine/renderer/DefaultRenderer;->mTextTypefaceStyle:I

    .line 490
    return-void
.end method

.method public setZoomButtonsVisible(Z)V
    .locals 0
    .param p1, "visible"    # Z

    .line 580
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mZoomButtonsVisible:Z

    .line 581
    return-void
.end method

.method public setZoomEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .line 562
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mZoomEnabled:Z

    .line 563
    return-void
.end method

.method public setZoomRate(F)V
    .locals 0
    .param p1, "rate"    # F

    .line 634
    iput p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mZoomRate:F

    .line 635
    return-void
.end method
