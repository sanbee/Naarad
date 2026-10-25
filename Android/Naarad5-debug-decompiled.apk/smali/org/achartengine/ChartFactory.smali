.class public Lorg/achartengine/ChartFactory;
.super Ljava/lang/Object;
.source "ChartFactory.java"


# static fields
.field public static final CHART:Ljava/lang/String; = "chart"

.field public static final TITLE:Ljava/lang/String; = "title"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    return-void
.end method

.method private static checkMultipleSeriesItems(Lorg/achartengine/model/MultipleCategorySeries;I)Z
    .locals 5
    .param p0, "dataset"    # Lorg/achartengine/model/MultipleCategorySeries;
    .param p1, "value"    # I

    .line 700
    invoke-virtual {p0}, Lorg/achartengine/model/MultipleCategorySeries;->getCategoriesCount()I

    move-result v0

    .line 701
    .local v0, "count":I
    const/4 v1, 0x1

    .line 702
    .local v1, "equal":Z
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_0
    if-ge v2, v0, :cond_1

    if-eqz v1, :cond_1

    .line 703
    invoke-virtual {p0, v2}, Lorg/achartengine/model/MultipleCategorySeries;->getValues(I)[D

    move-result-object v3

    array-length v3, v3

    invoke-virtual {p0, v2}, Lorg/achartengine/model/MultipleCategorySeries;->getTitles(I)[Ljava/lang/String;

    move-result-object v4

    array-length v4, v4

    if-ne v3, v4, :cond_0

    const/4 v3, 0x1

    goto :goto_1

    :cond_0
    const/4 v3, 0x0

    :goto_1
    move v1, v3

    .line 702
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 705
    .end local v2    # "k":I
    :cond_1
    return v1
.end method

.method private static checkParameters(Lorg/achartengine/model/CategorySeries;Lorg/achartengine/renderer/DefaultRenderer;)V
    .locals 2
    .param p0, "dataset"    # Lorg/achartengine/model/CategorySeries;
    .param p1, "renderer"    # Lorg/achartengine/renderer/DefaultRenderer;

    .line 675
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lorg/achartengine/model/CategorySeries;->getItemCount()I

    move-result v0

    invoke-virtual {p1}, Lorg/achartengine/renderer/DefaultRenderer;->getSeriesRendererCount()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 680
    return-void

    .line 677
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Dataset and renderer should be not null and the dataset number of items should be equal to the number of series renderers"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static checkParameters(Lorg/achartengine/model/MultipleCategorySeries;Lorg/achartengine/renderer/DefaultRenderer;)V
    .locals 2
    .param p0, "dataset"    # Lorg/achartengine/model/MultipleCategorySeries;
    .param p1, "renderer"    # Lorg/achartengine/renderer/DefaultRenderer;

    .line 692
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lorg/achartengine/renderer/DefaultRenderer;->getSeriesRendererCount()I

    move-result v0

    invoke-static {p0, v0}, Lorg/achartengine/ChartFactory;->checkMultipleSeriesItems(Lorg/achartengine/model/MultipleCategorySeries;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 697
    return-void

    .line 694
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Titles and values should be not null and the dataset number of items should be equal to the number of series renderers"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static checkParameters(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V
    .locals 2
    .param p0, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p1, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    .line 658
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesCount()I

    move-result v0

    invoke-virtual {p1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getSeriesRendererCount()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 663
    return-void

    .line 660
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Dataset and renderer should be not null and should have the same number of series"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static final getBarChartIntent(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Lorg/achartengine/chart/BarChart$Type;)Landroid/content/Intent;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .param p3, "type"    # Lorg/achartengine/chart/BarChart$Type;

    .line 371
    const-string v0, ""

    invoke-static {p0, p1, p2, p3, v0}, Lorg/achartengine/ChartFactory;->getBarChartIntent(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Lorg/achartengine/chart/BarChart$Type;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static final getBarChartIntent(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Lorg/achartengine/chart/BarChart$Type;Ljava/lang/String;)Landroid/content/Intent;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .param p3, "type"    # Lorg/achartengine/chart/BarChart$Type;
    .param p4, "activityTitle"    # Ljava/lang/String;

    .line 515
    invoke-static {p1, p2}, Lorg/achartengine/ChartFactory;->checkParameters(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 516
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/achartengine/GraphicalActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 517
    .local v0, "intent":Landroid/content/Intent;
    new-instance v1, Lorg/achartengine/chart/BarChart;

    invoke-direct {v1, p1, p2, p3}, Lorg/achartengine/chart/BarChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Lorg/achartengine/chart/BarChart$Type;)V

    .line 518
    .local v1, "chart":Lorg/achartengine/chart/BarChart;
    const-string v2, "chart"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 519
    const-string v2, "title"

    invoke-virtual {v0, v2, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 520
    return-object v0
.end method

.method public static final getBarChartView(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Lorg/achartengine/chart/BarChart$Type;)Lorg/achartengine/GraphicalView;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .param p3, "type"    # Lorg/achartengine/chart/BarChart$Type;

    .line 162
    invoke-static {p1, p2}, Lorg/achartengine/ChartFactory;->checkParameters(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 163
    new-instance v0, Lorg/achartengine/chart/BarChart;

    invoke-direct {v0, p1, p2, p3}, Lorg/achartengine/chart/BarChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Lorg/achartengine/chart/BarChart$Type;)V

    .line 164
    .local v0, "chart":Lorg/achartengine/chart/XYChart;
    new-instance v1, Lorg/achartengine/GraphicalView;

    invoke-direct {v1, p0, v0}, Lorg/achartengine/GraphicalView;-><init>(Landroid/content/Context;Lorg/achartengine/chart/AbstractChart;)V

    return-object v1
.end method

.method public static final getBubbleChartIntent(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)Landroid/content/Intent;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    .line 334
    const-string v0, ""

    invoke-static {p0, p1, p2, v0}, Lorg/achartengine/ChartFactory;->getBubbleChartIntent(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static final getBubbleChartIntent(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Ljava/lang/String;)Landroid/content/Intent;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .param p3, "activityTitle"    # Ljava/lang/String;

    .line 465
    invoke-static {p1, p2}, Lorg/achartengine/ChartFactory;->checkParameters(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 466
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/achartengine/GraphicalActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 467
    .local v0, "intent":Landroid/content/Intent;
    new-instance v1, Lorg/achartengine/chart/BubbleChart;

    invoke-direct {v1, p1, p2}, Lorg/achartengine/chart/BubbleChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 468
    .local v1, "chart":Lorg/achartengine/chart/XYChart;
    const-string v2, "chart"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 469
    const-string v2, "title"

    invoke-virtual {v0, v2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 470
    return-object v0
.end method

.method public static final getBubbleChartView(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)Lorg/achartengine/GraphicalView;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    .line 122
    invoke-static {p1, p2}, Lorg/achartengine/ChartFactory;->checkParameters(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 123
    new-instance v0, Lorg/achartengine/chart/BubbleChart;

    invoke-direct {v0, p1, p2}, Lorg/achartengine/chart/BubbleChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 124
    .local v0, "chart":Lorg/achartengine/chart/XYChart;
    new-instance v1, Lorg/achartengine/GraphicalView;

    invoke-direct {v1, p0, v0}, Lorg/achartengine/GraphicalView;-><init>(Landroid/content/Context;Lorg/achartengine/chart/AbstractChart;)V

    return-object v1
.end method

.method public static final getCombinedXYChartIntent(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;[Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .param p3, "types"    # [Ljava/lang/String;
    .param p4, "activityTitle"    # Ljava/lang/String;

    .line 565
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    if-eqz p3, :cond_0

    invoke-virtual {p1}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesCount()I

    move-result v0

    array-length v1, p3

    if-ne v0, v1, :cond_0

    .line 570
    invoke-static {p1, p2}, Lorg/achartengine/ChartFactory;->checkParameters(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 571
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/achartengine/GraphicalActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 572
    .local v0, "intent":Landroid/content/Intent;
    new-instance v1, Lorg/achartengine/chart/CombinedXYChart;

    invoke-direct {v1, p1, p2, p3}, Lorg/achartengine/chart/CombinedXYChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;[Ljava/lang/String;)V

    .line 573
    .local v1, "chart":Lorg/achartengine/chart/CombinedXYChart;
    const-string v2, "chart"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 574
    const-string v2, "title"

    invoke-virtual {v0, v2, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 575
    return-object v0

    .line 567
    .end local v0    # "intent":Landroid/content/Intent;
    .end local v1    # "chart":Lorg/achartengine/chart/CombinedXYChart;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Datasets, renderers and types should be not null and the datasets series count should be equal to the types length"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static final getCombinedXYChartView(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;[Ljava/lang/String;)Lorg/achartengine/GraphicalView;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .param p3, "types"    # [Ljava/lang/String;

    .line 200
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    if-eqz p3, :cond_0

    invoke-virtual {p1}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesCount()I

    move-result v0

    array-length v1, p3

    if-ne v0, v1, :cond_0

    .line 205
    invoke-static {p1, p2}, Lorg/achartengine/ChartFactory;->checkParameters(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 206
    new-instance v0, Lorg/achartengine/chart/CombinedXYChart;

    invoke-direct {v0, p1, p2, p3}, Lorg/achartengine/chart/CombinedXYChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;[Ljava/lang/String;)V

    .line 207
    .local v0, "chart":Lorg/achartengine/chart/CombinedXYChart;
    new-instance v1, Lorg/achartengine/GraphicalView;

    invoke-direct {v1, p0, v0}, Lorg/achartengine/GraphicalView;-><init>(Landroid/content/Context;Lorg/achartengine/chart/AbstractChart;)V

    return-object v1

    .line 202
    .end local v0    # "chart":Lorg/achartengine/chart/CombinedXYChart;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Dataset, renderer and types should be not null and the datasets series count should be equal to the types length"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static final getCubeLineChartView(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;F)Lorg/achartengine/GraphicalView;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .param p3, "smoothness"    # F

    .line 86
    invoke-static {p1, p2}, Lorg/achartengine/ChartFactory;->checkParameters(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 87
    new-instance v0, Lorg/achartengine/chart/CubicLineChart;

    invoke-direct {v0, p1, p2, p3}, Lorg/achartengine/chart/CubicLineChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;F)V

    .line 88
    .local v0, "chart":Lorg/achartengine/chart/XYChart;
    new-instance v1, Lorg/achartengine/GraphicalView;

    invoke-direct {v1, p0, v0}, Lorg/achartengine/GraphicalView;-><init>(Landroid/content/Context;Lorg/achartengine/chart/AbstractChart;)V

    return-object v1
.end method

.method public static final getCubicLineChartIntent(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;F)Landroid/content/Intent;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .param p3, "smoothness"    # F

    .line 300
    const-string v0, ""

    invoke-static {p0, p1, p2, p3, v0}, Lorg/achartengine/ChartFactory;->getCubicLineChartIntent(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;FLjava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static final getCubicLineChartIntent(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;FLjava/lang/String;)Landroid/content/Intent;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .param p3, "smoothness"    # F
    .param p4, "activityTitle"    # Ljava/lang/String;

    .line 419
    invoke-static {p1, p2}, Lorg/achartengine/ChartFactory;->checkParameters(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 420
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/achartengine/GraphicalActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 421
    .local v0, "intent":Landroid/content/Intent;
    new-instance v1, Lorg/achartengine/chart/CubicLineChart;

    invoke-direct {v1, p1, p2, p3}, Lorg/achartengine/chart/CubicLineChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;F)V

    .line 422
    .local v1, "chart":Lorg/achartengine/chart/XYChart;
    const-string v2, "chart"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 423
    const-string v2, "title"

    invoke-virtual {v0, v2, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 424
    return-object v0
.end method

.method public static final getDialChartIntent(Landroid/content/Context;Lorg/achartengine/model/CategorySeries;Lorg/achartengine/renderer/DialRenderer;Ljava/lang/String;)Landroid/content/Intent;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/CategorySeries;
    .param p2, "renderer"    # Lorg/achartengine/renderer/DialRenderer;
    .param p3, "activityTitle"    # Ljava/lang/String;

    .line 639
    invoke-static {p1, p2}, Lorg/achartengine/ChartFactory;->checkParameters(Lorg/achartengine/model/CategorySeries;Lorg/achartengine/renderer/DefaultRenderer;)V

    .line 640
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/achartengine/GraphicalActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 641
    .local v0, "intent":Landroid/content/Intent;
    new-instance v1, Lorg/achartengine/chart/DialChart;

    invoke-direct {v1, p1, p2}, Lorg/achartengine/chart/DialChart;-><init>(Lorg/achartengine/model/CategorySeries;Lorg/achartengine/renderer/DialRenderer;)V

    .line 642
    .local v1, "chart":Lorg/achartengine/chart/DialChart;
    const-string v2, "chart"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 643
    const-string v2, "title"

    invoke-virtual {v0, v2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 644
    return-object v0
.end method

.method public static final getDialChartView(Landroid/content/Context;Lorg/achartengine/model/CategorySeries;Lorg/achartengine/renderer/DialRenderer;)Lorg/achartengine/GraphicalView;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/CategorySeries;
    .param p2, "renderer"    # Lorg/achartengine/renderer/DialRenderer;

    .line 243
    invoke-static {p1, p2}, Lorg/achartengine/ChartFactory;->checkParameters(Lorg/achartengine/model/CategorySeries;Lorg/achartengine/renderer/DefaultRenderer;)V

    .line 244
    new-instance v0, Lorg/achartengine/chart/DialChart;

    invoke-direct {v0, p1, p2}, Lorg/achartengine/chart/DialChart;-><init>(Lorg/achartengine/model/CategorySeries;Lorg/achartengine/renderer/DialRenderer;)V

    .line 245
    .local v0, "chart":Lorg/achartengine/chart/DialChart;
    new-instance v1, Lorg/achartengine/GraphicalView;

    invoke-direct {v1, p0, v0}, Lorg/achartengine/GraphicalView;-><init>(Landroid/content/Context;Lorg/achartengine/chart/AbstractChart;)V

    return-object v1
.end method

.method public static final getDoughnutChartIntent(Landroid/content/Context;Lorg/achartengine/model/MultipleCategorySeries;Lorg/achartengine/renderer/DefaultRenderer;Ljava/lang/String;)Landroid/content/Intent;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/MultipleCategorySeries;
    .param p2, "renderer"    # Lorg/achartengine/renderer/DefaultRenderer;
    .param p3, "activityTitle"    # Ljava/lang/String;

    .line 616
    invoke-static {p1, p2}, Lorg/achartengine/ChartFactory;->checkParameters(Lorg/achartengine/model/MultipleCategorySeries;Lorg/achartengine/renderer/DefaultRenderer;)V

    .line 617
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/achartengine/GraphicalActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 618
    .local v0, "intent":Landroid/content/Intent;
    new-instance v1, Lorg/achartengine/chart/DoughnutChart;

    invoke-direct {v1, p1, p2}, Lorg/achartengine/chart/DoughnutChart;-><init>(Lorg/achartengine/model/MultipleCategorySeries;Lorg/achartengine/renderer/DefaultRenderer;)V

    .line 619
    .local v1, "chart":Lorg/achartengine/chart/DoughnutChart;
    const-string v2, "chart"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 620
    const-string v2, "title"

    invoke-virtual {v0, v2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 621
    return-object v0
.end method

.method public static final getDoughnutChartView(Landroid/content/Context;Lorg/achartengine/model/MultipleCategorySeries;Lorg/achartengine/renderer/DefaultRenderer;)Lorg/achartengine/GraphicalView;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/MultipleCategorySeries;
    .param p2, "renderer"    # Lorg/achartengine/renderer/DefaultRenderer;

    .line 262
    invoke-static {p1, p2}, Lorg/achartengine/ChartFactory;->checkParameters(Lorg/achartengine/model/MultipleCategorySeries;Lorg/achartengine/renderer/DefaultRenderer;)V

    .line 263
    new-instance v0, Lorg/achartengine/chart/DoughnutChart;

    invoke-direct {v0, p1, p2}, Lorg/achartengine/chart/DoughnutChart;-><init>(Lorg/achartengine/model/MultipleCategorySeries;Lorg/achartengine/renderer/DefaultRenderer;)V

    .line 264
    .local v0, "chart":Lorg/achartengine/chart/DoughnutChart;
    new-instance v1, Lorg/achartengine/GraphicalView;

    invoke-direct {v1, p0, v0}, Lorg/achartengine/GraphicalView;-><init>(Landroid/content/Context;Lorg/achartengine/chart/AbstractChart;)V

    return-object v1
.end method

.method public static final getLineChartIntent(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)Landroid/content/Intent;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    .line 282
    const-string v0, ""

    invoke-static {p0, p1, p2, v0}, Lorg/achartengine/ChartFactory;->getLineChartIntent(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static final getLineChartIntent(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Ljava/lang/String;)Landroid/content/Intent;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .param p3, "activityTitle"    # Ljava/lang/String;

    .line 392
    invoke-static {p1, p2}, Lorg/achartengine/ChartFactory;->checkParameters(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 393
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/achartengine/GraphicalActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 394
    .local v0, "intent":Landroid/content/Intent;
    new-instance v1, Lorg/achartengine/chart/LineChart;

    invoke-direct {v1, p1, p2}, Lorg/achartengine/chart/LineChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 395
    .local v1, "chart":Lorg/achartengine/chart/XYChart;
    const-string v2, "chart"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 396
    const-string v2, "title"

    invoke-virtual {v0, v2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 397
    return-object v0
.end method

.method public static final getLineChartView(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)Lorg/achartengine/GraphicalView;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    .line 68
    invoke-static {p1, p2}, Lorg/achartengine/ChartFactory;->checkParameters(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 69
    new-instance v0, Lorg/achartengine/chart/LineChart;

    invoke-direct {v0, p1, p2}, Lorg/achartengine/chart/LineChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 70
    .local v0, "chart":Lorg/achartengine/chart/XYChart;
    new-instance v1, Lorg/achartengine/GraphicalView;

    invoke-direct {v1, p0, v0}, Lorg/achartengine/GraphicalView;-><init>(Landroid/content/Context;Lorg/achartengine/chart/AbstractChart;)V

    return-object v1
.end method

.method public static final getPieChartIntent(Landroid/content/Context;Lorg/achartengine/model/CategorySeries;Lorg/achartengine/renderer/DefaultRenderer;Ljava/lang/String;)Landroid/content/Intent;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/CategorySeries;
    .param p2, "renderer"    # Lorg/achartengine/renderer/DefaultRenderer;
    .param p3, "activityTitle"    # Ljava/lang/String;

    .line 593
    invoke-static {p1, p2}, Lorg/achartengine/ChartFactory;->checkParameters(Lorg/achartengine/model/CategorySeries;Lorg/achartengine/renderer/DefaultRenderer;)V

    .line 594
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/achartengine/GraphicalActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 595
    .local v0, "intent":Landroid/content/Intent;
    new-instance v1, Lorg/achartengine/chart/PieChart;

    invoke-direct {v1, p1, p2}, Lorg/achartengine/chart/PieChart;-><init>(Lorg/achartengine/model/CategorySeries;Lorg/achartengine/renderer/DefaultRenderer;)V

    .line 596
    .local v1, "chart":Lorg/achartengine/chart/PieChart;
    const-string v2, "chart"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 597
    const-string v2, "title"

    invoke-virtual {v0, v2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 598
    return-object v0
.end method

.method public static final getPieChartView(Landroid/content/Context;Lorg/achartengine/model/CategorySeries;Lorg/achartengine/renderer/DefaultRenderer;)Lorg/achartengine/GraphicalView;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/CategorySeries;
    .param p2, "renderer"    # Lorg/achartengine/renderer/DefaultRenderer;

    .line 224
    invoke-static {p1, p2}, Lorg/achartengine/ChartFactory;->checkParameters(Lorg/achartengine/model/CategorySeries;Lorg/achartengine/renderer/DefaultRenderer;)V

    .line 225
    new-instance v0, Lorg/achartengine/chart/PieChart;

    invoke-direct {v0, p1, p2}, Lorg/achartengine/chart/PieChart;-><init>(Lorg/achartengine/model/CategorySeries;Lorg/achartengine/renderer/DefaultRenderer;)V

    .line 226
    .local v0, "chart":Lorg/achartengine/chart/PieChart;
    new-instance v1, Lorg/achartengine/GraphicalView;

    invoke-direct {v1, p0, v0}, Lorg/achartengine/GraphicalView;-><init>(Landroid/content/Context;Lorg/achartengine/chart/AbstractChart;)V

    return-object v1
.end method

.method public static final getRangeBarChartIntent(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Lorg/achartengine/chart/BarChart$Type;Ljava/lang/String;)Landroid/content/Intent;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .param p3, "type"    # Lorg/achartengine/chart/BarChart$Type;
    .param p4, "activityTitle"    # Ljava/lang/String;

    .line 540
    invoke-static {p1, p2}, Lorg/achartengine/ChartFactory;->checkParameters(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 541
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/achartengine/GraphicalActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 542
    .local v0, "intent":Landroid/content/Intent;
    new-instance v1, Lorg/achartengine/chart/RangeBarChart;

    invoke-direct {v1, p1, p2, p3}, Lorg/achartengine/chart/RangeBarChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Lorg/achartengine/chart/BarChart$Type;)V

    .line 543
    .local v1, "chart":Lorg/achartengine/chart/RangeBarChart;
    const-string v2, "chart"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 544
    const-string v2, "title"

    invoke-virtual {v0, v2, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 545
    return-object v0
.end method

.method public static final getRangeBarChartView(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Lorg/achartengine/chart/BarChart$Type;)Lorg/achartengine/GraphicalView;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .param p3, "type"    # Lorg/achartengine/chart/BarChart$Type;

    .line 181
    invoke-static {p1, p2}, Lorg/achartengine/ChartFactory;->checkParameters(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 182
    new-instance v0, Lorg/achartengine/chart/RangeBarChart;

    invoke-direct {v0, p1, p2, p3}, Lorg/achartengine/chart/RangeBarChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Lorg/achartengine/chart/BarChart$Type;)V

    .line 183
    .local v0, "chart":Lorg/achartengine/chart/XYChart;
    new-instance v1, Lorg/achartengine/GraphicalView;

    invoke-direct {v1, p0, v0}, Lorg/achartengine/GraphicalView;-><init>(Landroid/content/Context;Lorg/achartengine/chart/AbstractChart;)V

    return-object v1
.end method

.method public static final getScatterChartIntent(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)Landroid/content/Intent;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    .line 317
    const-string v0, ""

    invoke-static {p0, p1, p2, v0}, Lorg/achartengine/ChartFactory;->getScatterChartIntent(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static final getScatterChartIntent(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Ljava/lang/String;)Landroid/content/Intent;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .param p3, "activityTitle"    # Ljava/lang/String;

    .line 442
    invoke-static {p1, p2}, Lorg/achartengine/ChartFactory;->checkParameters(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 443
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/achartengine/GraphicalActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 444
    .local v0, "intent":Landroid/content/Intent;
    new-instance v1, Lorg/achartengine/chart/ScatterChart;

    invoke-direct {v1, p1, p2}, Lorg/achartengine/chart/ScatterChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 445
    .local v1, "chart":Lorg/achartengine/chart/XYChart;
    const-string v2, "chart"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 446
    const-string v2, "title"

    invoke-virtual {v0, v2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 447
    return-object v0
.end method

.method public static final getScatterChartView(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)Lorg/achartengine/GraphicalView;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    .line 104
    invoke-static {p1, p2}, Lorg/achartengine/ChartFactory;->checkParameters(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 105
    new-instance v0, Lorg/achartengine/chart/ScatterChart;

    invoke-direct {v0, p1, p2}, Lorg/achartengine/chart/ScatterChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 106
    .local v0, "chart":Lorg/achartengine/chart/XYChart;
    new-instance v1, Lorg/achartengine/GraphicalView;

    invoke-direct {v1, p0, v0}, Lorg/achartengine/GraphicalView;-><init>(Landroid/content/Context;Lorg/achartengine/chart/AbstractChart;)V

    return-object v1
.end method

.method public static final getTimeChartIntent(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Ljava/lang/String;)Landroid/content/Intent;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .param p3, "format"    # Ljava/lang/String;

    .line 353
    const-string v0, ""

    invoke-static {p0, p1, p2, p3, v0}, Lorg/achartengine/ChartFactory;->getTimeChartIntent(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static final getTimeChartIntent(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .param p3, "format"    # Ljava/lang/String;
    .param p4, "activityTitle"    # Ljava/lang/String;

    .line 490
    invoke-static {p1, p2}, Lorg/achartengine/ChartFactory;->checkParameters(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 491
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/achartengine/GraphicalActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 492
    .local v0, "intent":Landroid/content/Intent;
    new-instance v1, Lorg/achartengine/chart/TimeChart;

    invoke-direct {v1, p1, p2}, Lorg/achartengine/chart/TimeChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 493
    .local v1, "chart":Lorg/achartengine/chart/TimeChart;
    invoke-virtual {v1, p3}, Lorg/achartengine/chart/TimeChart;->setDateFormat(Ljava/lang/String;)V

    .line 494
    const-string v2, "chart"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 495
    const-string v2, "title"

    invoke-virtual {v0, v2, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 496
    return-object v0
.end method

.method public static final getTimeChartView(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Ljava/lang/String;)Lorg/achartengine/GraphicalView;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .param p3, "format"    # Ljava/lang/String;

    .line 142
    invoke-static {p1, p2}, Lorg/achartengine/ChartFactory;->checkParameters(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 143
    new-instance v0, Lorg/achartengine/chart/TimeChart;

    invoke-direct {v0, p1, p2}, Lorg/achartengine/chart/TimeChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 144
    .local v0, "chart":Lorg/achartengine/chart/TimeChart;
    invoke-virtual {v0, p3}, Lorg/achartengine/chart/TimeChart;->setDateFormat(Ljava/lang/String;)V

    .line 145
    new-instance v1, Lorg/achartengine/GraphicalView;

    invoke-direct {v1, p0, v0}, Lorg/achartengine/GraphicalView;-><init>(Landroid/content/Context;Lorg/achartengine/chart/AbstractChart;)V

    return-object v1
.end method
