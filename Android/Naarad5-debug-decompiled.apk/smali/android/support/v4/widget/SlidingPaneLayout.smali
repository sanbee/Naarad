.class public Landroid/support/v4/widget/SlidingPaneLayout;
.super Landroid/view/ViewGroup;
.source "SlidingPaneLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/widget/SlidingPaneLayout$DisableLayerRunnable;,
        Landroid/support/v4/widget/SlidingPaneLayout$AccessibilityDelegate;,
        Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImplJBMR1;,
        Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImplJB;,
        Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImplBase;,
        Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImpl;,
        Landroid/support/v4/widget/SlidingPaneLayout$SavedState;,
        Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;,
        Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;,
        Landroid/support/v4/widget/SlidingPaneLayout$SimplePanelSlideListener;,
        Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;
    }
.end annotation


# static fields
.field private static final DEFAULT_FADE_COLOR:I = -0x33333334

.field private static final DEFAULT_OVERHANG_SIZE:I = 0x20

.field static final IMPL:Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImpl;

.field private static final MIN_FLING_VELOCITY:I = 0x190

.field private static final TAG:Ljava/lang/String; = "SlidingPaneLayout"


# instance fields
.field private mCanSlide:Z

.field private mCoveredFadeColor:I

.field private final mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

.field private mFirstLayout:Z

.field private mInitialMotionX:F

.field private mInitialMotionY:F

.field private mIsUnableToDrag:Z

.field private final mOverhangSize:I

.field private mPanelSlideListener:Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;

.field private mParallaxBy:I

.field private mParallaxOffset:F

.field private final mPostedRunnables:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/support/v4/widget/SlidingPaneLayout$DisableLayerRunnable;",
            ">;"
        }
    .end annotation
.end field

.field private mPreservedOpenState:Z

.field private mShadowDrawable:Landroid/graphics/drawable/Drawable;

.field private mSlideOffset:F

.field private mSlideRange:I

.field private mSlideableView:Landroid/view/View;

.field private mSliderFadeColor:I

.field private final mTmpRect:Landroid/graphics/Rect;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 192
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 193
    .local v0, "deviceVersion":I
    const/16 v1, 0x11

    if-lt v0, v1, :cond_0

    .line 194
    new-instance v1, Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImplJBMR1;

    invoke-direct {v1}, Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImplJBMR1;-><init>()V

    sput-object v1, Landroid/support/v4/widget/SlidingPaneLayout;->IMPL:Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImpl;

    goto :goto_0

    .line 195
    :cond_0
    const/16 v1, 0x10

    if-lt v0, v1, :cond_1

    .line 196
    new-instance v1, Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImplJB;

    invoke-direct {v1}, Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImplJB;-><init>()V

    sput-object v1, Landroid/support/v4/widget/SlidingPaneLayout;->IMPL:Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImpl;

    goto :goto_0

    .line 198
    :cond_1
    new-instance v1, Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImplBase;

    invoke-direct {v1}, Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImplBase;-><init>()V

    sput-object v1, Landroid/support/v4/widget/SlidingPaneLayout;->IMPL:Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImpl;

    .line 200
    .end local v0    # "deviceVersion":I
    :goto_0
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 244
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v4/widget/SlidingPaneLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 245
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 248
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v4/widget/SlidingPaneLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 249
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .line 252
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 107
    const v0, -0x33333334

    iput v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSliderFadeColor:I

    .line 182
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mFirstLayout:Z

    .line 184
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mTmpRect:Landroid/graphics/Rect;

    .line 186
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPostedRunnables:Ljava/util/ArrayList;

    .line 254
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    .line 255
    .local v1, "density":F
    const/high16 v2, 0x42000000    # 32.0f

    mul-float v2, v2, v1

    const/high16 v3, 0x3f000000    # 0.5f

    add-float/2addr v2, v3

    float-to-int v2, v2

    iput v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mOverhangSize:I

    .line 257
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v2

    .line 259
    .local v2, "viewConfig":Landroid/view/ViewConfiguration;
    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Landroid/support/v4/widget/SlidingPaneLayout;->setWillNotDraw(Z)V

    .line 261
    new-instance v4, Landroid/support/v4/widget/SlidingPaneLayout$AccessibilityDelegate;

    invoke-direct {v4, p0}, Landroid/support/v4/widget/SlidingPaneLayout$AccessibilityDelegate;-><init>(Landroid/support/v4/widget/SlidingPaneLayout;)V

    invoke-static {p0, v4}, Landroid/support/v4/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroid/support/v4/view/AccessibilityDelegateCompat;)V

    .line 262
    invoke-static {p0, v0}, Landroid/support/v4/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    .line 264
    new-instance v4, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;

    const/4 v5, 0x0

    invoke-direct {v4, p0, v5}, Landroid/support/v4/widget/SlidingPaneLayout$DragHelperCallback;-><init>(Landroid/support/v4/widget/SlidingPaneLayout;Landroid/support/v4/widget/SlidingPaneLayout$1;)V

    invoke-static {p0, v3, v4}, Landroid/support/v4/widget/ViewDragHelper;->create(Landroid/view/ViewGroup;FLandroid/support/v4/widget/ViewDragHelper$Callback;)Landroid/support/v4/widget/ViewDragHelper;

    move-result-object v3

    iput-object v3, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    .line 265
    iget-object v3, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v3, v0}, Landroid/support/v4/widget/ViewDragHelper;->setEdgeTrackingEnabled(I)V

    .line 266
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    const/high16 v3, 0x43c80000    # 400.0f

    mul-float v3, v3, v1

    invoke-virtual {v0, v3}, Landroid/support/v4/widget/ViewDragHelper;->setMinVelocity(F)V

    .line 267
    return-void
.end method

.method static synthetic access$100(Landroid/support/v4/widget/SlidingPaneLayout;)Z
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/widget/SlidingPaneLayout;

    .line 88
    iget-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mIsUnableToDrag:Z

    return v0
.end method

.method static synthetic access$1000(Landroid/support/v4/widget/SlidingPaneLayout;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/widget/SlidingPaneLayout;

    .line 88
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPostedRunnables:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$200(Landroid/support/v4/widget/SlidingPaneLayout;)Landroid/support/v4/widget/ViewDragHelper;
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/widget/SlidingPaneLayout;

    .line 88
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    return-object v0
.end method

.method static synthetic access$300(Landroid/support/v4/widget/SlidingPaneLayout;)F
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/widget/SlidingPaneLayout;

    .line 88
    iget v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    return v0
.end method

.method static synthetic access$400(Landroid/support/v4/widget/SlidingPaneLayout;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/widget/SlidingPaneLayout;

    .line 88
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$502(Landroid/support/v4/widget/SlidingPaneLayout;Z)Z
    .locals 0
    .param p0, "x0"    # Landroid/support/v4/widget/SlidingPaneLayout;
    .param p1, "x1"    # Z

    .line 88
    iput-boolean p1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPreservedOpenState:Z

    return p1
.end method

.method static synthetic access$600(Landroid/support/v4/widget/SlidingPaneLayout;I)V
    .locals 0
    .param p0, "x0"    # Landroid/support/v4/widget/SlidingPaneLayout;
    .param p1, "x1"    # I

    .line 88
    invoke-direct {p0, p1}, Landroid/support/v4/widget/SlidingPaneLayout;->onPanelDragged(I)V

    return-void
.end method

.method static synthetic access$700(Landroid/support/v4/widget/SlidingPaneLayout;)I
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/widget/SlidingPaneLayout;

    .line 88
    iget v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideRange:I

    return v0
.end method

.method static synthetic access$900(Landroid/support/v4/widget/SlidingPaneLayout;Landroid/view/View;)V
    .locals 0
    .param p0, "x0"    # Landroid/support/v4/widget/SlidingPaneLayout;
    .param p1, "x1"    # Landroid/view/View;

    .line 88
    invoke-direct {p0, p1}, Landroid/support/v4/widget/SlidingPaneLayout;->invalidateChildRegion(Landroid/view/View;)V

    return-void
.end method

.method private closePane(Landroid/view/View;I)Z
    .locals 2
    .param p1, "pane"    # Landroid/view/View;
    .param p2, "initialVelocity"    # I

    .line 830
    iget-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mFirstLayout:Z

    const/4 v1, 0x0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p2}, Landroid/support/v4/widget/SlidingPaneLayout;->smoothSlideTo(FI)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 834
    :cond_0
    return v1

    .line 831
    :cond_1
    :goto_0
    iput-boolean v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPreservedOpenState:Z

    .line 832
    const/4 v0, 0x1

    return v0
.end method

.method private dimChildView(Landroid/view/View;FI)V
    .locals 7
    .param p1, "v"    # Landroid/view/View;
    .param p2, "mag"    # F
    .param p3, "fadeColor"    # I

    .line 933
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    .line 935
    .local v0, "lp":Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;
    const/4 v1, 0x0

    cmpl-float v1, p2, v1

    if-lez v1, :cond_2

    if-eqz p3, :cond_2

    .line 936
    const/high16 v1, -0x1000000

    and-int/2addr v1, p3

    ushr-int/lit8 v1, v1, 0x18

    .line 937
    .local v1, "baseAlpha":I
    int-to-float v2, v1

    mul-float v2, v2, p2

    float-to-int v2, v2

    .line 938
    .local v2, "imag":I
    shl-int/lit8 v3, v2, 0x18

    const v4, 0xffffff

    and-int/2addr v4, p3

    or-int/2addr v3, v4

    .line 939
    .local v3, "color":I
    iget-object v4, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimPaint:Landroid/graphics/Paint;

    if-nez v4, :cond_0

    .line 940
    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    iput-object v4, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimPaint:Landroid/graphics/Paint;

    .line 942
    :cond_0
    iget-object v4, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimPaint:Landroid/graphics/Paint;

    new-instance v5, Landroid/graphics/PorterDuffColorFilter;

    sget-object v6, Landroid/graphics/PorterDuff$Mode;->SRC_OVER:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v5, v3, v6}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 943
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->getLayerType(Landroid/view/View;)I

    move-result v4

    const/4 v5, 0x2

    if-eq v4, v5, :cond_1

    .line 944
    iget-object v4, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimPaint:Landroid/graphics/Paint;

    invoke-static {p1, v5, v4}, Landroid/support/v4/view/ViewCompat;->setLayerType(Landroid/view/View;ILandroid/graphics/Paint;)V

    .line 946
    :cond_1
    invoke-direct {p0, p1}, Landroid/support/v4/widget/SlidingPaneLayout;->invalidateChildRegion(Landroid/view/View;)V

    .end local v1    # "baseAlpha":I
    .end local v2    # "imag":I
    .end local v3    # "color":I
    goto :goto_0

    .line 947
    :cond_2
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->getLayerType(Landroid/view/View;)I

    move-result v1

    if-eqz v1, :cond_4

    .line 948
    iget-object v1, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimPaint:Landroid/graphics/Paint;

    if-eqz v1, :cond_3

    .line 949
    iget-object v1, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimPaint:Landroid/graphics/Paint;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 951
    :cond_3
    new-instance v1, Landroid/support/v4/widget/SlidingPaneLayout$DisableLayerRunnable;

    invoke-direct {v1, p0, p1}, Landroid/support/v4/widget/SlidingPaneLayout$DisableLayerRunnable;-><init>(Landroid/support/v4/widget/SlidingPaneLayout;Landroid/view/View;)V

    .line 952
    .local v1, "dlr":Landroid/support/v4/widget/SlidingPaneLayout$DisableLayerRunnable;
    iget-object v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPostedRunnables:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 953
    invoke-static {p0, v1}, Landroid/support/v4/view/ViewCompat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    goto :goto_1

    .line 947
    .end local v1    # "dlr":Landroid/support/v4/widget/SlidingPaneLayout$DisableLayerRunnable;
    :cond_4
    :goto_0
    nop

    .line 955
    :goto_1
    return-void
.end method

.method private invalidateChildRegion(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .line 999
    sget-object v0, Landroid/support/v4/widget/SlidingPaneLayout;->IMPL:Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImpl;

    invoke-interface {v0, p0, p1}, Landroid/support/v4/widget/SlidingPaneLayout$SlidingPanelLayoutImpl;->invalidateChildRegion(Landroid/support/v4/widget/SlidingPaneLayout;Landroid/view/View;)V

    .line 1000
    return-void
.end method

.method private onPanelDragged(I)V
    .locals 5
    .param p1, "newLeft"    # I

    .line 911
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    if-nez v0, :cond_0

    .line 913
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    .line 914
    return-void

    .line 917
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    .line 918
    .local v0, "lp":Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;
    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingLeft()I

    move-result v1

    iget v2, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->leftMargin:I

    add-int/2addr v1, v2

    .line 920
    .local v1, "leftBound":I
    sub-int v2, p1, v1

    int-to-float v2, v2

    iget v3, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideRange:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    iput v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    .line 922
    iget v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mParallaxBy:I

    if-eqz v2, :cond_1

    .line 923
    iget v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    invoke-direct {p0, v2}, Landroid/support/v4/widget/SlidingPaneLayout;->parallaxOtherViews(F)V

    .line 926
    :cond_1
    iget-boolean v2, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimWhenOffset:Z

    if-eqz v2, :cond_2

    .line 927
    iget-object v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    iget v3, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    iget v4, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSliderFadeColor:I

    invoke-direct {p0, v2, v3, v4}, Landroid/support/v4/widget/SlidingPaneLayout;->dimChildView(Landroid/view/View;FI)V

    .line 929
    :cond_2
    iget-object v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    invoke-virtual {p0, v2}, Landroid/support/v4/widget/SlidingPaneLayout;->dispatchOnPanelSlide(Landroid/view/View;)V

    .line 930
    return-void
.end method

.method private openPane(Landroid/view/View;I)Z
    .locals 1
    .param p1, "pane"    # Landroid/view/View;
    .param p2, "initialVelocity"    # I

    .line 838
    iget-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mFirstLayout:Z

    if-nez v0, :cond_1

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0, p2}, Landroid/support/v4/widget/SlidingPaneLayout;->smoothSlideTo(FI)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 842
    :cond_0
    const/4 v0, 0x0

    return v0

    .line 839
    :cond_1
    :goto_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPreservedOpenState:Z

    .line 840
    return v0
.end method

.method private parallaxOtherViews(F)V
    .locals 10
    .param p1, "slideOffset"    # F

    .line 1079
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    .line 1080
    .local v0, "slideLp":Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;
    iget-boolean v1, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimWhenOffset:Z

    if-eqz v1, :cond_0

    iget v1, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->leftMargin:I

    if-gtz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 1081
    .local v1, "dimViews":Z
    :goto_0
    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildCount()I

    move-result v2

    .line 1082
    .local v2, "childCount":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-ge v3, v2, :cond_3

    .line 1083
    invoke-virtual {p0, v3}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 1084
    .local v4, "v":Landroid/view/View;
    iget-object v5, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    if-ne v4, v5, :cond_1

    goto :goto_2

    .line 1086
    :cond_1
    iget v5, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mParallaxOffset:F

    const/high16 v6, 0x3f800000    # 1.0f

    sub-float v5, v6, v5

    iget v7, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mParallaxBy:I

    int-to-float v8, v7

    mul-float v5, v5, v8

    float-to-int v5, v5

    .line 1087
    .local v5, "oldOffset":I
    iput p1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mParallaxOffset:F

    .line 1088
    sub-float v8, v6, p1

    int-to-float v7, v7

    mul-float v8, v8, v7

    float-to-int v7, v8

    .line 1089
    .local v7, "newOffset":I
    sub-int v8, v5, v7

    .line 1091
    .local v8, "dx":I
    invoke-virtual {v4, v8}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 1093
    if-eqz v1, :cond_2

    .line 1094
    iget v9, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mParallaxOffset:F

    sub-float/2addr v6, v9

    iget v9, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCoveredFadeColor:I

    invoke-direct {p0, v4, v6, v9}, Landroid/support/v4/widget/SlidingPaneLayout;->dimChildView(Landroid/view/View;FI)V

    .line 1082
    .end local v4    # "v":Landroid/view/View;
    .end local v5    # "oldOffset":I
    .end local v7    # "newOffset":I
    .end local v8    # "dx":I
    :cond_2
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1097
    .end local v3    # "i":I
    :cond_3
    return-void
.end method

.method private static viewIsOpaque(Landroid/view/View;)Z
    .locals 5
    .param p0, "v"    # Landroid/view/View;

    .line 398
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->isOpaque(Landroid/view/View;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 403
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x12

    const/4 v3, 0x0

    if-lt v0, v2, :cond_1

    return v3

    .line 405
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 406
    .local v0, "bg":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_3

    .line 407
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    move-result v2

    const/4 v4, -0x1

    if-ne v2, v4, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 409
    :cond_3
    return v3
.end method


# virtual methods
.method protected canScroll(Landroid/view/View;ZIII)Z
    .locals 14
    .param p1, "v"    # Landroid/view/View;
    .param p2, "checkV"    # Z
    .param p3, "dx"    # I
    .param p4, "x"    # I
    .param p5, "y"    # I

    .line 1111
    move-object v0, p1

    instance-of v1, v0, Landroid/view/ViewGroup;

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    .line 1112
    move-object v1, v0

    check-cast v1, Landroid/view/ViewGroup;

    .line 1113
    .local v1, "group":Landroid/view/ViewGroup;
    invoke-virtual {p1}, Landroid/view/View;->getScrollX()I

    move-result v3

    .line 1114
    .local v3, "scrollX":I
    invoke-virtual {p1}, Landroid/view/View;->getScrollY()I

    move-result v4

    .line 1115
    .local v4, "scrollY":I
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    .line 1117
    .local v5, "count":I
    add-int/lit8 v6, v5, -0x1

    .local v6, "i":I
    :goto_0
    if-ltz v6, :cond_1

    .line 1120
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v13

    .line 1121
    .local v13, "child":Landroid/view/View;
    add-int v7, p4, v3

    invoke-virtual {v13}, Landroid/view/View;->getLeft()I

    move-result v8

    if-lt v7, v8, :cond_0

    add-int v7, p4, v3

    invoke-virtual {v13}, Landroid/view/View;->getRight()I

    move-result v8

    if-ge v7, v8, :cond_0

    add-int v7, p5, v4

    invoke-virtual {v13}, Landroid/view/View;->getTop()I

    move-result v8

    if-lt v7, v8, :cond_0

    add-int v7, p5, v4

    invoke-virtual {v13}, Landroid/view/View;->getBottom()I

    move-result v8

    if-ge v7, v8, :cond_0

    const/4 v9, 0x1

    add-int v7, p4, v3

    invoke-virtual {v13}, Landroid/view/View;->getLeft()I

    move-result v8

    sub-int v11, v7, v8

    add-int v7, p5, v4

    invoke-virtual {v13}, Landroid/view/View;->getTop()I

    move-result v8

    sub-int v12, v7, v8

    move-object v7, p0

    move-object v8, v13

    move/from16 v10, p3

    invoke-virtual/range {v7 .. v12}, Landroid/support/v4/widget/SlidingPaneLayout;->canScroll(Landroid/view/View;ZIII)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 1125
    return v2

    .line 1117
    .end local v13    # "child":Landroid/view/View;
    :cond_0
    add-int/lit8 v6, v6, -0x1

    goto :goto_0

    .line 1130
    .end local v1    # "group":Landroid/view/ViewGroup;
    .end local v3    # "scrollX":I
    .end local v4    # "scrollY":I
    .end local v5    # "count":I
    .end local v6    # "i":I
    :cond_1
    if-eqz p2, :cond_2

    move/from16 v1, p3

    neg-int v3, v1

    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->canScrollHorizontally(Landroid/view/View;I)Z

    move-result v3

    if-eqz v3, :cond_3

    goto :goto_1

    :cond_2
    move/from16 v1, p3

    :cond_3
    const/4 v2, 0x0

    :goto_1
    return v2
.end method

.method public canSlide()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 897
    iget-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    return v0
.end method

.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 1
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .line 1155
    instance-of v0, p1, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    if-eqz v0, :cond_0

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public closePane()Z
    .locals 2

    .line 878
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Landroid/support/v4/widget/SlidingPaneLayout;->closePane(Landroid/view/View;I)Z

    move-result v0

    return v0
.end method

.method public computeScroll()V
    .locals 2

    .line 1029
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/ViewDragHelper;->continueSettling(Z)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1030
    iget-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    if-nez v0, :cond_0

    .line 1031
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v0}, Landroid/support/v4/widget/ViewDragHelper;->abort()V

    .line 1032
    return-void

    .line 1035
    :cond_0
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 1037
    :cond_1
    return-void
.end method

.method dispatchOnPanelClosed(Landroid/view/View;)V
    .locals 1
    .param p1, "panel"    # Landroid/view/View;

    .line 341
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPanelSlideListener:Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;

    if-eqz v0, :cond_0

    .line 342
    invoke-interface {v0, p1}, Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;->onPanelClosed(Landroid/view/View;)V

    .line 344
    :cond_0
    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/SlidingPaneLayout;->sendAccessibilityEvent(I)V

    .line 345
    return-void
.end method

.method dispatchOnPanelOpened(Landroid/view/View;)V
    .locals 1
    .param p1, "panel"    # Landroid/view/View;

    .line 334
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPanelSlideListener:Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;

    if-eqz v0, :cond_0

    .line 335
    invoke-interface {v0, p1}, Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;->onPanelOpened(Landroid/view/View;)V

    .line 337
    :cond_0
    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/SlidingPaneLayout;->sendAccessibilityEvent(I)V

    .line 338
    return-void
.end method

.method dispatchOnPanelSlide(Landroid/view/View;)V
    .locals 2
    .param p1, "panel"    # Landroid/view/View;

    .line 328
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPanelSlideListener:Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;

    if-eqz v0, :cond_0

    .line 329
    iget v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    invoke-interface {v0, p1, v1}, Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;->onPanelSlide(Landroid/view/View;F)V

    .line 331
    :cond_0
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 7
    .param p1, "c"    # Landroid/graphics/Canvas;

    .line 1061
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->draw(Landroid/graphics/Canvas;)V

    .line 1063
    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    invoke-virtual {p0, v1}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1064
    .local v0, "shadowView":Landroid/view/View;
    :goto_0
    if-eqz v0, :cond_2

    iget-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mShadowDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v1, :cond_1

    goto :goto_1

    .line 1069
    :cond_1
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    .line 1070
    .local v1, "shadowWidth":I
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v2

    .line 1071
    .local v2, "right":I
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v3

    .line 1072
    .local v3, "top":I
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v4

    .line 1073
    .local v4, "bottom":I
    sub-int v5, v2, v1

    .line 1074
    .local v5, "left":I
    iget-object v6, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mShadowDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6, v5, v3, v2, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1075
    iget-object v6, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mShadowDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 1076
    return-void

    .line 1066
    .end local v1    # "shadowWidth":I
    .end local v2    # "right":I
    .end local v3    # "top":I
    .end local v4    # "bottom":I
    .end local v5    # "left":I
    :cond_2
    :goto_1
    return-void
.end method

.method protected drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .locals 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "child"    # Landroid/view/View;
    .param p3, "drawingTime"    # J

    .line 959
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    .line 961
    .local v0, "lp":Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;
    const/4 v1, 0x2

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->save(I)I

    move-result v1

    .line 963
    .local v1, "save":I
    iget-boolean v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    if-eqz v2, :cond_0

    iget-boolean v2, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->slideable:Z

    if-nez v2, :cond_0

    iget-object v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    if-eqz v2, :cond_0

    .line 965
    iget-object v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mTmpRect:Landroid/graphics/Rect;

    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->getClipBounds(Landroid/graphics/Rect;)Z

    .line 966
    iget-object v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mTmpRect:Landroid/graphics/Rect;

    iget v3, v2, Landroid/graphics/Rect;->right:I

    iget-object v4, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    iput v3, v2, Landroid/graphics/Rect;->right:I

    .line 967
    iget-object v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mTmpRect:Landroid/graphics/Rect;

    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    .line 970
    :cond_0
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v2, v3, :cond_1

    .line 971
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result v2

    .local v2, "result":Z
    goto :goto_1

    .line 973
    .end local v2    # "result":Z
    :cond_1
    iget-boolean v2, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimWhenOffset:Z

    if-eqz v2, :cond_4

    iget v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-lez v2, :cond_4

    .line 974
    invoke-virtual {p2}, Landroid/view/View;->isDrawingCacheEnabled()Z

    move-result v2

    if-nez v2, :cond_2

    .line 975
    const/4 v2, 0x1

    invoke-virtual {p2, v2}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 977
    :cond_2
    invoke-virtual {p2}, Landroid/view/View;->getDrawingCache()Landroid/graphics/Bitmap;

    move-result-object v2

    .line 978
    .local v2, "cache":Landroid/graphics/Bitmap;
    if-eqz v2, :cond_3

    .line 979
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v4

    int-to-float v4, v4

    iget-object v5, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 980
    const/4 v3, 0x0

    move v2, v3

    .local v3, "result":Z
    goto :goto_0

    .line 982
    .end local v3    # "result":Z
    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "drawChild: child view "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, " returned null drawing cache"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "SlidingPaneLayout"

    invoke-static {v4, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 983
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result v2

    .line 985
    .local v2, "result":Z
    :goto_0
    goto :goto_1

    .line 986
    .end local v2    # "result":Z
    :cond_4
    invoke-virtual {p2}, Landroid/view/View;->isDrawingCacheEnabled()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 987
    const/4 v2, 0x0

    invoke-virtual {p2, v2}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 989
    :cond_5
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result v2

    .line 993
    .restart local v2    # "result":Z
    :goto_1
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 995
    return v2
.end method

.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .line 1143
    new-instance v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    invoke-direct {v0}, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;-><init>()V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 2
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .line 1160
    new-instance v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 2
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .line 1148
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_0

    new-instance v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    move-object v1, p1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {v0, v1}, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    goto :goto_0

    :cond_0
    new-instance v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    invoke-direct {v0, p1}, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    :goto_0
    return-object v0
.end method

.method public getCoveredFadeColor()I
    .locals 1

    .line 320
    iget v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCoveredFadeColor:I

    return v0
.end method

.method public getParallaxDistance()I
    .locals 1

    .line 287
    iget v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mParallaxBy:I

    return v0
.end method

.method public getSliderFadeColor()I
    .locals 1

    .line 303
    iget v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSliderFadeColor:I

    return v0
.end method

.method isDimmed(Landroid/view/View;)Z
    .locals 4
    .param p1, "child"    # Landroid/view/View;

    .line 1134
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 1135
    return v0

    .line 1137
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    .line 1138
    .local v1, "lp":Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;
    iget-boolean v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    if-eqz v2, :cond_1

    iget-boolean v2, v1, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimWhenOffset:Z

    if-eqz v2, :cond_1

    iget v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-lez v2, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0
.end method

.method public isOpen()Z
    .locals 2

    .line 888
    iget-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    if-eqz v0, :cond_1

    iget v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public isSlideable()Z
    .locals 1

    .line 907
    iget-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    return v0
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .line 414
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 415
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mFirstLayout:Z

    .line 416
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 3

    .line 420
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 421
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mFirstLayout:Z

    .line 423
    const/4 v0, 0x0

    .local v0, "i":I
    iget-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPostedRunnables:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    .local v1, "count":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 424
    iget-object v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPostedRunnables:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/widget/SlidingPaneLayout$DisableLayerRunnable;

    .line 425
    .local v2, "dlr":Landroid/support/v4/widget/SlidingPaneLayout$DisableLayerRunnable;
    invoke-virtual {v2}, Landroid/support/v4/widget/SlidingPaneLayout$DisableLayerRunnable;->run()V

    .line 423
    .end local v2    # "dlr":Landroid/support/v4/widget/SlidingPaneLayout$DisableLayerRunnable;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 427
    .end local v0    # "i":I
    .end local v1    # "count":I
    :cond_0
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPostedRunnables:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 428
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 10
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .line 730
    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getActionMasked(Landroid/view/MotionEvent;)I

    move-result v0

    .line 733
    .local v0, "action":I
    iget-boolean v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    const/4 v2, 0x1

    if-nez v1, :cond_0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildCount()I

    move-result v1

    if-le v1, v2, :cond_0

    .line 735
    invoke-virtual {p0, v2}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 736
    .local v1, "secondChild":Landroid/view/View;
    if-eqz v1, :cond_0

    .line 737
    iget-object v3, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    float-to-int v5, v5

    invoke-virtual {v3, v1, v4, v5}, Landroid/support/v4/widget/ViewDragHelper;->isViewUnder(Landroid/view/View;II)Z

    move-result v3

    xor-int/2addr v3, v2

    iput-boolean v3, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPreservedOpenState:Z

    .line 742
    .end local v1    # "secondChild":Landroid/view/View;
    :cond_0
    iget-boolean v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    if-eqz v1, :cond_9

    iget-boolean v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mIsUnableToDrag:Z

    if-eqz v1, :cond_1

    if-eqz v0, :cond_1

    goto/16 :goto_3

    .line 747
    :cond_1
    const/4 v1, 0x3

    const/4 v3, 0x0

    if-eq v0, v1, :cond_8

    if-ne v0, v2, :cond_2

    goto :goto_2

    .line 752
    :cond_2
    const/4 v1, 0x0

    .line 754
    .local v1, "interceptTap":Z
    if-eqz v0, :cond_4

    const/4 v4, 0x2

    if-eq v0, v4, :cond_3

    goto :goto_0

    .line 770
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    .line 771
    .local v4, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    .line 772
    .local v5, "y":F
    iget v6, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mInitialMotionX:F

    sub-float v6, v4, v6

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    .line 773
    .local v6, "adx":F
    iget v7, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mInitialMotionY:F

    sub-float v7, v5, v7

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    .line 774
    .local v7, "ady":F
    iget-object v8, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v8}, Landroid/support/v4/widget/ViewDragHelper;->getTouchSlop()I

    move-result v8

    .line 775
    .local v8, "slop":I
    int-to-float v9, v8

    cmpl-float v9, v6, v9

    if-lez v9, :cond_5

    cmpl-float v9, v7, v6

    if-lez v9, :cond_5

    .line 776
    iget-object v9, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v9}, Landroid/support/v4/widget/ViewDragHelper;->cancel()V

    .line 777
    iput-boolean v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mIsUnableToDrag:Z

    .line 778
    return v3

    .line 756
    .end local v4    # "x":F
    .end local v5    # "y":F
    .end local v6    # "adx":F
    .end local v7    # "ady":F
    .end local v8    # "slop":I
    :cond_4
    iput-boolean v3, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mIsUnableToDrag:Z

    .line 757
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    .line 758
    .restart local v4    # "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    .line 759
    .restart local v5    # "y":F
    iput v4, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mInitialMotionX:F

    .line 760
    iput v5, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mInitialMotionY:F

    .line 762
    iget-object v6, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    iget-object v7, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    float-to-int v8, v4

    float-to-int v9, v5

    invoke-virtual {v6, v7, v8, v9}, Landroid/support/v4/widget/ViewDragHelper;->isViewUnder(Landroid/view/View;II)Z

    move-result v6

    if-eqz v6, :cond_5

    iget-object v6, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    invoke-virtual {p0, v6}, Landroid/support/v4/widget/SlidingPaneLayout;->isDimmed(Landroid/view/View;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 764
    const/4 v1, 0x1

    .line 783
    .end local v4    # "x":F
    .end local v5    # "y":F
    :cond_5
    :goto_0
    iget-object v4, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v4, p1}, Landroid/support/v4/widget/ViewDragHelper;->shouldInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v4

    .line 785
    .local v4, "interceptForDrag":Z
    if-nez v4, :cond_7

    if-eqz v1, :cond_6

    goto :goto_1

    :cond_6
    const/4 v2, 0x0

    :cond_7
    :goto_1
    return v2

    .line 748
    .end local v1    # "interceptTap":Z
    .end local v4    # "interceptForDrag":Z
    :cond_8
    :goto_2
    iget-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v1}, Landroid/support/v4/widget/ViewDragHelper;->cancel()V

    .line 749
    return v3

    .line 743
    :cond_9
    :goto_3
    iget-object v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v1}, Landroid/support/v4/widget/ViewDragHelper;->cancel()V

    .line 744
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    return v1
.end method

.method protected onLayout(ZIIII)V
    .locals 19
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .line 640
    move-object/from16 v0, p0

    sub-int v1, p4, p2

    .line 641
    .local v1, "width":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingLeft()I

    move-result v2

    .line 642
    .local v2, "paddingLeft":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingRight()I

    move-result v3

    .line 643
    .local v3, "paddingRight":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingTop()I

    move-result v4

    .line 645
    .local v4, "paddingTop":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildCount()I

    move-result v5

    .line 646
    .local v5, "childCount":I
    move v6, v2

    .line 647
    .local v6, "xStart":I
    move v7, v6

    .line 649
    .local v7, "nextXStart":I
    iget-boolean v8, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mFirstLayout:Z

    if-eqz v8, :cond_1

    .line 650
    iget-boolean v8, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    if-eqz v8, :cond_0

    iget-boolean v8, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mPreservedOpenState:Z

    if-eqz v8, :cond_0

    const/high16 v8, 0x3f800000    # 1.0f

    goto :goto_0

    :cond_0
    const/4 v8, 0x0

    :goto_0
    iput v8, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    .line 653
    :cond_1
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_1
    if-ge v8, v5, :cond_6

    .line 654
    invoke-virtual {v0, v8}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    .line 656
    .local v12, "child":Landroid/view/View;
    invoke-virtual {v12}, Landroid/view/View;->getVisibility()I

    move-result v13

    const/16 v14, 0x8

    if-ne v13, v14, :cond_2

    .line 657
    move/from16 v18, v1

    move/from16 v17, v2

    const/high16 v9, 0x3f800000    # 1.0f

    goto/16 :goto_4

    .line 660
    :cond_2
    invoke-virtual {v12}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v13

    check-cast v13, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    .line 662
    .local v13, "lp":Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredWidth()I

    move-result v14

    .line 663
    .local v14, "childWidth":I
    const/4 v15, 0x0

    .line 665
    .local v15, "offset":I
    iget-boolean v11, v13, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->slideable:Z

    if-eqz v11, :cond_4

    .line 666
    iget v11, v13, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->leftMargin:I

    iget v10, v13, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->rightMargin:I

    add-int/2addr v11, v10

    .line 667
    .local v11, "margin":I
    sub-int v10, v1, v3

    iget v9, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mOverhangSize:I

    sub-int/2addr v10, v9

    invoke-static {v7, v10}, Ljava/lang/Math;->min(II)I

    move-result v9

    sub-int/2addr v9, v6

    sub-int/2addr v9, v11

    .line 669
    .local v9, "range":I
    iput v9, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideRange:I

    .line 670
    iget v10, v13, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->leftMargin:I

    add-int/2addr v10, v6

    add-int/2addr v10, v9

    div-int/lit8 v17, v14, 0x2

    add-int v10, v10, v17

    move/from16 v17, v2

    .end local v2    # "paddingLeft":I
    .local v17, "paddingLeft":I
    sub-int v2, v1, v3

    if-le v10, v2, :cond_3

    const/4 v2, 0x1

    goto :goto_2

    :cond_3
    const/4 v2, 0x0

    :goto_2
    iput-boolean v2, v13, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimWhenOffset:Z

    .line 672
    int-to-float v2, v9

    iget v10, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    mul-float v2, v2, v10

    float-to-int v2, v2

    .line 673
    .local v2, "pos":I
    iget v10, v13, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->leftMargin:I

    add-int/2addr v10, v2

    add-int/2addr v6, v10

    .line 674
    int-to-float v10, v2

    move/from16 v18, v1

    .end local v1    # "width":I
    .local v18, "width":I
    iget v1, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideRange:I

    int-to-float v1, v1

    div-float/2addr v10, v1

    iput v10, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    .line 675
    .end local v2    # "pos":I
    .end local v9    # "range":I
    .end local v11    # "margin":I
    const/high16 v9, 0x3f800000    # 1.0f

    goto :goto_3

    .end local v17    # "paddingLeft":I
    .end local v18    # "width":I
    .restart local v1    # "width":I
    .local v2, "paddingLeft":I
    :cond_4
    move/from16 v18, v1

    move/from16 v17, v2

    .end local v1    # "width":I
    .end local v2    # "paddingLeft":I
    .restart local v17    # "paddingLeft":I
    .restart local v18    # "width":I
    iget-boolean v1, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    if-eqz v1, :cond_5

    iget v1, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mParallaxBy:I

    if-eqz v1, :cond_5

    .line 676
    iget v2, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    const/high16 v9, 0x3f800000    # 1.0f

    sub-float v2, v9, v2

    int-to-float v1, v1

    mul-float v2, v2, v1

    float-to-int v15, v2

    .line 677
    move v6, v7

    goto :goto_3

    .line 675
    :cond_5
    const/high16 v9, 0x3f800000    # 1.0f

    .line 679
    move v6, v7

    .line 682
    :goto_3
    sub-int v1, v6, v15

    .line 683
    .local v1, "childLeft":I
    add-int v2, v1, v14

    .line 684
    .local v2, "childRight":I
    move v10, v4

    .line 685
    .local v10, "childTop":I
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v11

    add-int/2addr v11, v10

    .line 686
    .local v11, "childBottom":I
    invoke-virtual {v12, v1, v4, v2, v11}, Landroid/view/View;->layout(IIII)V

    .line 688
    invoke-virtual {v12}, Landroid/view/View;->getWidth()I

    move-result v16

    add-int v7, v7, v16

    .line 653
    .end local v1    # "childLeft":I
    .end local v2    # "childRight":I
    .end local v10    # "childTop":I
    .end local v11    # "childBottom":I
    .end local v12    # "child":Landroid/view/View;
    .end local v13    # "lp":Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;
    .end local v14    # "childWidth":I
    .end local v15    # "offset":I
    :goto_4
    add-int/lit8 v8, v8, 0x1

    move/from16 v2, v17

    move/from16 v1, v18

    goto/16 :goto_1

    .end local v17    # "paddingLeft":I
    .end local v18    # "width":I
    .local v1, "width":I
    .local v2, "paddingLeft":I
    :cond_6
    move/from16 v18, v1

    move/from16 v17, v2

    .line 691
    .end local v1    # "width":I
    .end local v2    # "paddingLeft":I
    .end local v8    # "i":I
    .restart local v17    # "paddingLeft":I
    .restart local v18    # "width":I
    iget-boolean v1, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mFirstLayout:Z

    if-eqz v1, :cond_a

    .line 692
    iget-boolean v1, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    if-eqz v1, :cond_8

    .line 693
    iget v1, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mParallaxBy:I

    if-eqz v1, :cond_7

    .line 694
    iget v1, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    invoke-direct {v0, v1}, Landroid/support/v4/widget/SlidingPaneLayout;->parallaxOtherViews(F)V

    .line 696
    :cond_7
    iget-object v1, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    iget-boolean v1, v1, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimWhenOffset:Z

    if-eqz v1, :cond_9

    .line 697
    iget-object v1, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    iget v2, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideOffset:F

    iget v8, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSliderFadeColor:I

    invoke-direct {v0, v1, v2, v8}, Landroid/support/v4/widget/SlidingPaneLayout;->dimChildView(Landroid/view/View;FI)V

    goto :goto_6

    .line 701
    :cond_8
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    if-ge v1, v5, :cond_9

    .line 702
    invoke-virtual {v0, v1}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    iget v8, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSliderFadeColor:I

    const/4 v9, 0x0

    invoke-direct {v0, v2, v9, v8}, Landroid/support/v4/widget/SlidingPaneLayout;->dimChildView(Landroid/view/View;FI)V

    .line 701
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 705
    .end local v1    # "i":I
    :cond_9
    :goto_6
    iget-object v1, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/SlidingPaneLayout;->updateObscuredViewsVisibility(Landroid/view/View;)V

    .line 708
    :cond_a
    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mFirstLayout:Z

    .line 709
    return-void
.end method

.method protected onMeasure(II)V
    .locals 27
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .line 432
    move-object/from16 v0, p0

    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 433
    .local v1, "widthMode":I
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 434
    .local v2, "widthSize":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v3

    .line 435
    .local v3, "heightMode":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v4

    .line 437
    .local v4, "heightSize":I
    const/high16 v5, -0x80000000

    const/high16 v6, 0x40000000    # 2.0f

    if-eq v1, v6, :cond_2

    .line 438
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->isInEditMode()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 443
    if-ne v1, v5, :cond_0

    .line 444
    const/high16 v1, 0x40000000    # 2.0f

    goto :goto_0

    .line 445
    :cond_0
    if-nez v1, :cond_4

    .line 446
    const/high16 v1, 0x40000000    # 2.0f

    .line 447
    const/16 v2, 0x12c

    goto :goto_0

    .line 450
    :cond_1
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "Width must have an exact value or MATCH_PARENT"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 452
    :cond_2
    if-nez v3, :cond_4

    .line 453
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->isInEditMode()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 457
    if-nez v3, :cond_4

    .line 458
    const/high16 v3, -0x80000000

    .line 459
    const/16 v4, 0x12c

    goto :goto_0

    .line 462
    :cond_3
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "Height must not be UNSPECIFIED"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 466
    :cond_4
    :goto_0
    const/4 v7, 0x0

    .line 467
    .local v7, "layoutHeight":I
    const/4 v8, -0x1

    .line 468
    .local v8, "maxLayoutHeight":I
    if-eq v3, v5, :cond_6

    if-eq v3, v6, :cond_5

    goto :goto_1

    .line 470
    :cond_5
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingTop()I

    move-result v9

    sub-int v9, v4, v9

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingBottom()I

    move-result v10

    sub-int/2addr v9, v10

    move v8, v9

    move v7, v9

    .line 471
    goto :goto_1

    .line 473
    :cond_6
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingTop()I

    move-result v9

    sub-int v9, v4, v9

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingBottom()I

    move-result v10

    sub-int v8, v9, v10

    .line 477
    :goto_1
    const/4 v9, 0x0

    .line 478
    .local v9, "weightSum":F
    const/4 v10, 0x0

    .line 479
    .local v10, "canSlide":Z
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingLeft()I

    move-result v11

    sub-int v11, v2, v11

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingRight()I

    move-result v12

    sub-int/2addr v11, v12

    .line 480
    .local v11, "widthRemaining":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildCount()I

    move-result v12

    .line 482
    .local v12, "childCount":I
    const/4 v13, 0x2

    if-le v12, v13, :cond_7

    .line 483
    const-string v13, "SlidingPaneLayout"

    const-string v14, "onMeasure: More than two child views are not supported."

    invoke-static {v13, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 487
    :cond_7
    const/4 v13, 0x0

    iput-object v13, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    .line 491
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_2
    const/16 v14, 0x8

    const/16 v16, 0x1

    const/16 v19, 0x0

    if-ge v13, v12, :cond_11

    .line 492
    invoke-virtual {v0, v13}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 493
    .local v5, "child":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v20

    move-object/from16 v6, v20

    check-cast v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    .line 495
    .local v6, "lp":Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;
    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v15

    if-ne v15, v14, :cond_8

    .line 496
    const/4 v14, 0x0

    iput-boolean v14, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->dimWhenOffset:Z

    .line 497
    move/from16 v21, v1

    move/from16 v22, v4

    goto/16 :goto_6

    .line 500
    :cond_8
    iget v14, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->weight:F

    cmpl-float v14, v14, v19

    if-lez v14, :cond_9

    .line 501
    iget v14, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->weight:F

    add-float/2addr v9, v14

    .line 505
    iget v14, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->width:I

    if-nez v14, :cond_9

    move/from16 v21, v1

    move/from16 v22, v4

    goto/16 :goto_6

    .line 509
    :cond_9
    iget v14, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->leftMargin:I

    iget v15, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->rightMargin:I

    add-int/2addr v14, v15

    .line 510
    .local v14, "horizontalMargin":I
    iget v15, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->width:I

    move/from16 v21, v1

    const/4 v1, -0x2

    .end local v1    # "widthMode":I
    .local v21, "widthMode":I
    if-ne v15, v1, :cond_a

    .line 511
    sub-int v1, v2, v14

    const/high16 v15, -0x80000000

    invoke-static {v1, v15}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .local v1, "childWidthSpec":I
    goto :goto_3

    .line 513
    .end local v1    # "childWidthSpec":I
    :cond_a
    iget v1, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->width:I

    const/4 v15, -0x1

    if-ne v1, v15, :cond_b

    .line 514
    sub-int v1, v2, v14

    const/high16 v15, 0x40000000    # 2.0f

    invoke-static {v1, v15}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .restart local v1    # "childWidthSpec":I
    goto :goto_3

    .line 517
    .end local v1    # "childWidthSpec":I
    :cond_b
    const/high16 v15, 0x40000000    # 2.0f

    iget v1, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->width:I

    invoke-static {v1, v15}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 521
    .restart local v1    # "childWidthSpec":I
    :goto_3
    iget v15, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->height:I

    move/from16 v22, v4

    const/4 v4, -0x2

    .end local v4    # "heightSize":I
    .local v22, "heightSize":I
    if-ne v15, v4, :cond_c

    .line 522
    const/high16 v4, -0x80000000

    invoke-static {v8, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v15

    .local v15, "childHeightSpec":I
    goto :goto_4

    .line 523
    .end local v15    # "childHeightSpec":I
    :cond_c
    iget v4, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->height:I

    const/4 v15, -0x1

    if-ne v4, v15, :cond_d

    .line 524
    const/high16 v4, 0x40000000    # 2.0f

    invoke-static {v8, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v15

    .restart local v15    # "childHeightSpec":I
    goto :goto_4

    .line 526
    .end local v15    # "childHeightSpec":I
    :cond_d
    const/high16 v4, 0x40000000    # 2.0f

    iget v15, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->height:I

    invoke-static {v15, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v15

    .line 529
    .restart local v15    # "childHeightSpec":I
    :goto_4
    invoke-virtual {v5, v1, v15}, Landroid/view/View;->measure(II)V

    .line 530
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    .line 531
    .local v4, "childWidth":I
    move/from16 v18, v1

    .end local v1    # "childWidthSpec":I
    .local v18, "childWidthSpec":I
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    .line 533
    .local v1, "childHeight":I
    move/from16 v19, v9

    const/high16 v9, -0x80000000

    .end local v9    # "weightSum":F
    .local v19, "weightSum":F
    if-ne v3, v9, :cond_e

    if-le v1, v7, :cond_e

    .line 534
    invoke-static {v1, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 537
    :cond_e
    sub-int/2addr v11, v4

    .line 538
    if-gez v11, :cond_f

    const/4 v9, 0x1

    goto :goto_5

    :cond_f
    const/4 v9, 0x0

    :goto_5
    iput-boolean v9, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->slideable:Z

    or-int/2addr v9, v10

    .line 539
    .end local v10    # "canSlide":Z
    .local v9, "canSlide":Z
    iget-boolean v10, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->slideable:Z

    if-eqz v10, :cond_10

    .line 540
    iput-object v5, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    .line 491
    .end local v1    # "childHeight":I
    .end local v4    # "childWidth":I
    .end local v5    # "child":Landroid/view/View;
    .end local v6    # "lp":Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;
    .end local v14    # "horizontalMargin":I
    .end local v15    # "childHeightSpec":I
    .end local v18    # "childWidthSpec":I
    :cond_10
    move v10, v9

    move/from16 v9, v19

    .end local v19    # "weightSum":F
    .local v9, "weightSum":F
    .restart local v10    # "canSlide":Z
    :goto_6
    add-int/lit8 v13, v13, 0x1

    move/from16 v1, v21

    move/from16 v4, v22

    const/high16 v5, -0x80000000

    const/high16 v6, 0x40000000    # 2.0f

    goto/16 :goto_2

    .end local v21    # "widthMode":I
    .end local v22    # "heightSize":I
    .local v1, "widthMode":I
    .local v4, "heightSize":I
    :cond_11
    move/from16 v21, v1

    move/from16 v22, v4

    .line 545
    .end local v1    # "widthMode":I
    .end local v4    # "heightSize":I
    .end local v13    # "i":I
    .restart local v21    # "widthMode":I
    .restart local v22    # "heightSize":I
    if-nez v10, :cond_13

    cmpl-float v1, v9, v19

    if-lez v1, :cond_12

    goto :goto_7

    :cond_12
    move/from16 v23, v3

    move/from16 v26, v8

    move/from16 v24, v12

    goto/16 :goto_f

    .line 546
    :cond_13
    :goto_7
    iget v1, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mOverhangSize:I

    sub-int v1, v2, v1

    .line 548
    .local v1, "fixedPanelWidthLimit":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_8
    if-ge v4, v12, :cond_25

    .line 549
    invoke-virtual {v0, v4}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 551
    .restart local v5    # "child":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v6

    if-ne v6, v14, :cond_14

    .line 552
    move/from16 v25, v1

    move/from16 v23, v3

    move/from16 v26, v8

    move/from16 v24, v12

    const/high16 v1, 0x40000000    # 2.0f

    goto/16 :goto_e

    .line 555
    :cond_14
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    .line 557
    .restart local v6    # "lp":Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;
    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v13

    if-ne v13, v14, :cond_15

    .line 558
    move/from16 v25, v1

    move/from16 v23, v3

    move/from16 v26, v8

    move/from16 v24, v12

    const/high16 v1, 0x40000000    # 2.0f

    goto/16 :goto_e

    .line 561
    :cond_15
    iget v13, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->width:I

    if-nez v13, :cond_16

    iget v13, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->weight:F

    cmpl-float v13, v13, v19

    if-lez v13, :cond_16

    const/4 v13, 0x1

    goto :goto_9

    :cond_16
    const/4 v13, 0x0

    .line 562
    .local v13, "skippedFirstPass":Z
    :goto_9
    if-eqz v13, :cond_17

    const/4 v15, 0x0

    goto :goto_a

    :cond_17
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v15

    .line 563
    .local v15, "measuredWidth":I
    :goto_a
    if-eqz v10, :cond_1e

    iget-object v14, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    if-eq v5, v14, :cond_1e

    .line 564
    iget v14, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->width:I

    if-gez v14, :cond_1d

    if-gt v15, v1, :cond_19

    iget v14, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->weight:F

    cmpl-float v14, v14, v19

    if-lez v14, :cond_18

    goto :goto_b

    :cond_18
    move/from16 v25, v1

    move/from16 v23, v3

    move/from16 v26, v8

    move/from16 v24, v12

    const/high16 v1, 0x40000000    # 2.0f

    goto/16 :goto_e

    .line 568
    :cond_19
    :goto_b
    if-eqz v13, :cond_1c

    .line 571
    iget v14, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->height:I

    move/from16 v23, v3

    const/4 v3, -0x2

    .end local v3    # "heightMode":I
    .local v23, "heightMode":I
    if-ne v14, v3, :cond_1a

    .line 572
    const/high16 v3, -0x80000000

    invoke-static {v8, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v14

    const/high16 v3, 0x40000000    # 2.0f

    .local v14, "childHeightSpec":I
    goto :goto_c

    .line 574
    .end local v14    # "childHeightSpec":I
    :cond_1a
    iget v3, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->height:I

    const/4 v14, -0x1

    if-ne v3, v14, :cond_1b

    .line 575
    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v8, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v14

    .restart local v14    # "childHeightSpec":I
    goto :goto_c

    .line 578
    .end local v14    # "childHeightSpec":I
    :cond_1b
    const/high16 v3, 0x40000000    # 2.0f

    iget v14, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->height:I

    invoke-static {v14, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v14

    .restart local v14    # "childHeightSpec":I
    goto :goto_c

    .line 582
    .end local v14    # "childHeightSpec":I
    .end local v23    # "heightMode":I
    .restart local v3    # "heightMode":I
    :cond_1c
    move/from16 v23, v3

    const/high16 v3, 0x40000000    # 2.0f

    .end local v3    # "heightMode":I
    .restart local v23    # "heightMode":I
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v14

    invoke-static {v14, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v14

    .line 585
    .restart local v14    # "childHeightSpec":I
    :goto_c
    move/from16 v24, v12

    .end local v12    # "childCount":I
    .local v24, "childCount":I
    invoke-static {v1, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v12

    .line 587
    .local v12, "childWidthSpec":I
    invoke-virtual {v5, v12, v14}, Landroid/view/View;->measure(II)V

    .line 588
    .end local v12    # "childWidthSpec":I
    .end local v14    # "childHeightSpec":I
    move/from16 v25, v1

    move/from16 v26, v8

    const/high16 v1, 0x40000000    # 2.0f

    goto/16 :goto_e

    .line 564
    .end local v23    # "heightMode":I
    .end local v24    # "childCount":I
    .restart local v3    # "heightMode":I
    .local v12, "childCount":I
    :cond_1d
    move/from16 v23, v3

    move/from16 v24, v12

    .end local v3    # "heightMode":I
    .end local v12    # "childCount":I
    .restart local v23    # "heightMode":I
    .restart local v24    # "childCount":I
    move/from16 v25, v1

    move/from16 v26, v8

    const/high16 v1, 0x40000000    # 2.0f

    goto/16 :goto_e

    .line 563
    .end local v23    # "heightMode":I
    .end local v24    # "childCount":I
    .restart local v3    # "heightMode":I
    .restart local v12    # "childCount":I
    :cond_1e
    move/from16 v23, v3

    move/from16 v24, v12

    .line 589
    .end local v3    # "heightMode":I
    .end local v12    # "childCount":I
    .restart local v23    # "heightMode":I
    .restart local v24    # "childCount":I
    iget v3, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->weight:F

    cmpl-float v3, v3, v19

    if-lez v3, :cond_24

    .line 591
    iget v3, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->width:I

    if-nez v3, :cond_21

    .line 593
    iget v3, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->height:I

    const/4 v12, -0x2

    if-ne v3, v12, :cond_1f

    .line 594
    const/high16 v3, -0x80000000

    invoke-static {v8, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v14

    move v3, v14

    const/high16 v14, 0x40000000    # 2.0f

    .restart local v14    # "childHeightSpec":I
    goto :goto_d

    .line 596
    .end local v14    # "childHeightSpec":I
    :cond_1f
    const/high16 v3, -0x80000000

    iget v14, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->height:I

    const/4 v3, -0x1

    if-ne v14, v3, :cond_20

    .line 597
    const/high16 v14, 0x40000000    # 2.0f

    invoke-static {v8, v14}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v17

    move/from16 v3, v17

    .local v17, "childHeightSpec":I
    goto :goto_d

    .line 600
    .end local v17    # "childHeightSpec":I
    :cond_20
    const/high16 v14, 0x40000000    # 2.0f

    iget v3, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->height:I

    invoke-static {v3, v14}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    .local v3, "childHeightSpec":I
    goto :goto_d

    .line 604
    .end local v3    # "childHeightSpec":I
    :cond_21
    const/4 v12, -0x2

    const/high16 v14, 0x40000000    # 2.0f

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    invoke-static {v3, v14}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    .line 608
    .restart local v3    # "childHeightSpec":I
    :goto_d
    if-eqz v10, :cond_23

    .line 610
    iget v12, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->leftMargin:I

    iget v14, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->rightMargin:I

    add-int/2addr v12, v14

    .line 611
    .local v12, "horizontalMargin":I
    sub-int v14, v2, v12

    .line 612
    .local v14, "newWidth":I
    move/from16 v25, v1

    move/from16 v26, v8

    const/high16 v1, 0x40000000    # 2.0f

    .end local v1    # "fixedPanelWidthLimit":I
    .end local v8    # "maxLayoutHeight":I
    .local v25, "fixedPanelWidthLimit":I
    .local v26, "maxLayoutHeight":I
    invoke-static {v14, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v8

    .line 614
    .local v8, "childWidthSpec":I
    if-eq v15, v14, :cond_22

    .line 615
    invoke-virtual {v5, v8, v3}, Landroid/view/View;->measure(II)V

    .line 617
    .end local v8    # "childWidthSpec":I
    .end local v12    # "horizontalMargin":I
    .end local v14    # "newWidth":I
    :cond_22
    const/high16 v1, 0x40000000    # 2.0f

    goto :goto_e

    .line 619
    .end local v25    # "fixedPanelWidthLimit":I
    .end local v26    # "maxLayoutHeight":I
    .restart local v1    # "fixedPanelWidthLimit":I
    .local v8, "maxLayoutHeight":I
    :cond_23
    move/from16 v25, v1

    move/from16 v26, v8

    .end local v1    # "fixedPanelWidthLimit":I
    .end local v8    # "maxLayoutHeight":I
    .restart local v25    # "fixedPanelWidthLimit":I
    .restart local v26    # "maxLayoutHeight":I
    const/4 v1, 0x0

    invoke-static {v1, v11}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 620
    .local v8, "widthToDistribute":I
    iget v12, v6, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->weight:F

    int-to-float v14, v8

    mul-float v12, v12, v14

    div-float/2addr v12, v9

    float-to-int v12, v12

    .line 621
    .local v12, "addedWidth":I
    add-int v14, v15, v12

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v14, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v14

    .line 623
    .local v14, "childWidthSpec":I
    invoke-virtual {v5, v14, v3}, Landroid/view/View;->measure(II)V

    goto :goto_e

    .line 589
    .end local v3    # "childHeightSpec":I
    .end local v12    # "addedWidth":I
    .end local v14    # "childWidthSpec":I
    .end local v25    # "fixedPanelWidthLimit":I
    .end local v26    # "maxLayoutHeight":I
    .restart local v1    # "fixedPanelWidthLimit":I
    .local v8, "maxLayoutHeight":I
    :cond_24
    move/from16 v25, v1

    move/from16 v26, v8

    const/high16 v1, 0x40000000    # 2.0f

    .line 548
    .end local v1    # "fixedPanelWidthLimit":I
    .end local v5    # "child":Landroid/view/View;
    .end local v6    # "lp":Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;
    .end local v8    # "maxLayoutHeight":I
    .end local v13    # "skippedFirstPass":Z
    .end local v15    # "measuredWidth":I
    .restart local v25    # "fixedPanelWidthLimit":I
    .restart local v26    # "maxLayoutHeight":I
    :goto_e
    add-int/lit8 v4, v4, 0x1

    move/from16 v3, v23

    move/from16 v12, v24

    move/from16 v1, v25

    move/from16 v8, v26

    const/16 v14, 0x8

    goto/16 :goto_8

    .end local v23    # "heightMode":I
    .end local v24    # "childCount":I
    .end local v25    # "fixedPanelWidthLimit":I
    .end local v26    # "maxLayoutHeight":I
    .restart local v1    # "fixedPanelWidthLimit":I
    .local v3, "heightMode":I
    .restart local v8    # "maxLayoutHeight":I
    .local v12, "childCount":I
    :cond_25
    move/from16 v25, v1

    move/from16 v23, v3

    move/from16 v26, v8

    move/from16 v24, v12

    .line 629
    .end local v1    # "fixedPanelWidthLimit":I
    .end local v3    # "heightMode":I
    .end local v4    # "i":I
    .end local v8    # "maxLayoutHeight":I
    .end local v12    # "childCount":I
    .restart local v23    # "heightMode":I
    .restart local v24    # "childCount":I
    .restart local v26    # "maxLayoutHeight":I
    :goto_f
    invoke-virtual {v0, v2, v7}, Landroid/support/v4/widget/SlidingPaneLayout;->setMeasuredDimension(II)V

    .line 630
    iput-boolean v10, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    .line 631
    iget-object v1, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v1}, Landroid/support/v4/widget/ViewDragHelper;->getViewDragState()I

    move-result v1

    if-eqz v1, :cond_26

    if-nez v10, :cond_26

    .line 633
    iget-object v1, v0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v1}, Landroid/support/v4/widget/ViewDragHelper;->abort()V

    .line 635
    :cond_26
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 2
    .param p1, "state"    # Landroid/os/Parcelable;

    .line 1175
    move-object v0, p1

    check-cast v0, Landroid/support/v4/widget/SlidingPaneLayout$SavedState;

    .line 1176
    .local v0, "ss":Landroid/support/v4/widget/SlidingPaneLayout$SavedState;
    invoke-virtual {v0}, Landroid/support/v4/widget/SlidingPaneLayout$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 1178
    iget-boolean v1, v0, Landroid/support/v4/widget/SlidingPaneLayout$SavedState;->isOpen:Z

    if-eqz v1, :cond_0

    .line 1179
    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->openPane()Z

    goto :goto_0

    .line 1181
    :cond_0
    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->closePane()Z

    .line 1183
    :goto_0
    iget-boolean v1, v0, Landroid/support/v4/widget/SlidingPaneLayout$SavedState;->isOpen:Z

    iput-boolean v1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPreservedOpenState:Z

    .line 1184
    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .locals 3

    .line 1165
    invoke-super {p0}, Landroid/view/ViewGroup;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    .line 1167
    .local v0, "superState":Landroid/os/Parcelable;
    new-instance v1, Landroid/support/v4/widget/SlidingPaneLayout$SavedState;

    invoke-direct {v1, v0}, Landroid/support/v4/widget/SlidingPaneLayout$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 1168
    .local v1, "ss":Landroid/support/v4/widget/SlidingPaneLayout$SavedState;
    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->isSlideable()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->isOpen()Z

    move-result v2

    goto :goto_0

    :cond_0
    iget-boolean v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPreservedOpenState:Z

    :goto_0
    iput-boolean v2, v1, Landroid/support/v4/widget/SlidingPaneLayout$SavedState;->isOpen:Z

    .line 1170
    return-object v1
.end method

.method protected onSizeChanged(IIII)V
    .locals 1
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .line 713
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->onSizeChanged(IIII)V

    .line 715
    if-eq p1, p3, :cond_0

    .line 716
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mFirstLayout:Z

    .line 718
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 11
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .line 790
    iget-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    if-nez v0, :cond_0

    .line 791
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 794
    :cond_0
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v0, p1}, Landroid/support/v4/widget/ViewDragHelper;->processTouchEvent(Landroid/view/MotionEvent;)V

    .line 796
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 797
    .local v0, "action":I
    const/4 v1, 0x1

    .line 799
    .local v1, "wantTouchEvents":Z
    and-int/lit16 v2, v0, 0xff

    if-eqz v2, :cond_2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_1

    goto :goto_0

    .line 809
    :cond_1
    iget-object v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    invoke-virtual {p0, v2}, Landroid/support/v4/widget/SlidingPaneLayout;->isDimmed(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 810
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    .line 811
    .local v2, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    .line 812
    .local v3, "y":F
    iget v4, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mInitialMotionX:F

    sub-float v4, v2, v4

    .line 813
    .local v4, "dx":F
    iget v5, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mInitialMotionY:F

    sub-float v5, v3, v5

    .line 814
    .local v5, "dy":F
    iget-object v6, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v6}, Landroid/support/v4/widget/ViewDragHelper;->getTouchSlop()I

    move-result v6

    .line 815
    .local v6, "slop":I
    mul-float v7, v4, v4

    mul-float v8, v5, v5

    add-float/2addr v7, v8

    mul-int v8, v6, v6

    int-to-float v8, v8

    cmpg-float v7, v7, v8

    if-gez v7, :cond_3

    iget-object v7, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    iget-object v8, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    float-to-int v9, v2

    float-to-int v10, v3

    invoke-virtual {v7, v8, v9, v10}, Landroid/support/v4/widget/ViewDragHelper;->isViewUnder(Landroid/view/View;II)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 818
    iget-object v7, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    const/4 v8, 0x0

    invoke-direct {p0, v7, v8}, Landroid/support/v4/widget/SlidingPaneLayout;->closePane(Landroid/view/View;I)Z

    .line 819
    goto :goto_0

    .line 801
    .end local v2    # "x":F
    .end local v3    # "y":F
    .end local v4    # "dx":F
    .end local v5    # "dy":F
    .end local v6    # "slop":I
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    .line 802
    .restart local v2    # "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    .line 803
    .restart local v3    # "y":F
    iput v2, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mInitialMotionX:F

    .line 804
    iput v3, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mInitialMotionY:F

    .line 805
    nop

    .line 826
    .end local v2    # "x":F
    .end local v3    # "y":F
    :cond_3
    :goto_0
    return v1
.end method

.method public openPane()Z
    .locals 2

    .line 860
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Landroid/support/v4/widget/SlidingPaneLayout;->openPane(Landroid/view/View;I)Z

    move-result v0

    return v0
.end method

.method public requestChildFocus(Landroid/view/View;Landroid/view/View;)V
    .locals 1
    .param p1, "child"    # Landroid/view/View;
    .param p2, "focused"    # Landroid/view/View;

    .line 722
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->requestChildFocus(Landroid/view/View;Landroid/view/View;)V

    .line 723
    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->isInTouchMode()Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    if-nez v0, :cond_1

    .line 724
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPreservedOpenState:Z

    .line 726
    :cond_1
    return-void
.end method

.method setAllChildrenVisible()V
    .locals 5

    .line 389
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildCount()I

    move-result v1

    .local v1, "childCount":I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 390
    invoke-virtual {p0, v0}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 391
    .local v2, "child":Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    const/4 v4, 0x4

    if-ne v3, v4, :cond_0

    .line 392
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 389
    .end local v2    # "child":Landroid/view/View;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 395
    .end local v0    # "i":I
    .end local v1    # "childCount":I
    :cond_1
    return-void
.end method

.method public setCoveredFadeColor(I)V
    .locals 0
    .param p1, "color"    # I

    .line 313
    iput p1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCoveredFadeColor:I

    .line 314
    return-void
.end method

.method public setPanelSlideListener(Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;)V
    .locals 0
    .param p1, "listener"    # Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;

    .line 324
    iput-object p1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mPanelSlideListener:Landroid/support/v4/widget/SlidingPaneLayout$PanelSlideListener;

    .line 325
    return-void
.end method

.method public setParallaxDistance(I)V
    .locals 0
    .param p1, "parallaxBy"    # I

    .line 277
    iput p1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mParallaxBy:I

    .line 278
    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->requestLayout()V

    .line 279
    return-void
.end method

.method public setShadowDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;

    .line 1046
    iput-object p1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mShadowDrawable:Landroid/graphics/drawable/Drawable;

    .line 1047
    return-void
.end method

.method public setShadowResource(I)V
    .locals 1
    .param p1, "resId"    # I

    .line 1056
    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/SlidingPaneLayout;->setShadowDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1057
    return-void
.end method

.method public setSliderFadeColor(I)V
    .locals 0
    .param p1, "color"    # I

    .line 296
    iput p1, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSliderFadeColor:I

    .line 297
    return-void
.end method

.method public smoothSlideClosed()V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 868
    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->closePane()Z

    .line 869
    return-void
.end method

.method public smoothSlideOpen()V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 850
    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->openPane()Z

    .line 851
    return-void
.end method

.method smoothSlideTo(FI)Z
    .locals 7
    .param p1, "slideOffset"    # F
    .param p2, "velocity"    # I

    .line 1009
    iget-boolean v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mCanSlide:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1011
    return v1

    .line 1014
    :cond_0
    iget-object v0, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;

    .line 1016
    .local v0, "lp":Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;
    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingLeft()I

    move-result v2

    iget v3, v0, Landroid/support/v4/widget/SlidingPaneLayout$LayoutParams;->leftMargin:I

    add-int/2addr v2, v3

    .line 1017
    .local v2, "leftBound":I
    int-to-float v3, v2

    iget v4, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideRange:I

    int-to-float v4, v4

    mul-float v4, v4, p1

    add-float/2addr v3, v4

    float-to-int v3, v3

    .line 1019
    .local v3, "x":I
    iget-object v4, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    iget-object v5, p0, Landroid/support/v4/widget/SlidingPaneLayout;->mSlideableView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v6

    invoke-virtual {v4, v5, v3, v6}, Landroid/support/v4/widget/ViewDragHelper;->smoothSlideViewTo(Landroid/view/View;II)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1020
    invoke-virtual {p0}, Landroid/support/v4/widget/SlidingPaneLayout;->setAllChildrenVisible()V

    .line 1021
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 1022
    const/4 v1, 0x1

    return v1

    .line 1024
    :cond_1
    return v1
.end method

.method updateObscuredViewsVisibility(Landroid/view/View;)V
    .locals 18
    .param p1, "panel"    # Landroid/view/View;

    .line 348
    move-object/from16 v0, p1

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingLeft()I

    move-result v1

    .line 349
    .local v1, "leftBound":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getWidth()I

    move-result v2

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingRight()I

    move-result v3

    sub-int/2addr v2, v3

    .line 350
    .local v2, "rightBound":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingTop()I

    move-result v3

    .line 351
    .local v3, "topBound":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getHeight()I

    move-result v4

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getPaddingBottom()I

    move-result v5

    sub-int/2addr v4, v5

    .line 356
    .local v4, "bottomBound":I
    if-eqz v0, :cond_0

    invoke-static/range {p1 .. p1}, Landroid/support/v4/widget/SlidingPaneLayout;->viewIsOpaque(Landroid/view/View;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 357
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getLeft()I

    move-result v5

    .line 358
    .local v5, "left":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getRight()I

    move-result v6

    .line 359
    .local v6, "right":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTop()I

    move-result v7

    .line 360
    .local v7, "top":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getBottom()I

    move-result v8

    .local v8, "bottom":I
    goto :goto_0

    .line 362
    .end local v5    # "left":I
    .end local v6    # "right":I
    .end local v7    # "top":I
    .end local v8    # "bottom":I
    :cond_0
    const/4 v5, 0x0

    move v8, v5

    .restart local v8    # "bottom":I
    move v7, v5

    .restart local v7    # "top":I
    move v6, v5

    .line 365
    .restart local v5    # "left":I
    .restart local v6    # "right":I
    :goto_0
    const/4 v9, 0x0

    .local v9, "i":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildCount()I

    move-result v10

    .local v10, "childCount":I
    :goto_1
    if-ge v9, v10, :cond_3

    .line 366
    move-object/from16 v11, p0

    invoke-virtual {v11, v9}, Landroid/support/v4/widget/SlidingPaneLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    .line 368
    .local v12, "child":Landroid/view/View;
    if-ne v12, v0, :cond_1

    .line 370
    goto :goto_3

    .line 373
    :cond_1
    invoke-virtual {v12}, Landroid/view/View;->getLeft()I

    move-result v13

    invoke-static {v1, v13}, Ljava/lang/Math;->max(II)I

    move-result v13

    .line 374
    .local v13, "clampedChildLeft":I
    invoke-virtual {v12}, Landroid/view/View;->getTop()I

    move-result v14

    invoke-static {v3, v14}, Ljava/lang/Math;->max(II)I

    move-result v14

    .line 375
    .local v14, "clampedChildTop":I
    invoke-virtual {v12}, Landroid/view/View;->getRight()I

    move-result v15

    invoke-static {v2, v15}, Ljava/lang/Math;->min(II)I

    move-result v15

    .line 376
    .local v15, "clampedChildRight":I
    invoke-virtual {v12}, Landroid/view/View;->getBottom()I

    move-result v0

    invoke-static {v4, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 378
    .local v0, "clampedChildBottom":I
    if-lt v13, v5, :cond_2

    if-lt v14, v7, :cond_2

    if-gt v15, v6, :cond_2

    if-gt v0, v8, :cond_2

    .line 380
    const/16 v16, 0x4

    move/from16 v17, v0

    move/from16 v0, v16

    .local v16, "vis":I
    goto :goto_2

    .line 382
    .end local v16    # "vis":I
    :cond_2
    const/16 v16, 0x0

    move/from16 v17, v0

    move/from16 v0, v16

    .line 384
    .local v0, "vis":I
    .local v17, "clampedChildBottom":I
    :goto_2
    invoke-virtual {v12, v0}, Landroid/view/View;->setVisibility(I)V

    .line 365
    .end local v0    # "vis":I
    .end local v12    # "child":Landroid/view/View;
    .end local v13    # "clampedChildLeft":I
    .end local v14    # "clampedChildTop":I
    .end local v15    # "clampedChildRight":I
    .end local v17    # "clampedChildBottom":I
    add-int/lit8 v9, v9, 0x1

    move-object/from16 v0, p1

    goto :goto_1

    :cond_3
    move-object/from16 v11, p0

    .line 386
    .end local v9    # "i":I
    .end local v10    # "childCount":I
    :goto_3
    return-void
.end method
