.class public Lorg/achartengine/chart/RangeStackedBarChart;
.super Lorg/achartengine/chart/RangeBarChart;
.source "RangeStackedBarChart.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "RangeStackedBar"


# direct methods
.method constructor <init>()V
    .locals 1

    .line 23
    sget-object v0, Lorg/achartengine/chart/BarChart$Type;->STACKED:Lorg/achartengine/chart/BarChart$Type;

    invoke-direct {p0, v0}, Lorg/achartengine/chart/RangeBarChart;-><init>(Lorg/achartengine/chart/BarChart$Type;)V

    .line 24
    return-void
.end method


# virtual methods
.method public getChartType()Ljava/lang/String;
    .locals 1

    .line 27
    const-string v0, "RangeStackedBar"

    return-object v0
.end method
