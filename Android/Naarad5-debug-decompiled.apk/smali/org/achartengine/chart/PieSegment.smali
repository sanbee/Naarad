.class public Lorg/achartengine/chart/PieSegment;
.super Ljava/lang/Object;
.source "PieSegment.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private mDataIndex:I

.field private mEndAngle:F

.field private mStartAngle:F

.field private mValue:F


# direct methods
.method public constructor <init>(IFFF)V
    .locals 1
    .param p1, "dataIndex"    # I
    .param p2, "value"    # F
    .param p3, "startAngle"    # F
    .param p4, "angle"    # F

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput p3, p0, Lorg/achartengine/chart/PieSegment;->mStartAngle:F

    .line 34
    add-float v0, p4, p3

    iput v0, p0, Lorg/achartengine/chart/PieSegment;->mEndAngle:F

    .line 35
    iput p1, p0, Lorg/achartengine/chart/PieSegment;->mDataIndex:I

    .line 36
    iput p2, p0, Lorg/achartengine/chart/PieSegment;->mValue:F

    .line 37
    return-void
.end method


# virtual methods
.method protected getDataIndex()I
    .locals 1

    .line 68
    iget v0, p0, Lorg/achartengine/chart/PieSegment;->mDataIndex:I

    return v0
.end method

.method protected getEndAngle()F
    .locals 1

    .line 64
    iget v0, p0, Lorg/achartengine/chart/PieSegment;->mEndAngle:F

    return v0
.end method

.method protected getStartAngle()F
    .locals 1

    .line 60
    iget v0, p0, Lorg/achartengine/chart/PieSegment;->mStartAngle:F

    return v0
.end method

.method protected getValue()F
    .locals 1

    .line 72
    iget v0, p0, Lorg/achartengine/chart/PieSegment;->mValue:F

    return v0
.end method

.method public isInSegment(D)Z
    .locals 10
    .param p1, "angle"    # D

    .line 46
    iget v0, p0, Lorg/achartengine/chart/PieSegment;->mStartAngle:F

    float-to-double v0, v0

    const/4 v2, 0x1

    cmpl-double v3, p1, v0

    if-ltz v3, :cond_0

    iget v0, p0, Lorg/achartengine/chart/PieSegment;->mEndAngle:F

    float-to-double v0, v0

    cmpg-double v3, p1, v0

    if-gtz v3, :cond_0

    .line 47
    return v2

    .line 49
    :cond_0
    const-wide v0, 0x4076800000000000L    # 360.0

    rem-double v3, p1, v0

    .line 50
    .local v3, "cAngle":D
    iget v5, p0, Lorg/achartengine/chart/PieSegment;->mStartAngle:F

    float-to-double v5, v5

    .line 51
    .local v5, "startAngle":D
    iget v7, p0, Lorg/achartengine/chart/PieSegment;->mEndAngle:F

    float-to-double v7, v7

    .line 52
    .local v7, "stopAngle":D
    :goto_0
    cmpl-double v9, v7, v0

    if-lez v9, :cond_1

    .line 53
    sub-double/2addr v5, v0

    .line 54
    sub-double/2addr v7, v0

    goto :goto_0

    .line 56
    :cond_1
    cmpl-double v0, v3, v5

    if-ltz v0, :cond_2

    cmpg-double v0, v3, v7

    if-gtz v0, :cond_2

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    :goto_1
    return v2
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 76
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mDataIndex="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lorg/achartengine/chart/PieSegment;->mDataIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ",mValue="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lorg/achartengine/chart/PieSegment;->mValue:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ",mStartAngle="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lorg/achartengine/chart/PieSegment;->mStartAngle:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ",mEndAngle="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lorg/achartengine/chart/PieSegment;->mEndAngle:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
