.class Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;
.super Ljava/lang/Object;
.source "GestureDetectorCompat.java"

# interfaces
.implements Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImpl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/GestureDetectorCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "GestureDetectorCompatImplBase"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase$GestureHandler;
    }
.end annotation


# static fields
.field private static final DOUBLE_TAP_TIMEOUT:I

.field private static final LONGPRESS_TIMEOUT:I

.field private static final LONG_PRESS:I = 0x2

.field private static final SHOW_PRESS:I = 0x1

.field private static final TAP:I = 0x3

.field private static final TAP_TIMEOUT:I


# instance fields
.field private mAlwaysInBiggerTapRegion:Z

.field private mAlwaysInTapRegion:Z

.field private mCurrentDownEvent:Landroid/view/MotionEvent;

.field private mDeferConfirmSingleTap:Z

.field private mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

.field private mDoubleTapSlopSquare:I

.field private mDownFocusX:F

.field private mDownFocusY:F

.field private final mHandler:Landroid/os/Handler;

.field private mInLongPress:Z

.field private mIsDoubleTapping:Z

.field private mIsLongpressEnabled:Z

.field private mLastFocusX:F

.field private mLastFocusY:F

.field private final mListener:Landroid/view/GestureDetector$OnGestureListener;

.field private mMaximumFlingVelocity:I

.field private mMinimumFlingVelocity:I

.field private mPreviousUpEvent:Landroid/view/MotionEvent;

.field private mStillDown:Z

.field private mTouchSlopSquare:I

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 62
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v0

    sput v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->LONGPRESS_TIMEOUT:I

    .line 63
    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    move-result v0

    sput v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->TAP_TIMEOUT:I

    .line 64
    invoke-static {}, Landroid/view/ViewConfiguration;->getDoubleTapTimeout()I

    move-result v0

    sput v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->DOUBLE_TAP_TIMEOUT:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;Landroid/os/Handler;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Landroid/view/GestureDetector$OnGestureListener;
    .param p3, "handler"    # Landroid/os/Handler;

    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 153
    if-eqz p3, :cond_0

    .line 154
    new-instance v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase$GestureHandler;

    invoke-direct {v0, p0, p3}, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase$GestureHandler;-><init>(Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;Landroid/os/Handler;)V

    iput-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    goto :goto_0

    .line 156
    :cond_0
    new-instance v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase$GestureHandler;

    invoke-direct {v0, p0}, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase$GestureHandler;-><init>(Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;)V

    iput-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    .line 158
    :goto_0
    iput-object p2, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mListener:Landroid/view/GestureDetector$OnGestureListener;

    .line 159
    instance-of v0, p2, Landroid/view/GestureDetector$OnDoubleTapListener;

    if-eqz v0, :cond_1

    .line 160
    move-object v0, p2

    check-cast v0, Landroid/view/GestureDetector$OnDoubleTapListener;

    invoke-virtual {p0, v0}, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 162
    :cond_1
    invoke-direct {p0, p1}, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->init(Landroid/content/Context;)V

    .line 163
    return-void
.end method

.method static synthetic access$000(Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;)Landroid/view/MotionEvent;
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;

    .line 56
    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    return-object v0
.end method

.method static synthetic access$100(Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;)Landroid/view/GestureDetector$OnGestureListener;
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;

    .line 56
    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mListener:Landroid/view/GestureDetector$OnGestureListener;

    return-object v0
.end method

.method static synthetic access$200(Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;)V
    .locals 0
    .param p0, "x0"    # Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;

    .line 56
    invoke-direct {p0}, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->dispatchLongPress()V

    return-void
.end method

.method static synthetic access$300(Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;)Landroid/view/GestureDetector$OnDoubleTapListener;
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;

    .line 56
    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

    return-object v0
.end method

.method static synthetic access$400(Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;)Z
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;

    .line 56
    iget-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mStillDown:Z

    return v0
.end method

.method static synthetic access$502(Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;Z)Z
    .locals 0
    .param p0, "x0"    # Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;
    .param p1, "x1"    # Z

    .line 56
    iput-boolean p1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDeferConfirmSingleTap:Z

    return p1
.end method

.method private cancel()V
    .locals 2

    .line 409
    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 410
    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 411
    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 412
    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 413
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 414
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mIsDoubleTapping:Z

    .line 415
    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mStillDown:Z

    .line 416
    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInTapRegion:Z

    .line 417
    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInBiggerTapRegion:Z

    .line 418
    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDeferConfirmSingleTap:Z

    .line 419
    iget-boolean v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    if-eqz v1, :cond_0

    .line 420
    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    .line 422
    :cond_0
    return-void
.end method

.method private cancelTaps()V
    .locals 2

    .line 425
    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 426
    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 427
    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 428
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mIsDoubleTapping:Z

    .line 429
    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInTapRegion:Z

    .line 430
    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInBiggerTapRegion:Z

    .line 431
    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDeferConfirmSingleTap:Z

    .line 432
    iget-boolean v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    if-eqz v1, :cond_0

    .line 433
    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    .line 435
    :cond_0
    return-void
.end method

.method private dispatchLongPress()V
    .locals 2

    .line 453
    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 454
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDeferConfirmSingleTap:Z

    .line 455
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    .line 456
    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mListener:Landroid/view/GestureDetector$OnGestureListener;

    iget-object v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    invoke-interface {v0, v1}, Landroid/view/GestureDetector$OnGestureListener;->onLongPress(Landroid/view/MotionEvent;)V

    .line 457
    return-void
.end method

.method private init(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .line 166
    if-eqz p1, :cond_1

    .line 169
    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mListener:Landroid/view/GestureDetector$OnGestureListener;

    if-eqz v0, :cond_0

    .line 172
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mIsLongpressEnabled:Z

    .line 174
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 175
    .local v0, "configuration":Landroid/view/ViewConfiguration;
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    .line 176
    .local v1, "touchSlop":I
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledDoubleTapSlop()I

    move-result v2

    .line 177
    .local v2, "doubleTapSlop":I
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v3

    iput v3, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mMinimumFlingVelocity:I

    .line 178
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v3

    iput v3, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mMaximumFlingVelocity:I

    .line 180
    mul-int v3, v1, v1

    iput v3, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mTouchSlopSquare:I

    .line 181
    mul-int v3, v2, v2

    iput v3, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapSlopSquare:I

    .line 182
    return-void

    .line 170
    .end local v0    # "configuration":Landroid/view/ViewConfiguration;
    .end local v1    # "touchSlop":I
    .end local v2    # "doubleTapSlop":I
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "OnGestureListener must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 167
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Context must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private isConsideredDoubleTap(Landroid/view/MotionEvent;Landroid/view/MotionEvent;Landroid/view/MotionEvent;)Z
    .locals 6
    .param p1, "firstDown"    # Landroid/view/MotionEvent;
    .param p2, "firstUp"    # Landroid/view/MotionEvent;
    .param p3, "secondDown"    # Landroid/view/MotionEvent;

    .line 439
    iget-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInBiggerTapRegion:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 440
    return v1

    .line 443
    :cond_0
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    sub-long/2addr v2, v4

    sget v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->DOUBLE_TAP_TIMEOUT:I

    int-to-long v4, v0

    cmp-long v0, v2, v4

    if-lez v0, :cond_1

    .line 444
    return v1

    .line 447
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    float-to-int v2, v2

    sub-int/2addr v0, v2

    .line 448
    .local v0, "deltaX":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    float-to-int v3, v3

    sub-int/2addr v2, v3

    .line 449
    .local v2, "deltaY":I
    mul-int v3, v0, v0

    mul-int v4, v2, v2

    add-int/2addr v3, v4

    iget v4, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapSlopSquare:I

    if-ge v3, v4, :cond_2

    const/4 v1, 0x1

    :cond_2
    return v1
.end method


# virtual methods
.method public isLongpressEnabled()Z
    .locals 1

    .line 212
    iget-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mIsLongpressEnabled:Z

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 28
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .line 224
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    .line 226
    .local v2, "action":I
    iget-object v3, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v3, :cond_0

    .line 227
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v3

    iput-object v3, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 229
    :cond_0
    iget-object v3, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v3, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 231
    and-int/lit16 v3, v2, 0xff

    const/4 v4, 0x6

    const/4 v5, 0x1

    if-ne v3, v4, :cond_1

    const/4 v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    .line 233
    .local v3, "pointerUp":Z
    :goto_0
    if-eqz v3, :cond_2

    invoke-static/range {p1 .. p1}, Landroid/support/v4/view/MotionEventCompat;->getActionIndex(Landroid/view/MotionEvent;)I

    move-result v7

    goto :goto_1

    :cond_2
    const/4 v7, -0x1

    .line 236
    .local v7, "skipIndex":I
    :goto_1
    const/4 v8, 0x0

    .local v8, "sumX":F
    const/4 v9, 0x0

    .line 237
    .local v9, "sumY":F
    invoke-static/range {p1 .. p1}, Landroid/support/v4/view/MotionEventCompat;->getPointerCount(Landroid/view/MotionEvent;)I

    move-result v10

    .line 238
    .local v10, "count":I
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_2
    if-ge v11, v10, :cond_4

    .line 239
    if-ne v7, v11, :cond_3

    goto :goto_3

    .line 240
    :cond_3
    invoke-static {v1, v11}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v12

    add-float/2addr v8, v12

    .line 241
    invoke-static {v1, v11}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v12

    add-float/2addr v9, v12

    .line 238
    :goto_3
    add-int/lit8 v11, v11, 0x1

    goto :goto_2

    .line 243
    .end local v11    # "i":I
    :cond_4
    if-eqz v3, :cond_5

    add-int/lit8 v11, v10, -0x1

    goto :goto_4

    :cond_5
    move v11, v10

    .line 244
    .local v11, "div":I
    :goto_4
    int-to-float v12, v11

    div-float v12, v8, v12

    .line 245
    .local v12, "focusX":F
    int-to-float v13, v11

    div-float v13, v9, v13

    .line 247
    .local v13, "focusY":F
    const/4 v14, 0x0

    .line 249
    .local v14, "handled":Z
    and-int/lit16 v15, v2, 0xff

    const/4 v6, 0x2

    const/16 v17, 0x0

    if-eqz v15, :cond_1c

    const/4 v4, 0x0

    if-eq v15, v5, :cond_13

    if-eq v15, v6, :cond_c

    const/4 v6, 0x3

    if-eq v15, v6, :cond_b

    const/4 v4, 0x5

    if-eq v15, v4, :cond_a

    const/4 v4, 0x6

    if-eq v15, v4, :cond_6

    move/from16 v18, v2

    move/from16 v22, v3

    goto/16 :goto_d

    .line 258
    :cond_6
    iput v12, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusX:F

    iput v12, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDownFocusX:F

    .line 259
    iput v13, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusY:F

    iput v13, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDownFocusY:F

    .line 263
    iget-object v4, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget v5, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mMaximumFlingVelocity:I

    int-to-float v5, v5

    const/16 v6, 0x3e8

    invoke-virtual {v4, v6, v5}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 264
    invoke-static/range {p1 .. p1}, Landroid/support/v4/view/MotionEventCompat;->getActionIndex(Landroid/view/MotionEvent;)I

    move-result v4

    .line 265
    .local v4, "upIndex":I
    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v5

    .line 266
    .local v5, "id1":I
    iget-object v6, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-static {v6, v5}, Landroid/support/v4/view/VelocityTrackerCompat;->getXVelocity(Landroid/view/VelocityTracker;I)F

    move-result v6

    .line 267
    .local v6, "x1":F
    iget-object v15, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-static {v15, v5}, Landroid/support/v4/view/VelocityTrackerCompat;->getYVelocity(Landroid/view/VelocityTracker;I)F

    move-result v15

    .line 268
    .local v15, "y1":F
    const/16 v16, 0x0

    move/from16 v18, v2

    move/from16 v2, v16

    .local v2, "i":I
    .local v18, "action":I
    :goto_5
    if-ge v2, v10, :cond_9

    .line 269
    if-ne v2, v4, :cond_7

    move/from16 v22, v3

    move/from16 v16, v4

    move/from16 v19, v5

    goto :goto_6

    .line 271
    :cond_7
    move/from16 v22, v3

    .end local v3    # "pointerUp":Z
    .local v22, "pointerUp":Z
    invoke-static {v1, v2}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v3

    .line 272
    .local v3, "id2":I
    move/from16 v16, v4

    .end local v4    # "upIndex":I
    .local v16, "upIndex":I
    iget-object v4, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-static {v4, v3}, Landroid/support/v4/view/VelocityTrackerCompat;->getXVelocity(Landroid/view/VelocityTracker;I)F

    move-result v4

    mul-float v4, v4, v6

    .line 273
    .local v4, "x":F
    move/from16 v19, v5

    .end local v5    # "id1":I
    .local v19, "id1":I
    iget-object v5, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-static {v5, v3}, Landroid/support/v4/view/VelocityTrackerCompat;->getYVelocity(Landroid/view/VelocityTracker;I)F

    move-result v5

    mul-float v5, v5, v15

    .line 275
    .local v5, "y":F
    add-float v20, v4, v5

    .line 276
    .local v20, "dot":F
    cmpg-float v21, v20, v17

    if-gez v21, :cond_8

    .line 277
    move/from16 v21, v3

    .end local v3    # "id2":I
    .local v21, "id2":I
    iget-object v3, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v3}, Landroid/view/VelocityTracker;->clear()V

    .line 278
    goto :goto_7

    .line 276
    .end local v21    # "id2":I
    .restart local v3    # "id2":I
    :cond_8
    move/from16 v21, v3

    .line 268
    .end local v3    # "id2":I
    .end local v4    # "x":F
    .end local v5    # "y":F
    .end local v20    # "dot":F
    :goto_6
    add-int/lit8 v2, v2, 0x1

    move/from16 v4, v16

    move/from16 v5, v19

    move/from16 v3, v22

    goto :goto_5

    .end local v16    # "upIndex":I
    .end local v19    # "id1":I
    .end local v22    # "pointerUp":Z
    .local v3, "pointerUp":Z
    .local v4, "upIndex":I
    .local v5, "id1":I
    :cond_9
    move/from16 v22, v3

    move/from16 v16, v4

    move/from16 v19, v5

    .line 281
    .end local v2    # "i":I
    .end local v3    # "pointerUp":Z
    .end local v4    # "upIndex":I
    .end local v5    # "id1":I
    .restart local v16    # "upIndex":I
    .restart local v19    # "id1":I
    .restart local v22    # "pointerUp":Z
    :goto_7
    goto/16 :goto_d

    .line 251
    .end local v6    # "x1":F
    .end local v15    # "y1":F
    .end local v16    # "upIndex":I
    .end local v18    # "action":I
    .end local v19    # "id1":I
    .end local v22    # "pointerUp":Z
    .local v2, "action":I
    .restart local v3    # "pointerUp":Z
    :cond_a
    move/from16 v18, v2

    move/from16 v22, v3

    .end local v2    # "action":I
    .end local v3    # "pointerUp":Z
    .restart local v18    # "action":I
    .restart local v22    # "pointerUp":Z
    iput v12, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusX:F

    iput v12, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDownFocusX:F

    .line 252
    iput v13, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusY:F

    iput v13, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDownFocusY:F

    .line 254
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->cancelTaps()V

    .line 255
    goto/16 :goto_d

    .line 249
    .end local v18    # "action":I
    .end local v22    # "pointerUp":Z
    .restart local v2    # "action":I
    .restart local v3    # "pointerUp":Z
    :cond_b
    move/from16 v18, v2

    move/from16 v22, v3

    .end local v2    # "action":I
    .end local v3    # "pointerUp":Z
    .restart local v18    # "action":I
    .restart local v22    # "pointerUp":Z
    const/4 v2, 0x0

    move v3, v2

    .local v2, "id1":I
    .local v3, "upIndex":I
    move/from16 v5, v17

    .local v5, "x1":F
    move/from16 v6, v17

    .local v6, "y1":F
    move/from16 v15, v17

    .local v15, "scrollX":F
    move/from16 v16, v17

    .line 401
    .local v4, "currentUpEvent":Landroid/view/MotionEvent;
    .local v16, "scrollY":F
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->cancel()V

    goto/16 :goto_d

    .line 249
    .end local v4    # "currentUpEvent":Landroid/view/MotionEvent;
    .end local v5    # "x1":F
    .end local v6    # "y1":F
    .end local v15    # "scrollX":F
    .end local v16    # "scrollY":F
    .end local v18    # "action":I
    .end local v22    # "pointerUp":Z
    .local v2, "action":I
    .local v3, "pointerUp":Z
    :cond_c
    move/from16 v18, v2

    move/from16 v22, v3

    const/4 v2, 0x0

    .end local v2    # "action":I
    .end local v3    # "pointerUp":Z
    .restart local v18    # "action":I
    .restart local v22    # "pointerUp":Z
    move v3, v2

    .local v3, "upIndex":I
    move v4, v2

    .local v4, "id1":I
    move/from16 v2, v17

    .local v2, "x1":F
    move/from16 v6, v17

    .line 323
    .restart local v6    # "y1":F
    iget-boolean v15, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    if-eqz v15, :cond_d

    .line 324
    goto/16 :goto_d

    .line 326
    :cond_d
    iget v15, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusX:F

    sub-float/2addr v15, v12

    .line 327
    .restart local v15    # "scrollX":F
    iget v5, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusY:F

    sub-float/2addr v5, v13

    .line 328
    .local v5, "scrollY":F
    move/from16 v20, v2

    .end local v2    # "x1":F
    .local v20, "x1":F
    iget-boolean v2, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mIsDoubleTapping:Z

    if-eqz v2, :cond_e

    .line 330
    iget-object v2, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

    invoke-interface {v2, v1}, Landroid/view/GestureDetector$OnDoubleTapListener;->onDoubleTapEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    or-int/2addr v14, v2

    goto/16 :goto_d

    .line 331
    :cond_e
    iget-boolean v2, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInTapRegion:Z

    if-eqz v2, :cond_11

    .line 332
    iget v2, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDownFocusX:F

    sub-float v2, v12, v2

    float-to-int v2, v2

    .line 333
    .local v2, "deltaX":I
    move/from16 v23, v3

    .end local v3    # "upIndex":I
    .local v23, "upIndex":I
    iget v3, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDownFocusY:F

    sub-float v3, v13, v3

    float-to-int v3, v3

    .line 334
    .local v3, "deltaY":I
    mul-int v17, v2, v2

    mul-int v24, v3, v3

    move/from16 v25, v2

    .end local v2    # "deltaX":I
    .local v25, "deltaX":I
    add-int v2, v17, v24

    .line 335
    .local v2, "distance":I
    move/from16 v17, v3

    .end local v3    # "deltaY":I
    .local v17, "deltaY":I
    iget v3, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mTouchSlopSquare:I

    if-le v2, v3, :cond_f

    .line 336
    iget-object v3, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mListener:Landroid/view/GestureDetector$OnGestureListener;

    move/from16 v24, v4

    .end local v4    # "id1":I
    .local v24, "id1":I
    iget-object v4, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    invoke-interface {v3, v4, v1, v15, v5}, Landroid/view/GestureDetector$OnGestureListener;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result v3

    .line 337
    .end local v14    # "handled":Z
    .local v3, "handled":Z
    iput v12, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusX:F

    .line 338
    iput v13, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusY:F

    .line 339
    const/4 v4, 0x0

    iput-boolean v4, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInTapRegion:Z

    .line 340
    iget-object v4, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v14, 0x3

    invoke-virtual {v4, v14}, Landroid/os/Handler;->removeMessages(I)V

    .line 341
    iget-object v4, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v14, 0x1

    invoke-virtual {v4, v14}, Landroid/os/Handler;->removeMessages(I)V

    .line 342
    iget-object v4, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v14, 0x2

    invoke-virtual {v4, v14}, Landroid/os/Handler;->removeMessages(I)V

    move v14, v3

    goto :goto_8

    .line 335
    .end local v3    # "handled":Z
    .end local v24    # "id1":I
    .restart local v4    # "id1":I
    .restart local v14    # "handled":Z
    :cond_f
    move/from16 v24, v4

    .line 344
    .end local v4    # "id1":I
    .restart local v24    # "id1":I
    :goto_8
    iget v3, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mTouchSlopSquare:I

    if-le v2, v3, :cond_10

    .line 345
    const/4 v3, 0x0

    iput-boolean v3, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInBiggerTapRegion:Z

    .line 347
    .end local v2    # "distance":I
    .end local v17    # "deltaY":I
    .end local v25    # "deltaX":I
    :cond_10
    goto/16 :goto_d

    .end local v23    # "upIndex":I
    .end local v24    # "id1":I
    .local v3, "upIndex":I
    .restart local v4    # "id1":I
    :cond_11
    move/from16 v23, v3

    move/from16 v24, v4

    .end local v3    # "upIndex":I
    .end local v4    # "id1":I
    .restart local v23    # "upIndex":I
    .restart local v24    # "id1":I
    invoke-static {v15}, Ljava/lang/Math;->abs(F)F

    move-result v2

    const/high16 v3, 0x3f800000    # 1.0f

    cmpl-float v2, v2, v3

    if-gez v2, :cond_12

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v2

    cmpl-float v2, v2, v3

    if-ltz v2, :cond_10

    .line 348
    :cond_12
    iget-object v2, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mListener:Landroid/view/GestureDetector$OnGestureListener;

    iget-object v3, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    invoke-interface {v2, v3, v1, v15, v5}, Landroid/view/GestureDetector$OnGestureListener;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result v14

    .line 349
    iput v12, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusX:F

    .line 350
    iput v13, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusY:F

    goto/16 :goto_d

    .line 249
    .end local v5    # "scrollY":F
    .end local v6    # "y1":F
    .end local v15    # "scrollX":F
    .end local v18    # "action":I
    .end local v20    # "x1":F
    .end local v22    # "pointerUp":Z
    .end local v23    # "upIndex":I
    .end local v24    # "id1":I
    .local v2, "action":I
    .local v3, "pointerUp":Z
    :cond_13
    move/from16 v18, v2

    move/from16 v22, v3

    .end local v2    # "action":I
    .end local v3    # "pointerUp":Z
    .restart local v18    # "action":I
    .restart local v22    # "pointerUp":Z
    const/4 v2, 0x0

    move v3, v2

    .local v3, "upIndex":I
    move v5, v2

    .local v5, "id1":I
    move/from16 v6, v17

    .local v6, "x1":F
    move/from16 v15, v17

    .local v15, "y1":F
    move/from16 v23, v17

    .line 355
    .local v17, "scrollY":F
    .local v23, "scrollX":F
    iput-boolean v2, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mStillDown:Z

    .line 356
    invoke-static/range {p1 .. p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v2

    .line 357
    .local v2, "currentUpEvent":Landroid/view/MotionEvent;
    iget-boolean v4, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mIsDoubleTapping:Z

    if-eqz v4, :cond_14

    .line 359
    iget-object v4, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

    invoke-interface {v4, v1}, Landroid/view/GestureDetector$OnDoubleTapListener;->onDoubleTapEvent(Landroid/view/MotionEvent;)Z

    move-result v4

    or-int/2addr v14, v4

    move/from16 v25, v3

    move/from16 v19, v5

    move/from16 v26, v6

    goto/16 :goto_a

    .line 360
    :cond_14
    iget-boolean v4, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    if-eqz v4, :cond_15

    .line 361
    iget-object v4, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    move/from16 v25, v3

    const/4 v3, 0x3

    .end local v3    # "upIndex":I
    .local v25, "upIndex":I
    invoke-virtual {v4, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 362
    const/4 v3, 0x0

    iput-boolean v3, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    move/from16 v19, v5

    move/from16 v26, v6

    goto :goto_a

    .line 363
    .end local v25    # "upIndex":I
    .restart local v3    # "upIndex":I
    :cond_15
    move/from16 v25, v3

    .end local v3    # "upIndex":I
    .restart local v25    # "upIndex":I
    iget-boolean v3, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInTapRegion:Z

    if-eqz v3, :cond_17

    .line 364
    iget-object v3, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mListener:Landroid/view/GestureDetector$OnGestureListener;

    invoke-interface {v3, v1}, Landroid/view/GestureDetector$OnGestureListener;->onSingleTapUp(Landroid/view/MotionEvent;)Z

    move-result v14

    .line 365
    iget-boolean v3, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDeferConfirmSingleTap:Z

    if-eqz v3, :cond_16

    iget-object v3, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

    if-eqz v3, :cond_16

    .line 366
    invoke-interface {v3, v1}, Landroid/view/GestureDetector$OnDoubleTapListener;->onSingleTapConfirmed(Landroid/view/MotionEvent;)Z

    .line 383
    :cond_16
    move/from16 v19, v5

    move/from16 v26, v6

    goto :goto_a

    .line 370
    :cond_17
    iget-object v3, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 371
    .local v3, "velocityTracker":Landroid/view/VelocityTracker;
    move/from16 v19, v5

    const/4 v4, 0x0

    .end local v5    # "id1":I
    .restart local v19    # "id1":I
    invoke-static {v1, v4}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v5

    .line 372
    .local v5, "pointerId":I
    iget v4, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mMaximumFlingVelocity:I

    int-to-float v4, v4

    move/from16 v26, v6

    const/16 v6, 0x3e8

    .end local v6    # "x1":F
    .local v26, "x1":F
    invoke-virtual {v3, v6, v4}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 373
    invoke-static {v3, v5}, Landroid/support/v4/view/VelocityTrackerCompat;->getYVelocity(Landroid/view/VelocityTracker;I)F

    move-result v4

    .line 375
    .local v4, "velocityY":F
    invoke-static {v3, v5}, Landroid/support/v4/view/VelocityTrackerCompat;->getXVelocity(Landroid/view/VelocityTracker;I)F

    move-result v6

    .line 378
    .local v6, "velocityX":F
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v20

    move-object/from16 v27, v3

    .end local v3    # "velocityTracker":Landroid/view/VelocityTracker;
    .local v27, "velocityTracker":Landroid/view/VelocityTracker;
    iget v3, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mMinimumFlingVelocity:I

    int-to-float v3, v3

    cmpl-float v3, v20, v3

    if-gtz v3, :cond_18

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v3

    move/from16 v20, v5

    .end local v5    # "pointerId":I
    .local v20, "pointerId":I
    iget v5, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mMinimumFlingVelocity:I

    int-to-float v5, v5

    cmpl-float v3, v3, v5

    if-lez v3, :cond_19

    goto :goto_9

    .end local v20    # "pointerId":I
    .restart local v5    # "pointerId":I
    :cond_18
    move/from16 v20, v5

    .line 380
    .end local v5    # "pointerId":I
    .restart local v20    # "pointerId":I
    :goto_9
    iget-object v3, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mListener:Landroid/view/GestureDetector$OnGestureListener;

    iget-object v5, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    invoke-interface {v3, v5, v1, v6, v4}, Landroid/view/GestureDetector$OnGestureListener;->onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result v14

    .line 383
    .end local v4    # "velocityY":F
    .end local v6    # "velocityX":F
    .end local v20    # "pointerId":I
    .end local v27    # "velocityTracker":Landroid/view/VelocityTracker;
    :cond_19
    :goto_a
    iget-object v3, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mPreviousUpEvent:Landroid/view/MotionEvent;

    if-eqz v3, :cond_1a

    .line 384
    invoke-virtual {v3}, Landroid/view/MotionEvent;->recycle()V

    .line 387
    :cond_1a
    iput-object v2, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mPreviousUpEvent:Landroid/view/MotionEvent;

    .line 388
    iget-object v3, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v3, :cond_1b

    .line 391
    invoke-virtual {v3}, Landroid/view/VelocityTracker;->recycle()V

    .line 392
    const/4 v3, 0x0

    iput-object v3, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 394
    :cond_1b
    const/4 v3, 0x0

    iput-boolean v3, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mIsDoubleTapping:Z

    .line 395
    iput-boolean v3, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDeferConfirmSingleTap:Z

    .line 396
    iget-object v3, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 397
    iget-object v3, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 398
    goto/16 :goto_d

    .line 249
    .end local v15    # "y1":F
    .end local v17    # "scrollY":F
    .end local v18    # "action":I
    .end local v19    # "id1":I
    .end local v22    # "pointerUp":Z
    .end local v23    # "scrollX":F
    .end local v25    # "upIndex":I
    .end local v26    # "x1":F
    .local v2, "action":I
    .local v3, "pointerUp":Z
    :cond_1c
    move/from16 v18, v2

    move/from16 v22, v3

    const/4 v3, 0x0

    .end local v2    # "action":I
    .end local v3    # "pointerUp":Z
    .restart local v18    # "action":I
    .restart local v22    # "pointerUp":Z
    move v2, v3

    .local v2, "upIndex":I
    move v4, v3

    .local v4, "id1":I
    move/from16 v3, v17

    .local v3, "x1":F
    move/from16 v5, v17

    .line 284
    .local v5, "y1":F
    iget-object v6, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

    if-eqz v6, :cond_1f

    .line 285
    iget-object v6, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v15, 0x3

    invoke-virtual {v6, v15}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v6

    .line 286
    .local v6, "hadTapMessage":Z
    if-eqz v6, :cond_1d

    move/from16 v17, v2

    .end local v2    # "upIndex":I
    .local v17, "upIndex":I
    iget-object v2, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v15}, Landroid/os/Handler;->removeMessages(I)V

    goto :goto_b

    .end local v17    # "upIndex":I
    .restart local v2    # "upIndex":I
    :cond_1d
    move/from16 v17, v2

    .line 287
    .end local v2    # "upIndex":I
    .restart local v17    # "upIndex":I
    :goto_b
    iget-object v2, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    if-eqz v2, :cond_1e

    iget-object v15, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mPreviousUpEvent:Landroid/view/MotionEvent;

    if-eqz v15, :cond_1e

    if-eqz v6, :cond_1e

    invoke-direct {v0, v2, v15, v1}, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->isConsideredDoubleTap(Landroid/view/MotionEvent;Landroid/view/MotionEvent;Landroid/view/MotionEvent;)Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 290
    const/4 v2, 0x1

    iput-boolean v2, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mIsDoubleTapping:Z

    .line 292
    iget-object v2, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

    iget-object v15, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    invoke-interface {v2, v15}, Landroid/view/GestureDetector$OnDoubleTapListener;->onDoubleTap(Landroid/view/MotionEvent;)Z

    move-result v2

    or-int/2addr v2, v14

    .line 294
    .end local v14    # "handled":Z
    .local v2, "handled":Z
    iget-object v14, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

    invoke-interface {v14, v1}, Landroid/view/GestureDetector$OnDoubleTapListener;->onDoubleTapEvent(Landroid/view/MotionEvent;)Z

    move-result v14

    or-int/2addr v14, v2

    move/from16 v23, v3

    move/from16 v20, v4

    .end local v2    # "handled":Z
    .restart local v14    # "handled":Z
    goto :goto_c

    .line 297
    :cond_1e
    iget-object v2, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    sget v15, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->DOUBLE_TAP_TIMEOUT:I

    move/from16 v23, v3

    move/from16 v20, v4

    .end local v3    # "x1":F
    .end local v4    # "id1":I
    .local v20, "id1":I
    .local v23, "x1":F
    int-to-long v3, v15

    const/4 v15, 0x3

    invoke-virtual {v2, v15, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_c

    .line 284
    .end local v6    # "hadTapMessage":Z
    .end local v17    # "upIndex":I
    .end local v20    # "id1":I
    .end local v23    # "x1":F
    .local v2, "upIndex":I
    .restart local v3    # "x1":F
    .restart local v4    # "id1":I
    :cond_1f
    move/from16 v17, v2

    move/from16 v23, v3

    move/from16 v20, v4

    .line 301
    .end local v2    # "upIndex":I
    .end local v3    # "x1":F
    .end local v4    # "id1":I
    .restart local v17    # "upIndex":I
    .restart local v20    # "id1":I
    .restart local v23    # "x1":F
    :goto_c
    iput v12, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusX:F

    iput v12, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDownFocusX:F

    .line 302
    iput v13, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusY:F

    iput v13, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDownFocusY:F

    .line 303
    iget-object v2, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    if-eqz v2, :cond_20

    .line 304
    invoke-virtual {v2}, Landroid/view/MotionEvent;->recycle()V

    .line 306
    :cond_20
    invoke-static/range {p1 .. p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v2

    iput-object v2, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    .line 307
    const/4 v2, 0x1

    iput-boolean v2, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInTapRegion:Z

    .line 308
    iput-boolean v2, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInBiggerTapRegion:Z

    .line 309
    iput-boolean v2, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mStillDown:Z

    .line 310
    const/4 v2, 0x0

    iput-boolean v2, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    .line 311
    iput-boolean v2, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDeferConfirmSingleTap:Z

    .line 313
    iget-boolean v2, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mIsLongpressEnabled:Z

    if-eqz v2, :cond_21

    .line 314
    iget-object v2, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 315
    iget-object v2, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    iget-object v4, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    invoke-virtual {v4}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v15

    sget v4, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->TAP_TIMEOUT:I

    int-to-long v3, v4

    add-long/2addr v15, v3

    sget v3, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->LONGPRESS_TIMEOUT:I

    int-to-long v3, v3

    add-long/2addr v3, v15

    const/4 v6, 0x2

    invoke-virtual {v2, v6, v3, v4}, Landroid/os/Handler;->sendEmptyMessageAtTime(IJ)Z

    .line 318
    :cond_21
    iget-object v2, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    iget-object v3, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    invoke-virtual {v3}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v3

    sget v6, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->TAP_TIMEOUT:I

    move v15, v5

    .end local v5    # "y1":F
    .restart local v15    # "y1":F
    int-to-long v5, v6

    add-long/2addr v3, v5

    const/4 v5, 0x1

    invoke-virtual {v2, v5, v3, v4}, Landroid/os/Handler;->sendEmptyMessageAtTime(IJ)Z

    .line 319
    iget-object v2, v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mListener:Landroid/view/GestureDetector$OnGestureListener;

    invoke-interface {v2, v1}, Landroid/view/GestureDetector$OnGestureListener;->onDown(Landroid/view/MotionEvent;)Z

    move-result v2

    or-int/2addr v14, v2

    .line 320
    nop

    .line 405
    .end local v15    # "y1":F
    .end local v17    # "upIndex":I
    .end local v20    # "id1":I
    .end local v23    # "x1":F
    :goto_d
    return v14
.end method

.method public setIsLongpressEnabled(Z)V
    .locals 0
    .param p1, "isLongpressEnabled"    # Z

    .line 205
    iput-boolean p1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mIsLongpressEnabled:Z

    .line 206
    return-void
.end method

.method public setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V
    .locals 0
    .param p1, "onDoubleTapListener"    # Landroid/view/GestureDetector$OnDoubleTapListener;

    .line 192
    iput-object p1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

    .line 193
    return-void
.end method
