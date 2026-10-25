.class public Landroid/support/v4/widget/SwipeRefreshLayout;
.super Landroid/view/ViewGroup;
.source "SwipeRefreshLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/widget/SwipeRefreshLayout$BaseAnimationListener;,
        Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;
    }
.end annotation


# static fields
.field private static final ACCELERATE_INTERPOLATION_FACTOR:F = 1.5f

.field private static final DECELERATE_INTERPOLATION_FACTOR:F = 2.0f

.field private static final LAYOUT_ATTRS:[I

.field private static final MAX_SWIPE_DISTANCE_FACTOR:F = 0.6f

.field private static final PROGRESS_BAR_HEIGHT:F = 4.0f

.field private static final REFRESH_TRIGGER_DISTANCE:I = 0x78

.field private static final RETURN_TO_ORIGINAL_POSITION_TIMEOUT:J = 0x12cL


# instance fields
.field private final mAccelerateInterpolator:Landroid/view/animation/AccelerateInterpolator;

.field private final mAnimateToStartPosition:Landroid/view/animation/Animation;

.field private final mCancel:Ljava/lang/Runnable;

.field private mCurrPercentage:F

.field private mCurrentTargetOffsetTop:I

.field private final mDecelerateInterpolator:Landroid/view/animation/DecelerateInterpolator;

.field private mDistanceToTriggerSync:F

.field private mDownEvent:Landroid/view/MotionEvent;

.field private mFrom:I

.field private mFromPercentage:F

.field private mListener:Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;

.field private mMediumAnimationDuration:I

.field private mOriginalOffsetTop:I

.field private mPrevY:F

.field private mProgressBar:Landroid/support/v4/widget/SwipeProgressBar;

.field private mProgressBarHeight:I

.field private mRefreshing:Z

.field private final mReturnToStartPosition:Ljava/lang/Runnable;

.field private final mReturnToStartPositionListener:Landroid/view/animation/Animation$AnimationListener;

.field private mReturningToStart:Z

.field private final mShrinkAnimationListener:Landroid/view/animation/Animation$AnimationListener;

.field private mShrinkTrigger:Landroid/view/animation/Animation;

.field private mTarget:Landroid/view/View;

.field private mTouchSlop:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 86
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x101000e

    aput v2, v0, v1

    sput-object v0, Landroid/support/v4/widget/SwipeRefreshLayout;->LAYOUT_ATTRS:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 168
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v4/widget/SwipeRefreshLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 169
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 177
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 72
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mRefreshing:Z

    .line 74
    const/high16 v1, -0x40800000    # -1.0f

    iput v1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mDistanceToTriggerSync:F

    .line 77
    const/4 v1, 0x0

    iput v1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mFromPercentage:F

    .line 78
    iput v1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mCurrPercentage:F

    .line 90
    new-instance v1, Landroid/support/v4/widget/SwipeRefreshLayout$1;

    invoke-direct {v1, p0}, Landroid/support/v4/widget/SwipeRefreshLayout$1;-><init>(Landroid/support/v4/widget/SwipeRefreshLayout;)V

    iput-object v1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mAnimateToStartPosition:Landroid/view/animation/Animation;

    .line 106
    new-instance v1, Landroid/support/v4/widget/SwipeRefreshLayout$2;

    invoke-direct {v1, p0}, Landroid/support/v4/widget/SwipeRefreshLayout$2;-><init>(Landroid/support/v4/widget/SwipeRefreshLayout;)V

    iput-object v1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mShrinkTrigger:Landroid/view/animation/Animation;

    .line 114
    new-instance v1, Landroid/support/v4/widget/SwipeRefreshLayout$3;

    invoke-direct {v1, p0}, Landroid/support/v4/widget/SwipeRefreshLayout$3;-><init>(Landroid/support/v4/widget/SwipeRefreshLayout;)V

    iput-object v1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mReturnToStartPositionListener:Landroid/view/animation/Animation$AnimationListener;

    .line 123
    new-instance v1, Landroid/support/v4/widget/SwipeRefreshLayout$4;

    invoke-direct {v1, p0}, Landroid/support/v4/widget/SwipeRefreshLayout$4;-><init>(Landroid/support/v4/widget/SwipeRefreshLayout;)V

    iput-object v1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mShrinkAnimationListener:Landroid/view/animation/Animation$AnimationListener;

    .line 130
    new-instance v1, Landroid/support/v4/widget/SwipeRefreshLayout$5;

    invoke-direct {v1, p0}, Landroid/support/v4/widget/SwipeRefreshLayout$5;-><init>(Landroid/support/v4/widget/SwipeRefreshLayout;)V

    iput-object v1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mReturnToStartPosition:Ljava/lang/Runnable;

    .line 142
    new-instance v1, Landroid/support/v4/widget/SwipeRefreshLayout$6;

    invoke-direct {v1, p0}, Landroid/support/v4/widget/SwipeRefreshLayout$6;-><init>(Landroid/support/v4/widget/SwipeRefreshLayout;)V

    iput-object v1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mCancel:Ljava/lang/Runnable;

    .line 179
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    iput v1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mTouchSlop:I

    .line 181
    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x10e0001

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mMediumAnimationDuration:I

    .line 184
    invoke-virtual {p0, v0}, Landroid/support/v4/widget/SwipeRefreshLayout;->setWillNotDraw(Z)V

    .line 185
    new-instance v1, Landroid/support/v4/widget/SwipeProgressBar;

    invoke-direct {v1, p0}, Landroid/support/v4/widget/SwipeProgressBar;-><init>(Landroid/view/View;)V

    iput-object v1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mProgressBar:Landroid/support/v4/widget/SwipeProgressBar;

    .line 186
    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 187
    .local v1, "metrics":Landroid/util/DisplayMetrics;
    iget v2, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v3, 0x40800000    # 4.0f

    mul-float v2, v2, v3

    float-to-int v2, v2

    iput v2, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mProgressBarHeight:I

    .line 188
    new-instance v2, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v3, 0x40000000    # 2.0f

    invoke-direct {v2, v3}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    iput-object v2, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mDecelerateInterpolator:Landroid/view/animation/DecelerateInterpolator;

    .line 189
    new-instance v2, Landroid/view/animation/AccelerateInterpolator;

    const/high16 v3, 0x3fc00000    # 1.5f

    invoke-direct {v2, v3}, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V

    iput-object v2, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mAccelerateInterpolator:Landroid/view/animation/AccelerateInterpolator;

    .line 191
    sget-object v2, Landroid/support/v4/widget/SwipeRefreshLayout;->LAYOUT_ATTRS:[I

    invoke-virtual {p1, p2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v2

    .line 192
    .local v2, "a":Landroid/content/res/TypedArray;
    const/4 v3, 0x1

    invoke-virtual {v2, v0, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/SwipeRefreshLayout;->setEnabled(Z)V

    .line 193
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 194
    return-void
.end method

.method static synthetic access$000(Landroid/support/v4/widget/SwipeRefreshLayout;)I
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/widget/SwipeRefreshLayout;

    .line 58
    iget v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mFrom:I

    return v0
.end method

.method static synthetic access$100(Landroid/support/v4/widget/SwipeRefreshLayout;)I
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/widget/SwipeRefreshLayout;

    .line 58
    iget v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mOriginalOffsetTop:I

    return v0
.end method

.method static synthetic access$1000(Landroid/support/v4/widget/SwipeRefreshLayout;)Landroid/view/animation/Animation$AnimationListener;
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/widget/SwipeRefreshLayout;

    .line 58
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mReturnToStartPositionListener:Landroid/view/animation/Animation$AnimationListener;

    return-object v0
.end method

.method static synthetic access$1100(Landroid/support/v4/widget/SwipeRefreshLayout;ILandroid/view/animation/Animation$AnimationListener;)V
    .locals 0
    .param p0, "x0"    # Landroid/support/v4/widget/SwipeRefreshLayout;
    .param p1, "x1"    # I
    .param p2, "x2"    # Landroid/view/animation/Animation$AnimationListener;

    .line 58
    invoke-direct {p0, p1, p2}, Landroid/support/v4/widget/SwipeRefreshLayout;->animateOffsetToStartPosition(ILandroid/view/animation/Animation$AnimationListener;)V

    return-void
.end method

.method static synthetic access$1200(Landroid/support/v4/widget/SwipeRefreshLayout;)I
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/widget/SwipeRefreshLayout;

    .line 58
    iget v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mMediumAnimationDuration:I

    return v0
.end method

.method static synthetic access$1300(Landroid/support/v4/widget/SwipeRefreshLayout;)Landroid/view/animation/Animation;
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/widget/SwipeRefreshLayout;

    .line 58
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mShrinkTrigger:Landroid/view/animation/Animation;

    return-object v0
.end method

.method static synthetic access$1400(Landroid/support/v4/widget/SwipeRefreshLayout;)Landroid/view/animation/Animation$AnimationListener;
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/widget/SwipeRefreshLayout;

    .line 58
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mShrinkAnimationListener:Landroid/view/animation/Animation$AnimationListener;

    return-object v0
.end method

.method static synthetic access$1500(Landroid/support/v4/widget/SwipeRefreshLayout;)Landroid/view/animation/DecelerateInterpolator;
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/widget/SwipeRefreshLayout;

    .line 58
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mDecelerateInterpolator:Landroid/view/animation/DecelerateInterpolator;

    return-object v0
.end method

.method static synthetic access$200(Landroid/support/v4/widget/SwipeRefreshLayout;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/widget/SwipeRefreshLayout;

    .line 58
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mTarget:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$300(Landroid/support/v4/widget/SwipeRefreshLayout;I)V
    .locals 0
    .param p0, "x0"    # Landroid/support/v4/widget/SwipeRefreshLayout;
    .param p1, "x1"    # I

    .line 58
    invoke-direct {p0, p1}, Landroid/support/v4/widget/SwipeRefreshLayout;->setTargetOffsetTopAndBottom(I)V

    return-void
.end method

.method static synthetic access$400(Landroid/support/v4/widget/SwipeRefreshLayout;)F
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/widget/SwipeRefreshLayout;

    .line 58
    iget v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mFromPercentage:F

    return v0
.end method

.method static synthetic access$402(Landroid/support/v4/widget/SwipeRefreshLayout;F)F
    .locals 0
    .param p0, "x0"    # Landroid/support/v4/widget/SwipeRefreshLayout;
    .param p1, "x1"    # F

    .line 58
    iput p1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mFromPercentage:F

    return p1
.end method

.method static synthetic access$500(Landroid/support/v4/widget/SwipeRefreshLayout;)Landroid/support/v4/widget/SwipeProgressBar;
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/widget/SwipeRefreshLayout;

    .line 58
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mProgressBar:Landroid/support/v4/widget/SwipeProgressBar;

    return-object v0
.end method

.method static synthetic access$700(Landroid/support/v4/widget/SwipeRefreshLayout;)I
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/widget/SwipeRefreshLayout;

    .line 58
    iget v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mCurrentTargetOffsetTop:I

    return v0
.end method

.method static synthetic access$702(Landroid/support/v4/widget/SwipeRefreshLayout;I)I
    .locals 0
    .param p0, "x0"    # Landroid/support/v4/widget/SwipeRefreshLayout;
    .param p1, "x1"    # I

    .line 58
    iput p1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mCurrentTargetOffsetTop:I

    return p1
.end method

.method static synthetic access$800(Landroid/support/v4/widget/SwipeRefreshLayout;)F
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/widget/SwipeRefreshLayout;

    .line 58
    iget v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mCurrPercentage:F

    return v0
.end method

.method static synthetic access$802(Landroid/support/v4/widget/SwipeRefreshLayout;F)F
    .locals 0
    .param p0, "x0"    # Landroid/support/v4/widget/SwipeRefreshLayout;
    .param p1, "x1"    # F

    .line 58
    iput p1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mCurrPercentage:F

    return p1
.end method

.method static synthetic access$902(Landroid/support/v4/widget/SwipeRefreshLayout;Z)Z
    .locals 0
    .param p0, "x0"    # Landroid/support/v4/widget/SwipeRefreshLayout;
    .param p1, "x1"    # Z

    .line 58
    iput-boolean p1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mReturningToStart:Z

    return p1
.end method

.method private animateOffsetToStartPosition(ILandroid/view/animation/Animation$AnimationListener;)V
    .locals 3
    .param p1, "from"    # I
    .param p2, "listener"    # Landroid/view/animation/Animation$AnimationListener;

    .line 211
    iput p1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mFrom:I

    .line 212
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mAnimateToStartPosition:Landroid/view/animation/Animation;

    invoke-virtual {v0}, Landroid/view/animation/Animation;->reset()V

    .line 213
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mAnimateToStartPosition:Landroid/view/animation/Animation;

    iget v1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mMediumAnimationDuration:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 214
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mAnimateToStartPosition:Landroid/view/animation/Animation;

    invoke-virtual {v0, p2}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 215
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mAnimateToStartPosition:Landroid/view/animation/Animation;

    iget-object v1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mDecelerateInterpolator:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 216
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mTarget:Landroid/view/View;

    iget-object v1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mAnimateToStartPosition:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 217
    return-void
.end method

.method private ensureTarget()V
    .locals 4

    .line 287
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mTarget:Landroid/view/View;

    if-nez v0, :cond_2

    .line 288
    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_1

    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 289
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "SwipeRefreshLayout can host only one direct child"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 292
    :cond_1
    :goto_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mTarget:Landroid/view/View;

    .line 293
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mTarget:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getPaddingTop()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mOriginalOffsetTop:I

    .line 295
    :cond_2
    iget v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mDistanceToTriggerSync:F

    const/high16 v1, -0x40800000    # -1.0f

    cmpl-float v0, v0, v1

    if-nez v0, :cond_3

    .line 296
    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    if-lez v0, :cond_3

    .line 297
    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 298
    .local v0, "metrics":Landroid/util/DisplayMetrics;
    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    int-to-float v1, v1

    const v2, 0x3f19999a    # 0.6f

    mul-float v1, v1, v2

    const/high16 v2, 0x42f00000    # 120.0f

    iget v3, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float v3, v3, v2

    invoke-static {v1, v3}, Ljava/lang/Math;->min(FF)F

    move-result v1

    float-to-int v1, v1

    int-to-float v1, v1

    iput v1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mDistanceToTriggerSync:F

    .line 303
    .end local v0    # "metrics":Landroid/util/DisplayMetrics;
    :cond_3
    return-void
.end method

.method private setTargetOffsetTopAndBottom(I)V
    .locals 1
    .param p1, "offset"    # I

    .line 455
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mTarget:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->offsetTopAndBottom(I)V

    .line 456
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mTarget:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v0

    iput v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mCurrentTargetOffsetTop:I

    .line 457
    return-void
.end method

.method private setTriggerPercentage(F)V
    .locals 2
    .param p1, "percent"    # F

    .line 228
    const/4 v0, 0x0

    cmpl-float v1, p1, v0

    if-nez v1, :cond_0

    .line 231
    iput v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mCurrPercentage:F

    .line 232
    return-void

    .line 234
    :cond_0
    iput p1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mCurrPercentage:F

    .line 235
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mProgressBar:Landroid/support/v4/widget/SwipeProgressBar;

    invoke-virtual {v0, p1}, Landroid/support/v4/widget/SwipeProgressBar;->setTriggerPercentage(F)V

    .line 236
    return-void
.end method

.method private startRefresh()V
    .locals 1

    .line 438
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mCancel:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/SwipeRefreshLayout;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 439
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mReturnToStartPosition:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 440
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 441
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mListener:Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;

    invoke-interface {v0}, Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;->onRefresh()V

    .line 442
    return-void
.end method

.method private updateContentOffsetTop(I)V
    .locals 3
    .param p1, "targetTop"    # I

    .line 445
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mTarget:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v0

    .line 446
    .local v0, "currentTop":I
    int-to-float v1, p1

    iget v2, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mDistanceToTriggerSync:F

    cmpl-float v1, v1, v2

    if-lez v1, :cond_0

    .line 447
    float-to-int p1, v2

    goto :goto_0

    .line 448
    :cond_0
    if-gez p1, :cond_1

    .line 449
    const/4 p1, 0x0

    .line 451
    :cond_1
    :goto_0
    sub-int v1, p1, v0

    invoke-direct {p0, v1}, Landroid/support/v4/widget/SwipeRefreshLayout;->setTargetOffsetTopAndBottom(I)V

    .line 452
    return-void
.end method

.method private updatePositionTimeout()V
    .locals 3

    .line 460
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mCancel:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/SwipeRefreshLayout;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 461
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mCancel:Ljava/lang/Runnable;

    const-wide/16 v1, 0x12c

    invoke-virtual {p0, v0, v1, v2}, Landroid/support/v4/widget/SwipeRefreshLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 462
    return-void
.end method


# virtual methods
.method public canChildScrollUp()Z
    .locals 5

    .line 349
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-ge v0, v1, :cond_4

    .line 350
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mTarget:Landroid/view/View;

    instance-of v1, v0, Landroid/widget/AbsListView;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_2

    .line 351
    check-cast v0, Landroid/widget/AbsListView;

    .line 352
    .local v0, "absListView":Landroid/widget/AbsListView;
    invoke-virtual {v0}, Landroid/widget/AbsListView;->getChildCount()I

    move-result v1

    if-lez v1, :cond_1

    invoke-virtual {v0}, Landroid/widget/AbsListView;->getFirstVisiblePosition()I

    move-result v1

    if-gtz v1, :cond_0

    invoke-virtual {v0, v3}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v1

    invoke-virtual {v0}, Landroid/widget/AbsListView;->getPaddingTop()I

    move-result v4

    if-ge v1, v4, :cond_1

    :cond_0
    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    return v2

    .line 356
    .end local v0    # "absListView":Landroid/widget/AbsListView;
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result v0

    if-lez v0, :cond_3

    goto :goto_1

    :cond_3
    const/4 v2, 0x0

    :goto_1
    return v2

    .line 359
    :cond_4
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mTarget:Landroid/view/View;

    const/4 v1, -0x1

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->canScrollVertically(Landroid/view/View;I)Z

    move-result v0

    return v0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 1
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 307
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->draw(Landroid/graphics/Canvas;)V

    .line 308
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mProgressBar:Landroid/support/v4/widget/SwipeProgressBar;

    invoke-virtual {v0, p1}, Landroid/support/v4/widget/SwipeProgressBar;->draw(Landroid/graphics/Canvas;)V

    .line 309
    return-void
.end method

.method public isRefreshing()Z
    .locals 1

    .line 282
    iget-boolean v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mRefreshing:Z

    return v0
.end method

.method public onAttachedToWindow()V
    .locals 1

    .line 198
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 199
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mCancel:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/SwipeRefreshLayout;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 200
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mReturnToStartPosition:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/SwipeRefreshLayout;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 201
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 205
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 206
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mReturnToStartPosition:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/SwipeRefreshLayout;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 207
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mCancel:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/SwipeRefreshLayout;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 208
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .line 365
    invoke-direct {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->ensureTarget()V

    .line 366
    const/4 v0, 0x0

    .line 367
    .local v0, "handled":Z
    iget-boolean v1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mReturningToStart:Z

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_0

    .line 368
    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mReturningToStart:Z

    .line 370
    :cond_0
    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mReturningToStart:Z

    if-nez v1, :cond_1

    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->canChildScrollUp()Z

    move-result v1

    if-nez v1, :cond_1

    .line 371
    invoke-virtual {p0, p1}, Landroid/support/v4/widget/SwipeRefreshLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 373
    :cond_1
    if-nez v0, :cond_2

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    goto :goto_0

    :cond_2
    move v1, v0

    :goto_0
    return v1
.end method

.method protected onLayout(ZIIII)V
    .locals 9
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .line 313
    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getMeasuredWidth()I

    move-result v0

    .line 314
    .local v0, "width":I
    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getMeasuredHeight()I

    move-result v1

    .line 315
    .local v1, "height":I
    iget-object v2, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mProgressBar:Landroid/support/v4/widget/SwipeProgressBar;

    iget v3, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mProgressBarHeight:I

    const/4 v4, 0x0

    invoke-virtual {v2, v4, v4, v0, v3}, Landroid/support/v4/widget/SwipeProgressBar;->setBounds(IIII)V

    .line 316
    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getChildCount()I

    move-result v2

    if-nez v2, :cond_0

    .line 317
    return-void

    .line 319
    :cond_0
    invoke-virtual {p0, v4}, Landroid/support/v4/widget/SwipeRefreshLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 320
    .local v2, "child":Landroid/view/View;
    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getPaddingLeft()I

    move-result v3

    .line 321
    .local v3, "childLeft":I
    iget v4, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mCurrentTargetOffsetTop:I

    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getPaddingTop()I

    move-result v5

    add-int/2addr v4, v5

    .line 322
    .local v4, "childTop":I
    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getPaddingLeft()I

    move-result v5

    sub-int v5, v0, v5

    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getPaddingRight()I

    move-result v6

    sub-int/2addr v5, v6

    .line 323
    .local v5, "childWidth":I
    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getPaddingTop()I

    move-result v6

    sub-int v6, v1, v6

    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getPaddingBottom()I

    move-result v7

    sub-int/2addr v6, v7

    .line 324
    .local v6, "childHeight":I
    add-int v7, v3, v5

    add-int v8, v4, v6

    invoke-virtual {v2, v3, v4, v7, v8}, Landroid/view/View;->layout(IIII)V

    .line 325
    return-void
.end method

.method public onMeasure(II)V
    .locals 5
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .line 329
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onMeasure(II)V

    .line 330
    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_1

    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 331
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "SwipeRefreshLayout can host only one direct child"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 333
    :cond_1
    :goto_0
    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getChildCount()I

    move-result v0

    if-lez v0, :cond_2

    .line 334
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getMeasuredWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getPaddingLeft()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getMeasuredHeight()I

    move-result v3

    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getPaddingTop()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getPaddingBottom()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-static {v3, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/view/View;->measure(II)V

    .line 342
    :cond_2
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 7
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 383
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 384
    .local v0, "action":I
    const/4 v1, 0x0

    .line 385
    .local v1, "handled":Z
    if-eqz v0, :cond_6

    const/4 v2, 0x1

    if-eq v0, v2, :cond_5

    const/4 v2, 0x2

    if-eq v0, v2, :cond_0

    const/4 v2, 0x3

    if-eq v0, v2, :cond_5

    goto/16 :goto_1

    .line 392
    :cond_0
    iget-object v2, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mDownEvent:Landroid/view/MotionEvent;

    if-eqz v2, :cond_7

    iget-boolean v2, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mReturningToStart:Z

    if-nez v2, :cond_7

    .line 393
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    .line 394
    .local v2, "eventY":F
    iget-object v3, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mDownEvent:Landroid/view/MotionEvent;

    invoke-virtual {v3}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    sub-float v3, v2, v3

    .line 395
    .local v3, "yDiff":F
    iget v4, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mTouchSlop:I

    int-to-float v4, v4

    cmpl-float v4, v3, v4

    if-lez v4, :cond_4

    .line 397
    iget v4, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mDistanceToTriggerSync:F

    cmpl-float v5, v3, v4

    if-lez v5, :cond_1

    .line 399
    invoke-direct {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->startRefresh()V

    .line 400
    const/4 v1, 0x1

    .line 401
    goto :goto_1

    .line 404
    :cond_1
    iget-object v5, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mAccelerateInterpolator:Landroid/view/animation/AccelerateInterpolator;

    div-float v4, v3, v4

    invoke-virtual {v5, v4}, Landroid/view/animation/AccelerateInterpolator;->getInterpolation(F)F

    move-result v4

    invoke-direct {p0, v4}, Landroid/support/v4/widget/SwipeRefreshLayout;->setTriggerPercentage(F)V

    .line 407
    move v4, v3

    .line 408
    .local v4, "offsetTop":F
    iget v5, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mPrevY:F

    cmpl-float v5, v5, v2

    if-lez v5, :cond_2

    .line 409
    iget v5, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mTouchSlop:I

    int-to-float v5, v5

    sub-float v4, v3, v5

    .line 411
    :cond_2
    float-to-int v5, v4

    invoke-direct {p0, v5}, Landroid/support/v4/widget/SwipeRefreshLayout;->updateContentOffsetTop(I)V

    .line 412
    iget v5, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mPrevY:F

    cmpl-float v5, v5, v2

    if-lez v5, :cond_3

    iget-object v5, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mTarget:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v5

    iget v6, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mTouchSlop:I

    if-ge v5, v6, :cond_3

    .line 416
    iget-object v5, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mCancel:Ljava/lang/Runnable;

    invoke-virtual {p0, v5}, Landroid/support/v4/widget/SwipeRefreshLayout;->removeCallbacks(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 418
    :cond_3
    invoke-direct {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->updatePositionTimeout()V

    .line 420
    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    iput v5, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mPrevY:F

    .line 421
    const/4 v1, 0x1

    .line 424
    .end local v2    # "eventY":F
    .end local v3    # "yDiff":F
    .end local v4    # "offsetTop":F
    :cond_4
    goto :goto_1

    .line 428
    :cond_5
    iget-object v2, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mDownEvent:Landroid/view/MotionEvent;

    if-eqz v2, :cond_7

    .line 429
    invoke-virtual {v2}, Landroid/view/MotionEvent;->recycle()V

    .line 430
    const/4 v2, 0x0

    iput-object v2, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mDownEvent:Landroid/view/MotionEvent;

    goto :goto_1

    .line 387
    :cond_6
    const/4 v2, 0x0

    iput v2, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mCurrPercentage:F

    .line 388
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v2

    iput-object v2, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mDownEvent:Landroid/view/MotionEvent;

    .line 389
    iget-object v2, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mDownEvent:Landroid/view/MotionEvent;

    invoke-virtual {v2}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    iput v2, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mPrevY:F

    .line 390
    nop

    .line 434
    :cond_7
    :goto_1
    return v1
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .locals 0
    .param p1, "b"    # Z

    .line 379
    return-void
.end method

.method public setColorScheme(IIII)V
    .locals 6
    .param p1, "colorRes1"    # I
    .param p2, "colorRes2"    # I
    .param p3, "colorRes3"    # I
    .param p4, "colorRes4"    # I

    .line 268
    invoke-direct {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->ensureTarget()V

    .line 269
    invoke-virtual {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 270
    .local v0, "res":Landroid/content/res/Resources;
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    .line 271
    .local v1, "color1":I
    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    .line 272
    .local v2, "color2":I
    invoke-virtual {v0, p3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    .line 273
    .local v3, "color3":I
    invoke-virtual {v0, p4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    .line 274
    .local v4, "color4":I
    iget-object v5, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mProgressBar:Landroid/support/v4/widget/SwipeProgressBar;

    invoke-virtual {v5, v1, v2, v3, v4}, Landroid/support/v4/widget/SwipeProgressBar;->setColorScheme(IIII)V

    .line 275
    return-void
.end method

.method public setOnRefreshListener(Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;)V
    .locals 0
    .param p1, "listener"    # Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;

    .line 224
    iput-object p1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mListener:Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;

    .line 225
    return-void
.end method

.method public setRefreshing(Z)V
    .locals 1
    .param p1, "refreshing"    # Z

    .line 245
    iget-boolean v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mRefreshing:Z

    if-eq v0, p1, :cond_1

    .line 246
    invoke-direct {p0}, Landroid/support/v4/widget/SwipeRefreshLayout;->ensureTarget()V

    .line 247
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mCurrPercentage:F

    .line 248
    iput-boolean p1, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mRefreshing:Z

    .line 249
    iget-boolean v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mRefreshing:Z

    if-eqz v0, :cond_0

    .line 250
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mProgressBar:Landroid/support/v4/widget/SwipeProgressBar;

    invoke-virtual {v0}, Landroid/support/v4/widget/SwipeProgressBar;->start()V

    goto :goto_0

    .line 252
    :cond_0
    iget-object v0, p0, Landroid/support/v4/widget/SwipeRefreshLayout;->mProgressBar:Landroid/support/v4/widget/SwipeProgressBar;

    invoke-virtual {v0}, Landroid/support/v4/widget/SwipeProgressBar;->stop()V

    .line 255
    :cond_1
    :goto_0
    return-void
.end method
