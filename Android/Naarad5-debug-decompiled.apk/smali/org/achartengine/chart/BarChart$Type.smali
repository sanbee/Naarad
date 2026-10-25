.class public final enum Lorg/achartengine/chart/BarChart$Type;
.super Ljava/lang/Enum;
.source "BarChart.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/achartengine/chart/BarChart;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/achartengine/chart/BarChart$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/achartengine/chart/BarChart$Type;

.field public static final enum DEFAULT:Lorg/achartengine/chart/BarChart$Type;

.field public static final enum STACKED:Lorg/achartengine/chart/BarChart$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 48
    new-instance v0, Lorg/achartengine/chart/BarChart$Type;

    const/4 v1, 0x0

    const-string v2, "DEFAULT"

    invoke-direct {v0, v2, v1}, Lorg/achartengine/chart/BarChart$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/achartengine/chart/BarChart$Type;->DEFAULT:Lorg/achartengine/chart/BarChart$Type;

    new-instance v0, Lorg/achartengine/chart/BarChart$Type;

    const/4 v2, 0x1

    const-string v3, "STACKED"

    invoke-direct {v0, v3, v2}, Lorg/achartengine/chart/BarChart$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/achartengine/chart/BarChart$Type;->STACKED:Lorg/achartengine/chart/BarChart$Type;

    .line 47
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/achartengine/chart/BarChart$Type;

    sget-object v3, Lorg/achartengine/chart/BarChart$Type;->DEFAULT:Lorg/achartengine/chart/BarChart$Type;

    aput-object v3, v0, v1

    sget-object v1, Lorg/achartengine/chart/BarChart$Type;->STACKED:Lorg/achartengine/chart/BarChart$Type;

    aput-object v1, v0, v2

    sput-object v0, Lorg/achartengine/chart/BarChart$Type;->$VALUES:[Lorg/achartengine/chart/BarChart$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 47
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/achartengine/chart/BarChart$Type;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 47
    const-class v0, Lorg/achartengine/chart/BarChart$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/achartengine/chart/BarChart$Type;

    return-object v0
.end method

.method public static values()[Lorg/achartengine/chart/BarChart$Type;
    .locals 1

    .line 47
    sget-object v0, Lorg/achartengine/chart/BarChart$Type;->$VALUES:[Lorg/achartengine/chart/BarChart$Type;

    invoke-virtual {v0}, [Lorg/achartengine/chart/BarChart$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/achartengine/chart/BarChart$Type;

    return-object v0
.end method
