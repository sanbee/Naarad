.class public Lorg/achartengine/util/MathHelper;
.super Ljava/lang/Object;
.source "MathHelper.java"


# static fields
.field private static final FORMAT:Ljava/text/NumberFormat;

.field public static final NULL_VALUE:D = 1.7976931348623157E308


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 33
    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v0

    sput-object v0, Lorg/achartengine/util/MathHelper;->FORMAT:Ljava/text/NumberFormat;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    return-void
.end method

.method private static computeLabels(DDI)[D
    .locals 16
    .param p0, "start"    # D
    .param p2, "end"    # D
    .param p4, "approxNumLabels"    # I

    .line 107
    sub-double v0, p0, p2

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    const/4 v2, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x3

    const-wide v6, 0x3e7ad7f2a0000000L    # 1.0000000116860974E-7

    cmpg-double v8, v0, v6

    if-gez v8, :cond_0

    .line 108
    new-array v0, v5, [D

    aput-wide p0, v0, v4

    aput-wide p0, v0, v3

    const-wide/16 v3, 0x0

    aput-wide v3, v0, v2

    return-object v0

    .line 110
    :cond_0
    move-wide/from16 v0, p0

    .line 111
    .local v0, "s":D
    move-wide/from16 v6, p2

    .line 112
    .local v6, "e":D
    const/4 v8, 0x0

    .line 113
    .local v8, "switched":Z
    cmpl-double v9, v0, v6

    if-lez v9, :cond_1

    .line 114
    const/4 v8, 0x1

    .line 115
    move-wide v9, v0

    .line 116
    .local v9, "tmp":D
    move-wide v0, v6

    .line 117
    move-wide v6, v9

    .line 119
    .end local v9    # "tmp":D
    :cond_1
    sub-double v9, v0, v6

    invoke-static {v9, v10}, Ljava/lang/Math;->abs(D)D

    move-result-wide v9

    move/from16 v11, p4

    int-to-double v12, v11

    invoke-static {v12, v13}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v9, v12

    invoke-static {v9, v10}, Lorg/achartengine/util/MathHelper;->roundUp(D)D

    move-result-wide v9

    .line 121
    .local v9, "xStep":D
    div-double v12, v0, v9

    invoke-static {v12, v13}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v12

    mul-double v12, v12, v9

    .line 122
    .local v12, "xStart":D
    div-double v14, v6, v9

    invoke-static {v14, v15}, Ljava/lang/Math;->floor(D)D

    move-result-wide v14

    mul-double v14, v14, v9

    .line 123
    .local v14, "xEnd":D
    if-eqz v8, :cond_2

    .line 124
    new-array v5, v5, [D

    aput-wide v14, v5, v4

    aput-wide v12, v5, v3

    const-wide/high16 v3, -0x4010000000000000L    # -1.0

    mul-double v3, v3, v9

    aput-wide v3, v5, v2

    return-object v5

    .line 126
    :cond_2
    new-array v5, v5, [D

    aput-wide v12, v5, v4

    aput-wide v14, v5, v3

    aput-wide v9, v5, v2

    return-object v5
.end method

.method public static getLabels(DDI)Ljava/util/List;
    .locals 13
    .param p0, "start"    # D
    .param p2, "end"    # D
    .param p4, "approxNumLabels"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(DDI)",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .line 71
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v1, v0

    .line 72
    .local v1, "labels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    if-gtz p4, :cond_0

    .line 73
    return-object v1

    .line 75
    :cond_0
    sget-object v0, Lorg/achartengine/util/MathHelper;->FORMAT:Ljava/text/NumberFormat;

    const/4 v2, 0x5

    invoke-virtual {v0, v2}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    .line 76
    invoke-static/range {p0 .. p4}, Lorg/achartengine/util/MathHelper;->computeLabels(DDI)[D

    move-result-object v2

    .line 78
    .local v2, "labelParams":[D
    const/4 v0, 0x1

    aget-wide v3, v2, v0

    const/4 v5, 0x0

    aget-wide v6, v2, v5

    sub-double/2addr v3, v6

    const/4 v6, 0x2

    aget-wide v7, v2, v6

    div-double/2addr v3, v7

    double-to-int v3, v3

    add-int/2addr v3, v0

    .line 83
    .local v3, "numLabels":I
    const/4 v0, 0x0

    move v4, v0

    .local v4, "i":I
    :goto_0
    if-ge v4, v3, :cond_1

    .line 84
    aget-wide v7, v2, v5

    int-to-double v9, v4

    aget-wide v11, v2, v6

    invoke-static {v9, v10}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v9, v9, v11

    add-double/2addr v7, v9

    .line 88
    .local v7, "z":D
    :try_start_0
    sget-object v0, Lorg/achartengine/util/MathHelper;->FORMAT:Ljava/text/NumberFormat;

    sget-object v9, Lorg/achartengine/util/MathHelper;->FORMAT:Ljava/text/NumberFormat;

    invoke-virtual {v9, v7, v8}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/text/NumberFormat;->parse(Ljava/lang/String;)Ljava/lang/Number;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v9
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-wide v7, v9

    .line 91
    goto :goto_1

    .line 89
    :catch_0
    move-exception v0

    .line 92
    :goto_1
    invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    .end local v7    # "z":D
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 94
    .end local v4    # "i":I
    :cond_1
    return-object v1
.end method

.method public static minmax(Ljava/util/List;)[D
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;)[D"
        }
    .end annotation

    .line 46
    .local p0, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x2

    if-nez v0, :cond_0

    .line 47
    new-array v0, v1, [D

    return-object v0

    .line 49
    :cond_0
    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    .line 50
    .local v2, "min":D
    move-wide v4, v2

    .line 51
    .local v4, "max":D
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v6

    .line 52
    .local v6, "length":I
    const/4 v7, 0x1

    .local v7, "i":I
    :goto_0
    if-ge v7, v6, :cond_1

    .line 53
    invoke-interface {p0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Double;

    invoke-virtual {v8}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    .line 54
    .local v8, "value":D
    invoke-static {v2, v3, v8, v9}, Ljava/lang/Math;->min(DD)D

    move-result-wide v2

    .line 55
    invoke-static {v4, v5, v8, v9}, Ljava/lang/Math;->max(DD)D

    move-result-wide v4

    .line 52
    .end local v8    # "value":D
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 57
    .end local v7    # "i":I
    :cond_1
    new-array v1, v1, [D

    aput-wide v2, v1, v0

    const/4 v0, 0x1

    aput-wide v4, v1, v0

    return-object v1
.end method

.method private static roundUp(D)D
    .locals 8
    .param p0, "val"    # D

    .line 135
    invoke-static {p0, p1}, Ljava/lang/Math;->log10(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    .line 136
    .local v0, "exponent":I
    neg-int v1, v0

    int-to-double v1, v1

    const-wide/high16 v3, 0x4024000000000000L    # 10.0

    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v1

    mul-double v1, v1, p0

    .line 137
    .local v1, "rval":D
    const-wide/high16 v5, 0x4014000000000000L    # 5.0

    cmpl-double v7, v1, v5

    if-lez v7, :cond_0

    .line 138
    const-wide/high16 v1, 0x4024000000000000L    # 10.0

    goto :goto_0

    .line 139
    :cond_0
    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    cmpl-double v7, v1, v5

    if-lez v7, :cond_1

    .line 140
    const-wide/high16 v1, 0x4014000000000000L    # 5.0

    goto :goto_0

    .line 141
    :cond_1
    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    cmpl-double v7, v1, v5

    if-lez v7, :cond_2

    .line 142
    const-wide/high16 v1, 0x4000000000000000L    # 2.0

    .line 144
    :cond_2
    :goto_0
    int-to-double v5, v0

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v3

    mul-double v1, v1, v3

    .line 145
    return-wide v1
.end method
