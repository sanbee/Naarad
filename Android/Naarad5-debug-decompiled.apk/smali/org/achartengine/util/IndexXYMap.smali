.class public Lorg/achartengine/util/IndexXYMap;
.super Ljava/util/TreeMap;
.source "IndexXYMap.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/TreeMap<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field private final indexList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TK;>;"
        }
    .end annotation
.end field

.field private maxXDifference:D


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 32
    .local p0, "this":Lorg/achartengine/util/IndexXYMap;, "Lorg/achartengine/util/IndexXYMap<TK;TV;>;"
    invoke-direct {p0}, Ljava/util/TreeMap;-><init>()V

    .line 27
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/achartengine/util/IndexXYMap;->indexList:Ljava/util/List;

    .line 29
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/achartengine/util/IndexXYMap;->maxXDifference:D

    .line 33
    return-void
.end method

.method private updateMaxXDifference()V
    .locals 6

    .line 48
    .local p0, "this":Lorg/achartengine/util/IndexXYMap;, "Lorg/achartengine/util/IndexXYMap<TK;TV;>;"
    iget-object v0, p0, Lorg/achartengine/util/IndexXYMap;->indexList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    .line 49
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/achartengine/util/IndexXYMap;->maxXDifference:D

    .line 50
    return-void

    .line 53
    :cond_0
    iget-object v0, p0, Lorg/achartengine/util/IndexXYMap;->indexList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    iget-object v0, p0, Lorg/achartengine/util/IndexXYMap;->indexList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    sub-int/2addr v4, v1

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    sub-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    iget-wide v4, p0, Lorg/achartengine/util/IndexXYMap;->maxXDifference:D

    cmpl-double v0, v2, v4

    if-lez v0, :cond_1

    .line 55
    iget-object v0, p0, Lorg/achartengine/util/IndexXYMap;->indexList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    iget-object v0, p0, Lorg/achartengine/util/IndexXYMap;->indexList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    sub-int/2addr v4, v1

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    sub-double/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    iput-wide v0, p0, Lorg/achartengine/util/IndexXYMap;->maxXDifference:D

    .line 57
    :cond_1
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 64
    .local p0, "this":Lorg/achartengine/util/IndexXYMap;, "Lorg/achartengine/util/IndexXYMap<TK;TV;>;"
    invoke-direct {p0}, Lorg/achartengine/util/IndexXYMap;->updateMaxXDifference()V

    .line 65
    invoke-super {p0}, Ljava/util/TreeMap;->clear()V

    .line 66
    iget-object v0, p0, Lorg/achartengine/util/IndexXYMap;->indexList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 67
    return-void
.end method

.method public getByIndex(I)Lorg/achartengine/util/XYEntry;
    .locals 3
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lorg/achartengine/util/XYEntry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 97
    .local p0, "this":Lorg/achartengine/util/IndexXYMap;, "Lorg/achartengine/util/IndexXYMap<TK;TV;>;"
    iget-object v0, p0, Lorg/achartengine/util/IndexXYMap;->indexList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 98
    .local v0, "key":Ljava/lang/Object;, "TK;"
    new-instance v1, Lorg/achartengine/util/XYEntry;

    invoke-virtual {p0, v0}, Lorg/achartengine/util/IndexXYMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lorg/achartengine/util/XYEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v1
.end method

.method public getIndexForKey(Ljava/lang/Object;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)I"
        }
    .end annotation

    .line 112
    .local p0, "this":Lorg/achartengine/util/IndexXYMap;, "Lorg/achartengine/util/IndexXYMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    iget-object v0, p0, Lorg/achartengine/util/IndexXYMap;->indexList:Ljava/util/List;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;)I

    move-result v0

    return v0
.end method

.method public getMaxXDifference()D
    .locals 2

    .line 60
    .local p0, "this":Lorg/achartengine/util/IndexXYMap;, "Lorg/achartengine/util/IndexXYMap<TK;TV;>;"
    iget-wide v0, p0, Lorg/achartengine/util/IndexXYMap;->maxXDifference:D

    return-wide v0
.end method

.method public getXByIndex(I)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TK;"
        }
    .end annotation

    .line 76
    .local p0, "this":Lorg/achartengine/util/IndexXYMap;, "Lorg/achartengine/util/IndexXYMap<TK;TV;>;"
    iget-object v0, p0, Lorg/achartengine/util/IndexXYMap;->indexList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getYByIndex(I)Ljava/lang/Object;
    .locals 2
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TV;"
        }
    .end annotation

    .line 86
    .local p0, "this":Lorg/achartengine/util/IndexXYMap;, "Lorg/achartengine/util/IndexXYMap<TK;TV;>;"
    iget-object v0, p0, Lorg/achartengine/util/IndexXYMap;->indexList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 87
    .local v0, "key":Ljava/lang/Object;, "TK;"
    invoke-virtual {p0, v0}, Lorg/achartengine/util/IndexXYMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public put(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITK;TV;)TV;"
        }
    .end annotation

    .line 42
    .local p0, "this":Lorg/achartengine/util/IndexXYMap;, "Lorg/achartengine/util/IndexXYMap<TK;TV;>;"
    .local p2, "key":Ljava/lang/Object;, "TK;"
    .local p3, "value":Ljava/lang/Object;, "TV;"
    iget-object v0, p0, Lorg/achartengine/util/IndexXYMap;->indexList:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 43
    invoke-direct {p0}, Lorg/achartengine/util/IndexXYMap;->updateMaxXDifference()V

    .line 44
    invoke-super {p0, p2, p3}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .line 36
    .local p0, "this":Lorg/achartengine/util/IndexXYMap;, "Lorg/achartengine/util/IndexXYMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    iget-object v0, p0, Lorg/achartengine/util/IndexXYMap;->indexList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    invoke-direct {p0}, Lorg/achartengine/util/IndexXYMap;->updateMaxXDifference()V

    .line 38
    invoke-super {p0, p1, p2}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public removeByIndex(I)Lorg/achartengine/util/XYEntry;
    .locals 3
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lorg/achartengine/util/XYEntry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 107
    .local p0, "this":Lorg/achartengine/util/IndexXYMap;, "Lorg/achartengine/util/IndexXYMap<TK;TV;>;"
    iget-object v0, p0, Lorg/achartengine/util/IndexXYMap;->indexList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    .line 108
    .local v0, "key":Ljava/lang/Object;, "TK;"
    new-instance v1, Lorg/achartengine/util/XYEntry;

    invoke-virtual {p0, v0}, Lorg/achartengine/util/IndexXYMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lorg/achartengine/util/XYEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v1
.end method
