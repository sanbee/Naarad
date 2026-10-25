.class public Lnaarad/client/tabhost/NaaradPlotFragment;
.super Lnaarad/client/tabhost/NaaradAbstractFragment;
.source "NaaradPlotFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;,
        Lnaarad/client/tabhost/NaaradPlotFragment$nPlotDataArrivalListener;
    }
.end annotation


# static fields
.field private static mView:Landroid/view/View;


# instance fields
.field private apiLevel:I

.field private index:I

.field private mAdd:Landroid/widget/Button;

.field private mChartView:Lorg/achartengine/GraphicalView;

.field private mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

.field private mDateFormat:Ljava/lang/String;

.field mMainActivityCallback:Lnaarad/client/tabhost/NaaradPlotFragment$nPlotDataArrivalListener;

.field private mNewSeries:Landroid/widget/Button;

.field private mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

.field protected mSensorDataSource:Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;

.field private mTimeChartView:Lorg/achartengine/GraphicalView;

.field private messsage:Ljava/lang/String;

.field public myApp:Lnaarad/client/tabhost/NaaradApp;

.field private myThread:Ljava/lang/Thread;

.field private nConnected:Z

.field private plotButton:Landroid/widget/ToggleButton;

.field private renderer0:Lorg/achartengine/renderer/XYSeriesRenderer;

.field private series0:Lorg/achartengine/model/XYSeries;

.field private textField:Landroid/widget/EditText;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 96
    invoke-direct {p0}, Lnaarad/client/tabhost/NaaradAbstractFragment;-><init>()V

    .line 98
    new-instance v0, Lorg/achartengine/model/XYMultipleSeriesDataset;

    invoke-direct {v0}, Lorg/achartengine/model/XYMultipleSeriesDataset;-><init>()V

    iput-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    .line 99
    new-instance v0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-direct {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;-><init>()V

    iput-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    .line 105
    const/4 v0, 0x0

    iput v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->index:I

    .line 129
    iput-boolean v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->nConnected:Z

    return-void
.end method

.method static synthetic access$002(Lnaarad/client/tabhost/NaaradPlotFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lnaarad/client/tabhost/NaaradPlotFragment;
    .param p1, "x1"    # Z

    .line 96
    iput-boolean p1, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->nConnected:Z

    return p1
.end method

.method static synthetic access$100(Lnaarad/client/tabhost/NaaradPlotFragment;)Lorg/achartengine/GraphicalView;
    .locals 1
    .param p0, "x0"    # Lnaarad/client/tabhost/NaaradPlotFragment;

    .line 96
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mTimeChartView:Lorg/achartengine/GraphicalView;

    return-object v0
.end method

.method static synthetic access$200(Lnaarad/client/tabhost/NaaradPlotFragment;)Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .locals 1
    .param p0, "x0"    # Lnaarad/client/tabhost/NaaradPlotFragment;

    .line 96
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    return-object v0
.end method

.method private generateRandomNum(I)I
    .locals 2
    .param p1, "n"    # I

    .line 419
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 420
    .local v0, "randomGenerator":Ljava/util/Random;
    invoke-virtual {v0, p1}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    .line 421
    .local v1, "randomVal":I
    return v1
.end method

.method private initMultiRenderer(Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V
    .locals 5
    .param p1, "multiRenderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    .line 327
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setApplyBackgroundColor(Z)V

    .line 328
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    const/16 v2, 0x32

    const/16 v3, 0x64

    invoke-static {v3, v2, v2, v2}, Landroid/graphics/Color;->argb(IIII)I

    move-result v2

    invoke-virtual {v0, v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setBackgroundColor(I)V

    .line 329
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    const/high16 v2, 0x41200000    # 10.0f

    invoke-virtual {v0, v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setAxisTitleTextSize(F)V

    .line 330
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0, v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setChartTitleTextSize(F)V

    .line 331
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0, v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setLabelsTextSize(F)V

    .line 332
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0, v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setLegendTextSize(F)V

    .line 333
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    const/4 v2, 0x4

    new-array v2, v2, [I

    fill-array-data v2, :array_0

    invoke-virtual {v0, v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setMargins([I)V

    .line 334
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setZoomButtonsVisible(Z)V

    .line 335
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    const/high16 v3, 0x40000000    # 2.0f

    invoke-virtual {v0, v3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setPointSize(F)V

    .line 336
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    const-string v3, ""

    invoke-virtual {v0, v3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setXTitle(Ljava/lang/String;)V

    .line 337
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    const-string v3, "Temperature"

    invoke-virtual {v0, v3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setYTitle(Ljava/lang/String;)V

    .line 338
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0, v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setShowGrid(Z)V

    .line 339
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0, v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setShowLegend(Z)V

    .line 341
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    const/16 v3, 0xa

    invoke-virtual {v0, v3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setXLabels(I)V

    .line 342
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0, v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setClickEnabled(Z)V

    .line 343
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0, v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setPanEnabled(Z)V

    .line 345
    invoke-virtual {p0}, Lnaarad/client/tabhost/NaaradPlotFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 346
    .local v0, "metrics":Landroid/util/DisplayMetrics;
    const/4 v2, 0x2

    const/high16 v3, 0x41400000    # 12.0f

    invoke-static {v2, v3, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v3

    .line 347
    .local v3, "val":F
    iget-object v4, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4, v3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setLabelsTextSize(F)V

    .line 348
    const/high16 v4, 0x41000000    # 8.0f

    invoke-static {v2, v4, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    .line 349
    .end local v3    # "val":F
    .local v2, "val":F
    iget-object v3, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    const-string v4, "sans_serif"

    invoke-virtual {v3, v4, v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setTextTypeface(Ljava/lang/String;I)V

    .line 350
    return-void

    :array_0
    .array-data 4
        0x2
        0x14
        0x14
        0x2
    .end array-data
.end method

.method private makeSeries(Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Lorg/achartengine/model/XYMultipleSeriesDataset;I)V
    .locals 5
    .param p1, "multiRenderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .param p2, "multiDataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p3, "color"    # I

    .line 311
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Series "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesCount()I

    move-result v1

    const/4 v2, 0x1

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 312
    .local v0, "seriesTitle":Ljava/lang/String;
    new-instance v1, Lorg/achartengine/model/XYSeries;

    invoke-direct {v1, v0}, Lorg/achartengine/model/XYSeries;-><init>(Ljava/lang/String;)V

    .line 313
    .local v1, "series0":Lorg/achartengine/model/XYSeries;
    invoke-virtual {p2, v1}, Lorg/achartengine/model/XYMultipleSeriesDataset;->addSeries(Lorg/achartengine/model/XYSeries;)V

    .line 314
    new-instance v3, Lorg/achartengine/renderer/XYSeriesRenderer;

    invoke-direct {v3}, Lorg/achartengine/renderer/XYSeriesRenderer;-><init>()V

    .line 315
    .local v3, "renderer0":Lorg/achartengine/renderer/XYSeriesRenderer;
    sget-object v4, Lorg/achartengine/chart/PointStyle;->CIRCLE:Lorg/achartengine/chart/PointStyle;

    invoke-virtual {v3, v4}, Lorg/achartengine/renderer/XYSeriesRenderer;->setPointStyle(Lorg/achartengine/chart/PointStyle;)V

    .line 316
    invoke-virtual {v3, v2}, Lorg/achartengine/renderer/XYSeriesRenderer;->setFillPoints(Z)V

    .line 317
    invoke-virtual {p0}, Lnaarad/client/tabhost/NaaradPlotFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->scaledDensity:F

    const/high16 v4, 0x40000000    # 2.0f

    mul-float v2, v2, v4

    invoke-virtual {v3, v2}, Lorg/achartengine/renderer/XYSeriesRenderer;->setLineWidth(F)V

    .line 319
    invoke-virtual {v3, p3}, Lorg/achartengine/renderer/XYSeriesRenderer;->setColor(I)V

    .line 320
    invoke-virtual {p1, v3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->addSeriesRenderer(Lorg/achartengine/renderer/SimpleSeriesRenderer;)V

    .line 321
    return-void
.end method

.method public static final newInstanceNPF(Ljava/lang/String;)Lnaarad/client/tabhost/NaaradPlotFragment;
    .locals 3
    .param p0, "sampleText"    # Ljava/lang/String;

    .line 295
    new-instance v0, Lnaarad/client/tabhost/NaaradPlotFragment;

    invoke-direct {v0}, Lnaarad/client/tabhost/NaaradPlotFragment;-><init>()V

    .line 297
    .local v0, "f":Lnaarad/client/tabhost/NaaradPlotFragment;
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 298
    .local v1, "b":Landroid/os/Bundle;
    const-string v2, "bString"

    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 299
    invoke-virtual {v0, v1}, Lnaarad/client/tabhost/NaaradPlotFragment;->setArguments(Landroid/os/Bundle;)V

    .line 301
    return-object v0
.end method


# virtual methods
.method public makeChart(Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Lorg/achartengine/model/XYMultipleSeriesDataset;)V
    .locals 4
    .param p1, "multiRenderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .param p2, "multiDataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;

    .line 357
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "#### makeChart"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 360
    invoke-virtual {p0}, Lnaarad/client/tabhost/NaaradPlotFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget-object v1, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    iget-object v2, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    const-string v3, "hh:mm:ss\ndd/MM"

    invoke-static {v0, v1, v2, v3}, Lorg/achartengine/ChartFactory;->getTimeChartView(Landroid/content/Context;Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Ljava/lang/String;)Lorg/achartengine/GraphicalView;

    move-result-object v0

    iput-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mTimeChartView:Lorg/achartengine/GraphicalView;

    .line 362
    sget-object v0, Lnaarad/client/tabhost/NaaradPlotFragment;->mView:Landroid/view/View;

    const v1, 0x7f030001

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 363
    .local v0, "layout":Landroid/widget/LinearLayout;
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 364
    .local v1, "lp":Landroid/view/ViewGroup$LayoutParams;
    iget-object v2, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mTimeChartView:Lorg/achartengine/GraphicalView;

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 365
    const/4 v2, 0x1

    iput-boolean v2, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->nConnected:Z

    .line 366
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 165
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    iput v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->apiLevel:I

    .line 166
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "NPF onCreateView()"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 170
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lnaarad/client/tabhost/NaaradPlotFragment;->setHasOptionsMenu(Z)V

    .line 171
    invoke-virtual {p0, v0}, Lnaarad/client/tabhost/NaaradPlotFragment;->setRetainInstance(Z)V

    .line 172
    invoke-virtual {p0}, Lnaarad/client/tabhost/NaaradPlotFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lnaarad/client/tabhost/NaaradApp;

    iput-object v1, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    .line 174
    sget-object v1, Lnaarad/client/tabhost/NaaradPlotFragment;->mView:Landroid/view/View;

    invoke-virtual {p0, v1}, Lnaarad/client/tabhost/NaaradPlotFragment;->recreateView(Landroid/view/View;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 175
    const v1, 0x7f050006

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    sput-object v1, Lnaarad/client/tabhost/NaaradPlotFragment;->mView:Landroid/view/View;

    .line 182
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lnaarad/client/tabhost/NaaradPlotFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    check-cast v1, Lnaarad/client/tabhost/NaaradPlotFragment$nPlotDataArrivalListener;

    iput-object v1, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mMainActivityCallback:Lnaarad/client/tabhost/NaaradPlotFragment$nPlotDataArrivalListener;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 188
    nop

    .line 196
    iget-object v1, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-direct {p0, v1}, Lnaarad/client/tabhost/NaaradPlotFragment;->initMultiRenderer(Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 197
    iget-object v1, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    iget-object v2, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    const v3, -0xff0100

    invoke-direct {p0, v1, v2, v3}, Lnaarad/client/tabhost/NaaradPlotFragment;->makeSeries(Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Lorg/achartengine/model/XYMultipleSeriesDataset;I)V

    .line 198
    iget-object v1, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    iget-object v2, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    const v3, -0xffff01

    invoke-direct {p0, v1, v2, v3}, Lnaarad/client/tabhost/NaaradPlotFragment;->makeSeries(Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Lorg/achartengine/model/XYMultipleSeriesDataset;I)V

    .line 202
    sget-object v1, Lnaarad/client/tabhost/NaaradPlotFragment;->mView:Landroid/view/View;

    const v2, 0x7f03000f

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ToggleButton;

    iput-object v1, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->plotButton:Landroid/widget/ToggleButton;

    .line 203
    iget-object v1, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->plotButton:Landroid/widget/ToggleButton;

    invoke-virtual {v1, v0}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 204
    iput-boolean v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->nConnected:Z

    .line 205
    const/4 v1, -0x1

    invoke-virtual {p0, v1}, Lnaarad/client/tabhost/NaaradPlotFragment;->startAllCharts(I)V

    .line 206
    invoke-virtual {p0, v0}, Lnaarad/client/tabhost/NaaradPlotFragment;->stopAllCharts(I)V

    .line 207
    invoke-virtual {p0, v1}, Lnaarad/client/tabhost/NaaradPlotFragment;->startAllCharts(I)V

    .line 211
    new-instance v0, Lnaarad/client/tabhost/NaaradPlotFragment$1;

    invoke-direct {v0, p0}, Lnaarad/client/tabhost/NaaradPlotFragment$1;-><init>(Lnaarad/client/tabhost/NaaradPlotFragment;)V

    .line 248
    .local v0, "plotButtonHandler":Landroid/view/View$OnClickListener;
    iget-object v1, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->plotButton:Landroid/widget/ToggleButton;

    invoke-virtual {v1, v0}, Landroid/widget/ToggleButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 252
    sget-object v1, Lnaarad/client/tabhost/NaaradPlotFragment;->mView:Landroid/view/View;

    return-object v1

    .line 184
    .end local v0    # "plotButtonHandler":Landroid/view/View$OnClickListener;
    :catch_0
    move-exception v0

    .line 186
    .local v0, "e":Ljava/lang/ClassCastException;
    new-instance v1, Ljava/lang/ClassCastException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lnaarad/client/tabhost/NaaradPlotFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " must implement mMainActivityCallback"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public onDestroy()V
    .locals 2

    .line 261
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "NPF destroyed"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 262
    invoke-super {p0}, Lnaarad/client/tabhost/NaaradAbstractFragment;->onDestroy()V

    .line 269
    return-void
.end method

.method public onPause()V
    .locals 2

    .line 281
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "NPF paused"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 282
    invoke-super {p0}, Lnaarad/client/tabhost/NaaradAbstractFragment;->onPause()V

    .line 289
    return-void
.end method

.method public onResume()V
    .locals 2

    .line 272
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "NPF resumed"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 273
    invoke-super {p0}, Lnaarad/client/tabhost/NaaradAbstractFragment;->onResume()V

    .line 274
    return-void
.end method

.method public startAllCharts(I)V
    .locals 7
    .param p1, "n"    # I

    .line 373
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 v1, 0x0

    .local v1, "m0":I
    const/4 v2, 0x2

    .local v2, "m1":I
    goto :goto_0

    .line 374
    .end local v1    # "m0":I
    .end local v2    # "m1":I
    :cond_0
    move v1, p1

    .restart local v1    # "m0":I
    add-int/lit8 v2, p1, 0x1

    .line 376
    .restart local v2    # "m1":I
    :goto_0
    iget-object v3, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    iget-object v4, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    invoke-virtual {p0, v3, v4}, Lnaarad/client/tabhost/NaaradPlotFragment;->makeChart(Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Lorg/achartengine/model/XYMultipleSeriesDataset;)V

    .line 378
    if-eqz p1, :cond_1

    if-ne p1, v0, :cond_3

    .line 385
    :cond_1
    new-instance v0, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;

    invoke-direct {v0, p0}, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;-><init>(Lnaarad/client/tabhost/NaaradPlotFragment;)V

    iput-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mSensorDataSource:Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;

    .line 394
    iget v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->apiLevel:I

    const/16 v3, 0x9

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-gt v0, v3, :cond_2

    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mSensorDataSource:Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;

    new-array v3, v5, [Lorg/achartengine/model/XYMultipleSeriesDataset;

    iget-object v5, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    aput-object v5, v3, v4

    invoke-virtual {v0, v3}, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_1

    .line 395
    :cond_2
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mSensorDataSource:Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;

    sget-object v3, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v5, v5, [Lorg/achartengine/model/XYMultipleSeriesDataset;

    iget-object v6, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    aput-object v6, v5, v4

    invoke-virtual {v0, v3, v5}, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 402
    :cond_3
    :goto_1
    return-void
.end method

.method public stopAllCharts(I)V
    .locals 2
    .param p1, "n"    # I

    .line 408
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mSensorDataSource:Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->cancel(Z)Z

    .line 410
    :cond_0
    return-void
.end method

.method public stopDataSource()V
    .locals 1

    .line 256
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment;->mSensorDataSource:Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lnaarad/client/tabhost/NaaradPlotFragment$SensorDataSource;->finish()V

    .line 258
    :cond_0
    return-void
.end method
