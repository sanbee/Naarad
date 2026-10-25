.class public Lnaarad/client/tabhost/MainActivity;
.super Landroid/support/v4/app/FragmentActivity;
.source "MainActivity.java"

# interfaces
.implements Landroid/widget/TabHost$OnTabChangeListener;
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;
.implements Lnaarad/client/tabhost/NaaradPlotFragment$nPlotDataArrivalListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnaarad/client/tabhost/MainActivity$mRunnable;
    }
.end annotation


# instance fields
.field private b1:Landroid/widget/TextView;

.field private gControlFragment:Lnaarad/client/tabhost/NaaradControlFragment;

.field private gRunnableBlinker:Lnaarad/client/tabhost/MainActivity$mRunnable;

.field private gUIHandler:Landroid/os/Handler;

.field private mTabHost:Landroid/widget/TabHost;

.field private mViewPager:Lnaarad/client/tabhost/MyViewPager;

.field pageAdapter:Lnaarad/client/tabhost/MyPageAdapter;

.field private tab1Label:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 26
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    .line 32
    const/4 v0, 0x0

    iput-object v0, p0, Lnaarad/client/tabhost/MainActivity;->mViewPager:Lnaarad/client/tabhost/MyViewPager;

    .line 35
    iput-object v0, p0, Lnaarad/client/tabhost/MainActivity;->b1:Landroid/widget/TextView;

    return-void
.end method

.method private static AddTab(Lnaarad/client/tabhost/MainActivity;Landroid/widget/TabHost;Landroid/widget/TabHost$TabSpec;)V
    .locals 1
    .param p0, "activity"    # Lnaarad/client/tabhost/MainActivity;
    .param p1, "tabHost"    # Landroid/widget/TabHost;
    .param p2, "tabSpec"    # Landroid/widget/TabHost$TabSpec;

    .line 120
    new-instance v0, Lnaarad/client/tabhost/MyTabFactory;

    invoke-direct {v0, p0}, Lnaarad/client/tabhost/MyTabFactory;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2, v0}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/widget/TabHost$TabContentFactory;)Landroid/widget/TabHost$TabSpec;

    .line 121
    invoke-virtual {p1, p2}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    .line 122
    return-void
.end method

.method static synthetic access$000(Lnaarad/client/tabhost/MainActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lnaarad/client/tabhost/MainActivity;

    .line 26
    iget-object v0, p0, Lnaarad/client/tabhost/MainActivity;->b1:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$100(Lnaarad/client/tabhost/MainActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lnaarad/client/tabhost/MainActivity;

    .line 26
    iget-object v0, p0, Lnaarad/client/tabhost/MainActivity;->tab1Label:Landroid/widget/TextView;

    return-object v0
.end method

.method private getFragments()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/support/v4/app/Fragment;",
            ">;"
        }
    .end annotation

    .line 150
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 154
    .local v0, "fList":Ljava/util/List;, "Ljava/util/List<Landroid/support/v4/app/Fragment;>;"
    const-string v1, "Naarad Control Fragment"

    invoke-static {v1}, Lnaarad/client/tabhost/NaaradControlFragment;->newInstance(Ljava/lang/String;)Lnaarad/client/tabhost/NaaradControlFragment;

    move-result-object v1

    .line 156
    .local v1, "f1":Lnaarad/client/tabhost/NaaradControlFragment;
    iput-object v1, p0, Lnaarad/client/tabhost/MainActivity;->gControlFragment:Lnaarad/client/tabhost/NaaradControlFragment;

    .line 157
    iget-object v2, p0, Lnaarad/client/tabhost/MainActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v2}, Landroid/widget/TabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/TabWidget;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    const v3, 0x1020016

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lnaarad/client/tabhost/MainActivity;->tab1Label:Landroid/widget/TextView;

    .line 160
    const-string v2, "Naarad Plot Fragment"

    invoke-static {v2}, Lnaarad/client/tabhost/NaaradPlotFragment;->newInstanceNPF(Ljava/lang/String;)Lnaarad/client/tabhost/NaaradPlotFragment;

    move-result-object v2

    .line 164
    .local v2, "f2":Lnaarad/client/tabhost/NaaradPlotFragment;
    const-string v3, "Naarad Setting Fragment"

    invoke-static {v3}, Lnaarad/client/tabhost/NaaradSettingFragment;->newInstanceNSF(Ljava/lang/String;)Lnaarad/client/tabhost/NaaradSettingFragment;

    move-result-object v3

    .line 167
    .local v3, "f3":Lnaarad/client/tabhost/NaaradSettingFragment;
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 171
    return-object v0
.end method

.method private initialiseTabHost()V
    .locals 3

    .line 177
    const v0, 0x1020012

    invoke-virtual {p0, v0}, Lnaarad/client/tabhost/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TabHost;

    iput-object v0, p0, Lnaarad/client/tabhost/MainActivity;->mTabHost:Landroid/widget/TabHost;

    .line 178
    iget-object v0, p0, Lnaarad/client/tabhost/MainActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0}, Landroid/widget/TabHost;->setup()V

    .line 181
    iget-object v0, p0, Lnaarad/client/tabhost/MainActivity;->mTabHost:Landroid/widget/TabHost;

    .line 182
    const-string v1, "Controls"

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/widget/TabHost$TabSpec;->setIndicator(Ljava/lang/CharSequence;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    .line 181
    invoke-static {p0, v0, v1}, Lnaarad/client/tabhost/MainActivity;->AddTab(Lnaarad/client/tabhost/MainActivity;Landroid/widget/TabHost;Landroid/widget/TabHost$TabSpec;)V

    .line 183
    iget-object v0, p0, Lnaarad/client/tabhost/MainActivity;->mTabHost:Landroid/widget/TabHost;

    .line 184
    const-string v1, "Sensors  "

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/widget/TabHost$TabSpec;->setIndicator(Ljava/lang/CharSequence;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    .line 183
    invoke-static {p0, v0, v1}, Lnaarad/client/tabhost/MainActivity;->AddTab(Lnaarad/client/tabhost/MainActivity;Landroid/widget/TabHost;Landroid/widget/TabHost$TabSpec;)V

    .line 185
    iget-object v0, p0, Lnaarad/client/tabhost/MainActivity;->mTabHost:Landroid/widget/TabHost;

    .line 186
    const-string v1, "Settings"

    invoke-virtual {v0, v1}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/widget/TabHost$TabSpec;->setIndicator(Ljava/lang/CharSequence;)Landroid/widget/TabHost$TabSpec;

    move-result-object v1

    .line 185
    invoke-static {p0, v0, v1}, Lnaarad/client/tabhost/MainActivity;->AddTab(Lnaarad/client/tabhost/MainActivity;Landroid/widget/TabHost;Landroid/widget/TabHost$TabSpec;)V

    .line 187
    iget-object v0, p0, Lnaarad/client/tabhost/MainActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0}, Landroid/widget/TabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TabWidget;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    const/16 v1, 0x28

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 188
    iget-object v0, p0, Lnaarad/client/tabhost/MainActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0}, Landroid/widget/TabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/widget/TabWidget;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 189
    iget-object v0, p0, Lnaarad/client/tabhost/MainActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0}, Landroid/widget/TabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v0

    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Landroid/widget/TabWidget;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 190
    iget-object v0, p0, Lnaarad/client/tabhost/MainActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0, p0}, Landroid/widget/TabHost;->setOnTabChangedListener(Landroid/widget/TabHost$OnTabChangeListener;)V

    .line 191
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 94
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 95
    const/high16 v0, 0x7f050000

    invoke-virtual {p0, v0}, Lnaarad/client/tabhost/MainActivity;->setContentView(I)V

    .line 97
    iget-object v0, p0, Lnaarad/client/tabhost/MainActivity;->mViewPager:Lnaarad/client/tabhost/MyViewPager;

    if-nez v0, :cond_0

    .line 98
    const v0, 0x7f030018

    invoke-virtual {p0, v0}, Lnaarad/client/tabhost/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lnaarad/client/tabhost/MyViewPager;

    iput-object v0, p0, Lnaarad/client/tabhost/MainActivity;->mViewPager:Lnaarad/client/tabhost/MyViewPager;

    .line 101
    :cond_0
    invoke-direct {p0}, Lnaarad/client/tabhost/MainActivity;->initialiseTabHost()V

    .line 104
    invoke-direct {p0}, Lnaarad/client/tabhost/MainActivity;->getFragments()Ljava/util/List;

    move-result-object v0

    .line 105
    .local v0, "fragments":Ljava/util/List;, "Ljava/util/List<Landroid/support/v4/app/Fragment;>;"
    new-instance v1, Lnaarad/client/tabhost/MyPageAdapter;

    invoke-virtual {p0}, Lnaarad/client/tabhost/MainActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lnaarad/client/tabhost/MyPageAdapter;-><init>(Landroid/support/v4/app/FragmentManager;Ljava/util/List;)V

    iput-object v1, p0, Lnaarad/client/tabhost/MainActivity;->pageAdapter:Lnaarad/client/tabhost/MyPageAdapter;

    .line 106
    iget-object v1, p0, Lnaarad/client/tabhost/MainActivity;->mViewPager:Lnaarad/client/tabhost/MyViewPager;

    iget-object v2, p0, Lnaarad/client/tabhost/MainActivity;->pageAdapter:Lnaarad/client/tabhost/MyPageAdapter;

    invoke-virtual {v1, v2}, Lnaarad/client/tabhost/MyViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 107
    iget-object v1, p0, Lnaarad/client/tabhost/MainActivity;->mViewPager:Lnaarad/client/tabhost/MyViewPager;

    invoke-virtual {v1, p0}, Lnaarad/client/tabhost/MyViewPager;->setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 112
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lnaarad/client/tabhost/MainActivity;->gUIHandler:Landroid/os/Handler;

    .line 113
    new-instance v1, Lnaarad/client/tabhost/MainActivity$mRunnable;

    invoke-direct {v1, p0}, Lnaarad/client/tabhost/MainActivity$mRunnable;-><init>(Lnaarad/client/tabhost/MainActivity;)V

    iput-object v1, p0, Lnaarad/client/tabhost/MainActivity;->gRunnableBlinker:Lnaarad/client/tabhost/MainActivity$mRunnable;

    .line 114
    return-void
.end method

.method public onDataArrival(Ljava/lang/String;)V
    .locals 4
    .param p1, "json"    # Ljava/lang/String;

    .line 69
    iget-object v0, p0, Lnaarad/client/tabhost/MainActivity;->gControlFragment:Lnaarad/client/tabhost/NaaradControlFragment;

    invoke-virtual {v0, p1}, Lnaarad/client/tabhost/NaaradControlFragment;->setSensorValues(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v0

    iput-object v0, p0, Lnaarad/client/tabhost/MainActivity;->b1:Landroid/widget/TextView;

    .line 71
    iget-object v0, p0, Lnaarad/client/tabhost/MainActivity;->gRunnableBlinker:Lnaarad/client/tabhost/MainActivity$mRunnable;

    const-string v1, "Sensors ."

    const v2, -0xff0100

    invoke-virtual {v0, v1, v2}, Lnaarad/client/tabhost/MainActivity$mRunnable;->setText(Ljava/lang/String;I)V

    iget-object v0, p0, Lnaarad/client/tabhost/MainActivity;->gUIHandler:Landroid/os/Handler;

    iget-object v1, p0, Lnaarad/client/tabhost/MainActivity;->gRunnableBlinker:Lnaarad/client/tabhost/MainActivity$mRunnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 72
    iget-object v0, p0, Lnaarad/client/tabhost/MainActivity;->gRunnableBlinker:Lnaarad/client/tabhost/MainActivity$mRunnable;

    const-string v1, "Sensors  "

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Lnaarad/client/tabhost/MainActivity$mRunnable;->setText(Ljava/lang/String;I)V

    iget-object v0, p0, Lnaarad/client/tabhost/MainActivity;->gUIHandler:Landroid/os/Handler;

    iget-object v1, p0, Lnaarad/client/tabhost/MainActivity;->gRunnableBlinker:Lnaarad/client/tabhost/MainActivity$mRunnable;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 73
    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0
    .param p1, "arg0"    # I

    .line 196
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 2
    .param p1, "arg0"    # I
    .param p2, "arg1"    # F
    .param p3, "arg2"    # I

    .line 136
    iget-object v0, p0, Lnaarad/client/tabhost/MainActivity;->mViewPager:Lnaarad/client/tabhost/MyViewPager;

    invoke-virtual {v0}, Lnaarad/client/tabhost/MyViewPager;->getCurrentItem()I

    move-result v0

    .line 137
    .local v0, "pos":I
    iget-object v1, p0, Lnaarad/client/tabhost/MainActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v1, v0}, Landroid/widget/TabHost;->setCurrentTab(I)V

    .line 145
    return-void
.end method

.method public onPageSelected(I)V
    .locals 0
    .param p1, "arg0"    # I

    .line 197
    return-void
.end method

.method protected onResume()V
    .locals 1

    .line 89
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onResume()V

    .line 90
    iget-object v0, p0, Lnaarad/client/tabhost/MainActivity;->mViewPager:Lnaarad/client/tabhost/MyViewPager;

    if-nez v0, :cond_0

    const v0, 0x7f030018

    invoke-virtual {p0, v0}, Lnaarad/client/tabhost/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lnaarad/client/tabhost/MyViewPager;

    iput-object v0, p0, Lnaarad/client/tabhost/MainActivity;->mViewPager:Lnaarad/client/tabhost/MyViewPager;

    .line 91
    :cond_0
    return-void
.end method

.method public onTabChanged(Ljava/lang/String;)V
    .locals 2
    .param p1, "tag"    # Ljava/lang/String;

    .line 127
    iget-object v0, p0, Lnaarad/client/tabhost/MainActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0}, Landroid/widget/TabHost;->getCurrentTab()I

    move-result v0

    .line 128
    .local v0, "pos":I
    iget-object v1, p0, Lnaarad/client/tabhost/MainActivity;->mViewPager:Lnaarad/client/tabhost/MyViewPager;

    invoke-virtual {v1, v0}, Lnaarad/client/tabhost/MyViewPager;->setCurrentItem(I)V

    .line 131
    return-void
.end method
