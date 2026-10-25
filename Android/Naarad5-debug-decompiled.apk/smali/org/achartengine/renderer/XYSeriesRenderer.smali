.class public Lorg/achartengine/renderer/XYSeriesRenderer;
.super Lorg/achartengine/renderer/SimpleSeriesRenderer;
.source "XYSeriesRenderer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    }
.end annotation


# instance fields
.field private mFillBelowLine:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;",
            ">;"
        }
    .end annotation
.end field

.field private mFillPoints:Z

.field private mLineWidth:F

.field private mPointStrokeWidth:F

.field private mPointStyle:Lorg/achartengine/chart/PointStyle;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 30
    invoke-direct {p0}, Lorg/achartengine/renderer/SimpleSeriesRenderer;-><init>()V

    .line 32
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mFillPoints:Z

    .line 34
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mFillBelowLine:Ljava/util/List;

    .line 36
    sget-object v0, Lorg/achartengine/chart/PointStyle;->POINT:Lorg/achartengine/chart/PointStyle;

    iput-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mPointStyle:Lorg/achartengine/chart/PointStyle;

    .line 38
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mPointStrokeWidth:F

    .line 40
    iput v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mLineWidth:F

    .line 45
    return-void
.end method


# virtual methods
.method public addFillOutsideLine(Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;)V
    .locals 1
    .param p1, "fill"    # Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;

    .line 161
    iget-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mFillBelowLine:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 162
    return-void
.end method

.method public getFillOutsideLine()[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .locals 2

    .line 150
    iget-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mFillBelowLine:Ljava/util/List;

    const/4 v1, 0x0

    new-array v1, v1, [Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;

    return-object v0
.end method

.method public getLineWidth()F
    .locals 1

    .line 238
    iget v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mLineWidth:F

    return v0
.end method

.method public getPointStrokeWidth()F
    .locals 1

    .line 220
    iget v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mPointStrokeWidth:F

    return v0
.end method

.method public getPointStyle()Lorg/achartengine/chart/PointStyle;
    .locals 1

    .line 202
    iget-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mPointStyle:Lorg/achartengine/chart/PointStyle;

    return-object v0
.end method

.method public isFillBelowLine()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 123
    iget-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mFillBelowLine:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isFillPoints()Z
    .locals 1

    .line 170
    iget-boolean v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mFillPoints:Z

    return v0
.end method

.method public setFillBelowLine(Z)V
    .locals 3
    .param p1, "fill"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 136
    iget-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mFillBelowLine:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 137
    if-eqz p1, :cond_0

    .line 138
    iget-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mFillBelowLine:Ljava/util/List;

    new-instance v1, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;

    sget-object v2, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;->BOUNDS_ALL:Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    invoke-direct {v1, v2}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;-><init>(Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 140
    :cond_0
    iget-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mFillBelowLine:Ljava/util/List;

    new-instance v1, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;

    sget-object v2, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;->NONE:Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    invoke-direct {v1, v2}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;-><init>(Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    :goto_0
    return-void
.end method

.method public setFillBelowLineColor(I)V
    .locals 2
    .param p1, "color"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 191
    iget-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mFillBelowLine:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 192
    iget-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mFillBelowLine:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;

    invoke-virtual {v0, p1}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->setColor(I)V

    .line 194
    :cond_0
    return-void
.end method

.method public setFillPoints(Z)V
    .locals 0
    .param p1, "fill"    # Z

    .line 179
    iput-boolean p1, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mFillPoints:Z

    .line 180
    return-void
.end method

.method public setLineWidth(F)V
    .locals 0
    .param p1, "lineWidth"    # F

    .line 247
    iput p1, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mLineWidth:F

    .line 248
    return-void
.end method

.method public setPointStrokeWidth(F)V
    .locals 0
    .param p1, "strokeWidth"    # F

    .line 229
    iput p1, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mPointStrokeWidth:F

    .line 230
    return-void
.end method

.method public setPointStyle(Lorg/achartengine/chart/PointStyle;)V
    .locals 0
    .param p1, "style"    # Lorg/achartengine/chart/PointStyle;

    .line 211
    iput-object p1, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mPointStyle:Lorg/achartengine/chart/PointStyle;

    .line 212
    return-void
.end method
