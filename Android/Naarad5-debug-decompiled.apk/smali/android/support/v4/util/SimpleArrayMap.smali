.class public Landroid/support/v4/util/SimpleArrayMap;
.super Ljava/lang/Object;
.source "SimpleArrayMap.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final BASE_SIZE:I = 0x4

.field private static final CACHE_SIZE:I = 0xa

.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "ArrayMap"

.field static mBaseCache:[Ljava/lang/Object;

.field static mBaseCacheSize:I

.field static mTwiceBaseCache:[Ljava/lang/Object;

.field static mTwiceBaseCacheSize:I


# instance fields
.field mArray:[Ljava/lang/Object;

.field mHashes:[I

.field mSize:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 208
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 209
    sget-object v0, Landroid/support/v4/util/ContainerHelpers;->EMPTY_INTS:[I

    iput-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    .line 210
    sget-object v0, Landroid/support/v4/util/ContainerHelpers;->EMPTY_OBJECTS:[Ljava/lang/Object;

    iput-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    .line 211
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    .line 212
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "capacity"    # I

    .line 217
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 218
    if-nez p1, :cond_0

    .line 219
    sget-object v0, Landroid/support/v4/util/ContainerHelpers;->EMPTY_INTS:[I

    iput-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    .line 220
    sget-object v0, Landroid/support/v4/util/ContainerHelpers;->EMPTY_OBJECTS:[Ljava/lang/Object;

    iput-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    goto :goto_0

    .line 222
    :cond_0
    invoke-direct {p0, p1}, Landroid/support/v4/util/SimpleArrayMap;->allocArrays(I)V

    .line 224
    :goto_0
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    .line 225
    return-void
.end method

.method public constructor <init>(Landroid/support/v4/util/SimpleArrayMap;)V
    .locals 0
    .param p1, "map"    # Landroid/support/v4/util/SimpleArrayMap;

    .line 231
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    invoke-direct {p0}, Landroid/support/v4/util/SimpleArrayMap;-><init>()V

    .line 232
    if-eqz p1, :cond_0

    .line 233
    invoke-virtual {p0, p1}, Landroid/support/v4/util/SimpleArrayMap;->putAll(Landroid/support/v4/util/SimpleArrayMap;)V

    .line 235
    :cond_0
    return-void
.end method

.method private allocArrays(I)V
    .locals 6
    .param p1, "size"    # I

    .line 138
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/16 v3, 0x8

    if-ne p1, v3, :cond_1

    .line 139
    const-class v3, Landroid/support/v4/util/ArrayMap;

    monitor-enter v3

    .line 140
    :try_start_0
    sget-object v4, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCache:[Ljava/lang/Object;

    if-eqz v4, :cond_0

    .line 141
    sget-object v4, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCache:[Ljava/lang/Object;

    .line 142
    .local v4, "array":[Ljava/lang/Object;
    iput-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    .line 143
    aget-object v5, v4, v1

    check-cast v5, [Ljava/lang/Object;

    check-cast v5, [Ljava/lang/Object;

    sput-object v5, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCache:[Ljava/lang/Object;

    .line 144
    aget-object v5, v4, v2

    check-cast v5, [I

    check-cast v5, [I

    iput-object v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    .line 145
    aput-object v0, v4, v2

    aput-object v0, v4, v1

    .line 146
    sget v0, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCacheSize:I

    sub-int/2addr v0, v2

    sput v0, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCacheSize:I

    .line 149
    monitor-exit v3

    return-void

    .line 151
    .end local v4    # "array":[Ljava/lang/Object;
    :cond_0
    monitor-exit v3

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 152
    :cond_1
    const/4 v3, 0x4

    if-ne p1, v3, :cond_3

    .line 153
    const-class v3, Landroid/support/v4/util/ArrayMap;

    monitor-enter v3

    .line 154
    :try_start_1
    sget-object v4, Landroid/support/v4/util/SimpleArrayMap;->mBaseCache:[Ljava/lang/Object;

    if-eqz v4, :cond_2

    .line 155
    sget-object v4, Landroid/support/v4/util/SimpleArrayMap;->mBaseCache:[Ljava/lang/Object;

    .line 156
    .restart local v4    # "array":[Ljava/lang/Object;
    iput-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    .line 157
    aget-object v5, v4, v1

    check-cast v5, [Ljava/lang/Object;

    check-cast v5, [Ljava/lang/Object;

    sput-object v5, Landroid/support/v4/util/SimpleArrayMap;->mBaseCache:[Ljava/lang/Object;

    .line 158
    aget-object v5, v4, v2

    check-cast v5, [I

    check-cast v5, [I

    iput-object v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    .line 159
    aput-object v0, v4, v2

    aput-object v0, v4, v1

    .line 160
    sget v0, Landroid/support/v4/util/SimpleArrayMap;->mBaseCacheSize:I

    sub-int/2addr v0, v2

    sput v0, Landroid/support/v4/util/SimpleArrayMap;->mBaseCacheSize:I

    .line 163
    monitor-exit v3

    return-void

    .line 165
    .end local v4    # "array":[Ljava/lang/Object;
    :cond_2
    monitor-exit v3

    goto :goto_0

    :catchall_1
    move-exception v0

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw v0

    .line 168
    :cond_3
    :goto_0
    new-array v0, p1, [I

    iput-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    .line 169
    shl-int/lit8 v0, p1, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    .line 170
    return-void
.end method

.method private static freeArrays([I[Ljava/lang/Object;I)V
    .locals 7
    .param p0, "hashes"    # [I
    .param p1, "array"    # [Ljava/lang/Object;
    .param p2, "size"    # I

    .line 173
    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/16 v4, 0xa

    const/4 v5, 0x1

    const/16 v6, 0x8

    if-ne v0, v6, :cond_2

    .line 174
    const-class v0, Landroid/support/v4/util/ArrayMap;

    monitor-enter v0

    .line 175
    :try_start_0
    sget v6, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCacheSize:I

    if-ge v6, v4, :cond_1

    .line 176
    sget-object v4, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCache:[Ljava/lang/Object;

    aput-object v4, p1, v3

    .line 177
    aput-object p0, p1, v5

    .line 178
    shl-int/lit8 v3, p2, 0x1

    sub-int/2addr v3, v5

    .local v3, "i":I
    :goto_0
    if-lt v3, v2, :cond_0

    .line 179
    aput-object v1, p1, v3

    .line 178
    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    .line 181
    .end local v3    # "i":I
    :cond_0
    sput-object p1, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCache:[Ljava/lang/Object;

    .line 182
    sget v1, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCacheSize:I

    add-int/2addr v1, v5

    sput v1, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCacheSize:I

    .line 186
    :cond_1
    monitor-exit v0

    goto :goto_2

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 187
    :cond_2
    array-length v0, p0

    const/4 v6, 0x4

    if-ne v0, v6, :cond_5

    .line 188
    const-class v0, Landroid/support/v4/util/ArrayMap;

    monitor-enter v0

    .line 189
    :try_start_1
    sget v6, Landroid/support/v4/util/SimpleArrayMap;->mBaseCacheSize:I

    if-ge v6, v4, :cond_4

    .line 190
    sget-object v4, Landroid/support/v4/util/SimpleArrayMap;->mBaseCache:[Ljava/lang/Object;

    aput-object v4, p1, v3

    .line 191
    aput-object p0, p1, v5

    .line 192
    shl-int/lit8 v3, p2, 0x1

    sub-int/2addr v3, v5

    .restart local v3    # "i":I
    :goto_1
    if-lt v3, v2, :cond_3

    .line 193
    aput-object v1, p1, v3

    .line 192
    add-int/lit8 v3, v3, -0x1

    goto :goto_1

    .line 195
    .end local v3    # "i":I
    :cond_3
    sput-object p1, Landroid/support/v4/util/SimpleArrayMap;->mBaseCache:[Ljava/lang/Object;

    .line 196
    sget v1, Landroid/support/v4/util/SimpleArrayMap;->mBaseCacheSize:I

    add-int/2addr v1, v5

    sput v1, Landroid/support/v4/util/SimpleArrayMap;->mBaseCacheSize:I

    .line 200
    :cond_4
    monitor-exit v0

    goto :goto_2

    :catchall_1
    move-exception v1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw v1

    .line 202
    :cond_5
    :goto_2
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 3

    .line 241
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    iget v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-eqz v0, :cond_0

    .line 242
    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    invoke-static {v1, v2, v0}, Landroid/support/v4/util/SimpleArrayMap;->freeArrays([I[Ljava/lang/Object;I)V

    .line 243
    sget-object v0, Landroid/support/v4/util/ContainerHelpers;->EMPTY_INTS:[I

    iput-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    .line 244
    sget-object v0, Landroid/support/v4/util/ContainerHelpers;->EMPTY_OBJECTS:[Ljava/lang/Object;

    iput-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    .line 245
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    .line 247
    :cond_0
    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "key"    # Ljava/lang/Object;

    .line 273
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p1, :cond_0

    invoke-virtual {p0}, Landroid/support/v4/util/SimpleArrayMap;->indexOfNull()I

    move-result v2

    if-ltz v2, :cond_1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-virtual {p0, p1, v2}, Landroid/support/v4/util/SimpleArrayMap;->indexOf(Ljava/lang/Object;I)I

    move-result v2

    if-ltz v2, :cond_1

    :goto_0
    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .line 303
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    invoke-virtual {p0, p1}, Landroid/support/v4/util/SimpleArrayMap;->indexOfValue(Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public ensureCapacity(I)V
    .locals 5
    .param p1, "minimumCapacity"    # I

    .line 254
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    iget-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    array-length v0, v0

    if-ge v0, p1, :cond_1

    .line 255
    iget-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    .line 256
    .local v0, "ohashes":[I
    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    .line 257
    .local v1, "oarray":[Ljava/lang/Object;
    invoke-direct {p0, p1}, Landroid/support/v4/util/SimpleArrayMap;->allocArrays(I)V

    .line 258
    iget v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-lez v2, :cond_0

    .line 259
    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    const/4 v4, 0x0

    invoke-static {v0, v4, v3, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 260
    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    iget v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    shl-int/lit8 v3, v3, 0x1

    invoke-static {v1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 262
    :cond_0
    iget v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    invoke-static {v0, v1, v2}, Landroid/support/v4/util/SimpleArrayMap;->freeArrays([I[Ljava/lang/Object;I)V

    .line 264
    .end local v0    # "ohashes":[I
    .end local v1    # "oarray":[Ljava/lang/Object;
    :cond_1
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 8
    .param p1, "object"    # Ljava/lang/Object;

    .line 522
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    .line 523
    return v0

    .line 525
    :cond_0
    instance-of v1, p1, Ljava/util/Map;

    const/4 v2, 0x0

    if-eqz v1, :cond_6

    .line 526
    move-object v1, p1

    check-cast v1, Ljava/util/Map;

    .line 527
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<**>;"
    invoke-virtual {p0}, Landroid/support/v4/util/SimpleArrayMap;->size()I

    move-result v3

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v4

    if-eq v3, v4, :cond_1

    .line 528
    return v2

    .line 532
    :cond_1
    move v3, v2

    .local v3, "i":I
    :goto_0
    :try_start_0
    iget v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-ge v3, v4, :cond_5

    .line 533
    invoke-virtual {p0, v3}, Landroid/support/v4/util/SimpleArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v4

    .line 534
    .local v4, "key":Ljava/lang/Object;, "TK;"
    invoke-virtual {p0, v3}, Landroid/support/v4/util/SimpleArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v5

    .line 535
    .local v5, "mine":Ljava/lang/Object;, "TV;"
    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 536
    .local v6, "theirs":Ljava/lang/Object;
    if-nez v5, :cond_3

    .line 537
    if-nez v6, :cond_2

    invoke-interface {v1, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_4

    .line 538
    :cond_2
    return v2

    .line 540
    :cond_3
    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v7, :cond_4

    .line 541
    return v2

    .line 532
    .end local v4    # "key":Ljava/lang/Object;, "TK;"
    .end local v5    # "mine":Ljava/lang/Object;, "TV;"
    .end local v6    # "theirs":Ljava/lang/Object;
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 548
    .end local v3    # "i":I
    :cond_5
    nop

    .line 549
    return v0

    .line 546
    :catch_0
    move-exception v0

    .line 547
    .local v0, "ignored":Ljava/lang/ClassCastException;
    return v2

    .line 544
    .end local v0    # "ignored":Ljava/lang/ClassCastException;
    :catch_1
    move-exception v0

    .line 545
    .local v0, "ignored":Ljava/lang/NullPointerException;
    return v2

    .line 551
    .end local v0    # "ignored":Ljava/lang/NullPointerException;
    .end local v1    # "map":Ljava/util/Map;, "Ljava/util/Map<**>;"
    :cond_6
    return v2
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .line 313
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    if-nez p1, :cond_0

    invoke-virtual {p0}, Landroid/support/v4/util/SimpleArrayMap;->indexOfNull()I

    move-result v0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Landroid/support/v4/util/SimpleArrayMap;->indexOf(Ljava/lang/Object;I)I

    move-result v0

    .line 314
    .local v0, "index":I
    :goto_0
    if-ltz v0, :cond_1

    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v2, v0, 0x1

    add-int/lit8 v2, v2, 0x1

    aget-object v1, v1, v2

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    return-object v1
.end method

.method public hashCode()I
    .locals 9

    .line 559
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    iget-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    .line 560
    .local v0, "hashes":[I
    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    .line 561
    .local v1, "array":[Ljava/lang/Object;
    const/4 v2, 0x0

    .line 562
    .local v2, "result":I
    const/4 v3, 0x0

    .local v3, "i":I
    const/4 v4, 0x1

    .local v4, "v":I
    iget v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    .local v5, "s":I
    :goto_0
    if-ge v3, v5, :cond_1

    .line 563
    aget-object v6, v1, v4

    .line 564
    .local v6, "value":Ljava/lang/Object;
    aget v7, v0, v3

    if-nez v6, :cond_0

    const/4 v8, 0x0

    goto :goto_1

    :cond_0
    invoke-virtual {v6}, Ljava/lang/Object;->hashCode()I

    move-result v8

    :goto_1
    xor-int/2addr v7, v8

    add-int/2addr v2, v7

    .line 562
    .end local v6    # "value":Ljava/lang/Object;
    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v4, v4, 0x2

    goto :goto_0

    .line 566
    .end local v3    # "i":I
    .end local v4    # "v":I
    .end local v5    # "s":I
    :cond_1
    return v2
.end method

.method indexOf(Ljava/lang/Object;I)I
    .locals 6
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "hash"    # I

    .line 62
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    iget v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    .line 65
    .local v0, "N":I
    if-nez v0, :cond_0

    .line 66
    const/4 v1, -0x1

    return v1

    .line 69
    :cond_0
    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    invoke-static {v1, v0, p2}, Landroid/support/v4/util/ContainerHelpers;->binarySearch([III)I

    move-result v1

    .line 72
    .local v1, "index":I
    if-gez v1, :cond_1

    .line 73
    return v1

    .line 77
    :cond_1
    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v3, v1, 0x1

    aget-object v2, v2, v3

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 78
    return v1

    .line 83
    :cond_2
    add-int/lit8 v2, v1, 0x1

    .local v2, "end":I
    :goto_0
    if-ge v2, v0, :cond_4

    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    aget v3, v3, v2

    if-ne v3, p2, :cond_4

    .line 84
    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v4, v2, 0x1

    aget-object v3, v3, v4

    invoke-virtual {p1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    return v2

    .line 83
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 88
    :cond_4
    add-int/lit8 v3, v1, -0x1

    .local v3, "i":I
    :goto_1
    if-ltz v3, :cond_6

    iget-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    aget v4, v4, v3

    if-ne v4, p2, :cond_6

    .line 89
    iget-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v5, v3, 0x1

    aget-object v4, v4, v5

    invoke-virtual {p1, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    return v3

    .line 88
    :cond_5
    add-int/lit8 v3, v3, -0x1

    goto :goto_1

    .line 96
    .end local v3    # "i":I
    :cond_6
    xor-int/lit8 v3, v2, -0x1

    return v3
.end method

.method indexOfNull()I
    .locals 6

    .line 100
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    iget v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    .line 103
    .local v0, "N":I
    if-nez v0, :cond_0

    .line 104
    const/4 v1, -0x1

    return v1

    .line 107
    :cond_0
    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Landroid/support/v4/util/ContainerHelpers;->binarySearch([III)I

    move-result v1

    .line 110
    .local v1, "index":I
    if-gez v1, :cond_1

    .line 111
    return v1

    .line 115
    :cond_1
    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v3, v1, 0x1

    aget-object v2, v2, v3

    if-nez v2, :cond_2

    .line 116
    return v1

    .line 121
    :cond_2
    add-int/lit8 v2, v1, 0x1

    .local v2, "end":I
    :goto_0
    if-ge v2, v0, :cond_4

    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    aget v3, v3, v2

    if-nez v3, :cond_4

    .line 122
    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v4, v2, 0x1

    aget-object v3, v3, v4

    if-nez v3, :cond_3

    return v2

    .line 121
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 126
    :cond_4
    add-int/lit8 v3, v1, -0x1

    .local v3, "i":I
    :goto_1
    if-ltz v3, :cond_6

    iget-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    aget v4, v4, v3

    if-nez v4, :cond_6

    .line 127
    iget-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v5, v3, 0x1

    aget-object v4, v4, v5

    if-nez v4, :cond_5

    return v3

    .line 126
    :cond_5
    add-int/lit8 v3, v3, -0x1

    goto :goto_1

    .line 134
    .end local v3    # "i":I
    :cond_6
    xor-int/lit8 v3, v2, -0x1

    return v3
.end method

.method indexOfValue(Ljava/lang/Object;)I
    .locals 4
    .param p1, "value"    # Ljava/lang/Object;

    .line 277
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    iget v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    mul-int/lit8 v0, v0, 0x2

    .line 278
    .local v0, "N":I
    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    .line 279
    .local v1, "array":[Ljava/lang/Object;
    if-nez p1, :cond_2

    .line 280
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_1

    .line 281
    aget-object v3, v1, v2

    if-nez v3, :cond_0

    .line 282
    shr-int/lit8 v3, v2, 0x1

    return v3

    .line 280
    :cond_0
    add-int/lit8 v2, v2, 0x2

    goto :goto_0

    .end local v2    # "i":I
    :cond_1
    goto :goto_2

    .line 286
    :cond_2
    const/4 v2, 0x1

    .restart local v2    # "i":I
    :goto_1
    if-ge v2, v0, :cond_4

    .line 287
    aget-object v3, v1, v2

    invoke-virtual {p1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 288
    shr-int/lit8 v3, v2, 0x1

    return v3

    .line 286
    :cond_3
    add-int/lit8 v2, v2, 0x2

    goto :goto_1

    .line 292
    .end local v2    # "i":I
    :cond_4
    :goto_2
    const/4 v2, -0x1

    return v2
.end method

.method public isEmpty()Z
    .locals 1

    .line 352
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    iget v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public keyAt(I)Ljava/lang/Object;
    .locals 2
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TK;"
        }
    .end annotation

    .line 323
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    iget-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v1, p1, 0x1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .line 366
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    if-nez p1, :cond_0

    .line 367
    const/4 v0, 0x0

    .line 368
    .local v0, "hash":I
    invoke-virtual {p0}, Landroid/support/v4/util/SimpleArrayMap;->indexOfNull()I

    move-result v1

    .local v1, "index":I
    goto :goto_0

    .line 370
    .end local v0    # "hash":I
    .end local v1    # "index":I
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 371
    .restart local v0    # "hash":I
    invoke-virtual {p0, p1, v0}, Landroid/support/v4/util/SimpleArrayMap;->indexOf(Ljava/lang/Object;I)I

    move-result v1

    .line 373
    .restart local v1    # "index":I
    :goto_0
    if-ltz v1, :cond_1

    .line 374
    shl-int/lit8 v2, v1, 0x1

    add-int/lit8 v2, v2, 0x1

    .line 375
    .end local v1    # "index":I
    .local v2, "index":I
    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    aget-object v3, v1, v2

    .line 376
    .local v3, "old":Ljava/lang/Object;, "TV;"
    aput-object p2, v1, v2

    .line 377
    return-object v3

    .line 380
    .end local v2    # "index":I
    .end local v3    # "old":Ljava/lang/Object;, "TV;"
    .restart local v1    # "index":I
    :cond_1
    xor-int/lit8 v1, v1, -0x1

    .line 381
    iget v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    array-length v3, v3

    if-lt v2, v3, :cond_5

    .line 382
    const/4 v3, 0x4

    const/16 v4, 0x8

    if-lt v2, v4, :cond_2

    shr-int/lit8 v3, v2, 0x1

    add-int/2addr v3, v2

    goto :goto_1

    :cond_2
    if-lt v2, v3, :cond_3

    const/16 v3, 0x8

    :cond_3
    :goto_1
    move v2, v3

    .line 387
    .local v2, "n":I
    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    .line 388
    .local v3, "ohashes":[I
    iget-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    .line 389
    .local v4, "oarray":[Ljava/lang/Object;
    invoke-direct {p0, v2}, Landroid/support/v4/util/SimpleArrayMap;->allocArrays(I)V

    .line 391
    iget-object v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    array-length v6, v5

    if-lez v6, :cond_4

    .line 393
    array-length v6, v3

    const/4 v7, 0x0

    invoke-static {v3, v7, v5, v7, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 394
    iget-object v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    array-length v6, v4

    invoke-static {v4, v7, v5, v7, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 397
    :cond_4
    iget v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    invoke-static {v3, v4, v5}, Landroid/support/v4/util/SimpleArrayMap;->freeArrays([I[Ljava/lang/Object;I)V

    .line 400
    .end local v2    # "n":I
    .end local v3    # "ohashes":[I
    .end local v4    # "oarray":[Ljava/lang/Object;
    :cond_5
    iget v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-ge v1, v2, :cond_6

    .line 403
    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    add-int/lit8 v4, v1, 0x1

    sub-int/2addr v2, v1

    invoke-static {v3, v1, v3, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 404
    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v3, v1, 0x1

    add-int/lit8 v4, v1, 0x1

    shl-int/lit8 v4, v4, 0x1

    iget v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    sub-int/2addr v5, v1

    shl-int/lit8 v5, v5, 0x1

    invoke-static {v2, v3, v2, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 407
    :cond_6
    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    aput v0, v2, v1

    .line 408
    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v3, v1, 0x1

    aput-object p1, v2, v3

    .line 409
    shl-int/lit8 v3, v1, 0x1

    add-int/lit8 v3, v3, 0x1

    aput-object p2, v2, v3

    .line 410
    iget v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    .line 411
    const/4 v2, 0x0

    return-object v2
.end method

.method public putAll(Landroid/support/v4/util/SimpleArrayMap;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/util/SimpleArrayMap<",
            "+TK;+TV;>;)V"
        }
    .end annotation

    .line 419
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    .local p1, "array":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<+TK;+TV;>;"
    iget v0, p1, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    .line 420
    .local v0, "N":I
    iget v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    add-int/2addr v1, v0

    invoke-virtual {p0, v1}, Landroid/support/v4/util/SimpleArrayMap;->ensureCapacity(I)V

    .line 421
    iget v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-nez v1, :cond_0

    .line 422
    if-lez v0, :cond_1

    .line 423
    iget-object v1, p1, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    const/4 v3, 0x0

    invoke-static {v1, v3, v2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 424
    iget-object v1, p1, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v4, v0, 0x1

    invoke-static {v1, v3, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 425
    iput v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    goto :goto_1

    .line 428
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 429
    invoke-virtual {p1, v1}, Landroid/support/v4/util/SimpleArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v1}, Landroid/support/v4/util/SimpleArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Landroid/support/v4/util/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 428
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 432
    .end local v1    # "i":I
    :cond_1
    :goto_1
    return-void
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .line 441
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    if-nez p1, :cond_0

    invoke-virtual {p0}, Landroid/support/v4/util/SimpleArrayMap;->indexOfNull()I

    move-result v0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Landroid/support/v4/util/SimpleArrayMap;->indexOf(Ljava/lang/Object;I)I

    move-result v0

    .line 442
    .local v0, "index":I
    :goto_0
    if-ltz v0, :cond_1

    .line 443
    invoke-virtual {p0, v0}, Landroid/support/v4/util/SimpleArrayMap;->removeAt(I)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 446
    :cond_1
    const/4 v1, 0x0

    return-object v1
.end method

.method public removeAt(I)Ljava/lang/Object;
    .locals 9
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TV;"
        }
    .end annotation

    .line 455
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    iget-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v1, p1, 0x1

    const/4 v2, 0x1

    add-int/2addr v1, v2

    aget-object v1, v0, v1

    .line 456
    .local v1, "old":Ljava/lang/Object;
    iget v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    const/4 v4, 0x0

    if-gt v3, v2, :cond_0

    .line 459
    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    invoke-static {v2, v0, v3}, Landroid/support/v4/util/SimpleArrayMap;->freeArrays([I[Ljava/lang/Object;I)V

    .line 460
    sget-object v0, Landroid/support/v4/util/ContainerHelpers;->EMPTY_INTS:[I

    iput-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    .line 461
    sget-object v0, Landroid/support/v4/util/ContainerHelpers;->EMPTY_OBJECTS:[Ljava/lang/Object;

    iput-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    .line 462
    iput v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    goto/16 :goto_0

    .line 464
    :cond_0
    iget-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    array-length v5, v0

    const/16 v6, 0x8

    if-le v5, v6, :cond_4

    array-length v0, v0

    div-int/lit8 v0, v0, 0x3

    if-ge v3, v0, :cond_4

    .line 468
    if-le v3, v6, :cond_1

    shr-int/lit8 v0, v3, 0x1

    add-int v6, v3, v0

    :cond_1
    move v0, v6

    .line 472
    .local v0, "n":I
    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    .line 473
    .local v3, "ohashes":[I
    iget-object v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    .line 474
    .local v5, "oarray":[Ljava/lang/Object;
    invoke-direct {p0, v0}, Landroid/support/v4/util/SimpleArrayMap;->allocArrays(I)V

    .line 476
    iget v6, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    sub-int/2addr v6, v2

    iput v6, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    .line 477
    if-lez p1, :cond_2

    .line 479
    iget-object v6, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    invoke-static {v3, v4, v6, v4, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 480
    iget-object v6, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v7, p1, 0x1

    invoke-static {v5, v4, v6, v4, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 482
    :cond_2
    iget v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-ge p1, v4, :cond_3

    .line 485
    add-int/lit8 v6, p1, 0x1

    iget-object v7, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    sub-int/2addr v4, p1

    invoke-static {v3, v6, v7, p1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 486
    add-int/lit8 v4, p1, 0x1

    shl-int/2addr v4, v2

    iget-object v6, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v7, p1, 0x1

    iget v8, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    sub-int/2addr v8, p1

    shl-int/lit8 v2, v8, 0x1

    invoke-static {v5, v4, v6, v7, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 489
    .end local v0    # "n":I
    .end local v3    # "ohashes":[I
    .end local v5    # "oarray":[Ljava/lang/Object;
    :cond_3
    goto :goto_0

    .line 490
    :cond_4
    iget v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    sub-int/2addr v0, v2

    iput v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    .line 491
    iget v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-ge p1, v0, :cond_5

    .line 494
    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    add-int/lit8 v4, p1, 0x1

    sub-int/2addr v0, p1

    invoke-static {v3, v4, v3, p1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 495
    iget-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    add-int/lit8 v3, p1, 0x1

    shl-int/2addr v3, v2

    shl-int/lit8 v4, p1, 0x1

    iget v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    sub-int/2addr v5, p1

    shl-int/2addr v5, v2

    invoke-static {v0, v3, v0, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 498
    :cond_5
    iget-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    iget v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    shl-int/lit8 v4, v3, 0x1

    const/4 v5, 0x0

    aput-object v5, v0, v4

    .line 499
    shl-int/2addr v3, v2

    add-int/2addr v3, v2

    aput-object v5, v0, v3

    .line 502
    :goto_0
    return-object v1
.end method

.method public setValueAt(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITV;)TV;"
        }
    .end annotation

    .line 342
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    shl-int/lit8 v0, p1, 0x1

    add-int/lit8 v0, v0, 0x1

    .line 343
    .end local p1    # "index":I
    .local v0, "index":I
    iget-object p1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    aget-object v1, p1, v0

    .line 344
    .local v1, "old":Ljava/lang/Object;, "TV;"
    aput-object p2, p1, v0

    .line 345
    return-object v1
.end method

.method public size()I
    .locals 1

    .line 509
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    iget v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 578
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    invoke-virtual {p0}, Landroid/support/v4/util/SimpleArrayMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 579
    const-string v0, "{}"

    return-object v0

    .line 582
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    mul-int/lit8 v1, v1, 0x1c

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 583
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const/16 v1, 0x7b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 584
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-ge v1, v2, :cond_4

    .line 585
    if-lez v1, :cond_1

    .line 586
    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 588
    :cond_1
    invoke-virtual {p0, v1}, Landroid/support/v4/util/SimpleArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v2

    .line 589
    .local v2, "key":Ljava/lang/Object;
    const-string v3, "(this Map)"

    if-eq v2, p0, :cond_2

    .line 590
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 592
    :cond_2
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 594
    :goto_1
    const/16 v4, 0x3d

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 595
    invoke-virtual {p0, v1}, Landroid/support/v4/util/SimpleArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    .line 596
    .local v4, "value":Ljava/lang/Object;
    if-eq v4, p0, :cond_3

    .line 597
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 599
    :cond_3
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 584
    .end local v2    # "key":Ljava/lang/Object;
    .end local v4    # "value":Ljava/lang/Object;
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 602
    .end local v1    # "i":I
    :cond_4
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 603
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public valueAt(I)Ljava/lang/Object;
    .locals 2
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TV;"
        }
    .end annotation

    .line 332
    .local p0, "this":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<TK;TV;>;"
    iget-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v1, p1, 0x1

    add-int/lit8 v1, v1, 0x1

    aget-object v0, v0, v1

    return-object v0
.end method
