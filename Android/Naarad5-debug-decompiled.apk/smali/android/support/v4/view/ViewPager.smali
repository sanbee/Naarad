.class public Landroid/support/v4/view/ViewPager;
.super Landroid/view/ViewGroup;
.source "ViewPager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/view/ViewPager$ViewPositionComparator;,
        Landroid/support/v4/view/ViewPager$LayoutParams;,
        Landroid/support/v4/view/ViewPager$PagerObserver;,
        Landroid/support/v4/view/ViewPager$MyAccessibilityDelegate;,
        Landroid/support/v4/view/ViewPager$SavedState;,
        Landroid/support/v4/view/ViewPager$Decor;,
        Landroid/support/v4/view/ViewPager$OnAdapterChangeListener;,
        Landroid/support/v4/view/ViewPager$PageTransformer;,
        Landroid/support/v4/view/ViewPager$SimpleOnPageChangeListener;,
        Landroid/support/v4/view/ViewPager$OnPageChangeListener;,
        Landroid/support/v4/view/ViewPager$ItemInfo;
    }
.end annotation


# static fields
.field private static final CLOSE_ENOUGH:I = 0x2

.field private static final COMPARATOR:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Landroid/support/v4/view/ViewPager$ItemInfo;",
            ">;"
        }
    .end annotation
.end field

.field private static final DEBUG:Z = false

.field private static final DEFAULT_GUTTER_SIZE:I = 0x10

.field private static final DEFAULT_OFFSCREEN_PAGES:I = 0x1

.field private static final DRAW_ORDER_DEFAULT:I = 0x0

.field private static final DRAW_ORDER_FORWARD:I = 0x1

.field private static final DRAW_ORDER_REVERSE:I = 0x2

.field private static final INVALID_POINTER:I = -0x1

.field private static final LAYOUT_ATTRS:[I

.field private static final MAX_SETTLE_DURATION:I = 0x258

.field private static final MIN_DISTANCE_FOR_FLING:I = 0x19

.field private static final MIN_FLING_VELOCITY:I = 0x190

.field public static final SCROLL_STATE_DRAGGING:I = 0x1

.field public static final SCROLL_STATE_IDLE:I = 0x0

.field public static final SCROLL_STATE_SETTLING:I = 0x2

.field private static final TAG:Ljava/lang/String; = "ViewPager"

.field private static final USE_CACHE:Z = false

.field private static final sInterpolator:Landroid/view/animation/Interpolator;

.field private static final sPositionComparator:Landroid/support/v4/view/ViewPager$ViewPositionComparator;


# instance fields
.field private mActivePointerId:I

.field private mAdapter:Landroid/support/v4/view/PagerAdapter;

.field private mAdapterChangeListener:Landroid/support/v4/view/ViewPager$OnAdapterChangeListener;

.field private mBottomPageBounds:I

.field private mCalledSuper:Z

.field private mChildHeightMeasureSpec:I

.field private mChildWidthMeasureSpec:I

.field private mCloseEnough:I

.field private mCurItem:I

.field private mDecorChildCount:I

.field private mDefaultGutterSize:I

.field private mDrawingOrder:I

.field private mDrawingOrderedChildren:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final mEndScrollRunnable:Ljava/lang/Runnable;

.field private mExpectedAdapterCount:I

.field private mFakeDragBeginTime:J

.field private mFakeDragging:Z

.field private mFirstLayout:Z

.field private mFirstOffset:F

.field private mFlingDistance:I

.field private mGutterSize:I

.field private mIgnoreGutter:Z

.field private mInLayout:Z

.field private mInitialMotionX:F

.field private mInitialMotionY:F

.field private mInternalPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

.field private mIsBeingDragged:Z

.field private mIsUnableToDrag:Z

.field private final mItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/support/v4/view/ViewPager$ItemInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mLastMotionX:F

.field private mLastMotionY:F

.field private mLastOffset:F

.field private mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

.field private mMarginDrawable:Landroid/graphics/drawable/Drawable;

.field private mMaximumVelocity:I

.field private mMinimumVelocity:I

.field private mNeedCalculatePageOffsets:Z

.field private mObserver:Landroid/support/v4/view/ViewPager$PagerObserver;

.field private mOffscreenPageLimit:I

.field private mOnPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

.field private mPageMargin:I

.field private mPageTransformer:Landroid/support/v4/view/ViewPager$PageTransformer;

.field private mPopulatePending:Z

.field private mRestoredAdapterState:Landroid/os/Parcelable;

.field private mRestoredClassLoader:Ljava/lang/ClassLoader;

.field private mRestoredCurItem:I

.field private mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

.field private mScrollState:I

.field private mScroller:Landroid/widget/Scroller;

.field private mScrollingCacheEnabled:Z

.field private mSetChildrenDrawingOrderEnabled:Ljava/lang/reflect/Method;

.field private final mTempItem:Landroid/support/v4/view/ViewPager$ItemInfo;

.field private final mTempRect:Landroid/graphics/Rect;

.field private mTopPageBounds:I

.field private mTouchSlop:I

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 98
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x10100b3

    aput v2, v0, v1

    sput-object v0, Landroid/support/v4/view/ViewPager;->LAYOUT_ATTRS:[I

    .line 116
    new-instance v0, Landroid/support/v4/view/ViewPager$1;

    invoke-direct {v0}, Landroid/support/v4/view/ViewPager$1;-><init>()V

    sput-object v0, Landroid/support/v4/view/ViewPager;->COMPARATOR:Ljava/util/Comparator;

    .line 123
    new-instance v0, Landroid/support/v4/view/ViewPager$2;

    invoke-direct {v0}, Landroid/support/v4/view/ViewPager$2;-><init>()V

    sput-object v0, Landroid/support/v4/view/ViewPager;->sInterpolator:Landroid/view/animation/Interpolator;

    .line 223
    new-instance v0, Landroid/support/v4/view/ViewPager$ViewPositionComparator;

    invoke-direct {v0}, Landroid/support/v4/view/ViewPager$ViewPositionComparator;-><init>()V

    sput-object v0, Landroid/support/v4/view/ViewPager;->sPositionComparator:Landroid/support/v4/view/ViewPager$ViewPositionComparator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .line 344
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 130
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    .line 131
    new-instance v0, Landroid/support/v4/view/ViewPager$ItemInfo;

    invoke-direct {v0}, Landroid/support/v4/view/ViewPager$ItemInfo;-><init>()V

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mTempItem:Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 133
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mTempRect:Landroid/graphics/Rect;

    .line 137
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v4/view/ViewPager;->mRestoredCurItem:I

    .line 138
    const/4 v1, 0x0

    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mRestoredAdapterState:Landroid/os/Parcelable;

    .line 139
    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mRestoredClassLoader:Ljava/lang/ClassLoader;

    .line 151
    const v1, -0x800001

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    .line 152
    const v1, 0x7f7fffff    # Float.MAX_VALUE

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    .line 161
    const/4 v1, 0x1

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mOffscreenPageLimit:I

    .line 180
    iput v0, p0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    .line 207
    iput-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    .line 208
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mNeedCalculatePageOffsets:Z

    .line 241
    new-instance v1, Landroid/support/v4/view/ViewPager$3;

    invoke-direct {v1, p0}, Landroid/support/v4/view/ViewPager$3;-><init>(Landroid/support/v4/view/ViewPager;)V

    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mEndScrollRunnable:Ljava/lang/Runnable;

    .line 248
    iput v0, p0, Landroid/support/v4/view/ViewPager;->mScrollState:I

    .line 345
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->initViewPager()V

    .line 346
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 349
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 130
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    .line 131
    new-instance v0, Landroid/support/v4/view/ViewPager$ItemInfo;

    invoke-direct {v0}, Landroid/support/v4/view/ViewPager$ItemInfo;-><init>()V

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mTempItem:Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 133
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mTempRect:Landroid/graphics/Rect;

    .line 137
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v4/view/ViewPager;->mRestoredCurItem:I

    .line 138
    const/4 v1, 0x0

    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mRestoredAdapterState:Landroid/os/Parcelable;

    .line 139
    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mRestoredClassLoader:Ljava/lang/ClassLoader;

    .line 151
    const v1, -0x800001

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    .line 152
    const v1, 0x7f7fffff    # Float.MAX_VALUE

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    .line 161
    const/4 v1, 0x1

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mOffscreenPageLimit:I

    .line 180
    iput v0, p0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    .line 207
    iput-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    .line 208
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mNeedCalculatePageOffsets:Z

    .line 241
    new-instance v1, Landroid/support/v4/view/ViewPager$3;

    invoke-direct {v1, p0}, Landroid/support/v4/view/ViewPager$3;-><init>(Landroid/support/v4/view/ViewPager;)V

    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mEndScrollRunnable:Ljava/lang/Runnable;

    .line 248
    iput v0, p0, Landroid/support/v4/view/ViewPager;->mScrollState:I

    .line 350
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->initViewPager()V

    .line 351
    return-void
.end method

.method static synthetic access$000(Landroid/support/v4/view/ViewPager;I)V
    .locals 0
    .param p0, "x0"    # Landroid/support/v4/view/ViewPager;
    .param p1, "x1"    # I

    .line 84
    invoke-direct {p0, p1}, Landroid/support/v4/view/ViewPager;->setScrollState(I)V

    return-void
.end method

.method static synthetic access$200(Landroid/support/v4/view/ViewPager;)Landroid/support/v4/view/PagerAdapter;
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/view/ViewPager;

    .line 84
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    return-object v0
.end method

.method static synthetic access$300(Landroid/support/v4/view/ViewPager;)I
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/view/ViewPager;

    .line 84
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    return v0
.end method

.method static synthetic access$400()[I
    .locals 1

    .line 84
    sget-object v0, Landroid/support/v4/view/ViewPager;->LAYOUT_ATTRS:[I

    return-object v0
.end method

.method private calculatePageOffsets(Landroid/support/v4/view/ViewPager$ItemInfo;ILandroid/support/v4/view/ViewPager$ItemInfo;)V
    .locals 11
    .param p1, "curItem"    # Landroid/support/v4/view/ViewPager$ItemInfo;
    .param p2, "curIndex"    # I
    .param p3, "oldCurInfo"    # Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 1122
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v0}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v0

    .line 1123
    .local v0, "N":I
    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v1

    .line 1124
    .local v1, "width":I
    if-lez v1, :cond_0

    iget v2, p0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    int-to-float v2, v2

    int-to-float v3, v1

    div-float/2addr v2, v3

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 1126
    .local v2, "marginOffset":F
    :goto_0
    if-eqz p3, :cond_6

    .line 1127
    iget v3, p3, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    .line 1129
    .local v3, "oldCurPosition":I
    iget v4, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ge v3, v4, :cond_3

    .line 1130
    const/4 v4, 0x0

    .line 1131
    .local v4, "itemIndex":I
    const/4 v5, 0x0

    .line 1132
    .local v5, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget v6, p3, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    iget v7, p3, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v6, v7

    add-float/2addr v6, v2

    .line 1133
    .local v6, "offset":F
    add-int/lit8 v7, v3, 0x1

    .line 1134
    .local v7, "pos":I
    :goto_1
    iget v8, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-gt v7, v8, :cond_6

    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v4, v8, :cond_6

    .line 1135
    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object v5, v8

    check-cast v5, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 1136
    :goto_2
    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-le v7, v8, :cond_1

    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    if-ge v4, v8, :cond_1

    .line 1137
    add-int/lit8 v4, v4, 0x1

    .line 1138
    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object v5, v8

    check-cast v5, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_2

    .line 1140
    :cond_1
    :goto_3
    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ge v7, v8, :cond_2

    .line 1143
    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v8, v7}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v8

    add-float/2addr v8, v2

    add-float/2addr v6, v8

    .line 1144
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 1146
    :cond_2
    iput v6, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    .line 1147
    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v8, v2

    add-float/2addr v6, v8

    .line 1134
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 1149
    .end local v4    # "itemIndex":I
    .end local v5    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v6    # "offset":F
    .end local v7    # "pos":I
    :cond_3
    iget v4, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-le v3, v4, :cond_6

    .line 1150
    iget-object v4, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    .line 1151
    .restart local v4    # "itemIndex":I
    const/4 v5, 0x0

    .line 1152
    .restart local v5    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget v6, p3, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    .line 1153
    .restart local v6    # "offset":F
    add-int/lit8 v7, v3, -0x1

    .line 1154
    .restart local v7    # "pos":I
    :goto_4
    iget v8, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-lt v7, v8, :cond_6

    if-ltz v4, :cond_6

    .line 1155
    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object v5, v8

    check-cast v5, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 1156
    :goto_5
    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ge v7, v8, :cond_4

    if-lez v4, :cond_4

    .line 1157
    add-int/lit8 v4, v4, -0x1

    .line 1158
    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object v5, v8

    check-cast v5, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_5

    .line 1160
    :cond_4
    :goto_6
    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-le v7, v8, :cond_5

    .line 1163
    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v8, v7}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v8

    add-float/2addr v8, v2

    sub-float/2addr v6, v8

    .line 1164
    add-int/lit8 v7, v7, -0x1

    goto :goto_6

    .line 1166
    :cond_5
    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v8, v2

    sub-float/2addr v6, v8

    .line 1167
    iput v6, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    .line 1154
    add-int/lit8 v7, v7, -0x1

    goto :goto_4

    .line 1173
    .end local v3    # "oldCurPosition":I
    .end local v4    # "itemIndex":I
    .end local v5    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v6    # "offset":F
    .end local v7    # "pos":I
    :cond_6
    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 1174
    .local v3, "itemCount":I
    iget v4, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    .line 1175
    .local v4, "offset":F
    iget v5, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    add-int/lit8 v5, v5, -0x1

    .line 1176
    .local v5, "pos":I
    iget v6, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-nez v6, :cond_7

    iget v6, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    goto :goto_7

    :cond_7
    const v6, -0x800001

    :goto_7
    iput v6, p0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    .line 1177
    iget v6, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    add-int/lit8 v7, v0, -0x1

    const/high16 v8, 0x3f800000    # 1.0f

    if-ne v6, v7, :cond_8

    iget v6, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    iget v7, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v6, v7

    sub-float/2addr v6, v8

    goto :goto_8

    :cond_8
    const v6, 0x7f7fffff    # Float.MAX_VALUE

    :goto_8
    iput v6, p0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    .line 1180
    add-int/lit8 v6, p2, -0x1

    .local v6, "i":I
    :goto_9
    if-ltz v6, :cond_b

    .line 1181
    iget-object v7, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 1182
    .local v7, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :goto_a
    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-le v5, v9, :cond_9

    .line 1183
    iget-object v9, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    add-int/lit8 v10, v5, -0x1

    .end local v5    # "pos":I
    .local v10, "pos":I
    invoke-virtual {v9, v5}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v5

    add-float/2addr v5, v2

    sub-float/2addr v4, v5

    move v5, v10

    goto :goto_a

    .line 1185
    .end local v10    # "pos":I
    .restart local v5    # "pos":I
    :cond_9
    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v9, v2

    sub-float/2addr v4, v9

    .line 1186
    iput v4, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    .line 1187
    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-nez v9, :cond_a

    iput v4, p0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    .line 1180
    .end local v7    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_a
    add-int/lit8 v6, v6, -0x1

    add-int/lit8 v5, v5, -0x1

    goto :goto_9

    .line 1189
    .end local v6    # "i":I
    :cond_b
    iget v6, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    iget v7, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v6, v7

    add-float/2addr v6, v2

    .line 1190
    .end local v4    # "offset":F
    .local v6, "offset":F
    iget v4, p1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    add-int/lit8 v4, v4, 0x1

    .line 1192
    .end local v5    # "pos":I
    .local v4, "pos":I
    add-int/lit8 v5, p2, 0x1

    .local v5, "i":I
    :goto_b
    if-ge v5, v3, :cond_e

    .line 1193
    iget-object v7, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 1194
    .restart local v7    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :goto_c
    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ge v4, v9, :cond_c

    .line 1195
    iget-object v9, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    add-int/lit8 v10, v4, 0x1

    .end local v4    # "pos":I
    .restart local v10    # "pos":I
    invoke-virtual {v9, v4}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v4

    add-float/2addr v4, v2

    add-float/2addr v6, v4

    move v4, v10

    goto :goto_c

    .line 1197
    .end local v10    # "pos":I
    .restart local v4    # "pos":I
    :cond_c
    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    add-int/lit8 v10, v0, -0x1

    if-ne v9, v10, :cond_d

    .line 1198
    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v9, v6

    sub-float/2addr v9, v8

    iput v9, p0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    .line 1200
    :cond_d
    iput v6, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    .line 1201
    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v9, v2

    add-float/2addr v6, v9

    .line 1192
    .end local v7    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    add-int/lit8 v5, v5, 0x1

    add-int/lit8 v4, v4, 0x1

    goto :goto_b

    .line 1204
    .end local v5    # "i":I
    :cond_e
    const/4 v5, 0x0

    iput-boolean v5, p0, Landroid/support/v4/view/ViewPager;->mNeedCalculatePageOffsets:Z

    .line 1205
    return-void
.end method

.method private completeScroll(Z)V
    .locals 6
    .param p1, "postEvents"    # Z

    .line 1736
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mScrollState:I

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1737
    .local v0, "needPopulate":Z
    :goto_0
    if-eqz v0, :cond_2

    .line 1739
    invoke-direct {p0, v1}, Landroid/support/v4/view/ViewPager;->setScrollingCacheEnabled(Z)V

    .line 1740
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v2}, Landroid/widget/Scroller;->abortAnimation()V

    .line 1741
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v2

    .line 1742
    .local v2, "oldX":I
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getScrollY()I

    move-result v3

    .line 1743
    .local v3, "oldY":I
    iget-object v4, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->getCurrX()I

    move-result v4

    .line 1744
    .local v4, "x":I
    iget-object v5, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v5}, Landroid/widget/Scroller;->getCurrY()I

    move-result v5

    .line 1745
    .local v5, "y":I
    if-ne v2, v4, :cond_1

    if-eq v3, v5, :cond_2

    .line 1746
    :cond_1
    invoke-virtual {p0, v4, v5}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    .line 1749
    .end local v2    # "oldX":I
    .end local v3    # "oldY":I
    .end local v4    # "x":I
    .end local v5    # "y":I
    :cond_2
    iput-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    .line 1750
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_4

    .line 1751
    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 1752
    .local v3, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget-boolean v4, v3, Landroid/support/v4/view/ViewPager$ItemInfo;->scrolling:Z

    if-eqz v4, :cond_3

    .line 1753
    const/4 v0, 0x1

    .line 1754
    iput-boolean v1, v3, Landroid/support/v4/view/ViewPager$ItemInfo;->scrolling:Z

    .line 1750
    .end local v3    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1757
    .end local v2    # "i":I
    :cond_4
    if-eqz v0, :cond_6

    .line 1758
    if-eqz p1, :cond_5

    .line 1759
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mEndScrollRunnable:Ljava/lang/Runnable;

    invoke-static {p0, v1}, Landroid/support/v4/view/ViewCompat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    goto :goto_2

    .line 1761
    :cond_5
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mEndScrollRunnable:Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 1764
    :cond_6
    :goto_2
    return-void
.end method

.method private determineTargetPage(IFII)I
    .locals 5
    .param p1, "currentPage"    # I
    .param p2, "pageOffset"    # F
    .param p3, "velocity"    # I
    .param p4, "deltaX"    # I

    .line 2151
    invoke-static {p4}, Ljava/lang/Math;->abs(I)I

    move-result v0

    iget v1, p0, Landroid/support/v4/view/ViewPager;->mFlingDistance:I

    if-le v0, v1, :cond_1

    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result v0

    iget v1, p0, Landroid/support/v4/view/ViewPager;->mMinimumVelocity:I

    if-le v0, v1, :cond_1

    .line 2152
    if-lez p3, :cond_0

    move v0, p1

    goto :goto_0

    :cond_0
    add-int/lit8 v0, p1, 0x1

    .local v0, "targetPage":I
    :goto_0
    goto :goto_2

    .line 2154
    .end local v0    # "targetPage":I
    :cond_1
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-lt p1, v0, :cond_2

    const v0, 0x3ecccccd    # 0.4f

    goto :goto_1

    :cond_2
    const v0, 0x3f19999a    # 0.6f

    .line 2155
    .local v0, "truncator":F
    :goto_1
    int-to-float v1, p1

    add-float/2addr v1, p2

    add-float/2addr v1, v0

    float-to-int v0, v1

    .line 2158
    .local v0, "targetPage":I
    :goto_2
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_3

    .line 2159
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 2160
    .local v1, "firstItem":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 2163
    .local v2, "lastItem":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget v3, v1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v4, v2, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    invoke-static {v0, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 2166
    .end local v1    # "firstItem":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v2    # "lastItem":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_3
    return v0
.end method

.method private enableLayers(Z)V
    .locals 5
    .param p1, "enable"    # Z

    .line 1771
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v0

    .line 1772
    .local v0, "childCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 1773
    if-eqz p1, :cond_0

    const/4 v2, 0x2

    goto :goto_1

    :cond_0
    const/4 v2, 0x0

    .line 1775
    .local v2, "layerType":I
    :goto_1
    invoke-virtual {p0, v1}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v3, v2, v4}, Landroid/support/v4/view/ViewCompat;->setLayerType(Landroid/view/View;ILandroid/graphics/Paint;)V

    .line 1772
    .end local v2    # "layerType":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1777
    .end local v1    # "i":I
    :cond_1
    return-void
.end method

.method private endDrag()V
    .locals 1

    .line 2399
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    .line 2400
    iput-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mIsUnableToDrag:Z

    .line 2402
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_0

    .line 2403
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 2404
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 2406
    :cond_0
    return-void
.end method

.method private getChildRectInPagerCoordinates(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;
    .locals 4
    .param p1, "outRect"    # Landroid/graphics/Rect;
    .param p2, "child"    # Landroid/view/View;

    .line 2580
    if-nez p1, :cond_0

    .line 2581
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    move-object p1, v0

    .line 2583
    :cond_0
    if-nez p2, :cond_1

    .line 2584
    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 2585
    return-object p1

    .line 2587
    :cond_1
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v0

    iput v0, p1, Landroid/graphics/Rect;->left:I

    .line 2588
    invoke-virtual {p2}, Landroid/view/View;->getRight()I

    move-result v0

    iput v0, p1, Landroid/graphics/Rect;->right:I

    .line 2589
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v0

    iput v0, p1, Landroid/graphics/Rect;->top:I

    .line 2590
    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    move-result v0

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    .line 2592
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 2593
    .local v0, "parent":Landroid/view/ViewParent;
    :goto_0
    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_2

    if-eq v0, p0, :cond_2

    .line 2594
    move-object v1, v0

    check-cast v1, Landroid/view/ViewGroup;

    .line 2595
    .local v1, "group":Landroid/view/ViewGroup;
    iget v2, p1, Landroid/graphics/Rect;->left:I

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getLeft()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, p1, Landroid/graphics/Rect;->left:I

    .line 2596
    iget v2, p1, Landroid/graphics/Rect;->right:I

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getRight()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, p1, Landroid/graphics/Rect;->right:I

    .line 2597
    iget v2, p1, Landroid/graphics/Rect;->top:I

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getTop()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, p1, Landroid/graphics/Rect;->top:I

    .line 2598
    iget v2, p1, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getBottom()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, p1, Landroid/graphics/Rect;->bottom:I

    .line 2600
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 2601
    .end local v1    # "group":Landroid/view/ViewGroup;
    goto :goto_0

    .line 2602
    :cond_2
    return-object p1
.end method

.method private getClientWidth()I
    .locals 2

    .line 478
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method private infoForCurrentScrollPosition()Landroid/support/v4/view/ViewPager$ItemInfo;
    .locals 14

    .line 2108
    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v0

    .line 2109
    .local v0, "width":I
    const/4 v1, 0x0

    if-lez v0, :cond_0

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v2

    int-to-float v2, v2

    int-to-float v3, v0

    div-float/2addr v2, v3

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 2110
    .local v2, "scrollOffset":F
    :goto_0
    if-lez v0, :cond_1

    iget v1, p0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    int-to-float v1, v1

    int-to-float v3, v0

    div-float/2addr v1, v3

    .line 2111
    .local v1, "marginOffset":F
    :cond_1
    const/4 v3, -0x1

    .line 2112
    .local v3, "lastPos":I
    const/4 v4, 0x0

    .line 2113
    .local v4, "lastOffset":F
    const/4 v5, 0x0

    .line 2114
    .local v5, "lastWidth":F
    const/4 v6, 0x1

    .line 2116
    .local v6, "first":Z
    const/4 v7, 0x0

    .line 2117
    .local v7, "lastItem":Landroid/support/v4/view/ViewPager$ItemInfo;
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_1
    iget-object v9, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v8, v9, :cond_7

    .line 2118
    iget-object v9, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 2120
    .local v9, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    if-nez v6, :cond_2

    iget v10, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    add-int/lit8 v11, v3, 0x1

    if-eq v10, v11, :cond_2

    .line 2122
    iget-object v9, p0, Landroid/support/v4/view/ViewPager;->mTempItem:Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 2123
    add-float v10, v4, v5

    add-float/2addr v10, v1

    iput v10, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    .line 2124
    add-int/lit8 v10, v3, 0x1

    iput v10, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    .line 2125
    iget-object v10, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget v11, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    invoke-virtual {v10, v11}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v10

    iput v10, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    .line 2126
    add-int/lit8 v8, v8, -0x1

    .line 2128
    :cond_2
    iget v10, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    .line 2130
    .local v10, "offset":F
    move v11, v10

    .line 2131
    .local v11, "leftBound":F
    iget v12, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v12, v10

    add-float/2addr v12, v1

    .line 2132
    .local v12, "rightBound":F
    if-nez v6, :cond_4

    cmpl-float v13, v2, v11

    if-ltz v13, :cond_3

    goto :goto_2

    .line 2137
    :cond_3
    return-object v7

    .line 2133
    :cond_4
    :goto_2
    cmpg-float v13, v2, v12

    if-ltz v13, :cond_6

    iget-object v13, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    if-ne v8, v13, :cond_5

    goto :goto_3

    .line 2139
    :cond_5
    const/4 v6, 0x0

    .line 2140
    iget v3, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    .line 2141
    move v4, v10

    .line 2142
    iget v5, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    .line 2143
    move-object v7, v9

    .line 2117
    .end local v9    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v10    # "offset":F
    .end local v11    # "leftBound":F
    .end local v12    # "rightBound":F
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 2134
    .restart local v9    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .restart local v10    # "offset":F
    .restart local v11    # "leftBound":F
    .restart local v12    # "rightBound":F
    :cond_6
    :goto_3
    return-object v9

    .line 2146
    .end local v8    # "i":I
    .end local v9    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v10    # "offset":F
    .end local v11    # "leftBound":F
    .end local v12    # "rightBound":F
    :cond_7
    return-object v7
.end method

.method private isGutterDrag(FF)Z
    .locals 3
    .param p1, "x"    # F
    .param p2, "dx"    # F

    .line 1767
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mGutterSize:I

    int-to-float v0, v0

    const/4 v1, 0x0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    cmpl-float v0, p2, v1

    if-gtz v0, :cond_1

    :cond_0
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getWidth()I

    move-result v0

    iget v2, p0, Landroid/support/v4/view/ViewPager;->mGutterSize:I

    sub-int/2addr v0, v2

    int-to-float v0, v0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_2

    cmpg-float v0, p2, v1

    if-gez v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private onSecondaryPointerUp(Landroid/view/MotionEvent;)V
    .locals 4
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .line 2384
    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getActionIndex(Landroid/view/MotionEvent;)I

    move-result v0

    .line 2385
    .local v0, "pointerIndex":I
    invoke-static {p1, v0}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v1

    .line 2386
    .local v1, "pointerId":I
    iget v2, p0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    if-ne v1, v2, :cond_1

    .line 2389
    if-nez v0, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 2390
    .local v2, "newPointerIndex":I
    :goto_0
    invoke-static {p1, v2}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v3

    iput v3, p0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    .line 2391
    invoke-static {p1, v2}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v3

    iput v3, p0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    .line 2392
    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v3, :cond_1

    .line 2393
    invoke-virtual {v3}, Landroid/view/VelocityTracker;->clear()V

    .line 2396
    .end local v2    # "newPointerIndex":I
    :cond_1
    return-void
.end method

.method private pageScrolled(I)Z
    .locals 9
    .param p1, "xpos"    # I

    .line 1631
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const-string v1, "onPageScrolled did not call superclass implementation"

    const/4 v2, 0x0

    if-nez v0, :cond_1

    .line 1632
    iput-boolean v2, p0, Landroid/support/v4/view/ViewPager;->mCalledSuper:Z

    .line 1633
    const/4 v0, 0x0

    invoke-virtual {p0, v2, v0, v2}, Landroid/support/v4/view/ViewPager;->onPageScrolled(IFI)V

    .line 1634
    iget-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mCalledSuper:Z

    if-eqz v0, :cond_0

    .line 1638
    return v2

    .line 1635
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1640
    :cond_1
    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->infoForCurrentScrollPosition()Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v0

    .line 1641
    .local v0, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v3

    .line 1642
    .local v3, "width":I
    iget v4, p0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    add-int v5, v3, v4

    .line 1643
    .local v5, "widthWithMargin":I
    int-to-float v4, v4

    int-to-float v6, v3

    div-float/2addr v4, v6

    .line 1644
    .local v4, "marginOffset":F
    iget v6, v0, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    .line 1645
    .local v6, "currentPage":I
    int-to-float v7, p1

    int-to-float v8, v3

    div-float/2addr v7, v8

    iget v8, v0, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    sub-float/2addr v7, v8

    iget v8, v0, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v8, v4

    div-float/2addr v7, v8

    .line 1647
    .local v7, "pageOffset":F
    int-to-float v8, v5

    mul-float v8, v8, v7

    float-to-int v8, v8

    .line 1649
    .local v8, "offsetPixels":I
    iput-boolean v2, p0, Landroid/support/v4/view/ViewPager;->mCalledSuper:Z

    .line 1650
    invoke-virtual {p0, v6, v7, v8}, Landroid/support/v4/view/ViewPager;->onPageScrolled(IFI)V

    .line 1651
    iget-boolean v2, p0, Landroid/support/v4/view/ViewPager;->mCalledSuper:Z

    if-eqz v2, :cond_2

    .line 1655
    const/4 v1, 0x1

    return v1

    .line 1652
    :cond_2
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private performDrag(F)Z
    .locals 16
    .param p1, "x"    # F

    .line 2057
    move-object/from16 v0, p0

    move/from16 v1, p1

    const/4 v2, 0x0

    .line 2059
    .local v2, "needsInvalidate":Z
    iget v3, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    sub-float/2addr v3, v1

    .line 2060
    .local v3, "deltaX":F
    iput v1, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    .line 2062
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v4

    int-to-float v4, v4

    .line 2063
    .local v4, "oldScrollX":F
    add-float v5, v4, v3

    .line 2064
    .local v5, "scrollX":F
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v6

    .line 2066
    .local v6, "width":I
    int-to-float v7, v6

    iget v8, v0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    mul-float v7, v7, v8

    .line 2067
    .local v7, "leftBound":F
    int-to-float v8, v6

    iget v9, v0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    mul-float v8, v8, v9

    .line 2068
    .local v8, "rightBound":F
    const/4 v9, 0x1

    .line 2069
    .local v9, "leftAbsolute":Z
    const/4 v10, 0x1

    .line 2071
    .local v10, "rightAbsolute":Z
    iget-object v11, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 2072
    .local v11, "firstItem":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget-object v12, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    invoke-virtual {v12, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 2073
    .local v12, "lastItem":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget v13, v11, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-eqz v13, :cond_0

    .line 2074
    const/4 v9, 0x0

    .line 2075
    iget v13, v11, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    int-to-float v14, v6

    mul-float v7, v13, v14

    .line 2077
    :cond_0
    iget v13, v12, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget-object v14, v0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v14}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v14

    add-int/lit8 v14, v14, -0x1

    if-eq v13, v14, :cond_1

    .line 2078
    const/4 v10, 0x0

    .line 2079
    iget v13, v12, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    int-to-float v14, v6

    mul-float v8, v13, v14

    .line 2082
    :cond_1
    cmpg-float v13, v5, v7

    if-gez v13, :cond_3

    .line 2083
    if-eqz v9, :cond_2

    .line 2084
    sub-float v13, v7, v5

    .line 2085
    .local v13, "over":F
    iget-object v14, v0, Landroid/support/v4/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-static {v13}, Ljava/lang/Math;->abs(F)F

    move-result v15

    int-to-float v1, v6

    div-float/2addr v15, v1

    invoke-virtual {v14, v15}, Landroid/support/v4/widget/EdgeEffectCompat;->onPull(F)Z

    move-result v2

    .line 2087
    .end local v13    # "over":F
    :cond_2
    move v5, v7

    goto :goto_0

    .line 2088
    :cond_3
    cmpl-float v1, v5, v8

    if-lez v1, :cond_5

    .line 2089
    if-eqz v10, :cond_4

    .line 2090
    sub-float v1, v5, v8

    .line 2091
    .local v1, "over":F
    iget-object v13, v0, Landroid/support/v4/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v14

    int-to-float v15, v6

    div-float/2addr v14, v15

    invoke-virtual {v13, v14}, Landroid/support/v4/widget/EdgeEffectCompat;->onPull(F)Z

    move-result v2

    .line 2093
    .end local v1    # "over":F
    :cond_4
    move v5, v8

    .line 2096
    :cond_5
    :goto_0
    iget v1, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    float-to-int v13, v5

    int-to-float v13, v13

    sub-float v13, v5, v13

    add-float/2addr v1, v13

    iput v1, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    .line 2097
    float-to-int v1, v5

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollY()I

    move-result v13

    invoke-virtual {v0, v1, v13}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    .line 2098
    float-to-int v1, v5

    invoke-direct {v0, v1}, Landroid/support/v4/view/ViewPager;->pageScrolled(I)Z

    .line 2100
    return v2
.end method

.method private recomputeScrollPosition(IIII)V
    .locals 15
    .param p1, "width"    # I
    .param p2, "oldWidth"    # I
    .param p3, "margin"    # I
    .param p4, "oldMargin"    # I

    .line 1468
    move-object v0, p0

    move/from16 v1, p1

    if-lez p2, :cond_1

    iget-object v2, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 1469
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingLeft()I

    move-result v2

    sub-int v2, v1, v2

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingRight()I

    move-result v3

    sub-int/2addr v2, v3

    add-int v2, v2, p3

    .line 1470
    .local v2, "widthWithMargin":I
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingLeft()I

    move-result v3

    sub-int v3, p2, v3

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingRight()I

    move-result v4

    sub-int/2addr v3, v4

    add-int v3, v3, p4

    .line 1472
    .local v3, "oldWidthWithMargin":I
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v4

    .line 1473
    .local v4, "xpos":I
    int-to-float v5, v4

    int-to-float v6, v3

    div-float/2addr v5, v6

    .line 1474
    .local v5, "pageOffset":F
    int-to-float v6, v2

    mul-float v6, v6, v5

    float-to-int v6, v6

    .line 1476
    .local v6, "newOffsetPixels":I
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getScrollY()I

    move-result v7

    invoke-virtual {p0, v6, v7}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    .line 1477
    iget-object v7, v0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v7}, Landroid/widget/Scroller;->isFinished()Z

    move-result v7

    if-nez v7, :cond_0

    .line 1479
    iget-object v7, v0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v7}, Landroid/widget/Scroller;->getDuration()I

    move-result v7

    iget-object v8, v0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v8}, Landroid/widget/Scroller;->timePassed()I

    move-result v8

    sub-int v13, v7, v8

    .line 1480
    .local v13, "newDuration":I
    iget v7, v0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    invoke-virtual {p0, v7}, Landroid/support/v4/view/ViewPager;->infoForPosition(I)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v14

    .line 1481
    .local v14, "targetInfo":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget-object v7, v0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    const/4 v9, 0x0

    iget v8, v14, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    int-to-float v10, v1

    mul-float v8, v8, v10

    float-to-int v10, v8

    const/4 v11, 0x0

    move v8, v6

    move v12, v13

    invoke-virtual/range {v7 .. v12}, Landroid/widget/Scroller;->startScroll(IIIII)V

    .line 1484
    .end local v2    # "widthWithMargin":I
    .end local v3    # "oldWidthWithMargin":I
    .end local v4    # "xpos":I
    .end local v5    # "pageOffset":F
    .end local v6    # "newOffsetPixels":I
    .end local v13    # "newDuration":I
    .end local v14    # "targetInfo":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_0
    goto :goto_1

    .line 1485
    :cond_1
    iget v2, v0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    invoke-virtual {p0, v2}, Landroid/support/v4/view/ViewPager;->infoForPosition(I)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v2

    .line 1486
    .local v2, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    if-eqz v2, :cond_2

    iget v3, v2, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    iget v4, v0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    goto :goto_0

    :cond_2
    const/4 v3, 0x0

    .line 1487
    .local v3, "scrollOffset":F
    :goto_0
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingLeft()I

    move-result v4

    sub-int v4, v1, v4

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingRight()I

    move-result v5

    sub-int/2addr v4, v5

    int-to-float v4, v4

    mul-float v4, v4, v3

    float-to-int v4, v4

    .line 1489
    .local v4, "scrollPos":I
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v5

    if-eq v4, v5, :cond_3

    .line 1490
    const/4 v5, 0x0

    invoke-direct {p0, v5}, Landroid/support/v4/view/ViewPager;->completeScroll(Z)V

    .line 1491
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getScrollY()I

    move-result v5

    invoke-virtual {p0, v4, v5}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    .line 1494
    .end local v2    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v3    # "scrollOffset":F
    .end local v4    # "scrollPos":I
    :cond_3
    :goto_1
    return-void
.end method

.method private removeNonDecorViews()V
    .locals 4

    .line 454
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 455
    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 456
    .local v1, "child":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/v4/view/ViewPager$LayoutParams;

    .line 457
    .local v2, "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    iget-boolean v3, v2, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-nez v3, :cond_0

    .line 458
    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->removeViewAt(I)V

    .line 459
    add-int/lit8 v0, v0, -0x1

    .line 454
    .end local v1    # "child":Landroid/view/View;
    .end local v2    # "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 462
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method private requestParentDisallowInterceptTouchEvent(Z)V
    .locals 1
    .param p1, "disallowIntercept"    # Z

    .line 2050
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 2051
    .local v0, "parent":Landroid/view/ViewParent;
    if-eqz v0, :cond_0

    .line 2052
    invoke-interface {v0, p1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 2054
    :cond_0
    return-void
.end method

.method private scrollToItem(IZIZ)V
    .locals 7
    .param p1, "item"    # I
    .param p2, "smoothScroll"    # Z
    .param p3, "velocity"    # I
    .param p4, "dispatchSelected"    # Z

    .line 557
    invoke-virtual {p0, p1}, Landroid/support/v4/view/ViewPager;->infoForPosition(I)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v0

    .line 558
    .local v0, "curInfo":Landroid/support/v4/view/ViewPager$ItemInfo;
    const/4 v1, 0x0

    .line 559
    .local v1, "destX":I
    if-eqz v0, :cond_0

    .line 560
    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v2

    .line 561
    .local v2, "width":I
    int-to-float v3, v2

    iget v4, p0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    iget v5, v0, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    iget v6, p0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    invoke-static {v5, v6}, Ljava/lang/Math;->min(FF)F

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(FF)F

    move-result v4

    mul-float v3, v3, v4

    float-to-int v1, v3

    .line 564
    .end local v2    # "width":I
    :cond_0
    const/4 v2, 0x0

    if-eqz p2, :cond_2

    .line 565
    invoke-virtual {p0, v1, v2, p3}, Landroid/support/v4/view/ViewPager;->smoothScrollTo(III)V

    .line 566
    if-eqz p4, :cond_1

    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v2, :cond_1

    .line 567
    invoke-interface {v2, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageSelected(I)V

    .line 569
    :cond_1
    if-eqz p4, :cond_5

    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mInternalPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v2, :cond_5

    .line 570
    invoke-interface {v2, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageSelected(I)V

    goto :goto_0

    .line 573
    :cond_2
    if-eqz p4, :cond_3

    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v3, :cond_3

    .line 574
    invoke-interface {v3, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageSelected(I)V

    .line 576
    :cond_3
    if-eqz p4, :cond_4

    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mInternalPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v3, :cond_4

    .line 577
    invoke-interface {v3, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageSelected(I)V

    .line 579
    :cond_4
    invoke-direct {p0, v2}, Landroid/support/v4/view/ViewPager;->completeScroll(Z)V

    .line 580
    invoke-virtual {p0, v1, v2}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    .line 581
    invoke-direct {p0, v1}, Landroid/support/v4/view/ViewPager;->pageScrolled(I)Z

    .line 583
    :cond_5
    :goto_0
    return-void
.end method

.method private setScrollState(I)V
    .locals 1
    .param p1, "newState"    # I

    .line 388
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mScrollState:I

    if-ne v0, p1, :cond_0

    .line 389
    return-void

    .line 392
    :cond_0
    iput p1, p0, Landroid/support/v4/view/ViewPager;->mScrollState:I

    .line 393
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mPageTransformer:Landroid/support/v4/view/ViewPager$PageTransformer;

    if-eqz v0, :cond_2

    .line 395
    if-eqz p1, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    invoke-direct {p0, v0}, Landroid/support/v4/view/ViewPager;->enableLayers(Z)V

    .line 397
    :cond_2
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v0, :cond_3

    .line 398
    invoke-interface {v0, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageScrollStateChanged(I)V

    .line 400
    :cond_3
    return-void
.end method

.method private setScrollingCacheEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .line 2409
    iget-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mScrollingCacheEnabled:Z

    if-eq v0, p1, :cond_0

    .line 2410
    iput-boolean p1, p0, Landroid/support/v4/view/ViewPager;->mScrollingCacheEnabled:Z

    .line 2421
    :cond_0
    return-void
.end method

.method private sortChildDrawingOrder()V
    .locals 4

    .line 1106
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrder:I

    if-eqz v0, :cond_2

    .line 1107
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrderedChildren:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 1108
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrderedChildren:Ljava/util/ArrayList;

    goto :goto_0

    .line 1110
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1112
    :goto_0
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v0

    .line 1113
    .local v0, "childCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v0, :cond_1

    .line 1114
    invoke-virtual {p0, v1}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1115
    .local v2, "child":Landroid/view/View;
    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrderedChildren:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1113
    .end local v2    # "child":Landroid/view/View;
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1117
    .end local v1    # "i":I
    :cond_1
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrderedChildren:Ljava/util/ArrayList;

    sget-object v2, Landroid/support/v4/view/ViewPager;->sPositionComparator:Landroid/support/v4/view/ViewPager$ViewPositionComparator;

    invoke-static {v1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 1119
    .end local v0    # "childCount":I
    :cond_2
    return-void
.end method


# virtual methods
.method public addFocusables(Ljava/util/ArrayList;II)V
    .locals 7
    .param p2, "direction"    # I
    .param p3, "focusableMode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;II)V"
        }
    .end annotation

    .line 2626
    .local p1, "views":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 2628
    .local v0, "focusableCount":I
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getDescendantFocusability()I

    move-result v1

    .line 2630
    .local v1, "descendantFocusability":I
    const/high16 v2, 0x60000

    if-eq v1, v2, :cond_1

    .line 2631
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 2632
    invoke-virtual {p0, v2}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 2633
    .local v3, "child":Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-nez v4, :cond_0

    .line 2634
    invoke-virtual {p0, v3}, Landroid/support/v4/view/ViewPager;->infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v4

    .line 2635
    .local v4, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    if-eqz v4, :cond_0

    iget v5, v4, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v6, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-ne v5, v6, :cond_0

    .line 2636
    invoke-virtual {v3, p1, p2, p3}, Landroid/view/View;->addFocusables(Ljava/util/ArrayList;II)V

    .line 2631
    .end local v3    # "child":Landroid/view/View;
    .end local v4    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2646
    .end local v2    # "i":I
    :cond_1
    const/high16 v2, 0x40000

    if-ne v1, v2, :cond_2

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ne v0, v2, :cond_5

    .line 2652
    :cond_2
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->isFocusable()Z

    move-result v2

    if-nez v2, :cond_3

    .line 2653
    return-void

    .line 2655
    :cond_3
    and-int/lit8 v2, p3, 0x1

    const/4 v3, 0x1

    if-ne v2, v3, :cond_4

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->isInTouchMode()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->isFocusableInTouchMode()Z

    move-result v2

    if-nez v2, :cond_4

    .line 2657
    return-void

    .line 2659
    :cond_4
    if-eqz p1, :cond_5

    .line 2660
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2663
    :cond_5
    return-void
.end method

.method addNewItem(II)Landroid/support/v4/view/ViewPager$ItemInfo;
    .locals 2
    .param p1, "position"    # I
    .param p2, "index"    # I

    .line 830
    new-instance v0, Landroid/support/v4/view/ViewPager$ItemInfo;

    invoke-direct {v0}, Landroid/support/v4/view/ViewPager$ItemInfo;-><init>()V

    .line 831
    .local v0, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    iput p1, v0, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    .line 832
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v1, p0, p1}, Landroid/support/v4/view/PagerAdapter;->instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v4/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    .line 833
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v1, p1}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v1

    iput v1, v0, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    .line 834
    if-ltz p2, :cond_1

    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt p2, v1, :cond_0

    goto :goto_0

    .line 837
    :cond_0
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1, p2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_1

    .line 835
    :cond_1
    :goto_0
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 839
    :goto_1
    return-object v0
.end method

.method public addTouchables(Ljava/util/ArrayList;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 2673
    .local p1, "views":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 2674
    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 2675
    .local v1, "child":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-nez v2, :cond_0

    .line 2676
    invoke-virtual {p0, v1}, Landroid/support/v4/view/ViewPager;->infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v2

    .line 2677
    .local v2, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    if-eqz v2, :cond_0

    iget v3, v2, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v4, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-ne v3, v4, :cond_0

    .line 2678
    invoke-virtual {v1, p1}, Landroid/view/View;->addTouchables(Ljava/util/ArrayList;)V

    .line 2673
    .end local v1    # "child":Landroid/view/View;
    .end local v2    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2682
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 3
    .param p1, "child"    # Landroid/view/View;
    .param p2, "index"    # I
    .param p3, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .line 1292
    invoke-virtual {p0, p3}, Landroid/support/v4/view/ViewPager;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1293
    invoke-virtual {p0, p3}, Landroid/support/v4/view/ViewPager;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object p3

    .line 1295
    :cond_0
    move-object v0, p3

    check-cast v0, Landroid/support/v4/view/ViewPager$LayoutParams;

    .line 1296
    .local v0, "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    iget-boolean v1, v0, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    instance-of v2, p1, Landroid/support/v4/view/ViewPager$Decor;

    or-int/2addr v1, v2

    iput-boolean v1, v0, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    .line 1297
    iget-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mInLayout:Z

    if-eqz v1, :cond_3

    .line 1298
    if-eqz v0, :cond_2

    iget-boolean v1, v0, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-nez v1, :cond_1

    goto :goto_0

    .line 1299
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Cannot add pager decor view during layout"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1301
    :cond_2
    :goto_0
    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/support/v4/view/ViewPager$LayoutParams;->needsMeasure:Z

    .line 1302
    invoke-virtual {p0, p1, p2, p3}, Landroid/support/v4/view/ViewPager;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)Z

    goto :goto_1

    .line 1304
    :cond_3
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 1314
    :goto_1
    return-void
.end method

.method public arrowScroll(I)Z
    .locals 5
    .param p1, "direction"    # I

    .line 2514
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->findFocus()Landroid/view/View;

    move-result-object v0

    .line 2515
    .local v0, "currentFocused":Landroid/view/View;
    if-ne v0, p0, :cond_0

    .line 2516
    const/4 v0, 0x0

    goto :goto_3

    .line 2517
    :cond_0
    if-eqz v0, :cond_4

    .line 2518
    const/4 v1, 0x0

    .line 2519
    .local v1, "isChild":Z
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    .local v2, "parent":Landroid/view/ViewParent;
    :goto_0
    instance-of v3, v2, Landroid/view/ViewGroup;

    if-eqz v3, :cond_2

    .line 2521
    if-ne v2, p0, :cond_1

    .line 2522
    const/4 v1, 0x1

    .line 2523
    goto :goto_1

    .line 2520
    :cond_1
    invoke-interface {v2}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    goto :goto_0

    .line 2526
    .end local v2    # "parent":Landroid/view/ViewParent;
    :cond_2
    :goto_1
    if-nez v1, :cond_4

    .line 2528
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 2529
    .local v2, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2530
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    .local v3, "parent":Landroid/view/ViewParent;
    :goto_2
    instance-of v4, v3, Landroid/view/ViewGroup;

    if-eqz v4, :cond_3

    .line 2532
    const-string v4, " => "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2531
    invoke-interface {v3}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    goto :goto_2

    .line 2534
    .end local v3    # "parent":Landroid/view/ViewParent;
    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "arrowScroll tried to find focus based on non-child current focused view "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "ViewPager"

    invoke-static {v4, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2536
    const/4 v0, 0x0

    .line 2540
    .end local v1    # "isChild":Z
    .end local v2    # "sb":Ljava/lang/StringBuilder;
    :cond_4
    :goto_3
    const/4 v1, 0x0

    .line 2542
    .local v1, "handled":Z
    invoke-static {}, Landroid/view/FocusFinder;->getInstance()Landroid/view/FocusFinder;

    move-result-object v2

    invoke-virtual {v2, p0, v0, p1}, Landroid/view/FocusFinder;->findNextFocus(Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    move-result-object v2

    .line 2544
    .local v2, "nextFocused":Landroid/view/View;
    const/16 v3, 0x42

    const/16 v4, 0x11

    if-eqz v2, :cond_9

    if-eq v2, v0, :cond_9

    .line 2545
    if-ne p1, v4, :cond_7

    .line 2548
    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mTempRect:Landroid/graphics/Rect;

    invoke-direct {p0, v3, v2}, Landroid/support/v4/view/ViewPager;->getChildRectInPagerCoordinates(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->left:I

    .line 2549
    .local v3, "nextLeft":I
    iget-object v4, p0, Landroid/support/v4/view/ViewPager;->mTempRect:Landroid/graphics/Rect;

    invoke-direct {p0, v4, v0}, Landroid/support/v4/view/ViewPager;->getChildRectInPagerCoordinates(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v4

    iget v4, v4, Landroid/graphics/Rect;->left:I

    .line 2550
    .local v4, "currLeft":I
    if-eqz v0, :cond_5

    if-lt v3, v4, :cond_5

    .line 2551
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->pageLeft()Z

    move-result v1

    goto :goto_4

    .line 2553
    :cond_5
    invoke-virtual {v2}, Landroid/view/View;->requestFocus()Z

    move-result v1

    .line 2555
    .end local v3    # "nextLeft":I
    .end local v4    # "currLeft":I
    :cond_6
    :goto_4
    goto :goto_7

    :cond_7
    if-ne p1, v3, :cond_6

    .line 2558
    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mTempRect:Landroid/graphics/Rect;

    invoke-direct {p0, v3, v2}, Landroid/support/v4/view/ViewPager;->getChildRectInPagerCoordinates(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->left:I

    .line 2559
    .restart local v3    # "nextLeft":I
    iget-object v4, p0, Landroid/support/v4/view/ViewPager;->mTempRect:Landroid/graphics/Rect;

    invoke-direct {p0, v4, v0}, Landroid/support/v4/view/ViewPager;->getChildRectInPagerCoordinates(Landroid/graphics/Rect;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v4

    iget v4, v4, Landroid/graphics/Rect;->left:I

    .line 2560
    .restart local v4    # "currLeft":I
    if-eqz v0, :cond_8

    if-gt v3, v4, :cond_8

    .line 2561
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->pageRight()Z

    move-result v1

    goto :goto_5

    .line 2563
    :cond_8
    invoke-virtual {v2}, Landroid/view/View;->requestFocus()Z

    move-result v1

    .line 2565
    .end local v3    # "nextLeft":I
    .end local v4    # "currLeft":I
    :goto_5
    goto :goto_7

    .line 2566
    :cond_9
    if-eq p1, v4, :cond_c

    const/4 v4, 0x1

    if-ne p1, v4, :cond_a

    goto :goto_6

    .line 2569
    :cond_a
    if-eq p1, v3, :cond_b

    const/4 v3, 0x2

    if-ne p1, v3, :cond_d

    .line 2571
    :cond_b
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->pageRight()Z

    move-result v1

    goto :goto_7

    .line 2568
    :cond_c
    :goto_6
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->pageLeft()Z

    move-result v1

    .line 2573
    :cond_d
    :goto_7
    if-eqz v1, :cond_e

    .line 2574
    invoke-static {p1}, Landroid/view/SoundEffectConstants;->getContantForFocusDirection(I)I

    move-result v3

    invoke-virtual {p0, v3}, Landroid/support/v4/view/ViewPager;->playSoundEffect(I)V

    .line 2576
    :cond_e
    return v1
.end method

.method public beginFakeDrag()Z
    .locals 12

    .line 2273
    iget-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    if-eqz v0, :cond_0

    .line 2274
    const/4 v0, 0x0

    return v0

    .line 2276
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mFakeDragging:Z

    .line 2277
    invoke-direct {p0, v0}, Landroid/support/v4/view/ViewPager;->setScrollState(I)V

    .line 2278
    const/4 v1, 0x0

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    .line 2279
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v1, :cond_1

    .line 2280
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    goto :goto_0

    .line 2282
    :cond_1
    invoke-virtual {v1}, Landroid/view/VelocityTracker;->clear()V

    .line 2284
    :goto_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v10

    .line 2285
    .local v10, "time":J
    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-wide v2, v10

    move-wide v4, v10

    invoke-static/range {v2 .. v9}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v1

    .line 2286
    .local v1, "ev":Landroid/view/MotionEvent;
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v2, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 2287
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 2288
    iput-wide v10, p0, Landroid/support/v4/view/ViewPager;->mFakeDragBeginTime:J

    .line 2289
    return v0
.end method

.method protected canScroll(Landroid/view/View;ZIII)Z
    .locals 14
    .param p1, "v"    # Landroid/view/View;
    .param p2, "checkV"    # Z
    .param p3, "dx"    # I
    .param p4, "x"    # I
    .param p5, "y"    # I

    .line 2451
    move-object v0, p1

    instance-of v1, v0, Landroid/view/ViewGroup;

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    .line 2452
    move-object v1, v0

    check-cast v1, Landroid/view/ViewGroup;

    .line 2453
    .local v1, "group":Landroid/view/ViewGroup;
    invoke-virtual {p1}, Landroid/view/View;->getScrollX()I

    move-result v3

    .line 2454
    .local v3, "scrollX":I
    invoke-virtual {p1}, Landroid/view/View;->getScrollY()I

    move-result v4

    .line 2455
    .local v4, "scrollY":I
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    .line 2457
    .local v5, "count":I
    add-int/lit8 v6, v5, -0x1

    .local v6, "i":I
    :goto_0
    if-ltz v6, :cond_1

    .line 2460
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v13

    .line 2461
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

    invoke-virtual/range {v7 .. v12}, Landroid/support/v4/view/ViewPager;->canScroll(Landroid/view/View;ZIII)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 2465
    return v2

    .line 2457
    .end local v13    # "child":Landroid/view/View;
    :cond_0
    add-int/lit8 v6, v6, -0x1

    goto :goto_0

    .line 2470
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

.method public canScrollHorizontally(I)Z
    .locals 6
    .param p1, "direction"    # I

    .line 2424
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 2425
    return v1

    .line 2428
    :cond_0
    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v0

    .line 2429
    .local v0, "width":I
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v2

    .line 2430
    .local v2, "scrollX":I
    const/4 v3, 0x1

    if-gez p1, :cond_2

    .line 2431
    int-to-float v4, v0

    iget v5, p0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    mul-float v4, v4, v5

    float-to-int v4, v4

    if-le v2, v4, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1

    .line 2432
    :cond_2
    if-lez p1, :cond_4

    .line 2433
    int-to-float v4, v0

    iget v5, p0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    mul-float v4, v4, v5

    float-to-int v4, v4

    if-ge v2, v4, :cond_3

    const/4 v1, 0x1

    :cond_3
    return v1

    .line 2435
    :cond_4
    return v1
.end method

.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 1
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .line 2752
    instance-of v0, p1, Landroid/support/v4/view/ViewPager$LayoutParams;

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

.method public computeScroll()V
    .locals 5

    .line 1607
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1608
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v0

    .line 1609
    .local v0, "oldX":I
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getScrollY()I

    move-result v1

    .line 1610
    .local v1, "oldY":I
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v2}, Landroid/widget/Scroller;->getCurrX()I

    move-result v2

    .line 1611
    .local v2, "x":I
    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v3}, Landroid/widget/Scroller;->getCurrY()I

    move-result v3

    .line 1613
    .local v3, "y":I
    if-ne v0, v2, :cond_0

    if-eq v1, v3, :cond_1

    .line 1614
    :cond_0
    invoke-virtual {p0, v2, v3}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    .line 1615
    invoke-direct {p0, v2}, Landroid/support/v4/view/ViewPager;->pageScrolled(I)Z

    move-result v4

    if-nez v4, :cond_1

    .line 1616
    iget-object v4, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->abortAnimation()V

    .line 1617
    const/4 v4, 0x0

    invoke-virtual {p0, v4, v3}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    .line 1622
    :cond_1
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 1623
    return-void

    .line 1627
    .end local v0    # "oldX":I
    .end local v1    # "oldY":I
    .end local v2    # "x":I
    .end local v3    # "y":I
    :cond_2
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Landroid/support/v4/view/ViewPager;->completeScroll(Z)V

    .line 1628
    return-void
.end method

.method dataSetChanged()V
    .locals 12

    .line 845
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v0}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v0

    .line 846
    .local v0, "adapterCount":I
    iput v0, p0, Landroid/support/v4/view/ViewPager;->mExpectedAdapterCount:I

    .line 847
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget v2, p0, Landroid/support/v4/view/ViewPager;->mOffscreenPageLimit:I

    mul-int/lit8 v2, v2, 0x2

    const/4 v3, 0x1

    add-int/2addr v2, v3

    const/4 v4, 0x0

    if-ge v1, v2, :cond_0

    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v1, v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 849
    .local v1, "needPopulate":Z
    :goto_0
    iget v2, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    .line 851
    .local v2, "newCurrItem":I
    const/4 v5, 0x0

    .line 852
    .local v5, "isUpdating":Z
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    iget-object v7, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v6, v7, :cond_6

    .line 853
    iget-object v7, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 854
    .local v7, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget-object v8, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    invoke-virtual {v8, v9}, Landroid/support/v4/view/PagerAdapter;->getItemPosition(Ljava/lang/Object;)I

    move-result v8

    .line 856
    .local v8, "newPos":I
    const/4 v9, -0x1

    if-ne v8, v9, :cond_1

    .line 857
    goto :goto_2

    .line 860
    :cond_1
    const/4 v9, -0x2

    if-ne v8, v9, :cond_3

    .line 861
    iget-object v9, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v9, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 862
    add-int/lit8 v6, v6, -0x1

    .line 864
    if-nez v5, :cond_2

    .line 865
    iget-object v9, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v9, p0}, Landroid/support/v4/view/PagerAdapter;->startUpdate(Landroid/view/ViewGroup;)V

    .line 866
    const/4 v5, 0x1

    .line 869
    :cond_2
    iget-object v9, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget v10, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget-object v11, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    invoke-virtual {v9, p0, v10, v11}, Landroid/support/v4/view/PagerAdapter;->destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 870
    const/4 v1, 0x1

    .line 872
    iget v9, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    iget v10, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ne v9, v10, :cond_5

    .line 874
    iget v9, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    add-int/lit8 v10, v0, -0x1

    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    move-result v9

    invoke-static {v4, v9}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 875
    const/4 v1, 0x1

    goto :goto_2

    .line 880
    :cond_3
    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-eq v9, v8, :cond_5

    .line 881
    iget v9, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v10, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-ne v9, v10, :cond_4

    .line 883
    move v2, v8

    .line 886
    :cond_4
    iput v8, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    .line 887
    const/4 v1, 0x1

    .line 852
    .end local v7    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v8    # "newPos":I
    :cond_5
    :goto_2
    add-int/2addr v6, v3

    goto :goto_1

    .line 891
    .end local v6    # "i":I
    :cond_6
    if-eqz v5, :cond_7

    .line 892
    iget-object v6, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v6, p0}, Landroid/support/v4/view/PagerAdapter;->finishUpdate(Landroid/view/ViewGroup;)V

    .line 895
    :cond_7
    iget-object v6, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    sget-object v7, Landroid/support/v4/view/ViewPager;->COMPARATOR:Ljava/util/Comparator;

    invoke-static {v6, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 897
    if-eqz v1, :cond_a

    .line 899
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v6

    .line 900
    .local v6, "childCount":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_3
    if-ge v7, v6, :cond_9

    .line 901
    invoke-virtual {p0, v7}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 902
    .local v8, "child":Landroid/view/View;
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Landroid/support/v4/view/ViewPager$LayoutParams;

    .line 903
    .local v9, "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    iget-boolean v10, v9, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-nez v10, :cond_8

    .line 904
    const/4 v10, 0x0

    iput v10, v9, Landroid/support/v4/view/ViewPager$LayoutParams;->widthFactor:F

    .line 900
    .end local v8    # "child":Landroid/view/View;
    .end local v9    # "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    :cond_8
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 908
    .end local v7    # "i":I
    :cond_9
    invoke-virtual {p0, v2, v4, v3}, Landroid/support/v4/view/ViewPager;->setCurrentItemInternal(IZZ)V

    .line 909
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->requestLayout()V

    .line 911
    .end local v6    # "childCount":I
    :cond_a
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/KeyEvent;

    .line 2476
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0, p1}, Landroid/support/v4/view/ViewPager;->executeKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

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

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 6
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .line 2720
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v0

    const/16 v1, 0x1000

    if-ne v0, v1, :cond_0

    .line 2721
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v0

    return v0

    .line 2725
    :cond_0
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v0

    .line 2726
    .local v0, "childCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_2

    .line 2727
    invoke-virtual {p0, v1}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 2728
    .local v2, "child":Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-nez v3, :cond_1

    .line 2729
    invoke-virtual {p0, v2}, Landroid/support/v4/view/ViewPager;->infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v3

    .line 2730
    .local v3, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    if-eqz v3, :cond_1

    iget v4, v3, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v5, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-ne v4, v5, :cond_1

    invoke-virtual {v2, p1}, Landroid/view/View;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 2732
    const/4 v4, 0x1

    return v4

    .line 2726
    .end local v2    # "child":Landroid/view/View;
    .end local v3    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2737
    .end local v1    # "i":I
    :cond_2
    const/4 v1, 0x0

    return v1
.end method

.method distanceInfluenceForSnapDuration(F)F
    .locals 4
    .param p1, "f"    # F

    .line 766
    const/high16 v0, 0x3f000000    # 0.5f

    sub-float/2addr p1, v0

    .line 767
    float-to-double v0, p1

    const-wide v2, 0x3fde28c7460698c7L    # 0.4712389167638204

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v2

    double-to-float p1, v0

    .line 768
    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 2171
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->draw(Landroid/graphics/Canvas;)V

    .line 2172
    const/4 v0, 0x0

    .line 2174
    .local v0, "needsInvalidate":Z
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getOverScrollMode(Landroid/view/View;)I

    move-result v1

    .line 2175
    .local v1, "overScrollMode":I
    if-eqz v1, :cond_1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v3, :cond_0

    invoke-virtual {v3}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v3

    if-le v3, v2, :cond_0

    goto :goto_0

    .line 2201
    :cond_0
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v2}, Landroid/support/v4/widget/EdgeEffectCompat;->finish()V

    .line 2202
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v2}, Landroid/support/v4/widget/EdgeEffectCompat;->finish()V

    goto/16 :goto_1

    .line 2178
    :cond_1
    :goto_0
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v2}, Landroid/support/v4/widget/EdgeEffectCompat;->isFinished()Z

    move-result v2

    if-nez v2, :cond_2

    .line 2179
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v2

    .line 2180
    .local v2, "restoreCount":I
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getHeight()I

    move-result v3

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingTop()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingBottom()I

    move-result v4

    sub-int/2addr v3, v4

    .line 2181
    .local v3, "height":I
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getWidth()I

    move-result v4

    .line 2183
    .local v4, "width":I
    const/high16 v5, 0x43870000    # 270.0f

    invoke-virtual {p1, v5}, Landroid/graphics/Canvas;->rotate(F)V

    .line 2184
    neg-int v5, v3

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingTop()I

    move-result v6

    add-int/2addr v5, v6

    int-to-float v5, v5

    iget v6, p0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    int-to-float v7, v4

    mul-float v6, v6, v7

    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->translate(FF)V

    .line 2185
    iget-object v5, p0, Landroid/support/v4/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v5, v3, v4}, Landroid/support/v4/widget/EdgeEffectCompat;->setSize(II)V

    .line 2186
    iget-object v5, p0, Landroid/support/v4/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v5, p1}, Landroid/support/v4/widget/EdgeEffectCompat;->draw(Landroid/graphics/Canvas;)Z

    move-result v5

    or-int/2addr v0, v5

    .line 2187
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 2189
    .end local v2    # "restoreCount":I
    .end local v3    # "height":I
    .end local v4    # "width":I
    :cond_2
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v2}, Landroid/support/v4/widget/EdgeEffectCompat;->isFinished()Z

    move-result v2

    if-nez v2, :cond_3

    .line 2190
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v2

    .line 2191
    .restart local v2    # "restoreCount":I
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getWidth()I

    move-result v3

    .line 2192
    .local v3, "width":I
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getHeight()I

    move-result v4

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingTop()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingBottom()I

    move-result v5

    sub-int/2addr v4, v5

    .line 2194
    .local v4, "height":I
    const/high16 v5, 0x42b40000    # 90.0f

    invoke-virtual {p1, v5}, Landroid/graphics/Canvas;->rotate(F)V

    .line 2195
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getPaddingTop()I

    move-result v5

    neg-int v5, v5

    int-to-float v5, v5

    iget v6, p0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    const/high16 v7, 0x3f800000    # 1.0f

    add-float/2addr v6, v7

    neg-float v6, v6

    int-to-float v7, v3

    mul-float v6, v6, v7

    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->translate(FF)V

    .line 2196
    iget-object v5, p0, Landroid/support/v4/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v5, v4, v3}, Landroid/support/v4/widget/EdgeEffectCompat;->setSize(II)V

    .line 2197
    iget-object v5, p0, Landroid/support/v4/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v5, p1}, Landroid/support/v4/widget/EdgeEffectCompat;->draw(Landroid/graphics/Canvas;)Z

    move-result v5

    or-int/2addr v0, v5

    .line 2198
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 2205
    .end local v2    # "restoreCount":I
    .end local v3    # "width":I
    .end local v4    # "height":I
    :cond_3
    :goto_1
    if-eqz v0, :cond_4

    .line 2207
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 2209
    :cond_4
    return-void
.end method

.method protected drawableStateChanged()V
    .locals 2

    .line 754
    invoke-super {p0}, Landroid/view/ViewGroup;->drawableStateChanged()V

    .line 755
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    .line 756
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 757
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 759
    :cond_0
    return-void
.end method

.method public endFakeDrag()V
    .locals 10

    .line 2299
    iget-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mFakeDragging:Z

    if-eqz v0, :cond_0

    .line 2303
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 2304
    .local v0, "velocityTracker":Landroid/view/VelocityTracker;
    const/16 v1, 0x3e8

    iget v2, p0, Landroid/support/v4/view/ViewPager;->mMaximumVelocity:I

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 2305
    iget v1, p0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    invoke-static {v0, v1}, Landroid/support/v4/view/VelocityTrackerCompat;->getXVelocity(Landroid/view/VelocityTracker;I)F

    move-result v1

    float-to-int v1, v1

    .line 2307
    .local v1, "initialVelocity":I
    const/4 v2, 0x1

    iput-boolean v2, p0, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    .line 2308
    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v3

    .line 2309
    .local v3, "width":I
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v4

    .line 2310
    .local v4, "scrollX":I
    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->infoForCurrentScrollPosition()Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v5

    .line 2311
    .local v5, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget v6, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    .line 2312
    .local v6, "currentPage":I
    int-to-float v7, v4

    int-to-float v8, v3

    div-float/2addr v7, v8

    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    sub-float/2addr v7, v8

    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    div-float/2addr v7, v8

    .line 2313
    .local v7, "pageOffset":F
    iget v8, p0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    iget v9, p0, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    sub-float/2addr v8, v9

    float-to-int v8, v8

    .line 2314
    .local v8, "totalDelta":I
    invoke-direct {p0, v6, v7, v1, v8}, Landroid/support/v4/view/ViewPager;->determineTargetPage(IFII)I

    move-result v9

    .line 2316
    .local v9, "nextPage":I
    invoke-virtual {p0, v9, v2, v2, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItemInternal(IZZI)V

    .line 2317
    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->endDrag()V

    .line 2319
    const/4 v2, 0x0

    iput-boolean v2, p0, Landroid/support/v4/view/ViewPager;->mFakeDragging:Z

    .line 2320
    return-void

    .line 2300
    .end local v0    # "velocityTracker":Landroid/view/VelocityTracker;
    .end local v1    # "initialVelocity":I
    .end local v3    # "width":I
    .end local v4    # "scrollX":I
    .end local v5    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v6    # "currentPage":I
    .end local v7    # "pageOffset":F
    .end local v8    # "totalDelta":I
    .end local v9    # "nextPage":I
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No fake drag in progress. Call beginFakeDrag first."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public executeKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "event"    # Landroid/view/KeyEvent;

    .line 2488
    const/4 v0, 0x0

    .line 2489
    .local v0, "handled":Z
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_4

    .line 2490
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    const/16 v2, 0x15

    if-eq v1, v2, :cond_3

    const/16 v2, 0x16

    if-eq v1, v2, :cond_2

    const/16 v2, 0x3d

    if-eq v1, v2, :cond_0

    goto :goto_0

    .line 2498
    :cond_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_4

    .line 2501
    invoke-static {p1}, Landroid/support/v4/view/KeyEventCompat;->hasNoModifiers(Landroid/view/KeyEvent;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2502
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Landroid/support/v4/view/ViewPager;->arrowScroll(I)Z

    move-result v0

    goto :goto_0

    .line 2503
    :cond_1
    const/4 v1, 0x1

    invoke-static {p1, v1}, Landroid/support/v4/view/KeyEventCompat;->hasModifiers(Landroid/view/KeyEvent;I)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 2504
    invoke-virtual {p0, v1}, Landroid/support/v4/view/ViewPager;->arrowScroll(I)Z

    move-result v0

    goto :goto_0

    .line 2495
    :cond_2
    const/16 v1, 0x42

    invoke-virtual {p0, v1}, Landroid/support/v4/view/ViewPager;->arrowScroll(I)Z

    move-result v0

    .line 2496
    goto :goto_0

    .line 2492
    :cond_3
    const/16 v1, 0x11

    invoke-virtual {p0, v1}, Landroid/support/v4/view/ViewPager;->arrowScroll(I)Z

    move-result v0

    .line 2510
    :cond_4
    :goto_0
    return v0
.end method

.method public fakeDragBy(F)V
    .locals 19
    .param p1, "xOffset"    # F

    .line 2330
    move-object/from16 v0, p0

    iget-boolean v1, v0, Landroid/support/v4/view/ViewPager;->mFakeDragging:Z

    if-eqz v1, :cond_4

    .line 2334
    iget v1, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    add-float v1, v1, p1

    iput v1, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    .line 2336
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v1

    int-to-float v1, v1

    .line 2337
    .local v1, "oldScrollX":F
    sub-float v2, v1, p1

    .line 2338
    .local v2, "scrollX":F
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v3

    .line 2340
    .local v3, "width":I
    int-to-float v4, v3

    iget v5, v0, Landroid/support/v4/view/ViewPager;->mFirstOffset:F

    mul-float v4, v4, v5

    .line 2341
    .local v4, "leftBound":F
    int-to-float v5, v3

    iget v6, v0, Landroid/support/v4/view/ViewPager;->mLastOffset:F

    mul-float v5, v5, v6

    .line 2343
    .local v5, "rightBound":F
    iget-object v6, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 2344
    .local v6, "firstItem":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget-object v7, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 2345
    .local v7, "lastItem":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget v8, v6, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-eqz v8, :cond_0

    .line 2346
    iget v8, v6, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    int-to-float v9, v3

    mul-float v4, v8, v9

    .line 2348
    :cond_0
    iget v8, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget-object v9, v0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v9}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    if-eq v8, v9, :cond_1

    .line 2349
    iget v8, v7, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    int-to-float v9, v3

    mul-float v5, v8, v9

    .line 2352
    :cond_1
    cmpg-float v8, v2, v4

    if-gez v8, :cond_2

    .line 2353
    move v2, v4

    goto :goto_0

    .line 2354
    :cond_2
    cmpl-float v8, v2, v5

    if-lez v8, :cond_3

    .line 2355
    move v2, v5

    .line 2358
    :cond_3
    :goto_0
    iget v8, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    float-to-int v9, v2

    int-to-float v9, v9

    sub-float v9, v2, v9

    add-float/2addr v8, v9

    iput v8, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    .line 2359
    float-to-int v8, v2

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollY()I

    move-result v9

    invoke-virtual {v0, v8, v9}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    .line 2360
    float-to-int v8, v2

    invoke-direct {v0, v8}, Landroid/support/v4/view/ViewPager;->pageScrolled(I)Z

    .line 2363
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v17

    .line 2364
    .local v17, "time":J
    iget-wide v9, v0, Landroid/support/v4/view/ViewPager;->mFakeDragBeginTime:J

    const/4 v13, 0x2

    iget v14, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-wide/from16 v11, v17

    invoke-static/range {v9 .. v16}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v8

    .line 2366
    .local v8, "ev":Landroid/view/MotionEvent;
    iget-object v9, v0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v9, v8}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 2367
    invoke-virtual {v8}, Landroid/view/MotionEvent;->recycle()V

    .line 2368
    return-void

    .line 2331
    .end local v1    # "oldScrollX":F
    .end local v2    # "scrollX":F
    .end local v3    # "width":I
    .end local v4    # "leftBound":F
    .end local v5    # "rightBound":F
    .end local v6    # "firstItem":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v7    # "lastItem":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v8    # "ev":Landroid/view/MotionEvent;
    .end local v17    # "time":J
    :cond_4
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "No fake drag in progress. Call beginFakeDrag first."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .line 2742
    new-instance v0, Landroid/support/v4/view/ViewPager$LayoutParams;

    invoke-direct {v0}, Landroid/support/v4/view/ViewPager$LayoutParams;-><init>()V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 2
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .line 2757
    new-instance v0, Landroid/support/v4/view/ViewPager$LayoutParams;

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/support/v4/view/ViewPager$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .line 2747
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public getAdapter()Landroid/support/v4/view/PagerAdapter;
    .locals 1

    .line 470
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    return-object v0
.end method

.method protected getChildDrawingOrder(II)I
    .locals 2
    .param p1, "childCount"    # I
    .param p2, "i"    # I

    .line 642
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrder:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    add-int/lit8 v0, p1, -0x1

    sub-int/2addr v0, p2

    goto :goto_0

    :cond_0
    move v0, p2

    .line 643
    .local v0, "index":I
    :goto_0
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrderedChildren:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/support/v4/view/ViewPager$LayoutParams;

    iget v1, v1, Landroid/support/v4/view/ViewPager$LayoutParams;->childIndex:I

    .line 644
    .local v1, "result":I
    return v1
.end method

.method public getCurrentItem()I
    .locals 1

    .line 505
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    return v0
.end method

.method public getOffscreenPageLimit()I
    .locals 1

    .line 667
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mOffscreenPageLimit:I

    return v0
.end method

.method public getPageMargin()I
    .locals 1

    .line 723
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    return v0
.end method

.method infoForAnyChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;
    .locals 2
    .param p1, "child"    # Landroid/view/View;

    .line 1337
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    move-object v1, v0

    .local v1, "parent":Landroid/view/ViewParent;
    if-eq v0, p0, :cond_2

    .line 1338
    if-eqz v1, :cond_1

    instance-of v0, v1, Landroid/view/View;

    if-nez v0, :cond_0

    goto :goto_1

    .line 1341
    :cond_0
    move-object p1, v1

    check-cast p1, Landroid/view/View;

    goto :goto_0

    .line 1339
    :cond_1
    :goto_1
    const/4 v0, 0x0

    return-object v0

    .line 1343
    :cond_2
    invoke-virtual {p0, p1}, Landroid/support/v4/view/ViewPager;->infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v0

    return-object v0
.end method

.method infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;
    .locals 4
    .param p1, "child"    # Landroid/view/View;

    .line 1326
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 1327
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 1328
    .local v1, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v3, v1, Landroid/support/v4/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    invoke-virtual {v2, p1, v3}, Landroid/support/v4/view/PagerAdapter;->isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1329
    return-object v1

    .line 1326
    .end local v1    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1332
    .end local v0    # "i":I
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method infoForPosition(I)Landroid/support/v4/view/ViewPager$ItemInfo;
    .locals 3
    .param p1, "position"    # I

    .line 1347
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 1348
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 1349
    .local v1, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget v2, v1, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ne v2, p1, :cond_0

    .line 1350
    return-object v1

    .line 1347
    .end local v1    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1353
    .end local v0    # "i":I
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method initViewPager()V
    .locals 5

    .line 354
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->setWillNotDraw(Z)V

    .line 355
    const/high16 v0, 0x40000

    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->setDescendantFocusability(I)V

    .line 356
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->setFocusable(Z)V

    .line 357
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 358
    .local v1, "context":Landroid/content/Context;
    new-instance v2, Landroid/widget/Scroller;

    sget-object v3, Landroid/support/v4/view/ViewPager;->sInterpolator:Landroid/view/animation/Interpolator;

    invoke-direct {v2, v1, v3}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object v2, p0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    .line 359
    invoke-static {v1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v2

    .line 360
    .local v2, "configuration":Landroid/view/ViewConfiguration;
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    .line 362
    .local v3, "density":F
    invoke-static {v2}, Landroid/support/v4/view/ViewConfigurationCompat;->getScaledPagingTouchSlop(Landroid/view/ViewConfiguration;)I

    move-result v4

    iput v4, p0, Landroid/support/v4/view/ViewPager;->mTouchSlop:I

    .line 363
    const/high16 v4, 0x43c80000    # 400.0f

    mul-float v4, v4, v3

    float-to-int v4, v4

    iput v4, p0, Landroid/support/v4/view/ViewPager;->mMinimumVelocity:I

    .line 364
    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v4

    iput v4, p0, Landroid/support/v4/view/ViewPager;->mMaximumVelocity:I

    .line 365
    new-instance v4, Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-direct {v4, v1}, Landroid/support/v4/widget/EdgeEffectCompat;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Landroid/support/v4/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    .line 366
    new-instance v4, Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-direct {v4, v1}, Landroid/support/v4/widget/EdgeEffectCompat;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Landroid/support/v4/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    .line 368
    const/high16 v4, 0x41c80000    # 25.0f

    mul-float v4, v4, v3

    float-to-int v4, v4

    iput v4, p0, Landroid/support/v4/view/ViewPager;->mFlingDistance:I

    .line 369
    const/high16 v4, 0x40000000    # 2.0f

    mul-float v4, v4, v3

    float-to-int v4, v4

    iput v4, p0, Landroid/support/v4/view/ViewPager;->mCloseEnough:I

    .line 370
    const/high16 v4, 0x41800000    # 16.0f

    mul-float v4, v4, v3

    float-to-int v4, v4

    iput v4, p0, Landroid/support/v4/view/ViewPager;->mDefaultGutterSize:I

    .line 372
    new-instance v4, Landroid/support/v4/view/ViewPager$MyAccessibilityDelegate;

    invoke-direct {v4, p0}, Landroid/support/v4/view/ViewPager$MyAccessibilityDelegate;-><init>(Landroid/support/v4/view/ViewPager;)V

    invoke-static {p0, v4}, Landroid/support/v4/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroid/support/v4/view/AccessibilityDelegateCompat;)V

    .line 374
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getImportantForAccessibility(Landroid/view/View;)I

    move-result v4

    if-nez v4, :cond_0

    .line 376
    invoke-static {p0, v0}, Landroid/support/v4/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    .line 379
    :cond_0
    return-void
.end method

.method public isFakeDragging()Z
    .locals 1

    .line 2380
    iget-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mFakeDragging:Z

    return v0
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .line 1358
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 1359
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    .line 1360
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 383
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mEndScrollRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 384
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 385
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 17
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 2213
    move-object/from16 v0, p0

    invoke-super/range {p0 .. p1}, Landroid/view/ViewGroup;->onDraw(Landroid/graphics/Canvas;)V

    .line 2216
    iget v1, v0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    if-lez v1, :cond_5

    iget-object v1, v0, Landroid/support/v4/view/ViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_5

    iget-object v1, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_5

    iget-object v1, v0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v1, :cond_5

    .line 2217
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v1

    .line 2218
    .local v1, "scrollX":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getWidth()I

    move-result v2

    .line 2220
    .local v2, "width":I
    iget v3, v0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    int-to-float v3, v3

    int-to-float v4, v2

    div-float/2addr v3, v4

    .line 2221
    .local v3, "marginOffset":F
    const/4 v4, 0x0

    .line 2222
    .local v4, "itemIndex":I
    iget-object v5, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 2223
    .local v5, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget v6, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    .line 2224
    .local v6, "offset":F
    iget-object v7, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    .line 2225
    .local v7, "itemCount":I
    iget v8, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    .line 2226
    .local v8, "firstPos":I
    iget-object v9, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    add-int/lit8 v10, v7, -0x1

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/support/v4/view/ViewPager$ItemInfo;

    iget v9, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    .line 2227
    .local v9, "lastPos":I
    move v10, v8

    .local v10, "pos":I
    :goto_0
    if-ge v10, v9, :cond_4

    .line 2228
    :goto_1
    iget v11, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-le v10, v11, :cond_0

    if-ge v4, v7, :cond_0

    .line 2229
    iget-object v11, v0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v11, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    move-object v5, v11

    check-cast v5, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_1

    .line 2233
    :cond_0
    iget v11, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ne v10, v11, :cond_1

    .line 2234
    iget v11, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    iget v12, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v11, v12

    int-to-float v12, v2

    mul-float v11, v11, v12

    .line 2235
    .local v11, "drawAt":F
    iget v12, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    iget v13, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v12, v13

    add-float/2addr v12, v3

    move v6, v12

    .end local v6    # "offset":F
    .local v12, "offset":F
    goto :goto_2

    .line 2237
    .end local v11    # "drawAt":F
    .end local v12    # "offset":F
    .restart local v6    # "offset":F
    :cond_1
    iget-object v11, v0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v11, v10}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v11

    .line 2238
    .local v11, "widthFactor":F
    add-float v12, v6, v11

    int-to-float v13, v2

    mul-float v12, v12, v13

    .line 2239
    .local v12, "drawAt":F
    add-float v13, v11, v3

    add-float/2addr v6, v13

    move v11, v12

    .line 2242
    .end local v12    # "drawAt":F
    .local v11, "drawAt":F
    :goto_2
    iget v12, v0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    int-to-float v13, v12

    add-float/2addr v13, v11

    int-to-float v14, v1

    cmpl-float v13, v13, v14

    if-lez v13, :cond_2

    .line 2243
    iget-object v13, v0, Landroid/support/v4/view/ViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    float-to-int v14, v11

    iget v15, v0, Landroid/support/v4/view/ViewPager;->mTopPageBounds:I

    int-to-float v12, v12

    add-float/2addr v12, v11

    const/high16 v16, 0x3f000000    # 0.5f

    add-float v12, v12, v16

    float-to-int v12, v12

    move/from16 v16, v3

    .end local v3    # "marginOffset":F
    .local v16, "marginOffset":F
    iget v3, v0, Landroid/support/v4/view/ViewPager;->mBottomPageBounds:I

    invoke-virtual {v13, v14, v15, v12, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 2245
    iget-object v3, v0, Landroid/support/v4/view/ViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v12, p1

    invoke-virtual {v3, v12}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_3

    .line 2242
    .end local v16    # "marginOffset":F
    .restart local v3    # "marginOffset":F
    :cond_2
    move-object/from16 v12, p1

    move/from16 v16, v3

    .line 2248
    .end local v3    # "marginOffset":F
    .restart local v16    # "marginOffset":F
    :goto_3
    add-int v3, v1, v2

    int-to-float v3, v3

    cmpl-float v3, v11, v3

    if-lez v3, :cond_3

    .line 2249
    goto :goto_4

    .line 2227
    .end local v11    # "drawAt":F
    :cond_3
    add-int/lit8 v10, v10, 0x1

    move/from16 v3, v16

    goto :goto_0

    .end local v16    # "marginOffset":F
    .restart local v3    # "marginOffset":F
    :cond_4
    move-object/from16 v12, p1

    move/from16 v16, v3

    .end local v3    # "marginOffset":F
    .restart local v16    # "marginOffset":F
    goto :goto_4

    .line 2216
    .end local v1    # "scrollX":I
    .end local v2    # "width":I
    .end local v4    # "itemIndex":I
    .end local v5    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v6    # "offset":F
    .end local v7    # "itemCount":I
    .end local v8    # "firstPos":I
    .end local v9    # "lastPos":I
    .end local v10    # "pos":I
    .end local v16    # "marginOffset":F
    :cond_5
    move-object/from16 v12, p1

    .line 2253
    :goto_4
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 19
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .line 1787
    move-object/from16 v6, p0

    move-object/from16 v7, p1

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    and-int/lit16 v8, v0, 0xff

    .line 1790
    .local v8, "action":I
    const/4 v0, -0x1

    const/4 v9, 0x0

    const/4 v1, 0x3

    if-eq v8, v1, :cond_f

    const/4 v10, 0x1

    if-ne v8, v10, :cond_0

    goto/16 :goto_3

    .line 1805
    :cond_0
    if-eqz v8, :cond_2

    .line 1806
    iget-boolean v1, v6, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    if-eqz v1, :cond_1

    .line 1808
    return v10

    .line 1810
    :cond_1
    iget-boolean v1, v6, Landroid/support/v4/view/ViewPager;->mIsUnableToDrag:Z

    if-eqz v1, :cond_2

    .line 1812
    return v9

    .line 1816
    :cond_2
    const/4 v1, 0x2

    if-eqz v8, :cond_b

    if-eq v8, v1, :cond_4

    const/4 v0, 0x6

    if-eq v8, v0, :cond_3

    goto/16 :goto_2

    .line 1907
    :cond_3
    invoke-direct/range {p0 .. p1}, Landroid/support/v4/view/ViewPager;->onSecondaryPointerUp(Landroid/view/MotionEvent;)V

    goto/16 :goto_2

    .line 1827
    :cond_4
    iget v11, v6, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    .line 1828
    .local v11, "activePointerId":I
    if-ne v11, v0, :cond_5

    .line 1830
    goto/16 :goto_2

    .line 1833
    :cond_5
    invoke-static {v7, v11}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v12

    .line 1834
    .local v12, "pointerIndex":I
    invoke-static {v7, v12}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v13

    .line 1835
    .local v13, "x":F
    iget v0, v6, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    sub-float v14, v13, v0

    .line 1836
    .local v14, "dx":F
    invoke-static {v14}, Ljava/lang/Math;->abs(F)F

    move-result v15

    .line 1837
    .local v15, "xDiff":F
    invoke-static {v7, v12}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v5

    .line 1838
    .local v5, "y":F
    iget v0, v6, Landroid/support/v4/view/ViewPager;->mInitialMotionY:F

    sub-float v0, v5, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v16

    .line 1841
    .local v16, "yDiff":F
    const/16 v17, 0x0

    cmpl-float v0, v14, v17

    if-eqz v0, :cond_6

    iget v0, v6, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    invoke-direct {v6, v0, v14}, Landroid/support/v4/view/ViewPager;->isGutterDrag(FF)Z

    move-result v0

    if-nez v0, :cond_6

    const/4 v2, 0x0

    float-to-int v3, v14

    float-to-int v4, v13

    float-to-int v1, v5

    move-object/from16 v0, p0

    move/from16 v18, v1

    move-object/from16 v1, p0

    move v9, v5

    .end local v5    # "y":F
    .local v9, "y":F
    move/from16 v5, v18

    invoke-virtual/range {v0 .. v5}, Landroid/support/v4/view/ViewPager;->canScroll(Landroid/view/View;ZIII)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 1844
    iput v13, v6, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    .line 1845
    iput v9, v6, Landroid/support/v4/view/ViewPager;->mLastMotionY:F

    .line 1846
    iput-boolean v10, v6, Landroid/support/v4/view/ViewPager;->mIsUnableToDrag:Z

    .line 1847
    const/4 v0, 0x0

    return v0

    .line 1841
    .end local v9    # "y":F
    .restart local v5    # "y":F
    :cond_6
    move v9, v5

    .line 1849
    .end local v5    # "y":F
    .restart local v9    # "y":F
    :cond_7
    iget v0, v6, Landroid/support/v4/view/ViewPager;->mTouchSlop:I

    int-to-float v0, v0

    cmpl-float v0, v15, v0

    if-lez v0, :cond_9

    const/high16 v0, 0x3f000000    # 0.5f

    mul-float v0, v0, v15

    cmpl-float v0, v0, v16

    if-lez v0, :cond_9

    .line 1851
    iput-boolean v10, v6, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    .line 1852
    invoke-direct {v6, v10}, Landroid/support/v4/view/ViewPager;->requestParentDisallowInterceptTouchEvent(Z)V

    .line 1853
    invoke-direct {v6, v10}, Landroid/support/v4/view/ViewPager;->setScrollState(I)V

    .line 1854
    cmpl-float v0, v14, v17

    if-lez v0, :cond_8

    iget v0, v6, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    iget v1, v6, Landroid/support/v4/view/ViewPager;->mTouchSlop:I

    int-to-float v1, v1

    add-float/2addr v0, v1

    goto :goto_0

    :cond_8
    iget v0, v6, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    iget v1, v6, Landroid/support/v4/view/ViewPager;->mTouchSlop:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    :goto_0
    iput v0, v6, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    .line 1856
    iput v9, v6, Landroid/support/v4/view/ViewPager;->mLastMotionY:F

    .line 1857
    invoke-direct {v6, v10}, Landroid/support/v4/view/ViewPager;->setScrollingCacheEnabled(Z)V

    goto :goto_1

    .line 1858
    :cond_9
    iget v0, v6, Landroid/support/v4/view/ViewPager;->mTouchSlop:I

    int-to-float v0, v0

    cmpl-float v0, v16, v0

    if-lez v0, :cond_a

    .line 1864
    iput-boolean v10, v6, Landroid/support/v4/view/ViewPager;->mIsUnableToDrag:Z

    .line 1866
    :cond_a
    :goto_1
    iget-boolean v0, v6, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    if-eqz v0, :cond_d

    .line 1868
    invoke-direct {v6, v13}, Landroid/support/v4/view/ViewPager;->performDrag(F)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 1869
    invoke-static/range {p0 .. p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    goto :goto_2

    .line 1880
    .end local v9    # "y":F
    .end local v11    # "activePointerId":I
    .end local v12    # "pointerIndex":I
    .end local v13    # "x":F
    .end local v14    # "dx":F
    .end local v15    # "xDiff":F
    .end local v16    # "yDiff":F
    :cond_b
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, v6, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    iput v0, v6, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    .line 1881
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, v6, Landroid/support/v4/view/ViewPager;->mInitialMotionY:F

    iput v0, v6, Landroid/support/v4/view/ViewPager;->mLastMotionY:F

    .line 1882
    const/4 v0, 0x0

    invoke-static {v7, v0}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v2

    iput v2, v6, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    .line 1883
    iput-boolean v0, v6, Landroid/support/v4/view/ViewPager;->mIsUnableToDrag:Z

    .line 1885
    iget-object v0, v6, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 1886
    iget v0, v6, Landroid/support/v4/view/ViewPager;->mScrollState:I

    if-ne v0, v1, :cond_c

    iget-object v0, v6, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getFinalX()I

    move-result v0

    iget-object v1, v6, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrX()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    iget v1, v6, Landroid/support/v4/view/ViewPager;->mCloseEnough:I

    if-le v0, v1, :cond_c

    .line 1889
    iget-object v0, v6, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    .line 1890
    const/4 v0, 0x0

    iput-boolean v0, v6, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    .line 1891
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->populate()V

    .line 1892
    iput-boolean v10, v6, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    .line 1893
    invoke-direct {v6, v10}, Landroid/support/v4/view/ViewPager;->requestParentDisallowInterceptTouchEvent(Z)V

    .line 1894
    invoke-direct {v6, v10}, Landroid/support/v4/view/ViewPager;->setScrollState(I)V

    goto :goto_2

    .line 1896
    :cond_c
    const/4 v0, 0x0

    invoke-direct {v6, v0}, Landroid/support/v4/view/ViewPager;->completeScroll(Z)V

    .line 1897
    iput-boolean v0, v6, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    .line 1903
    nop

    .line 1911
    :cond_d
    :goto_2
    iget-object v0, v6, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v0, :cond_e

    .line 1912
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, v6, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 1914
    :cond_e
    iget-object v0, v6, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, v7}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 1920
    iget-boolean v0, v6, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    return v0

    .line 1793
    :cond_f
    :goto_3
    const/4 v1, 0x0

    iput-boolean v1, v6, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    .line 1794
    iput-boolean v1, v6, Landroid/support/v4/view/ViewPager;->mIsUnableToDrag:Z

    .line 1795
    iput v0, v6, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    .line 1796
    iget-object v0, v6, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_10

    .line 1797
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 1798
    const/4 v0, 0x0

    iput-object v0, v6, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 1800
    :cond_10
    const/4 v0, 0x0

    return v0
.end method

.method protected onLayout(ZIIII)V
    .locals 23
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .line 1498
    move-object/from16 v0, p0

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v1

    .line 1499
    .local v1, "count":I
    sub-int v2, p4, p2

    .line 1500
    .local v2, "width":I
    sub-int v3, p5, p3

    .line 1501
    .local v3, "height":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingLeft()I

    move-result v4

    .line 1502
    .local v4, "paddingLeft":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingTop()I

    move-result v5

    .line 1503
    .local v5, "paddingTop":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingRight()I

    move-result v6

    .line 1504
    .local v6, "paddingRight":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingBottom()I

    move-result v7

    .line 1505
    .local v7, "paddingBottom":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v8

    .line 1507
    .local v8, "scrollX":I
    const/4 v9, 0x0

    .line 1511
    .local v9, "decorCount":I
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    const/16 v11, 0x8

    if-ge v10, v1, :cond_8

    .line 1512
    invoke-virtual {v0, v10}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    .line 1513
    .local v12, "child":Landroid/view/View;
    invoke-virtual {v12}, Landroid/view/View;->getVisibility()I

    move-result v13

    if-eq v13, v11, :cond_7

    .line 1514
    invoke-virtual {v12}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v11

    check-cast v11, Landroid/support/v4/view/ViewPager$LayoutParams;

    .line 1515
    .local v11, "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    const/4 v13, 0x0

    .line 1516
    .local v13, "childLeft":I
    const/4 v14, 0x0

    .line 1517
    .local v14, "childTop":I
    iget-boolean v15, v11, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-eqz v15, :cond_6

    .line 1518
    iget v15, v11, Landroid/support/v4/view/ViewPager$LayoutParams;->gravity:I

    and-int/lit8 v15, v15, 0x7

    .line 1519
    .local v15, "hgrav":I
    move/from16 v16, v13

    .end local v13    # "childLeft":I
    .local v16, "childLeft":I
    iget v13, v11, Landroid/support/v4/view/ViewPager$LayoutParams;->gravity:I

    and-int/lit8 v13, v13, 0x70

    .line 1520
    .local v13, "vgrav":I
    move-object/from16 v17, v11

    .end local v11    # "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    .local v17, "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    const/4 v11, 0x1

    if-eq v15, v11, :cond_2

    const/4 v11, 0x3

    if-eq v15, v11, :cond_1

    const/4 v11, 0x5

    if-eq v15, v11, :cond_0

    .line 1522
    move v11, v4

    .line 1523
    .end local v16    # "childLeft":I
    .local v11, "childLeft":I
    goto :goto_1

    .line 1533
    .end local v11    # "childLeft":I
    .restart local v16    # "childLeft":I
    :cond_0
    sub-int v11, v2, v6

    invoke-virtual {v12}, Landroid/view/View;->getMeasuredWidth()I

    move-result v18

    sub-int v11, v11, v18

    .line 1534
    .end local v16    # "childLeft":I
    .restart local v11    # "childLeft":I
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredWidth()I

    move-result v16

    add-int v6, v6, v16

    goto :goto_1

    .line 1525
    .end local v11    # "childLeft":I
    .restart local v16    # "childLeft":I
    :cond_1
    move v11, v4

    .line 1526
    .end local v16    # "childLeft":I
    .restart local v11    # "childLeft":I
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredWidth()I

    move-result v16

    add-int v4, v4, v16

    .line 1527
    goto :goto_1

    .line 1529
    .end local v11    # "childLeft":I
    .restart local v16    # "childLeft":I
    :cond_2
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredWidth()I

    move-result v11

    sub-int v11, v2, v11

    div-int/lit8 v11, v11, 0x2

    invoke-static {v11, v4}, Ljava/lang/Math;->max(II)I

    move-result v11

    .line 1531
    .end local v16    # "childLeft":I
    .restart local v11    # "childLeft":I
    nop

    .line 1537
    :goto_1
    move/from16 v16, v4

    .end local v4    # "paddingLeft":I
    .local v16, "paddingLeft":I
    const/16 v4, 0x10

    if-eq v13, v4, :cond_5

    const/16 v4, 0x30

    if-eq v13, v4, :cond_4

    const/16 v4, 0x50

    if-eq v13, v4, :cond_3

    .line 1539
    move v4, v5

    .line 1540
    .end local v14    # "childTop":I
    .local v4, "childTop":I
    goto :goto_2

    .line 1550
    .end local v4    # "childTop":I
    .restart local v14    # "childTop":I
    :cond_3
    sub-int v4, v3, v7

    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v18

    sub-int v4, v4, v18

    .line 1551
    .end local v14    # "childTop":I
    .restart local v4    # "childTop":I
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v14

    add-int/2addr v7, v14

    goto :goto_2

    .line 1542
    .end local v4    # "childTop":I
    .restart local v14    # "childTop":I
    :cond_4
    move v4, v5

    .line 1543
    .end local v14    # "childTop":I
    .restart local v4    # "childTop":I
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v14

    add-int/2addr v5, v14

    .line 1544
    goto :goto_2

    .line 1546
    .end local v4    # "childTop":I
    .restart local v14    # "childTop":I
    :cond_5
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    sub-int v4, v3, v4

    div-int/lit8 v4, v4, 0x2

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 1548
    .end local v14    # "childTop":I
    .restart local v4    # "childTop":I
    nop

    .line 1554
    :goto_2
    add-int/2addr v11, v8

    .line 1555
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredWidth()I

    move-result v14

    add-int/2addr v14, v11

    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v18

    move/from16 v19, v5

    .end local v5    # "paddingTop":I
    .local v19, "paddingTop":I
    add-int v5, v4, v18

    invoke-virtual {v12, v11, v4, v14, v5}, Landroid/view/View;->layout(IIII)V

    .line 1558
    add-int/lit8 v9, v9, 0x1

    move/from16 v4, v16

    move/from16 v5, v19

    goto :goto_3

    .line 1517
    .end local v15    # "hgrav":I
    .end local v16    # "paddingLeft":I
    .end local v17    # "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    .end local v19    # "paddingTop":I
    .local v4, "paddingLeft":I
    .restart local v5    # "paddingTop":I
    .local v11, "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    .local v13, "childLeft":I
    .restart local v14    # "childTop":I
    :cond_6
    move-object/from16 v17, v11

    move/from16 v16, v13

    .line 1511
    .end local v11    # "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    .end local v12    # "child":Landroid/view/View;
    .end local v13    # "childLeft":I
    .end local v14    # "childTop":I
    :cond_7
    :goto_3
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_0

    .line 1563
    .end local v10    # "i":I
    :cond_8
    sub-int v10, v2, v4

    sub-int/2addr v10, v6

    .line 1565
    .local v10, "childWidth":I
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_4
    if-ge v12, v1, :cond_d

    .line 1566
    invoke-virtual {v0, v12}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v14

    .line 1567
    .local v14, "child":Landroid/view/View;
    invoke-virtual {v14}, Landroid/view/View;->getVisibility()I

    move-result v15

    if-eq v15, v11, :cond_c

    .line 1568
    invoke-virtual {v14}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v15

    check-cast v15, Landroid/support/v4/view/ViewPager$LayoutParams;

    .line 1570
    .local v15, "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    iget-boolean v11, v15, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-nez v11, :cond_b

    invoke-virtual {v0, v14}, Landroid/support/v4/view/ViewPager;->infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v11

    move-object/from16 v17, v11

    .local v17, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    if-eqz v11, :cond_a

    .line 1571
    int-to-float v11, v10

    move-object/from16 v13, v17

    move/from16 v17, v1

    .end local v1    # "count":I
    .local v13, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .local v17, "count":I
    iget v1, v13, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    mul-float v11, v11, v1

    float-to-int v1, v11

    .line 1572
    .local v1, "loff":I
    add-int v11, v4, v1

    .line 1573
    .local v11, "childLeft":I
    move/from16 v19, v5

    .line 1574
    .local v19, "childTop":I
    move/from16 v20, v1

    .end local v1    # "loff":I
    .local v20, "loff":I
    iget-boolean v1, v15, Landroid/support/v4/view/ViewPager$LayoutParams;->needsMeasure:Z

    if-eqz v1, :cond_9

    .line 1577
    const/4 v1, 0x0

    iput-boolean v1, v15, Landroid/support/v4/view/ViewPager$LayoutParams;->needsMeasure:Z

    .line 1578
    int-to-float v1, v10

    move/from16 v21, v2

    .end local v2    # "width":I
    .local v21, "width":I
    iget v2, v15, Landroid/support/v4/view/ViewPager$LayoutParams;->widthFactor:F

    mul-float v1, v1, v2

    float-to-int v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 1581
    .local v1, "widthSpec":I
    sub-int v18, v3, v5

    move/from16 v22, v4

    .end local v4    # "paddingLeft":I
    .local v22, "paddingLeft":I
    sub-int v4, v18, v7

    invoke-static {v4, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 1584
    .local v2, "heightSpec":I
    invoke-virtual {v14, v1, v2}, Landroid/view/View;->measure(II)V

    goto :goto_5

    .line 1574
    .end local v1    # "widthSpec":I
    .end local v21    # "width":I
    .end local v22    # "paddingLeft":I
    .local v2, "width":I
    .restart local v4    # "paddingLeft":I
    :cond_9
    move/from16 v21, v2

    move/from16 v22, v4

    .line 1589
    .end local v2    # "width":I
    .end local v4    # "paddingLeft":I
    .restart local v21    # "width":I
    .restart local v22    # "paddingLeft":I
    :goto_5
    invoke-virtual {v14}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    add-int/2addr v1, v11

    invoke-virtual {v14}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    move/from16 v4, v19

    .end local v19    # "childTop":I
    .local v4, "childTop":I
    add-int/2addr v2, v4

    invoke-virtual {v14, v11, v4, v1, v2}, Landroid/view/View;->layout(IIII)V

    goto :goto_6

    .line 1570
    .end local v11    # "childLeft":I
    .end local v13    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v20    # "loff":I
    .end local v21    # "width":I
    .end local v22    # "paddingLeft":I
    .local v1, "count":I
    .restart local v2    # "width":I
    .local v4, "paddingLeft":I
    .local v17, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_a
    move/from16 v21, v2

    move/from16 v22, v4

    move-object/from16 v13, v17

    move/from16 v17, v1

    .end local v1    # "count":I
    .end local v2    # "width":I
    .end local v4    # "paddingLeft":I
    .restart local v13    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .local v17, "count":I
    .restart local v21    # "width":I
    .restart local v22    # "paddingLeft":I
    goto :goto_6

    .end local v13    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v17    # "count":I
    .end local v21    # "width":I
    .end local v22    # "paddingLeft":I
    .restart local v1    # "count":I
    .restart local v2    # "width":I
    .restart local v4    # "paddingLeft":I
    :cond_b
    move/from16 v17, v1

    move/from16 v21, v2

    move/from16 v22, v4

    .end local v1    # "count":I
    .end local v2    # "width":I
    .end local v4    # "paddingLeft":I
    .restart local v17    # "count":I
    .restart local v21    # "width":I
    .restart local v22    # "paddingLeft":I
    goto :goto_6

    .line 1567
    .end local v15    # "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    .end local v17    # "count":I
    .end local v21    # "width":I
    .end local v22    # "paddingLeft":I
    .restart local v1    # "count":I
    .restart local v2    # "width":I
    .restart local v4    # "paddingLeft":I
    :cond_c
    move/from16 v17, v1

    move/from16 v21, v2

    move/from16 v22, v4

    .line 1565
    .end local v1    # "count":I
    .end local v2    # "width":I
    .end local v4    # "paddingLeft":I
    .end local v14    # "child":Landroid/view/View;
    .restart local v17    # "count":I
    .restart local v21    # "width":I
    .restart local v22    # "paddingLeft":I
    :goto_6
    add-int/lit8 v12, v12, 0x1

    move/from16 v1, v17

    move/from16 v2, v21

    move/from16 v4, v22

    const/16 v11, 0x8

    goto/16 :goto_4

    .end local v17    # "count":I
    .end local v21    # "width":I
    .end local v22    # "paddingLeft":I
    .restart local v1    # "count":I
    .restart local v2    # "width":I
    .restart local v4    # "paddingLeft":I
    :cond_d
    move/from16 v17, v1

    move/from16 v21, v2

    move/from16 v22, v4

    .line 1595
    .end local v1    # "count":I
    .end local v2    # "width":I
    .end local v4    # "paddingLeft":I
    .end local v12    # "i":I
    .restart local v17    # "count":I
    .restart local v21    # "width":I
    .restart local v22    # "paddingLeft":I
    iput v5, v0, Landroid/support/v4/view/ViewPager;->mTopPageBounds:I

    .line 1596
    sub-int v1, v3, v7

    iput v1, v0, Landroid/support/v4/view/ViewPager;->mBottomPageBounds:I

    .line 1597
    iput v9, v0, Landroid/support/v4/view/ViewPager;->mDecorChildCount:I

    .line 1599
    iget-boolean v1, v0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    if-eqz v1, :cond_e

    .line 1600
    iget v1, v0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2, v2}, Landroid/support/v4/view/ViewPager;->scrollToItem(IZIZ)V

    goto :goto_7

    .line 1599
    :cond_e
    const/4 v2, 0x0

    .line 1602
    :goto_7
    iput-boolean v2, v0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    .line 1603
    return-void
.end method

.method protected onMeasure(II)V
    .locals 20
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .line 1369
    move-object/from16 v0, p0

    const/4 v1, 0x0

    move/from16 v2, p1

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewPager;->getDefaultSize(II)I

    move-result v3

    move/from16 v4, p2

    invoke-static {v1, v4}, Landroid/support/v4/view/ViewPager;->getDefaultSize(II)I

    move-result v5

    invoke-virtual {v0, v3, v5}, Landroid/support/v4/view/ViewPager;->setMeasuredDimension(II)V

    .line 1372
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getMeasuredWidth()I

    move-result v3

    .line 1373
    .local v3, "measuredWidth":I
    div-int/lit8 v5, v3, 0xa

    .line 1374
    .local v5, "maxGutterSize":I
    iget v6, v0, Landroid/support/v4/view/ViewPager;->mDefaultGutterSize:I

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v6

    iput v6, v0, Landroid/support/v4/view/ViewPager;->mGutterSize:I

    .line 1377
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingLeft()I

    move-result v6

    sub-int v6, v3, v6

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingRight()I

    move-result v7

    sub-int/2addr v6, v7

    .line 1378
    .local v6, "childWidthSize":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getMeasuredHeight()I

    move-result v7

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingTop()I

    move-result v8

    sub-int/2addr v7, v8

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingBottom()I

    move-result v8

    sub-int/2addr v7, v8

    .line 1385
    .local v7, "childHeightSize":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v8

    .line 1386
    .local v8, "size":I
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    const/16 v10, 0x8

    if-ge v9, v8, :cond_e

    .line 1387
    invoke-virtual {v0, v9}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    .line 1388
    .local v12, "child":Landroid/view/View;
    invoke-virtual {v12}, Landroid/view/View;->getVisibility()I

    move-result v13

    if-eq v13, v10, :cond_c

    .line 1389
    invoke-virtual {v12}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    check-cast v10, Landroid/support/v4/view/ViewPager$LayoutParams;

    .line 1390
    .local v10, "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    if-eqz v10, :cond_b

    iget-boolean v13, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-eqz v13, :cond_b

    .line 1391
    iget v13, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->gravity:I

    and-int/lit8 v13, v13, 0x7

    .line 1392
    .local v13, "hgrav":I
    iget v14, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->gravity:I

    and-int/lit8 v14, v14, 0x70

    .line 1393
    .local v14, "vgrav":I
    const/high16 v15, -0x80000000

    .line 1394
    .local v15, "widthMode":I
    const/high16 v16, -0x80000000

    .line 1395
    .local v16, "heightMode":I
    const/16 v1, 0x30

    if-eq v14, v1, :cond_1

    const/16 v1, 0x50

    if-ne v14, v1, :cond_0

    goto :goto_1

    :cond_0
    const/4 v1, 0x0

    goto :goto_2

    :cond_1
    :goto_1
    const/4 v1, 0x1

    .line 1396
    .local v1, "consumeVertical":Z
    :goto_2
    const/4 v11, 0x3

    if-eq v13, v11, :cond_3

    const/4 v11, 0x5

    if-ne v13, v11, :cond_2

    goto :goto_3

    :cond_2
    const/16 v17, 0x0

    goto :goto_4

    :cond_3
    :goto_3
    const/16 v17, 0x1

    :goto_4
    move/from16 v11, v17

    .line 1398
    .local v11, "consumeHorizontal":Z
    if-eqz v1, :cond_4

    .line 1399
    const/high16 v15, 0x40000000    # 2.0f

    goto :goto_5

    .line 1400
    :cond_4
    if-eqz v11, :cond_5

    .line 1401
    const/high16 v16, 0x40000000    # 2.0f

    .line 1404
    :cond_5
    :goto_5
    move/from16 v17, v6

    .line 1405
    .local v17, "widthSize":I
    move/from16 v18, v7

    .line 1406
    .local v18, "heightSize":I
    iget v2, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->width:I

    move/from16 v19, v3

    .end local v3    # "measuredWidth":I
    .local v19, "measuredWidth":I
    const/4 v3, -0x2

    if-eq v2, v3, :cond_7

    .line 1407
    const/high16 v15, 0x40000000    # 2.0f

    .line 1408
    iget v2, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->width:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_6

    .line 1409
    iget v2, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->width:I

    .end local v17    # "widthSize":I
    .local v2, "widthSize":I
    goto :goto_6

    .line 1408
    .end local v2    # "widthSize":I
    .restart local v17    # "widthSize":I
    :cond_6
    move/from16 v2, v17

    goto :goto_6

    .line 1406
    :cond_7
    move/from16 v2, v17

    .line 1412
    .end local v17    # "widthSize":I
    .restart local v2    # "widthSize":I
    :goto_6
    iget v3, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->height:I

    const/4 v4, -0x2

    if-eq v3, v4, :cond_9

    .line 1413
    const/high16 v16, 0x40000000    # 2.0f

    .line 1414
    iget v3, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->height:I

    const/4 v4, -0x1

    if-eq v3, v4, :cond_8

    .line 1415
    iget v3, v10, Landroid/support/v4/view/ViewPager$LayoutParams;->height:I

    move/from16 v4, v16

    .end local v18    # "heightSize":I
    .local v3, "heightSize":I
    goto :goto_7

    .line 1414
    .end local v3    # "heightSize":I
    .restart local v18    # "heightSize":I
    :cond_8
    move/from16 v4, v16

    move/from16 v3, v18

    goto :goto_7

    .line 1412
    :cond_9
    move/from16 v4, v16

    move/from16 v3, v18

    .line 1418
    .end local v16    # "heightMode":I
    .end local v18    # "heightSize":I
    .restart local v3    # "heightSize":I
    .local v4, "heightMode":I
    :goto_7
    move/from16 v16, v5

    .end local v5    # "maxGutterSize":I
    .local v16, "maxGutterSize":I
    invoke-static {v2, v15}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    .line 1419
    .local v5, "widthSpec":I
    move/from16 v17, v2

    .end local v2    # "widthSize":I
    .restart local v17    # "widthSize":I
    invoke-static {v3, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 1420
    .local v2, "heightSpec":I
    invoke-virtual {v12, v5, v2}, Landroid/view/View;->measure(II)V

    .line 1422
    if-eqz v1, :cond_a

    .line 1423
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v18

    sub-int v7, v7, v18

    goto :goto_8

    .line 1424
    :cond_a
    if-eqz v11, :cond_d

    .line 1425
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredWidth()I

    move-result v18

    sub-int v6, v6, v18

    goto :goto_8

    .line 1390
    .end local v1    # "consumeVertical":Z
    .end local v2    # "heightSpec":I
    .end local v4    # "heightMode":I
    .end local v11    # "consumeHorizontal":Z
    .end local v13    # "hgrav":I
    .end local v14    # "vgrav":I
    .end local v15    # "widthMode":I
    .end local v16    # "maxGutterSize":I
    .end local v17    # "widthSize":I
    .end local v19    # "measuredWidth":I
    .local v3, "measuredWidth":I
    .local v5, "maxGutterSize":I
    :cond_b
    move/from16 v19, v3

    move/from16 v16, v5

    .end local v3    # "measuredWidth":I
    .end local v5    # "maxGutterSize":I
    .restart local v16    # "maxGutterSize":I
    .restart local v19    # "measuredWidth":I
    goto :goto_8

    .line 1388
    .end local v10    # "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    .end local v16    # "maxGutterSize":I
    .end local v19    # "measuredWidth":I
    .restart local v3    # "measuredWidth":I
    .restart local v5    # "maxGutterSize":I
    :cond_c
    move/from16 v19, v3

    move/from16 v16, v5

    .line 1386
    .end local v3    # "measuredWidth":I
    .end local v5    # "maxGutterSize":I
    .end local v12    # "child":Landroid/view/View;
    .restart local v16    # "maxGutterSize":I
    .restart local v19    # "measuredWidth":I
    :cond_d
    :goto_8
    add-int/lit8 v9, v9, 0x1

    move/from16 v2, p1

    move/from16 v4, p2

    move/from16 v5, v16

    move/from16 v3, v19

    const/4 v1, 0x0

    goto/16 :goto_0

    .end local v16    # "maxGutterSize":I
    .end local v19    # "measuredWidth":I
    .restart local v3    # "measuredWidth":I
    .restart local v5    # "maxGutterSize":I
    :cond_e
    move/from16 v19, v3

    move/from16 v16, v5

    .line 1431
    .end local v3    # "measuredWidth":I
    .end local v5    # "maxGutterSize":I
    .end local v9    # "i":I
    .restart local v16    # "maxGutterSize":I
    .restart local v19    # "measuredWidth":I
    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v6, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    iput v2, v0, Landroid/support/v4/view/ViewPager;->mChildWidthMeasureSpec:I

    .line 1432
    invoke-static {v7, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    iput v2, v0, Landroid/support/v4/view/ViewPager;->mChildHeightMeasureSpec:I

    .line 1435
    const/4 v2, 0x1

    iput-boolean v2, v0, Landroid/support/v4/view/ViewPager;->mInLayout:Z

    .line 1436
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->populate()V

    .line 1437
    const/4 v2, 0x0

    iput-boolean v2, v0, Landroid/support/v4/view/ViewPager;->mInLayout:Z

    .line 1440
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v2

    .line 1441
    .end local v8    # "size":I
    .local v2, "size":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_9
    if-ge v3, v2, :cond_11

    .line 1442
    invoke-virtual {v0, v3}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 1443
    .local v4, "child":Landroid/view/View;
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-eq v5, v10, :cond_10

    .line 1447
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/support/v4/view/ViewPager$LayoutParams;

    .line 1448
    .local v5, "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    if-eqz v5, :cond_f

    iget-boolean v8, v5, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-nez v8, :cond_10

    .line 1449
    :cond_f
    int-to-float v8, v6

    iget v9, v5, Landroid/support/v4/view/ViewPager$LayoutParams;->widthFactor:F

    mul-float v8, v8, v9

    float-to-int v8, v8

    invoke-static {v8, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v8

    .line 1451
    .local v8, "widthSpec":I
    iget v9, v0, Landroid/support/v4/view/ViewPager;->mChildHeightMeasureSpec:I

    invoke-virtual {v4, v8, v9}, Landroid/view/View;->measure(II)V

    .line 1441
    .end local v4    # "child":Landroid/view/View;
    .end local v5    # "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    .end local v8    # "widthSpec":I
    :cond_10
    add-int/lit8 v3, v3, 0x1

    goto :goto_9

    .line 1455
    .end local v3    # "i":I
    :cond_11
    return-void
.end method

.method protected onPageScrolled(IFI)V
    .locals 17
    .param p1, "position"    # I
    .param p2, "offset"    # F
    .param p3, "offsetPixels"    # I

    .line 1672
    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    iget v4, v0, Landroid/support/v4/view/ViewPager;->mDecorChildCount:I

    const/4 v5, 0x1

    if-lez v4, :cond_5

    .line 1673
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v4

    .line 1674
    .local v4, "scrollX":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingLeft()I

    move-result v6

    .line 1675
    .local v6, "paddingLeft":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingRight()I

    move-result v7

    .line 1676
    .local v7, "paddingRight":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getWidth()I

    move-result v8

    .line 1677
    .local v8, "width":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v9

    .line 1678
    .local v9, "childCount":I
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    if-ge v10, v9, :cond_5

    .line 1679
    invoke-virtual {v0, v10}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    .line 1680
    .local v11, "child":Landroid/view/View;
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v12

    check-cast v12, Landroid/support/v4/view/ViewPager$LayoutParams;

    .line 1681
    .local v12, "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    iget-boolean v13, v12, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-nez v13, :cond_0

    goto :goto_2

    .line 1683
    :cond_0
    iget v13, v12, Landroid/support/v4/view/ViewPager$LayoutParams;->gravity:I

    and-int/lit8 v13, v13, 0x7

    .line 1684
    .local v13, "hgrav":I
    const/4 v14, 0x0

    .line 1685
    .local v14, "childLeft":I
    if-eq v13, v5, :cond_3

    const/4 v15, 0x3

    if-eq v13, v15, :cond_2

    const/4 v15, 0x5

    if-eq v13, v15, :cond_1

    .line 1687
    move v14, v6

    .line 1688
    goto :goto_1

    .line 1698
    :cond_1
    sub-int v15, v8, v7

    invoke-virtual {v11}, Landroid/view/View;->getMeasuredWidth()I

    move-result v16

    sub-int v14, v15, v16

    .line 1699
    invoke-virtual {v11}, Landroid/view/View;->getMeasuredWidth()I

    move-result v15

    add-int/2addr v7, v15

    goto :goto_1

    .line 1690
    :cond_2
    move v14, v6

    .line 1691
    invoke-virtual {v11}, Landroid/view/View;->getWidth()I

    move-result v15

    add-int/2addr v6, v15

    .line 1692
    goto :goto_1

    .line 1694
    :cond_3
    invoke-virtual {v11}, Landroid/view/View;->getMeasuredWidth()I

    move-result v15

    sub-int v15, v8, v15

    div-int/lit8 v15, v15, 0x2

    invoke-static {v15, v6}, Ljava/lang/Math;->max(II)I

    move-result v14

    .line 1696
    nop

    .line 1702
    :goto_1
    add-int/2addr v14, v4

    .line 1704
    invoke-virtual {v11}, Landroid/view/View;->getLeft()I

    move-result v15

    sub-int v15, v14, v15

    .line 1705
    .local v15, "childOffset":I
    if-eqz v15, :cond_4

    .line 1706
    invoke-virtual {v11, v15}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 1678
    .end local v11    # "child":Landroid/view/View;
    .end local v12    # "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    .end local v13    # "hgrav":I
    .end local v14    # "childLeft":I
    .end local v15    # "childOffset":I
    :cond_4
    :goto_2
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 1711
    .end local v4    # "scrollX":I
    .end local v6    # "paddingLeft":I
    .end local v7    # "paddingRight":I
    .end local v8    # "width":I
    .end local v9    # "childCount":I
    .end local v10    # "i":I
    :cond_5
    iget-object v4, v0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v4, :cond_6

    .line 1712
    invoke-interface {v4, v1, v2, v3}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageScrolled(IFI)V

    .line 1714
    :cond_6
    iget-object v4, v0, Landroid/support/v4/view/ViewPager;->mInternalPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v4, :cond_7

    .line 1715
    invoke-interface {v4, v1, v2, v3}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageScrolled(IFI)V

    .line 1718
    :cond_7
    iget-object v4, v0, Landroid/support/v4/view/ViewPager;->mPageTransformer:Landroid/support/v4/view/ViewPager$PageTransformer;

    if-eqz v4, :cond_9

    .line 1719
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v4

    .line 1720
    .restart local v4    # "scrollX":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v6

    .line 1721
    .local v6, "childCount":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_3
    if-ge v7, v6, :cond_9

    .line 1722
    invoke-virtual {v0, v7}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 1723
    .local v8, "child":Landroid/view/View;
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Landroid/support/v4/view/ViewPager$LayoutParams;

    .line 1725
    .local v9, "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    iget-boolean v10, v9, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-eqz v10, :cond_8

    goto :goto_4

    .line 1727
    :cond_8
    invoke-virtual {v8}, Landroid/view/View;->getLeft()I

    move-result v10

    sub-int/2addr v10, v4

    int-to-float v10, v10

    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v11

    int-to-float v11, v11

    div-float/2addr v10, v11

    .line 1728
    .local v10, "transformPos":F
    iget-object v11, v0, Landroid/support/v4/view/ViewPager;->mPageTransformer:Landroid/support/v4/view/ViewPager$PageTransformer;

    invoke-interface {v11, v8, v10}, Landroid/support/v4/view/ViewPager$PageTransformer;->transformPage(Landroid/view/View;F)V

    .line 1721
    .end local v8    # "child":Landroid/view/View;
    .end local v9    # "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    .end local v10    # "transformPos":F
    :goto_4
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 1732
    .end local v4    # "scrollX":I
    .end local v6    # "childCount":I
    .end local v7    # "i":I
    :cond_9
    iput-boolean v5, v0, Landroid/support/v4/view/ViewPager;->mCalledSuper:Z

    .line 1733
    return-void
.end method

.method protected onRequestFocusInDescendants(ILandroid/graphics/Rect;)Z
    .locals 9
    .param p1, "direction"    # I
    .param p2, "previouslyFocusedRect"    # Landroid/graphics/Rect;

    .line 2693
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v0

    .line 2694
    .local v0, "count":I
    and-int/lit8 v1, p1, 0x2

    if-eqz v1, :cond_0

    .line 2695
    const/4 v1, 0x0

    .line 2696
    .local v1, "index":I
    const/4 v2, 0x1

    .line 2697
    .local v2, "increment":I
    move v3, v0

    .local v3, "end":I
    goto :goto_0

    .line 2699
    .end local v1    # "index":I
    .end local v2    # "increment":I
    .end local v3    # "end":I
    :cond_0
    add-int/lit8 v1, v0, -0x1

    .line 2700
    .restart local v1    # "index":I
    const/4 v2, -0x1

    .line 2701
    .restart local v2    # "increment":I
    const/4 v3, -0x1

    .line 2703
    .restart local v3    # "end":I
    :goto_0
    move v4, v1

    .local v4, "i":I
    :goto_1
    if-eq v4, v3, :cond_2

    .line 2704
    invoke-virtual {p0, v4}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 2705
    .local v5, "child":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v6

    if-nez v6, :cond_1

    .line 2706
    invoke-virtual {p0, v5}, Landroid/support/v4/view/ViewPager;->infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v6

    .line 2707
    .local v6, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    if-eqz v6, :cond_1

    iget v7, v6, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v8, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-ne v7, v8, :cond_1

    .line 2708
    invoke-virtual {v5, p1, p2}, Landroid/view/View;->requestFocus(ILandroid/graphics/Rect;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 2709
    const/4 v7, 0x1

    return v7

    .line 2703
    .end local v5    # "child":Landroid/view/View;
    .end local v6    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_1
    add-int/2addr v4, v2

    goto :goto_1

    .line 2714
    .end local v4    # "i":I
    :cond_2
    const/4 v4, 0x0

    return v4
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 4
    .param p1, "state"    # Landroid/os/Parcelable;

    .line 1272
    instance-of v0, p1, Landroid/support/v4/view/ViewPager$SavedState;

    if-nez v0, :cond_0

    .line 1273
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 1274
    return-void

    .line 1277
    :cond_0
    move-object v0, p1

    check-cast v0, Landroid/support/v4/view/ViewPager$SavedState;

    .line 1278
    .local v0, "ss":Landroid/support/v4/view/ViewPager$SavedState;
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 1280
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v1, :cond_1

    .line 1281
    iget-object v2, v0, Landroid/support/v4/view/ViewPager$SavedState;->adapterState:Landroid/os/Parcelable;

    iget-object v3, v0, Landroid/support/v4/view/ViewPager$SavedState;->loader:Ljava/lang/ClassLoader;

    invoke-virtual {v1, v2, v3}, Landroid/support/v4/view/PagerAdapter;->restoreState(Landroid/os/Parcelable;Ljava/lang/ClassLoader;)V

    .line 1282
    iget v1, v0, Landroid/support/v4/view/ViewPager$SavedState;->position:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {p0, v1, v2, v3}, Landroid/support/v4/view/ViewPager;->setCurrentItemInternal(IZZ)V

    goto :goto_0

    .line 1284
    :cond_1
    iget v1, v0, Landroid/support/v4/view/ViewPager$SavedState;->position:I

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mRestoredCurItem:I

    .line 1285
    iget-object v1, v0, Landroid/support/v4/view/ViewPager$SavedState;->adapterState:Landroid/os/Parcelable;

    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mRestoredAdapterState:Landroid/os/Parcelable;

    .line 1286
    iget-object v1, v0, Landroid/support/v4/view/ViewPager$SavedState;->loader:Ljava/lang/ClassLoader;

    iput-object v1, p0, Landroid/support/v4/view/ViewPager;->mRestoredClassLoader:Ljava/lang/ClassLoader;

    .line 1288
    :goto_0
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .locals 3

    .line 1261
    invoke-super {p0}, Landroid/view/ViewGroup;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    .line 1262
    .local v0, "superState":Landroid/os/Parcelable;
    new-instance v1, Landroid/support/v4/view/ViewPager$SavedState;

    invoke-direct {v1, v0}, Landroid/support/v4/view/ViewPager$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 1263
    .local v1, "ss":Landroid/support/v4/view/ViewPager$SavedState;
    iget v2, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    iput v2, v1, Landroid/support/v4/view/ViewPager$SavedState;->position:I

    .line 1264
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v2, :cond_0

    .line 1265
    invoke-virtual {v2}, Landroid/support/v4/view/PagerAdapter;->saveState()Landroid/os/Parcelable;

    move-result-object v2

    iput-object v2, v1, Landroid/support/v4/view/ViewPager$SavedState;->adapterState:Landroid/os/Parcelable;

    .line 1267
    :cond_0
    return-object v1
.end method

.method protected onSizeChanged(IIII)V
    .locals 1
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .line 1459
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->onSizeChanged(IIII)V

    .line 1462
    if-eq p1, p3, :cond_0

    .line 1463
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    invoke-direct {p0, p1, p3, v0, v0}, Landroid/support/v4/view/ViewPager;->recomputeScrollPosition(IIII)V

    .line 1465
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 17
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .line 1925
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-boolean v2, v0, Landroid/support/v4/view/ViewPager;->mFakeDragging:Z

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    .line 1929
    return v3

    .line 1932
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    const/4 v4, 0x0

    if-nez v2, :cond_1

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEdgeFlags()I

    move-result v2

    if-eqz v2, :cond_1

    .line 1935
    return v4

    .line 1938
    :cond_1
    iget-object v2, v0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v2, :cond_10

    invoke-virtual {v2}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v2

    if-nez v2, :cond_2

    goto/16 :goto_2

    .line 1943
    :cond_2
    iget-object v2, v0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v2, :cond_3

    .line 1944
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v2

    iput-object v2, v0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 1946
    :cond_3
    iget-object v2, v0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v2, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 1948
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    .line 1949
    .local v2, "action":I
    const/4 v5, 0x0

    .line 1951
    .local v5, "needsInvalidate":Z
    and-int/lit16 v6, v2, 0xff

    if-eqz v6, :cond_e

    const/4 v7, -0x1

    if-eq v6, v3, :cond_c

    const/4 v8, 0x2

    if-eq v6, v8, :cond_8

    const/4 v8, 0x3

    if-eq v6, v8, :cond_6

    const/4 v4, 0x5

    if-eq v6, v4, :cond_5

    const/4 v4, 0x6

    if-eq v6, v4, :cond_4

    move/from16 v16, v2

    goto/16 :goto_1

    .line 2038
    :cond_4
    invoke-direct/range {p0 .. p1}, Landroid/support/v4/view/ViewPager;->onSecondaryPointerUp(Landroid/view/MotionEvent;)V

    .line 2039
    iget v4, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v4

    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v4

    iput v4, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    move/from16 v16, v2

    goto/16 :goto_1

    .line 2031
    :cond_5
    invoke-static/range {p1 .. p1}, Landroid/support/v4/view/MotionEventCompat;->getActionIndex(Landroid/view/MotionEvent;)I

    move-result v4

    .line 2032
    .local v4, "index":I
    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v6

    .line 2033
    .local v6, "x":F
    iput v6, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    .line 2034
    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v7

    iput v7, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    .line 2035
    move/from16 v16, v2

    goto/16 :goto_1

    .line 2023
    .end local v4    # "index":I
    .end local v6    # "x":F
    :cond_6
    iget-boolean v6, v0, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    if-eqz v6, :cond_7

    .line 2024
    iget v6, v0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    invoke-direct {v0, v6, v3, v4, v4}, Landroid/support/v4/view/ViewPager;->scrollToItem(IZIZ)V

    .line 2025
    iput v7, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    .line 2026
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->endDrag()V

    .line 2027
    iget-object v4, v0, Landroid/support/v4/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v4}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v4

    iget-object v6, v0, Landroid/support/v4/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v6}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v6

    or-int v5, v4, v6

    move/from16 v16, v2

    goto/16 :goto_1

    .line 2023
    :cond_7
    move/from16 v16, v2

    goto/16 :goto_1

    .line 1964
    :cond_8
    iget-boolean v4, v0, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    if-nez v4, :cond_a

    .line 1965
    iget v4, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v4

    .line 1966
    .local v4, "pointerIndex":I
    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v6

    .line 1967
    .restart local v6    # "x":F
    iget v7, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    sub-float v7, v6, v7

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    .line 1968
    .local v7, "xDiff":F
    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v8

    .line 1969
    .local v8, "y":F
    iget v9, v0, Landroid/support/v4/view/ViewPager;->mLastMotionY:F

    sub-float v9, v8, v9

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v9

    .line 1971
    .local v9, "yDiff":F
    iget v10, v0, Landroid/support/v4/view/ViewPager;->mTouchSlop:I

    int-to-float v10, v10

    cmpl-float v10, v7, v10

    if-lez v10, :cond_a

    cmpl-float v10, v7, v9

    if-lez v10, :cond_a

    .line 1973
    iput-boolean v3, v0, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    .line 1974
    invoke-direct {v0, v3}, Landroid/support/v4/view/ViewPager;->requestParentDisallowInterceptTouchEvent(Z)V

    .line 1975
    iget v10, v0, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    sub-float v11, v6, v10

    const/4 v12, 0x0

    cmpl-float v11, v11, v12

    if-lez v11, :cond_9

    iget v11, v0, Landroid/support/v4/view/ViewPager;->mTouchSlop:I

    int-to-float v11, v11

    add-float/2addr v10, v11

    goto :goto_0

    :cond_9
    iget v11, v0, Landroid/support/v4/view/ViewPager;->mTouchSlop:I

    int-to-float v11, v11

    sub-float/2addr v10, v11

    :goto_0
    iput v10, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    .line 1977
    iput v8, v0, Landroid/support/v4/view/ViewPager;->mLastMotionY:F

    .line 1978
    invoke-direct {v0, v3}, Landroid/support/v4/view/ViewPager;->setScrollState(I)V

    .line 1979
    invoke-direct {v0, v3}, Landroid/support/v4/view/ViewPager;->setScrollingCacheEnabled(Z)V

    .line 1982
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getParent()Landroid/view/ViewParent;

    move-result-object v10

    .line 1983
    .local v10, "parent":Landroid/view/ViewParent;
    if-eqz v10, :cond_a

    .line 1984
    invoke-interface {v10, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 1989
    .end local v4    # "pointerIndex":I
    .end local v6    # "x":F
    .end local v7    # "xDiff":F
    .end local v8    # "y":F
    .end local v9    # "yDiff":F
    .end local v10    # "parent":Landroid/view/ViewParent;
    :cond_a
    iget-boolean v4, v0, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    if-eqz v4, :cond_b

    .line 1991
    iget v4, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v4

    .line 1993
    .local v4, "activePointerIndex":I
    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v6

    .line 1994
    .restart local v6    # "x":F
    invoke-direct {v0, v6}, Landroid/support/v4/view/ViewPager;->performDrag(F)Z

    move-result v7

    or-int/2addr v5, v7

    .line 1995
    .end local v4    # "activePointerIndex":I
    .end local v6    # "x":F
    move/from16 v16, v2

    goto/16 :goto_1

    .line 1989
    :cond_b
    move/from16 v16, v2

    goto/16 :goto_1

    .line 1998
    :cond_c
    iget-boolean v4, v0, Landroid/support/v4/view/ViewPager;->mIsBeingDragged:Z

    if-eqz v4, :cond_d

    .line 1999
    iget-object v4, v0, Landroid/support/v4/view/ViewPager;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 2000
    .local v4, "velocityTracker":Landroid/view/VelocityTracker;
    const/16 v6, 0x3e8

    iget v8, v0, Landroid/support/v4/view/ViewPager;->mMaximumVelocity:I

    int-to-float v8, v8

    invoke-virtual {v4, v6, v8}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 2001
    iget v6, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    invoke-static {v4, v6}, Landroid/support/v4/view/VelocityTrackerCompat;->getXVelocity(Landroid/view/VelocityTracker;I)F

    move-result v6

    float-to-int v6, v6

    .line 2003
    .local v6, "initialVelocity":I
    iput-boolean v3, v0, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    .line 2004
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v8

    .line 2005
    .local v8, "width":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v9

    .line 2006
    .local v9, "scrollX":I
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->infoForCurrentScrollPosition()Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v10

    .line 2007
    .local v10, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget v11, v10, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    .line 2008
    .local v11, "currentPage":I
    int-to-float v12, v9

    int-to-float v13, v8

    div-float/2addr v12, v13

    iget v13, v10, Landroid/support/v4/view/ViewPager$ItemInfo;->offset:F

    sub-float/2addr v12, v13

    iget v13, v10, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    div-float/2addr v12, v13

    .line 2009
    .local v12, "pageOffset":F
    iget v13, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    invoke-static {v1, v13}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v13

    .line 2011
    .local v13, "activePointerIndex":I
    invoke-static {v1, v13}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v14

    .line 2012
    .local v14, "x":F
    iget v15, v0, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    sub-float v15, v14, v15

    float-to-int v15, v15

    .line 2013
    .local v15, "totalDelta":I
    invoke-direct {v0, v11, v12, v6, v15}, Landroid/support/v4/view/ViewPager;->determineTargetPage(IFII)I

    move-result v7

    .line 2015
    .local v7, "nextPage":I
    invoke-virtual {v0, v7, v3, v3, v6}, Landroid/support/v4/view/ViewPager;->setCurrentItemInternal(IZZI)V

    .line 2017
    const/4 v3, -0x1

    iput v3, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    .line 2018
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->endDrag()V

    .line 2019
    iget-object v3, v0, Landroid/support/v4/view/ViewPager;->mLeftEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v3}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v3

    move/from16 v16, v2

    .end local v2    # "action":I
    .local v16, "action":I
    iget-object v2, v0, Landroid/support/v4/view/ViewPager;->mRightEdge:Landroid/support/v4/widget/EdgeEffectCompat;

    invoke-virtual {v2}, Landroid/support/v4/widget/EdgeEffectCompat;->onRelease()Z

    move-result v2

    or-int v5, v3, v2

    .line 2020
    .end local v4    # "velocityTracker":Landroid/view/VelocityTracker;
    .end local v6    # "initialVelocity":I
    .end local v7    # "nextPage":I
    .end local v8    # "width":I
    .end local v9    # "scrollX":I
    .end local v10    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v11    # "currentPage":I
    .end local v12    # "pageOffset":F
    .end local v13    # "activePointerIndex":I
    .end local v14    # "x":F
    .end local v15    # "totalDelta":I
    goto :goto_1

    .line 1998
    .end local v16    # "action":I
    .restart local v2    # "action":I
    :cond_d
    move/from16 v16, v2

    .end local v2    # "action":I
    .restart local v16    # "action":I
    goto :goto_1

    .line 1953
    .end local v16    # "action":I
    .restart local v2    # "action":I
    :cond_e
    move/from16 v16, v2

    .end local v2    # "action":I
    .restart local v16    # "action":I
    iget-object v2, v0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v2}, Landroid/widget/Scroller;->abortAnimation()V

    .line 1954
    iput-boolean v4, v0, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    .line 1955
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->populate()V

    .line 1958
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    iput v2, v0, Landroid/support/v4/view/ViewPager;->mInitialMotionX:F

    iput v2, v0, Landroid/support/v4/view/ViewPager;->mLastMotionX:F

    .line 1959
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    iput v2, v0, Landroid/support/v4/view/ViewPager;->mInitialMotionY:F

    iput v2, v0, Landroid/support/v4/view/ViewPager;->mLastMotionY:F

    .line 1960
    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v2

    iput v2, v0, Landroid/support/v4/view/ViewPager;->mActivePointerId:I

    .line 1961
    nop

    .line 2043
    :goto_1
    if-eqz v5, :cond_f

    .line 2044
    invoke-static/range {p0 .. p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 2046
    :cond_f
    const/4 v2, 0x1

    return v2

    .line 1940
    .end local v5    # "needsInvalidate":Z
    .end local v16    # "action":I
    :cond_10
    :goto_2
    return v4
.end method

.method pageLeft()Z
    .locals 2

    .line 2606
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-lez v0, :cond_0

    .line 2607
    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-virtual {p0, v0, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    .line 2608
    return v1

    .line 2610
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method pageRight()Z
    .locals 3

    .line 2614
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v0, :cond_0

    iget v1, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    invoke-virtual {v0}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v0

    const/4 v2, 0x1

    sub-int/2addr v0, v2

    if-ge v1, v0, :cond_0

    .line 2615
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    add-int/2addr v0, v2

    invoke-virtual {p0, v0, v2}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    .line 2616
    return v2

    .line 2618
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method populate()V
    .locals 1

    .line 914
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->populate(I)V

    .line 915
    return-void
.end method

.method populate(I)V
    .locals 21
    .param p1, "newCurrentItem"    # I

    .line 918
    move-object/from16 v1, p0

    move/from16 v2, p1

    const/4 v0, 0x0

    .line 919
    .local v0, "oldCurInfo":Landroid/support/v4/view/ViewPager$ItemInfo;
    const/4 v3, 0x2

    .line 920
    .local v3, "focusDirection":I
    iget v4, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-eq v4, v2, :cond_1

    .line 921
    if-ge v4, v2, :cond_0

    const/16 v4, 0x42

    goto :goto_0

    :cond_0
    const/16 v4, 0x11

    :goto_0
    move v3, v4

    .line 922
    iget v4, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    invoke-virtual {v1, v4}, Landroid/support/v4/view/ViewPager;->infoForPosition(I)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v0

    .line 923
    iput v2, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    move v4, v3

    move-object v3, v0

    goto :goto_1

    .line 920
    :cond_1
    move v4, v3

    move-object v3, v0

    .line 926
    .end local v0    # "oldCurInfo":Landroid/support/v4/view/ViewPager$ItemInfo;
    .local v3, "oldCurInfo":Landroid/support/v4/view/ViewPager$ItemInfo;
    .local v4, "focusDirection":I
    :goto_1
    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-nez v0, :cond_2

    .line 927
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->sortChildDrawingOrder()V

    .line 928
    return-void

    .line 935
    :cond_2
    iget-boolean v0, v1, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    if-eqz v0, :cond_3

    .line 937
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->sortChildDrawingOrder()V

    .line 938
    return-void

    .line 944
    :cond_3
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getWindowToken()Landroid/os/IBinder;

    move-result-object v0

    if-nez v0, :cond_4

    .line 945
    return-void

    .line 948
    :cond_4
    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/PagerAdapter;->startUpdate(Landroid/view/ViewGroup;)V

    .line 950
    iget v5, v1, Landroid/support/v4/view/ViewPager;->mOffscreenPageLimit:I

    .line 951
    .local v5, "pageLimit":I
    const/4 v0, 0x0

    iget v6, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    sub-int/2addr v6, v5

    invoke-static {v0, v6}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 952
    .local v6, "startPos":I
    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v0}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v7

    .line 953
    .local v7, "N":I
    add-int/lit8 v0, v7, -0x1

    iget v8, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    add-int/2addr v8, v5

    invoke-static {v0, v8}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 955
    .local v8, "endPos":I
    iget v0, v1, Landroid/support/v4/view/ViewPager;->mExpectedAdapterCount:I

    if-ne v7, v0, :cond_26

    .line 971
    const/4 v0, -0x1

    .line 972
    .local v0, "curIndex":I
    const/4 v10, 0x0

    .line 973
    .local v10, "curItem":Landroid/support/v4/view/ViewPager$ItemInfo;
    const/4 v0, 0x0

    :goto_2
    iget-object v11, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-ge v0, v11, :cond_6

    .line 974
    iget-object v11, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 975
    .local v11, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget v12, v11, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v13, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-lt v12, v13, :cond_5

    .line 976
    iget v12, v11, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v13, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-ne v12, v13, :cond_6

    move-object v10, v11

    goto :goto_3

    .line 973
    .end local v11    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 981
    :cond_6
    :goto_3
    if-nez v10, :cond_7

    if-lez v7, :cond_7

    .line 982
    iget v11, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    invoke-virtual {v1, v11, v0}, Landroid/support/v4/view/ViewPager;->addNewItem(II)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v10

    .line 988
    :cond_7
    if-eqz v10, :cond_1d

    .line 989
    const/4 v12, 0x0

    .line 990
    .local v12, "extraWidthLeft":F
    add-int/lit8 v13, v0, -0x1

    .line 991
    .local v13, "itemIndex":I
    if-ltz v13, :cond_8

    iget-object v14, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v14, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_4

    :cond_8
    const/4 v14, 0x0

    .line 992
    .local v14, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :goto_4
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v15

    .line 993
    .local v15, "clientWidth":I
    const/high16 v16, 0x40000000    # 2.0f

    if-gtz v15, :cond_9

    move/from16 v18, v0

    const/4 v11, 0x0

    goto :goto_5

    :cond_9
    iget v9, v10, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    sub-float v9, v16, v9

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingLeft()I

    move-result v11

    int-to-float v11, v11

    move/from16 v18, v0

    .end local v0    # "curIndex":I
    .local v18, "curIndex":I
    int-to-float v0, v15

    div-float/2addr v11, v0

    add-float/2addr v11, v9

    :goto_5
    move v0, v11

    .line 995
    .local v0, "leftWidthNeeded":F
    iget v9, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    add-int/lit8 v9, v9, -0x1

    move/from16 v11, v18

    .end local v18    # "curIndex":I
    .local v9, "pos":I
    .local v11, "curIndex":I
    :goto_6
    if-ltz v9, :cond_11

    .line 996
    cmpl-float v18, v12, v0

    if-ltz v18, :cond_c

    if-ge v9, v6, :cond_c

    .line 997
    if-nez v14, :cond_a

    .line 998
    move/from16 v19, v0

    goto/16 :goto_b

    .line 1000
    :cond_a
    move/from16 v19, v0

    .end local v0    # "leftWidthNeeded":F
    .local v19, "leftWidthNeeded":F
    iget v0, v14, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ne v9, v0, :cond_10

    iget-boolean v0, v14, Landroid/support/v4/view/ViewPager$ItemInfo;->scrolling:Z

    if-nez v0, :cond_10

    .line 1001
    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1002
    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v2, v14, Landroid/support/v4/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    invoke-virtual {v0, v1, v9, v2}, Landroid/support/v4/view/PagerAdapter;->destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 1007
    add-int/lit8 v13, v13, -0x1

    .line 1008
    add-int/lit8 v11, v11, -0x1

    .line 1009
    if-ltz v13, :cond_b

    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_7

    :cond_b
    const/4 v0, 0x0

    :goto_7
    move-object v14, v0

    .end local v14    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .local v0, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    goto :goto_a

    .line 996
    .end local v19    # "leftWidthNeeded":F
    .local v0, "leftWidthNeeded":F
    .restart local v14    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_c
    move/from16 v19, v0

    .line 1011
    .end local v0    # "leftWidthNeeded":F
    .restart local v19    # "leftWidthNeeded":F
    if-eqz v14, :cond_e

    iget v0, v14, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ne v9, v0, :cond_e

    .line 1012
    iget v0, v14, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v12, v0

    .line 1013
    add-int/lit8 v13, v13, -0x1

    .line 1014
    if-ltz v13, :cond_d

    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_8

    :cond_d
    const/4 v0, 0x0

    :goto_8
    move-object v14, v0

    .end local v14    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .local v0, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    goto :goto_a

    .line 1016
    .end local v0    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .restart local v14    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_e
    add-int/lit8 v0, v13, 0x1

    invoke-virtual {v1, v9, v0}, Landroid/support/v4/view/ViewPager;->addNewItem(II)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v0

    .line 1017
    .end local v14    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .restart local v0    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget v2, v0, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v12, v2

    .line 1018
    add-int/lit8 v11, v11, 0x1

    .line 1019
    if-ltz v13, :cond_f

    iget-object v2, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_9

    :cond_f
    const/4 v2, 0x0

    :goto_9
    move-object v0, v2

    move-object v14, v0

    .line 995
    .end local v0    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .restart local v14    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_10
    :goto_a
    add-int/lit8 v9, v9, -0x1

    move/from16 v2, p1

    move/from16 v0, v19

    goto :goto_6

    .end local v19    # "leftWidthNeeded":F
    .local v0, "leftWidthNeeded":F
    :cond_11
    move/from16 v19, v0

    .line 1023
    .end local v0    # "leftWidthNeeded":F
    .end local v9    # "pos":I
    .restart local v19    # "leftWidthNeeded":F
    :goto_b
    iget v0, v10, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    .line 1024
    .local v0, "extraWidthRight":F
    add-int/lit8 v2, v11, 0x1

    .line 1025
    .end local v13    # "itemIndex":I
    .local v2, "itemIndex":I
    cmpg-float v9, v0, v16

    if-gez v9, :cond_1c

    .line 1026
    iget-object v9, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v2, v9, :cond_12

    iget-object v9, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v9, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_c

    :cond_12
    const/4 v9, 0x0

    .line 1027
    .end local v14    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .local v9, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :goto_c
    if-gtz v15, :cond_13

    const/4 v13, 0x0

    goto :goto_d

    :cond_13
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getPaddingRight()I

    move-result v13

    int-to-float v13, v13

    int-to-float v14, v15

    div-float/2addr v13, v14

    add-float v13, v13, v16

    .line 1029
    .local v13, "rightWidthNeeded":F
    :goto_d
    iget v14, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    add-int/lit8 v14, v14, 0x1

    .local v14, "pos":I
    :goto_e
    if-ge v14, v7, :cond_1b

    .line 1030
    cmpl-float v16, v0, v13

    if-ltz v16, :cond_17

    if-le v14, v8, :cond_17

    .line 1031
    if-nez v9, :cond_14

    .line 1032
    move/from16 v16, v5

    move/from16 v20, v6

    goto/16 :goto_12

    .line 1034
    :cond_14
    move/from16 v16, v5

    .end local v5    # "pageLimit":I
    .local v16, "pageLimit":I
    iget v5, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ne v14, v5, :cond_16

    iget-boolean v5, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->scrolling:Z

    if-nez v5, :cond_16

    .line 1035
    iget-object v5, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1036
    iget-object v5, v1, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    move/from16 v20, v6

    .end local v6    # "startPos":I
    .local v20, "startPos":I
    iget-object v6, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    invoke-virtual {v5, v1, v14, v6}, Landroid/support/v4/view/PagerAdapter;->destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 1041
    iget-object v5, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v2, v5, :cond_15

    iget-object v5, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_f

    :cond_15
    const/4 v5, 0x0

    :goto_f
    move-object v9, v5

    goto :goto_11

    .line 1034
    .end local v20    # "startPos":I
    .restart local v6    # "startPos":I
    :cond_16
    move/from16 v20, v6

    .end local v6    # "startPos":I
    .restart local v20    # "startPos":I
    goto :goto_11

    .line 1030
    .end local v16    # "pageLimit":I
    .end local v20    # "startPos":I
    .restart local v5    # "pageLimit":I
    .restart local v6    # "startPos":I
    :cond_17
    move/from16 v16, v5

    move/from16 v20, v6

    .line 1043
    .end local v5    # "pageLimit":I
    .end local v6    # "startPos":I
    .restart local v16    # "pageLimit":I
    .restart local v20    # "startPos":I
    if-eqz v9, :cond_19

    iget v5, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    if-ne v14, v5, :cond_19

    .line 1044
    iget v5, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v0, v5

    .line 1045
    add-int/lit8 v2, v2, 0x1

    .line 1046
    iget-object v5, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v2, v5, :cond_18

    iget-object v5, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_10

    :cond_18
    const/4 v5, 0x0

    :goto_10
    move-object v9, v5

    goto :goto_11

    .line 1048
    :cond_19
    invoke-virtual {v1, v14, v2}, Landroid/support/v4/view/ViewPager;->addNewItem(II)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v5

    .line 1049
    .end local v9    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .local v5, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    add-int/lit8 v2, v2, 0x1

    .line 1050
    iget v6, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    add-float/2addr v0, v6

    .line 1051
    iget-object v6, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v2, v6, :cond_1a

    iget-object v6, v1, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    move-object v9, v6

    check-cast v9, Landroid/support/v4/view/ViewPager$ItemInfo;

    goto :goto_11

    :cond_1a
    const/4 v9, 0x0

    .line 1029
    .end local v5    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .restart local v9    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :goto_11
    add-int/lit8 v14, v14, 0x1

    move/from16 v5, v16

    move/from16 v6, v20

    goto/16 :goto_e

    .end local v16    # "pageLimit":I
    .end local v20    # "startPos":I
    .local v5, "pageLimit":I
    .restart local v6    # "startPos":I
    :cond_1b
    move/from16 v16, v5

    move/from16 v20, v6

    .line 1056
    .end local v5    # "pageLimit":I
    .end local v6    # "startPos":I
    .end local v13    # "rightWidthNeeded":F
    .end local v14    # "pos":I
    .restart local v16    # "pageLimit":I
    .restart local v20    # "startPos":I
    :goto_12
    move-object v14, v9

    goto :goto_13

    .line 1025
    .end local v9    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v16    # "pageLimit":I
    .end local v20    # "startPos":I
    .restart local v5    # "pageLimit":I
    .restart local v6    # "startPos":I
    .local v14, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_1c
    move/from16 v16, v5

    move/from16 v20, v6

    .line 1056
    .end local v5    # "pageLimit":I
    .end local v6    # "startPos":I
    .restart local v16    # "pageLimit":I
    .restart local v20    # "startPos":I
    :goto_13
    invoke-direct {v1, v10, v11, v3}, Landroid/support/v4/view/ViewPager;->calculatePageOffsets(Landroid/support/v4/view/ViewPager$ItemInfo;ILandroid/support/v4/view/ViewPager$ItemInfo;)V

    move/from16 v18, v11

    goto :goto_14

    .line 988
    .end local v2    # "itemIndex":I
    .end local v11    # "curIndex":I
    .end local v12    # "extraWidthLeft":F
    .end local v14    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v15    # "clientWidth":I
    .end local v16    # "pageLimit":I
    .end local v19    # "leftWidthNeeded":F
    .end local v20    # "startPos":I
    .local v0, "curIndex":I
    .restart local v5    # "pageLimit":I
    .restart local v6    # "startPos":I
    :cond_1d
    move/from16 v18, v0

    move/from16 v16, v5

    move/from16 v20, v6

    .line 1066
    .end local v0    # "curIndex":I
    .end local v5    # "pageLimit":I
    .end local v6    # "startPos":I
    .restart local v16    # "pageLimit":I
    .restart local v18    # "curIndex":I
    .restart local v20    # "startPos":I
    :goto_14
    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget v2, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-eqz v10, :cond_1e

    iget-object v9, v10, Landroid/support/v4/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    goto :goto_15

    :cond_1e
    const/4 v9, 0x0

    :goto_15
    invoke-virtual {v0, v1, v2, v9}, Landroid/support/v4/view/PagerAdapter;->setPrimaryItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 1068
    iget-object v0, v1, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/PagerAdapter;->finishUpdate(Landroid/view/ViewGroup;)V

    .line 1072
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v0

    .line 1073
    .local v0, "childCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_16
    if-ge v2, v0, :cond_21

    .line 1074
    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 1075
    .local v5, "child":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/support/v4/view/ViewPager$LayoutParams;

    .line 1076
    .local v6, "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    iput v2, v6, Landroid/support/v4/view/ViewPager$LayoutParams;->childIndex:I

    .line 1077
    iget-boolean v9, v6, Landroid/support/v4/view/ViewPager$LayoutParams;->isDecor:Z

    if-nez v9, :cond_1f

    iget v9, v6, Landroid/support/v4/view/ViewPager$LayoutParams;->widthFactor:F

    const/4 v11, 0x0

    cmpl-float v9, v9, v11

    if-nez v9, :cond_20

    .line 1079
    invoke-virtual {v1, v5}, Landroid/support/v4/view/ViewPager;->infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v9

    .line 1080
    .restart local v9    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    if-eqz v9, :cond_20

    .line 1081
    iget v12, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->widthFactor:F

    iput v12, v6, Landroid/support/v4/view/ViewPager$LayoutParams;->widthFactor:F

    .line 1082
    iget v12, v9, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iput v12, v6, Landroid/support/v4/view/ViewPager$LayoutParams;->position:I

    goto :goto_17

    .line 1077
    .end local v9    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    :cond_1f
    const/4 v11, 0x0

    .line 1073
    .end local v5    # "child":Landroid/view/View;
    .end local v6    # "lp":Landroid/support/v4/view/ViewPager$LayoutParams;
    :cond_20
    :goto_17
    add-int/lit8 v2, v2, 0x1

    goto :goto_16

    .line 1086
    .end local v2    # "i":I
    :cond_21
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->sortChildDrawingOrder()V

    .line 1088
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->hasFocus()Z

    move-result v2

    if-eqz v2, :cond_25

    .line 1089
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->findFocus()Landroid/view/View;

    move-result-object v2

    .line 1090
    .local v2, "currentFocused":Landroid/view/View;
    if-eqz v2, :cond_22

    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPager;->infoForAnyChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v9

    move-object/from16 v17, v9

    goto :goto_18

    :cond_22
    const/16 v17, 0x0

    :goto_18
    move-object/from16 v5, v17

    .line 1091
    .local v5, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    if-eqz v5, :cond_23

    iget v6, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v9, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-eq v6, v9, :cond_25

    .line 1092
    :cond_23
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_19
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v9

    if-ge v6, v9, :cond_25

    .line 1093
    invoke-virtual {v1, v6}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    .line 1094
    .local v9, "child":Landroid/view/View;
    invoke-virtual {v1, v9}, Landroid/support/v4/view/ViewPager;->infoForChild(Landroid/view/View;)Landroid/support/v4/view/ViewPager$ItemInfo;

    move-result-object v5

    .line 1095
    if-eqz v5, :cond_24

    iget v11, v5, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget v12, v1, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-ne v11, v12, :cond_24

    .line 1096
    invoke-virtual {v9, v4}, Landroid/view/View;->requestFocus(I)Z

    move-result v11

    if-eqz v11, :cond_24

    .line 1097
    goto :goto_1a

    .line 1092
    .end local v9    # "child":Landroid/view/View;
    :cond_24
    add-int/lit8 v6, v6, 0x1

    goto :goto_19

    .line 1103
    .end local v2    # "currentFocused":Landroid/view/View;
    .end local v5    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v6    # "i":I
    :cond_25
    :goto_1a
    return-void

    .line 958
    .end local v0    # "childCount":I
    .end local v10    # "curItem":Landroid/support/v4/view/ViewPager$ItemInfo;
    .end local v16    # "pageLimit":I
    .end local v18    # "curIndex":I
    .end local v20    # "startPos":I
    .local v5, "pageLimit":I
    .local v6, "startPos":I
    :cond_26
    move/from16 v16, v5

    move/from16 v20, v6

    .end local v5    # "pageLimit":I
    .end local v6    # "startPos":I
    .restart local v16    # "pageLimit":I
    .restart local v20    # "startPos":I
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getId()I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 961
    .local v0, "resName":Ljava/lang/String;
    goto :goto_1b

    .line 959
    .end local v0    # "resName":Ljava/lang/String;
    :catch_0
    move-exception v0

    const/4 v2, 0x0

    .line 960
    .local v0, "e":Landroid/content/res/Resources$NotFoundException;
    .local v2, "resName":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getId()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    move-object v0, v2

    .line 962
    .end local v2    # "resName":Ljava/lang/String;
    .local v0, "resName":Ljava/lang/String;
    :goto_1b
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "The application\'s PagerAdapter changed the adapter\'s contents without calling PagerAdapter#notifyDataSetChanged! Expected adapter item count: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v6, v1, Landroid/support/v4/view/ViewPager;->mExpectedAdapterCount:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ", found: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " Pager id: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " Pager class: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v6, " Problematic adapter: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v1, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_1d

    :goto_1c
    throw v2

    :goto_1d
    goto :goto_1c
.end method

.method public removeView(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .line 1318
    iget-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mInLayout:Z

    if-eqz v0, :cond_0

    .line 1319
    invoke-virtual {p0, p1}, Landroid/support/v4/view/ViewPager;->removeViewInLayout(Landroid/view/View;)V

    goto :goto_0

    .line 1321
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 1323
    :goto_0
    return-void
.end method

.method public setAdapter(Landroid/support/v4/view/PagerAdapter;)V
    .locals 8
    .param p1, "adapter"    # Landroid/support/v4/view/PagerAdapter;

    .line 408
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 409
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mObserver:Landroid/support/v4/view/ViewPager$PagerObserver;

    invoke-virtual {v0, v2}, Landroid/support/v4/view/PagerAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 410
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v0, p0}, Landroid/support/v4/view/PagerAdapter;->startUpdate(Landroid/view/ViewGroup;)V

    .line 411
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 412
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/view/ViewPager$ItemInfo;

    .line 413
    .local v2, "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget v4, v2, Landroid/support/v4/view/ViewPager$ItemInfo;->position:I

    iget-object v5, v2, Landroid/support/v4/view/ViewPager$ItemInfo;->object:Ljava/lang/Object;

    invoke-virtual {v3, p0, v4, v5}, Landroid/support/v4/view/PagerAdapter;->destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 411
    .end local v2    # "ii":Landroid/support/v4/view/ViewPager$ItemInfo;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 415
    .end local v0    # "i":I
    :cond_0
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v0, p0}, Landroid/support/v4/view/PagerAdapter;->finishUpdate(Landroid/view/ViewGroup;)V

    .line 416
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 417
    invoke-direct {p0}, Landroid/support/v4/view/ViewPager;->removeNonDecorViews()V

    .line 418
    iput v1, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    .line 419
    invoke-virtual {p0, v1, v1}, Landroid/support/v4/view/ViewPager;->scrollTo(II)V

    .line 422
    :cond_1
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    .line 423
    .local v0, "oldAdapter":Landroid/support/v4/view/PagerAdapter;
    iput-object p1, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    .line 424
    iput v1, p0, Landroid/support/v4/view/ViewPager;->mExpectedAdapterCount:I

    .line 426
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    if-eqz v2, :cond_5

    .line 427
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mObserver:Landroid/support/v4/view/ViewPager$PagerObserver;

    const/4 v3, 0x0

    if-nez v2, :cond_2

    .line 428
    new-instance v2, Landroid/support/v4/view/ViewPager$PagerObserver;

    invoke-direct {v2, p0, v3}, Landroid/support/v4/view/ViewPager$PagerObserver;-><init>(Landroid/support/v4/view/ViewPager;Landroid/support/v4/view/ViewPager$1;)V

    iput-object v2, p0, Landroid/support/v4/view/ViewPager;->mObserver:Landroid/support/v4/view/ViewPager$PagerObserver;

    .line 430
    :cond_2
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v4, p0, Landroid/support/v4/view/ViewPager;->mObserver:Landroid/support/v4/view/ViewPager$PagerObserver;

    invoke-virtual {v2, v4}, Landroid/support/v4/view/PagerAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 431
    iput-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    .line 432
    iget-boolean v2, p0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    .line 433
    .local v2, "wasFirstLayout":Z
    const/4 v4, 0x1

    iput-boolean v4, p0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    .line 434
    iget-object v5, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v5}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v5

    iput v5, p0, Landroid/support/v4/view/ViewPager;->mExpectedAdapterCount:I

    .line 435
    iget v5, p0, Landroid/support/v4/view/ViewPager;->mRestoredCurItem:I

    if-ltz v5, :cond_3

    .line 436
    iget-object v5, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget-object v6, p0, Landroid/support/v4/view/ViewPager;->mRestoredAdapterState:Landroid/os/Parcelable;

    iget-object v7, p0, Landroid/support/v4/view/ViewPager;->mRestoredClassLoader:Ljava/lang/ClassLoader;

    invoke-virtual {v5, v6, v7}, Landroid/support/v4/view/PagerAdapter;->restoreState(Landroid/os/Parcelable;Ljava/lang/ClassLoader;)V

    .line 437
    iget v5, p0, Landroid/support/v4/view/ViewPager;->mRestoredCurItem:I

    invoke-virtual {p0, v5, v1, v4}, Landroid/support/v4/view/ViewPager;->setCurrentItemInternal(IZZ)V

    .line 438
    const/4 v1, -0x1

    iput v1, p0, Landroid/support/v4/view/ViewPager;->mRestoredCurItem:I

    .line 439
    iput-object v3, p0, Landroid/support/v4/view/ViewPager;->mRestoredAdapterState:Landroid/os/Parcelable;

    .line 440
    iput-object v3, p0, Landroid/support/v4/view/ViewPager;->mRestoredClassLoader:Ljava/lang/ClassLoader;

    goto :goto_1

    .line 441
    :cond_3
    if-nez v2, :cond_4

    .line 442
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->populate()V

    goto :goto_1

    .line 444
    :cond_4
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->requestLayout()V

    .line 448
    .end local v2    # "wasFirstLayout":Z
    :cond_5
    :goto_1
    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mAdapterChangeListener:Landroid/support/v4/view/ViewPager$OnAdapterChangeListener;

    if-eqz v1, :cond_6

    if-eq v0, p1, :cond_6

    .line 449
    invoke-interface {v1, v0, p1}, Landroid/support/v4/view/ViewPager$OnAdapterChangeListener;->onAdapterChanged(Landroid/support/v4/view/PagerAdapter;Landroid/support/v4/view/PagerAdapter;)V

    .line 451
    :cond_6
    return-void
.end method

.method setChildrenDrawingOrderEnabledCompat(Z)V
    .locals 7
    .param p1, "enable"    # Z

    .line 623
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x7

    if-lt v0, v1, :cond_1

    .line 624
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mSetChildrenDrawingOrderEnabled:Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    const-string v2, "ViewPager"

    const/4 v3, 0x1

    if-nez v0, :cond_0

    .line 626
    :try_start_0
    const-class v0, Landroid/view/ViewGroup;

    const-string v4, "setChildrenDrawingOrderEnabled"

    new-array v5, v3, [Ljava/lang/Class;

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v6, v5, v1

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/view/ViewPager;->mSetChildrenDrawingOrderEnabled:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 630
    goto :goto_0

    .line 628
    :catch_0
    move-exception v0

    .line 629
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    const-string v4, "Can\'t find setChildrenDrawingOrderEnabled"

    invoke-static {v2, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 633
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :cond_0
    :goto_0
    :try_start_1
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mSetChildrenDrawingOrderEnabled:Ljava/lang/reflect/Method;

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v3, v1

    invoke-virtual {v0, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 636
    goto :goto_1

    .line 634
    :catch_1
    move-exception v0

    .line 635
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Error changing children drawing order"

    invoke-static {v2, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 638
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    :goto_1
    return-void
.end method

.method public setCurrentItem(I)V
    .locals 2
    .param p1, "item"    # I

    .line 489
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    .line 490
    iget-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, p1, v1, v0}, Landroid/support/v4/view/ViewPager;->setCurrentItemInternal(IZZ)V

    .line 491
    return-void
.end method

.method public setCurrentItem(IZ)V
    .locals 1
    .param p1, "item"    # I
    .param p2, "smoothScroll"    # Z

    .line 500
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/view/ViewPager;->mPopulatePending:Z

    .line 501
    invoke-virtual {p0, p1, p2, v0}, Landroid/support/v4/view/ViewPager;->setCurrentItemInternal(IZZ)V

    .line 502
    return-void
.end method

.method setCurrentItemInternal(IZZ)V
    .locals 1
    .param p1, "item"    # I
    .param p2, "smoothScroll"    # Z
    .param p3, "always"    # Z

    .line 509
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Landroid/support/v4/view/ViewPager;->setCurrentItemInternal(IZZI)V

    .line 510
    return-void
.end method

.method setCurrentItemInternal(IZZI)V
    .locals 5
    .param p1, "item"    # I
    .param p2, "smoothScroll"    # Z
    .param p3, "always"    # Z
    .param p4, "velocity"    # I

    .line 513
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v0

    if-gtz v0, :cond_0

    goto/16 :goto_4

    .line 517
    :cond_0
    if-nez p3, :cond_1

    iget v0, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-ne v0, p1, :cond_1

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-eqz v0, :cond_1

    .line 518
    invoke-direct {p0, v1}, Landroid/support/v4/view/ViewPager;->setScrollingCacheEnabled(Z)V

    .line 519
    return-void

    .line 522
    :cond_1
    const/4 v0, 0x1

    if-gez p1, :cond_2

    .line 523
    const/4 p1, 0x0

    goto :goto_0

    .line 524
    :cond_2
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v2}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v2

    if-lt p1, v2, :cond_3

    .line 525
    iget-object v2, p0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    invoke-virtual {v2}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v2

    add-int/lit8 p1, v2, -0x1

    .line 527
    :cond_3
    :goto_0
    iget v2, p0, Landroid/support/v4/view/ViewPager;->mOffscreenPageLimit:I

    .line 528
    .local v2, "pageLimit":I
    iget v3, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    add-int v4, v3, v2

    if-gt p1, v4, :cond_4

    sub-int/2addr v3, v2

    if-ge p1, v3, :cond_5

    .line 532
    :cond_4
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    iget-object v4, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_5

    .line 533
    iget-object v4, p0, Landroid/support/v4/view/ViewPager;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/v4/view/ViewPager$ItemInfo;

    iput-boolean v0, v4, Landroid/support/v4/view/ViewPager$ItemInfo;->scrolling:Z

    .line 532
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 536
    .end local v3    # "i":I
    :cond_5
    iget v3, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    if-eq v3, p1, :cond_6

    goto :goto_2

    :cond_6
    const/4 v0, 0x0

    .line 538
    .local v0, "dispatchSelected":Z
    :goto_2
    iget-boolean v1, p0, Landroid/support/v4/view/ViewPager;->mFirstLayout:Z

    if-eqz v1, :cond_9

    .line 541
    iput p1, p0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    .line 542
    if-eqz v0, :cond_7

    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v1, :cond_7

    .line 543
    invoke-interface {v1, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageSelected(I)V

    .line 545
    :cond_7
    if-eqz v0, :cond_8

    iget-object v1, p0, Landroid/support/v4/view/ViewPager;->mInternalPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v1, :cond_8

    .line 546
    invoke-interface {v1, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageSelected(I)V

    .line 548
    :cond_8
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->requestLayout()V

    goto :goto_3

    .line 550
    :cond_9
    invoke-virtual {p0, p1}, Landroid/support/v4/view/ViewPager;->populate(I)V

    .line 551
    invoke-direct {p0, p1, p2, p4, v0}, Landroid/support/v4/view/ViewPager;->scrollToItem(IZIZ)V

    .line 553
    :goto_3
    return-void

    .line 514
    .end local v0    # "dispatchSelected":Z
    .end local v2    # "pageLimit":I
    :cond_a
    :goto_4
    invoke-direct {p0, v1}, Landroid/support/v4/view/ViewPager;->setScrollingCacheEnabled(Z)V

    .line 515
    return-void
.end method

.method setInternalPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)Landroid/support/v4/view/ViewPager$OnPageChangeListener;
    .locals 1
    .param p1, "listener"    # Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .line 654
    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mInternalPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .line 655
    .local v0, "oldListener":Landroid/support/v4/view/ViewPager$OnPageChangeListener;
    iput-object p1, p0, Landroid/support/v4/view/ViewPager;->mInternalPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .line 656
    return-object v0
.end method

.method public setOffscreenPageLimit(I)V
    .locals 3
    .param p1, "limit"    # I

    .line 688
    const/4 v0, 0x1

    if-ge p1, v0, :cond_0

    .line 689
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Requested offscreen page limit "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " too small; defaulting to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ViewPager"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 691
    const/4 p1, 0x1

    .line 693
    :cond_0
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mOffscreenPageLimit:I

    if-eq p1, v0, :cond_1

    .line 694
    iput p1, p0, Landroid/support/v4/view/ViewPager;->mOffscreenPageLimit:I

    .line 695
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->populate()V

    .line 697
    :cond_1
    return-void
.end method

.method setOnAdapterChangeListener(Landroid/support/v4/view/ViewPager$OnAdapterChangeListener;)V
    .locals 0
    .param p1, "listener"    # Landroid/support/v4/view/ViewPager$OnAdapterChangeListener;

    .line 474
    iput-object p1, p0, Landroid/support/v4/view/ViewPager;->mAdapterChangeListener:Landroid/support/v4/view/ViewPager$OnAdapterChangeListener;

    .line 475
    return-void
.end method

.method public setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V
    .locals 0
    .param p1, "listener"    # Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .line 592
    iput-object p1, p0, Landroid/support/v4/view/ViewPager;->mOnPageChangeListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .line 593
    return-void
.end method

.method public setPageMargin(I)V
    .locals 2
    .param p1, "marginPixels"    # I

    .line 708
    iget v0, p0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    .line 709
    .local v0, "oldMargin":I
    iput p1, p0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    .line 711
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getWidth()I

    move-result v1

    .line 712
    .local v1, "width":I
    invoke-direct {p0, v1, v1, p1, v0}, Landroid/support/v4/view/ViewPager;->recomputeScrollPosition(IIII)V

    .line 714
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->requestLayout()V

    .line 715
    return-void
.end method

.method public setPageMarginDrawable(I)V
    .locals 1
    .param p1, "resId"    # I

    .line 744
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->setPageMarginDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 745
    return-void
.end method

.method public setPageMarginDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;

    .line 732
    iput-object p1, p0, Landroid/support/v4/view/ViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    .line 733
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->refreshDrawableState()V

    .line 734
    :cond_0
    if-nez p1, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0, v0}, Landroid/support/v4/view/ViewPager;->setWillNotDraw(Z)V

    .line 735
    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->invalidate()V

    .line 736
    return-void
.end method

.method public setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V
    .locals 4
    .param p1, "reverseDrawingOrder"    # Z
    .param p2, "transformer"    # Landroid/support/v4/view/ViewPager$PageTransformer;

    .line 608
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_5

    .line 609
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 610
    .local v2, "hasTransformer":Z
    :goto_0
    iget-object v3, p0, Landroid/support/v4/view/ViewPager;->mPageTransformer:Landroid/support/v4/view/ViewPager$PageTransformer;

    if-eqz v3, :cond_1

    const/4 v3, 0x1

    goto :goto_1

    :cond_1
    const/4 v3, 0x0

    :goto_1
    if-eq v2, v3, :cond_2

    const/4 v3, 0x1

    goto :goto_2

    :cond_2
    const/4 v3, 0x0

    .line 611
    .local v3, "needsPopulate":Z
    :goto_2
    iput-object p2, p0, Landroid/support/v4/view/ViewPager;->mPageTransformer:Landroid/support/v4/view/ViewPager$PageTransformer;

    .line 612
    invoke-virtual {p0, v2}, Landroid/support/v4/view/ViewPager;->setChildrenDrawingOrderEnabledCompat(Z)V

    .line 613
    if-eqz v2, :cond_4

    .line 614
    if-eqz p1, :cond_3

    const/4 v0, 0x2

    :cond_3
    iput v0, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrder:I

    goto :goto_3

    .line 616
    :cond_4
    iput v1, p0, Landroid/support/v4/view/ViewPager;->mDrawingOrder:I

    .line 618
    :goto_3
    if-eqz v3, :cond_5

    invoke-virtual {p0}, Landroid/support/v4/view/ViewPager;->populate()V

    .line 620
    .end local v2    # "hasTransformer":Z
    .end local v3    # "needsPopulate":Z
    :cond_5
    return-void
.end method

.method smoothScrollTo(II)V
    .locals 1
    .param p1, "x"    # I
    .param p2, "y"    # I

    .line 778
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Landroid/support/v4/view/ViewPager;->smoothScrollTo(III)V

    .line 779
    return-void
.end method

.method smoothScrollTo(III)V
    .locals 17
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "velocity"    # I

    .line 789
    move-object/from16 v0, p0

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 791
    invoke-direct {v0, v2}, Landroid/support/v4/view/ViewPager;->setScrollingCacheEnabled(Z)V

    .line 792
    return-void

    .line 794
    :cond_0
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollX()I

    move-result v1

    .line 795
    .local v1, "sx":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getScrollY()I

    move-result v9

    .line 796
    .local v9, "sy":I
    sub-int v10, p1, v1

    .line 797
    .local v10, "dx":I
    sub-int v11, p2, v9

    .line 798
    .local v11, "dy":I
    if-nez v10, :cond_1

    if-nez v11, :cond_1

    .line 799
    invoke-direct {v0, v2}, Landroid/support/v4/view/ViewPager;->completeScroll(Z)V

    .line 800
    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->populate()V

    .line 801
    invoke-direct {v0, v2}, Landroid/support/v4/view/ViewPager;->setScrollState(I)V

    .line 802
    return-void

    .line 805
    :cond_1
    const/4 v2, 0x1

    invoke-direct {v0, v2}, Landroid/support/v4/view/ViewPager;->setScrollingCacheEnabled(Z)V

    .line 806
    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/support/v4/view/ViewPager;->setScrollState(I)V

    .line 808
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewPager;->getClientWidth()I

    move-result v2

    .line 809
    .local v2, "width":I
    div-int/lit8 v12, v2, 0x2

    .line 810
    .local v12, "halfWidth":I
    invoke-static {v10}, Ljava/lang/Math;->abs(I)I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x3f800000    # 1.0f

    mul-float v3, v3, v4

    int-to-float v5, v2

    div-float/2addr v3, v5

    invoke-static {v4, v3}, Ljava/lang/Math;->min(FF)F

    move-result v13

    .line 811
    .local v13, "distanceRatio":F
    int-to-float v3, v12

    int-to-float v5, v12

    invoke-virtual {v0, v13}, Landroid/support/v4/view/ViewPager;->distanceInfluenceForSnapDuration(F)F

    move-result v6

    mul-float v5, v5, v6

    add-float v14, v3, v5

    .line 814
    .local v14, "distance":F
    const/4 v3, 0x0

    .line 815
    .local v3, "duration":I
    invoke-static/range {p3 .. p3}, Ljava/lang/Math;->abs(I)I

    move-result v15

    .line 816
    .end local p3    # "velocity":I
    .local v15, "velocity":I
    if-lez v15, :cond_2

    .line 817
    const/high16 v4, 0x447a0000    # 1000.0f

    int-to-float v5, v15

    div-float v5, v14, v5

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    mul-float v5, v5, v4

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v4

    mul-int/lit8 v4, v4, 0x4

    .end local v3    # "duration":I
    .local v4, "duration":I
    goto :goto_0

    .line 819
    .end local v4    # "duration":I
    .restart local v3    # "duration":I
    :cond_2
    int-to-float v5, v2

    iget-object v6, v0, Landroid/support/v4/view/ViewPager;->mAdapter:Landroid/support/v4/view/PagerAdapter;

    iget v7, v0, Landroid/support/v4/view/ViewPager;->mCurItem:I

    invoke-virtual {v6, v7}, Landroid/support/v4/view/PagerAdapter;->getPageWidth(I)F

    move-result v6

    mul-float v5, v5, v6

    .line 820
    .local v5, "pageWidth":F
    invoke-static {v10}, Ljava/lang/Math;->abs(I)I

    move-result v6

    int-to-float v6, v6

    iget v7, v0, Landroid/support/v4/view/ViewPager;->mPageMargin:I

    int-to-float v7, v7

    add-float/2addr v7, v5

    div-float/2addr v6, v7

    .line 821
    .local v6, "pageDelta":F
    add-float/2addr v4, v6

    const/high16 v7, 0x42c80000    # 100.0f

    mul-float v4, v4, v7

    float-to-int v4, v4

    .line 823
    .end local v3    # "duration":I
    .end local v5    # "pageWidth":F
    .end local v6    # "pageDelta":F
    .restart local v4    # "duration":I
    :goto_0
    const/16 v3, 0x258

    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    move-result v16

    .line 825
    .end local v4    # "duration":I
    .local v16, "duration":I
    iget-object v3, v0, Landroid/support/v4/view/ViewPager;->mScroller:Landroid/widget/Scroller;

    move v4, v1

    move v5, v9

    move v6, v10

    move v7, v11

    move/from16 v8, v16

    invoke-virtual/range {v3 .. v8}, Landroid/widget/Scroller;->startScroll(IIIII)V

    .line 826
    invoke-static/range {p0 .. p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 827
    return-void
.end method

.method protected verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .locals 1
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;

    .line 749
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/view/ViewPager;->mMarginDrawable:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_0

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
