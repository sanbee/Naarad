.class public Lorg/achartengine/model/XYSeries;
.super Ljava/lang/Object;
.source "XYSeries.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final PADDING:D = 1.0E-12


# instance fields
.field private mAnnotations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mMaxX:D

.field private mMaxY:D

.field private mMinX:D

.field private mMinY:D

.field private final mScaleNumber:I

.field private final mStringXY:Lorg/achartengine/util/IndexXYMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/achartengine/util/IndexXYMap<",
            "Ljava/lang/Double;",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field

.field private mTitle:Ljava/lang/String;

.field private final mXY:Lorg/achartengine/util/IndexXYMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/achartengine/util/IndexXYMap<",
            "Ljava/lang/Double;",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "title"    # Ljava/lang/String;

    .line 60
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/achartengine/model/XYSeries;-><init>(Ljava/lang/String;I)V

    .line 61
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 4
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "scaleNumber"    # I

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Lorg/achartengine/util/IndexXYMap;

    invoke-direct {v0}, Lorg/achartengine/util/IndexXYMap;-><init>()V

    iput-object v0, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    .line 38
    const-wide v0, 0x7fefffffffffffffL    # Double.MAX_VALUE

    iput-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMinX:D

    .line 40
    const-wide v2, -0x10000000000001L

    iput-wide v2, p0, Lorg/achartengine/model/XYSeries;->mMaxX:D

    .line 42
    iput-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMinY:D

    .line 44
    iput-wide v2, p0, Lorg/achartengine/model/XYSeries;->mMaxY:D

    .line 50
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/achartengine/model/XYSeries;->mAnnotations:Ljava/util/List;

    .line 52
    new-instance v0, Lorg/achartengine/util/IndexXYMap;

    invoke-direct {v0}, Lorg/achartengine/util/IndexXYMap;-><init>()V

    iput-object v0, p0, Lorg/achartengine/model/XYSeries;->mStringXY:Lorg/achartengine/util/IndexXYMap;

    .line 70
    iput-object p1, p0, Lorg/achartengine/model/XYSeries;->mTitle:Ljava/lang/String;

    .line 71
    iput p2, p0, Lorg/achartengine/model/XYSeries;->mScaleNumber:I

    .line 72
    invoke-direct {p0}, Lorg/achartengine/model/XYSeries;->initRange()V

    .line 73
    return-void
.end method

.method private initRange()V
    .locals 6

    .line 83
    const-wide v0, 0x7fefffffffffffffL    # Double.MAX_VALUE

    iput-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMinX:D

    .line 84
    const-wide v2, -0x10000000000001L

    iput-wide v2, p0, Lorg/achartengine/model/XYSeries;->mMaxX:D

    .line 85
    iput-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMinY:D

    .line 86
    iput-wide v2, p0, Lorg/achartengine/model/XYSeries;->mMaxY:D

    .line 87
    invoke-virtual {p0}, Lorg/achartengine/model/XYSeries;->getItemCount()I

    move-result v0

    .line 88
    .local v0, "length":I
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 89
    invoke-virtual {p0, v1}, Lorg/achartengine/model/XYSeries;->getX(I)D

    move-result-wide v2

    .line 90
    .local v2, "x":D
    invoke-virtual {p0, v1}, Lorg/achartengine/model/XYSeries;->getY(I)D

    move-result-wide v4

    .line 91
    .local v4, "y":D
    invoke-direct {p0, v2, v3, v4, v5}, Lorg/achartengine/model/XYSeries;->updateRange(DD)V

    .line 88
    .end local v2    # "x":D
    .end local v4    # "y":D
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 93
    .end local v1    # "k":I
    :cond_0
    return-void
.end method

.method private updateRange(DD)V
    .locals 2
    .param p1, "x"    # D
    .param p3, "y"    # D

    .line 102
    iget-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMinX:D

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    iput-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMinX:D

    .line 103
    iget-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMaxX:D

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    iput-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMaxX:D

    .line 104
    iget-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMinY:D

    invoke-static {v0, v1, p3, p4}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    iput-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMinY:D

    .line 105
    iget-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMaxY:D

    invoke-static {v0, v1, p3, p4}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    iput-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMaxY:D

    .line 106
    return-void
.end method


# virtual methods
.method public declared-synchronized add(DD)V
    .locals 3
    .param p1, "x"    # D
    .param p3, "y"    # D

    monitor-enter p0

    .line 133
    :goto_0
    :try_start_0
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/achartengine/util/IndexXYMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 136
    invoke-virtual {p0}, Lorg/achartengine/model/XYSeries;->getPadding()D

    move-result-wide v0

    add-double/2addr p1, v0

    goto :goto_0

    .line 138
    .end local p0    # "this":Lorg/achartengine/model/XYSeries;
    :cond_0
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/achartengine/util/IndexXYMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/achartengine/model/XYSeries;->updateRange(DD)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 140
    monitor-exit p0

    return-void

    .line 132
    .end local p1    # "x":D
    .end local p3    # "y":D
    :catchall_0
    move-exception p1

    monitor-exit p0

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public declared-synchronized add(IDD)V
    .locals 3
    .param p1, "index"    # I
    .param p2, "x"    # D
    .param p4, "y"    # D

    monitor-enter p0

    .line 150
    :goto_0
    :try_start_0
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/achartengine/util/IndexXYMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 153
    invoke-virtual {p0}, Lorg/achartengine/model/XYSeries;->getPadding()D

    move-result-wide v0

    add-double/2addr p2, v0

    goto :goto_0

    .line 155
    .end local p0    # "this":Lorg/achartengine/model/XYSeries;
    :cond_0
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {p4, p5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, p1, v1, v2}, Lorg/achartengine/util/IndexXYMap;->put(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    invoke-direct {p0, p2, p3, p4, p5}, Lorg/achartengine/model/XYSeries;->updateRange(DD)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 157
    monitor-exit p0

    return-void

    .line 149
    .end local p1    # "index":I
    .end local p2    # "x":D
    .end local p4    # "y":D
    :catchall_0
    move-exception p1

    monitor-exit p0

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public addAnnotation(Ljava/lang/String;DD)V
    .locals 3
    .param p1, "annotation"    # Ljava/lang/String;
    .param p2, "x"    # D
    .param p4, "y"    # D

    .line 214
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mAnnotations:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 215
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mStringXY:Lorg/achartengine/util/IndexXYMap;

    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {p4, p5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/achartengine/util/IndexXYMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    return-void
.end method

.method public declared-synchronized clear()V
    .locals 1

    monitor-enter p0

    .line 181
    :try_start_0
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    invoke-virtual {v0}, Lorg/achartengine/util/IndexXYMap;->clear()V

    .line 182
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mStringXY:Lorg/achartengine/util/IndexXYMap;

    invoke-virtual {v0}, Lorg/achartengine/util/IndexXYMap;->clear()V

    .line 183
    invoke-direct {p0}, Lorg/achartengine/model/XYSeries;->initRange()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 184
    monitor-exit p0

    return-void

    .line 180
    .end local p0    # "this":Lorg/achartengine/model/XYSeries;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getAnnotationAt(I)Ljava/lang/String;
    .locals 1
    .param p1, "index"    # I

    .line 264
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mAnnotations:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getAnnotationCount()I
    .locals 1

    .line 254
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mAnnotations:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getAnnotationX(I)D
    .locals 2
    .param p1, "index"    # I

    .line 235
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mStringXY:Lorg/achartengine/util/IndexXYMap;

    invoke-virtual {v0, p1}, Lorg/achartengine/util/IndexXYMap;->getXByIndex(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    return-wide v0
.end method

.method public getAnnotationY(I)D
    .locals 2
    .param p1, "index"    # I

    .line 245
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mStringXY:Lorg/achartengine/util/IndexXYMap;

    invoke-virtual {v0, p1}, Lorg/achartengine/util/IndexXYMap;->getYByIndex(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    return-wide v0
.end method

.method public getIndexForKey(D)I
    .locals 2
    .param p1, "key"    # D

    .line 309
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/achartengine/util/IndexXYMap;->getIndexForKey(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public declared-synchronized getItemCount()I
    .locals 1

    monitor-enter p0

    .line 318
    :try_start_0
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    invoke-virtual {v0}, Lorg/achartengine/util/IndexXYMap;->size()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    .end local p0    # "this":Lorg/achartengine/model/XYSeries;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getMaxX()D
    .locals 2

    .line 345
    iget-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMaxX:D

    return-wide v0
.end method

.method public getMaxY()D
    .locals 2

    .line 354
    iget-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMaxY:D

    return-wide v0
.end method

.method public getMinX()D
    .locals 2

    .line 327
    iget-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMinX:D

    return-wide v0
.end method

.method public getMinY()D
    .locals 2

    .line 336
    iget-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMinY:D

    return-wide v0
.end method

.method protected getPadding()D
    .locals 2

    .line 160
    const-wide v0, 0x3d719799812dea11L    # 1.0E-12

    return-wide v0
.end method

.method public declared-synchronized getRange(DDZ)Ljava/util/SortedMap;
    .locals 6
    .param p1, "start"    # D
    .param p3, "stop"    # D
    .param p5, "beforeAfterPoints"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(DDZ)",
            "Ljava/util/SortedMap<",
            "Ljava/lang/Double;",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 278
    if-eqz p5, :cond_2

    .line 286
    :try_start_0
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/achartengine/util/IndexXYMap;->headMap(Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object v0

    .line 287
    .local v0, "headMap":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    invoke-interface {v0}, Ljava/util/SortedMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 288
    invoke-interface {v0}, Ljava/util/SortedMap;->lastKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Double;

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    move-wide p1, v1

    .line 294
    .end local p0    # "this":Lorg/achartengine/model/XYSeries;
    :cond_0
    iget-object v1, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/achartengine/util/IndexXYMap;->tailMap(Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object v1

    .line 295
    .local v1, "tailMap":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    invoke-interface {v1}, Ljava/util/SortedMap;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 296
    invoke-interface {v1}, Ljava/util/SortedMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 297
    .local v2, "tailIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Double;>;"
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Double;

    .line 298
    .local v3, "next":Ljava/lang/Double;
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 299
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Double;

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    move-wide p3, v4

    goto :goto_0

    .line 301
    :cond_1
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    add-double/2addr p3, v4

    .line 305
    .end local v0    # "headMap":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    .end local v1    # "tailMap":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    .end local v2    # "tailIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Double;>;"
    .end local v3    # "next":Ljava/lang/Double;
    :cond_2
    :goto_0
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/achartengine/util/IndexXYMap;->subMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 277
    .end local p1    # "start":D
    .end local p3    # "stop":D
    .end local p5    # "beforeAfterPoints":Z
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public getScaleNumber()I
    .locals 1

    .line 76
    iget v0, p0, Lorg/achartengine/model/XYSeries;->mScaleNumber:I

    return v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .line 114
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mTitle:Ljava/lang/String;

    return-object v0
.end method

.method public declared-synchronized getX(I)D
    .locals 2
    .param p1, "index"    # I

    monitor-enter p0

    .line 193
    :try_start_0
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    invoke-virtual {v0, p1}, Lorg/achartengine/util/IndexXYMap;->getXByIndex(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    .end local p0    # "this":Lorg/achartengine/model/XYSeries;
    .end local p1    # "index":I
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getY(I)D
    .locals 2
    .param p1, "index"    # I

    monitor-enter p0

    .line 203
    :try_start_0
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    invoke-virtual {v0, p1}, Lorg/achartengine/util/IndexXYMap;->getYByIndex(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    .end local p0    # "this":Lorg/achartengine/model/XYSeries;
    .end local p1    # "index":I
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized remove(I)V
    .locals 8
    .param p1, "index"    # I

    monitor-enter p0

    .line 169
    :try_start_0
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    invoke-virtual {v0, p1}, Lorg/achartengine/util/IndexXYMap;->removeByIndex(I)Lorg/achartengine/util/XYEntry;

    move-result-object v0

    .line 170
    .local v0, "removedEntry":Lorg/achartengine/util/XYEntry;, "Lorg/achartengine/util/XYEntry<Ljava/lang/Double;Ljava/lang/Double;>;"
    invoke-virtual {v0}, Lorg/achartengine/util/XYEntry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Double;

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    .line 171
    .local v1, "removedX":D
    invoke-virtual {v0}, Lorg/achartengine/util/XYEntry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    .line 172
    .local v3, "removedY":D
    iget-wide v5, p0, Lorg/achartengine/model/XYSeries;->mMinX:D

    cmpl-double v7, v1, v5

    if-eqz v7, :cond_0

    iget-wide v5, p0, Lorg/achartengine/model/XYSeries;->mMaxX:D

    cmpl-double v7, v1, v5

    if-eqz v7, :cond_0

    iget-wide v5, p0, Lorg/achartengine/model/XYSeries;->mMinY:D

    cmpl-double v7, v3, v5

    if-eqz v7, :cond_0

    iget-wide v5, p0, Lorg/achartengine/model/XYSeries;->mMaxY:D

    cmpl-double v7, v3, v5

    if-nez v7, :cond_1

    .line 173
    .end local p0    # "this":Lorg/achartengine/model/XYSeries;
    :cond_0
    invoke-direct {p0}, Lorg/achartengine/model/XYSeries;->initRange()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 175
    :cond_1
    monitor-exit p0

    return-void

    .line 168
    .end local v0    # "removedEntry":Lorg/achartengine/util/XYEntry;, "Lorg/achartengine/util/XYEntry<Ljava/lang/Double;Ljava/lang/Double;>;"
    .end local v1    # "removedX":D
    .end local v3    # "removedY":D
    .end local p1    # "index":I
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public removeAnnotation(I)V
    .locals 1
    .param p1, "index"    # I

    .line 224
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mAnnotations:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 225
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mStringXY:Lorg/achartengine/util/IndexXYMap;

    invoke-virtual {v0, p1}, Lorg/achartengine/util/IndexXYMap;->removeByIndex(I)Lorg/achartengine/util/XYEntry;

    .line 226
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;

    .line 123
    iput-object p1, p0, Lorg/achartengine/model/XYSeries;->mTitle:Ljava/lang/String;

    .line 124
    return-void
.end method
