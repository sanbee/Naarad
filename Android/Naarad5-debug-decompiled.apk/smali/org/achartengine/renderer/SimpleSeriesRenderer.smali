.class public Lorg/achartengine/renderer/SimpleSeriesRenderer;
.super Ljava/lang/Object;
.source "SimpleSeriesRenderer.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private mChartValuesFormat:Ljava/text/NumberFormat;

.field private mChartValuesSpacing:F

.field private mChartValuesTextAlign:Landroid/graphics/Paint$Align;

.field private mChartValuesTextSize:F

.field private mColor:I

.field private mDisplayBoundingPoints:Z

.field private mDisplayChartValues:Z

.field private mDisplayChartValuesDistance:I

.field private mGradientEnabled:Z

.field private mGradientStartColor:I

.field private mGradientStartValue:D

.field private mGradientStopColor:I

.field private mGradientStopValue:D

.field private mHighlighted:Z

.field private mShowLegendItem:Z

.field private mStroke:Lorg/achartengine/renderer/BasicStroke;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const v0, -0xffff01

    iput v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mColor:I

    .line 33
    const/16 v0, 0x64

    iput v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mDisplayChartValuesDistance:I

    .line 35
    const/high16 v0, 0x41200000    # 10.0f

    iput v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mChartValuesTextSize:F

    .line 37
    sget-object v0, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    iput-object v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mChartValuesTextAlign:Landroid/graphics/Paint$Align;

    .line 39
    const/high16 v0, 0x40a00000    # 5.0f

    iput v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mChartValuesSpacing:F

    .line 43
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mGradientEnabled:Z

    .line 53
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mShowLegendItem:Z

    .line 59
    iput-boolean v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mDisplayBoundingPoints:Z

    return-void
.end method


# virtual methods
.method public getChartValuesFormat()Ljava/text/NumberFormat;
    .locals 1

    .line 324
    iget-object v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mChartValuesFormat:Ljava/text/NumberFormat;

    return-object v0
.end method

.method public getChartValuesSpacing()F
    .locals 1

    .line 157
    iget v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mChartValuesSpacing:F

    return v0
.end method

.method public getChartValuesTextAlign()Landroid/graphics/Paint$Align;
    .locals 1

    .line 139
    iget-object v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mChartValuesTextAlign:Landroid/graphics/Paint$Align;

    return-object v0
.end method

.method public getChartValuesTextSize()F
    .locals 1

    .line 121
    iget v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mChartValuesTextSize:F

    return v0
.end method

.method public getColor()I
    .locals 1

    .line 67
    iget v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mColor:I

    return v0
.end method

.method public getDisplayChartValuesDistance()I
    .locals 1

    .line 103
    iget v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mDisplayChartValuesDistance:I

    return v0
.end method

.method public getGradientStartColor()I
    .locals 1

    .line 221
    iget v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mGradientStartColor:I

    return v0
.end method

.method public getGradientStartValue()D
    .locals 2

    .line 212
    iget-wide v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mGradientStartValue:D

    return-wide v0
.end method

.method public getGradientStopColor()I
    .locals 1

    .line 250
    iget v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mGradientStopColor:I

    return v0
.end method

.method public getGradientStopValue()D
    .locals 2

    .line 241
    iget-wide v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mGradientStopValue:D

    return-wide v0
.end method

.method public getStroke()Lorg/achartengine/renderer/BasicStroke;
    .locals 1

    .line 176
    iget-object v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mStroke:Lorg/achartengine/renderer/BasicStroke;

    return-object v0
.end method

.method public isDisplayBoundingPoints()Z
    .locals 1

    .line 306
    iget-boolean v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mDisplayBoundingPoints:Z

    return v0
.end method

.method public isDisplayChartValues()Z
    .locals 1

    .line 85
    iget-boolean v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mDisplayChartValues:Z

    return v0
.end method

.method public isGradientEnabled()Z
    .locals 1

    .line 194
    iget-boolean v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mGradientEnabled:Z

    return v0
.end method

.method public isHighlighted()Z
    .locals 1

    .line 288
    iget-boolean v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mHighlighted:Z

    return v0
.end method

.method public isShowLegendItem()Z
    .locals 1

    .line 270
    iget-boolean v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mShowLegendItem:Z

    return v0
.end method

.method public setChartValuesFormat(Ljava/text/NumberFormat;)V
    .locals 0
    .param p1, "format"    # Ljava/text/NumberFormat;

    .line 333
    iput-object p1, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mChartValuesFormat:Ljava/text/NumberFormat;

    .line 334
    return-void
.end method

.method public setChartValuesSpacing(F)V
    .locals 0
    .param p1, "spacing"    # F

    .line 167
    iput p1, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mChartValuesSpacing:F

    .line 168
    return-void
.end method

.method public setChartValuesTextAlign(Landroid/graphics/Paint$Align;)V
    .locals 0
    .param p1, "align"    # Landroid/graphics/Paint$Align;

    .line 148
    iput-object p1, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mChartValuesTextAlign:Landroid/graphics/Paint$Align;

    .line 149
    return-void
.end method

.method public setChartValuesTextSize(F)V
    .locals 0
    .param p1, "textSize"    # F

    .line 130
    iput p1, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mChartValuesTextSize:F

    .line 131
    return-void
.end method

.method public setColor(I)V
    .locals 0
    .param p1, "color"    # I

    .line 76
    iput p1, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mColor:I

    .line 77
    return-void
.end method

.method public setDisplayBoundingPoints(Z)V
    .locals 0
    .param p1, "display"    # Z

    .line 315
    iput-boolean p1, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mDisplayBoundingPoints:Z

    .line 316
    return-void
.end method

.method public setDisplayChartValues(Z)V
    .locals 0
    .param p1, "display"    # Z

    .line 94
    iput-boolean p1, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mDisplayChartValues:Z

    .line 95
    return-void
.end method

.method public setDisplayChartValuesDistance(I)V
    .locals 0
    .param p1, "distance"    # I

    .line 112
    iput p1, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mDisplayChartValuesDistance:I

    .line 113
    return-void
.end method

.method public setGradientEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .line 203
    iput-boolean p1, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mGradientEnabled:Z

    .line 204
    return-void
.end method

.method public setGradientStart(DI)V
    .locals 0
    .param p1, "start"    # D
    .param p3, "color"    # I

    .line 231
    iput-wide p1, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mGradientStartValue:D

    .line 232
    iput p3, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mGradientStartColor:I

    .line 233
    return-void
.end method

.method public setGradientStop(DI)V
    .locals 0
    .param p1, "start"    # D
    .param p3, "color"    # I

    .line 260
    iput-wide p1, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mGradientStopValue:D

    .line 261
    iput p3, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mGradientStopColor:I

    .line 262
    return-void
.end method

.method public setHighlighted(Z)V
    .locals 0
    .param p1, "highlighted"    # Z

    .line 297
    iput-boolean p1, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mHighlighted:Z

    .line 298
    return-void
.end method

.method public setShowLegendItem(Z)V
    .locals 0
    .param p1, "showLegend"    # Z

    .line 279
    iput-boolean p1, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mShowLegendItem:Z

    .line 280
    return-void
.end method

.method public setStroke(Lorg/achartengine/renderer/BasicStroke;)V
    .locals 0
    .param p1, "stroke"    # Lorg/achartengine/renderer/BasicStroke;

    .line 185
    iput-object p1, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mStroke:Lorg/achartengine/renderer/BasicStroke;

    .line 186
    return-void
.end method
