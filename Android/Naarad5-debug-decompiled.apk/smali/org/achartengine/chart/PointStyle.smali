.class public final enum Lorg/achartengine/chart/PointStyle;
.super Ljava/lang/Enum;
.source "PointStyle.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/achartengine/chart/PointStyle;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/achartengine/chart/PointStyle;

.field public static final enum CIRCLE:Lorg/achartengine/chart/PointStyle;

.field public static final enum DIAMOND:Lorg/achartengine/chart/PointStyle;

.field public static final enum POINT:Lorg/achartengine/chart/PointStyle;

.field public static final enum SQUARE:Lorg/achartengine/chart/PointStyle;

.field public static final enum TRIANGLE:Lorg/achartengine/chart/PointStyle;

.field public static final enum X:Lorg/achartengine/chart/PointStyle;


# instance fields
.field private mName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 22
    new-instance v0, Lorg/achartengine/chart/PointStyle;

    const/4 v1, 0x0

    const-string v2, "X"

    const-string v3, "x"

    invoke-direct {v0, v2, v1, v3}, Lorg/achartengine/chart/PointStyle;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/achartengine/chart/PointStyle;->X:Lorg/achartengine/chart/PointStyle;

    new-instance v0, Lorg/achartengine/chart/PointStyle;

    const/4 v2, 0x1

    const-string v3, "CIRCLE"

    const-string v4, "circle"

    invoke-direct {v0, v3, v2, v4}, Lorg/achartengine/chart/PointStyle;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/achartengine/chart/PointStyle;->CIRCLE:Lorg/achartengine/chart/PointStyle;

    new-instance v0, Lorg/achartengine/chart/PointStyle;

    const/4 v3, 0x2

    const-string v4, "TRIANGLE"

    const-string v5, "triangle"

    invoke-direct {v0, v4, v3, v5}, Lorg/achartengine/chart/PointStyle;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/achartengine/chart/PointStyle;->TRIANGLE:Lorg/achartengine/chart/PointStyle;

    new-instance v0, Lorg/achartengine/chart/PointStyle;

    const/4 v4, 0x3

    const-string v5, "SQUARE"

    const-string v6, "square"

    invoke-direct {v0, v5, v4, v6}, Lorg/achartengine/chart/PointStyle;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/achartengine/chart/PointStyle;->SQUARE:Lorg/achartengine/chart/PointStyle;

    new-instance v0, Lorg/achartengine/chart/PointStyle;

    const/4 v5, 0x4

    const-string v6, "DIAMOND"

    const-string v7, "diamond"

    invoke-direct {v0, v6, v5, v7}, Lorg/achartengine/chart/PointStyle;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/achartengine/chart/PointStyle;->DIAMOND:Lorg/achartengine/chart/PointStyle;

    new-instance v0, Lorg/achartengine/chart/PointStyle;

    const/4 v6, 0x5

    const-string v7, "POINT"

    const-string v8, "point"

    invoke-direct {v0, v7, v6, v8}, Lorg/achartengine/chart/PointStyle;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/achartengine/chart/PointStyle;->POINT:Lorg/achartengine/chart/PointStyle;

    .line 21
    const/4 v0, 0x6

    new-array v0, v0, [Lorg/achartengine/chart/PointStyle;

    sget-object v7, Lorg/achartengine/chart/PointStyle;->X:Lorg/achartengine/chart/PointStyle;

    aput-object v7, v0, v1

    sget-object v1, Lorg/achartengine/chart/PointStyle;->CIRCLE:Lorg/achartengine/chart/PointStyle;

    aput-object v1, v0, v2

    sget-object v1, Lorg/achartengine/chart/PointStyle;->TRIANGLE:Lorg/achartengine/chart/PointStyle;

    aput-object v1, v0, v3

    sget-object v1, Lorg/achartengine/chart/PointStyle;->SQUARE:Lorg/achartengine/chart/PointStyle;

    aput-object v1, v0, v4

    sget-object v1, Lorg/achartengine/chart/PointStyle;->DIAMOND:Lorg/achartengine/chart/PointStyle;

    aput-object v1, v0, v5

    sget-object v1, Lorg/achartengine/chart/PointStyle;->POINT:Lorg/achartengine/chart/PointStyle;

    aput-object v1, v0, v6

    sput-object v0, Lorg/achartengine/chart/PointStyle;->$VALUES:[Lorg/achartengine/chart/PointStyle;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 33
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 34
    iput-object p3, p0, Lorg/achartengine/chart/PointStyle;->mName:Ljava/lang/String;

    .line 35
    return-void
.end method

.method public static getIndexForName(Ljava/lang/String;)I
    .locals 5
    .param p0, "name"    # Ljava/lang/String;

    .line 79
    const/4 v0, -0x1

    .line 80
    .local v0, "index":I
    invoke-static {}, Lorg/achartengine/chart/PointStyle;->values()[Lorg/achartengine/chart/PointStyle;

    move-result-object v1

    .line 81
    .local v1, "styles":[Lorg/achartengine/chart/PointStyle;
    array-length v2, v1

    .line 82
    .local v2, "length":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v2, :cond_1

    if-gez v0, :cond_1

    .line 83
    aget-object v4, v1, v3

    iget-object v4, v4, Lorg/achartengine/chart/PointStyle;->mName:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 84
    move v0, v3

    .line 82
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 87
    .end local v3    # "i":I
    :cond_1
    const/4 v3, 0x0

    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    move-result v3

    return v3
.end method

.method public static getPointStyleForName(Ljava/lang/String;)Lorg/achartengine/chart/PointStyle;
    .locals 5
    .param p0, "name"    # Ljava/lang/String;

    .line 62
    const/4 v0, 0x0

    .line 63
    .local v0, "pointStyle":Lorg/achartengine/chart/PointStyle;
    invoke-static {}, Lorg/achartengine/chart/PointStyle;->values()[Lorg/achartengine/chart/PointStyle;

    move-result-object v1

    .line 64
    .local v1, "styles":[Lorg/achartengine/chart/PointStyle;
    array-length v2, v1

    .line 65
    .local v2, "length":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v2, :cond_1

    if-nez v0, :cond_1

    .line 66
    aget-object v4, v1, v3

    iget-object v4, v4, Lorg/achartengine/chart/PointStyle;->mName:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 67
    aget-object v0, v1, v3

    .line 65
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 70
    .end local v3    # "i":I
    :cond_1
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/achartengine/chart/PointStyle;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 21
    const-class v0, Lorg/achartengine/chart/PointStyle;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/achartengine/chart/PointStyle;

    return-object v0
.end method

.method public static values()[Lorg/achartengine/chart/PointStyle;
    .locals 1

    .line 21
    sget-object v0, Lorg/achartengine/chart/PointStyle;->$VALUES:[Lorg/achartengine/chart/PointStyle;

    invoke-virtual {v0}, [Lorg/achartengine/chart/PointStyle;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/achartengine/chart/PointStyle;

    return-object v0
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .line 43
    iget-object v0, p0, Lorg/achartengine/chart/PointStyle;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 52
    invoke-virtual {p0}, Lorg/achartengine/chart/PointStyle;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
