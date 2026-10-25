.class final Landroid/support/v4/widget/SwipeProgressBar;
.super Ljava/lang/Object;
.source "SwipeProgressBar.java"


# static fields
.field private static final ANIMATION_DURATION_MS:I = 0x7d0

.field private static final COLOR1:I = -0x4d000000

.field private static final COLOR2:I = -0x80000000

.field private static final COLOR3:I = 0x4d000000

.field private static final COLOR4:I = 0x1a000000

.field private static final FINISH_ANIMATION_DURATION_MS:I = 0x3e8

.field private static final INTERPOLATOR:Landroid/view/animation/Interpolator;


# instance fields
.field private mBounds:Landroid/graphics/Rect;

.field private final mClipRect:Landroid/graphics/RectF;

.field private mColor1:I

.field private mColor2:I

.field private mColor3:I

.field private mColor4:I

.field private mFinishTime:J

.field private final mPaint:Landroid/graphics/Paint;

.field private mParent:Landroid/view/View;

.field private mRunning:Z

.field private mStartTime:J

.field private mTriggerPercentage:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 51
    invoke-static {}, Landroid/support/v4/widget/BakedBezierInterpolator;->getInstance()Landroid/support/v4/widget/BakedBezierInterpolator;

    move-result-object v0

    sput-object v0, Landroid/support/v4/widget/SwipeProgressBar;->INTERPOLATOR:Landroid/view/animation/Interpolator;

    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .param p1, "parent"    # Landroid/view/View;

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mPaint:Landroid/graphics/Paint;

    .line 54
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mClipRect:Landroid/graphics/RectF;

    .line 67
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mBounds:Landroid/graphics/Rect;

    .line 70
    iput-object p1, p0, Landroid/support/v4/widget/SwipeProgressBar;->mParent:Landroid/view/View;

    .line 71
    const/high16 v0, -0x4d000000

    iput v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mColor1:I

    .line 72
    const/high16 v0, -0x80000000

    iput v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mColor2:I

    .line 73
    const/high16 v0, 0x4d000000    # 1.34217728E8f

    iput v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mColor3:I

    .line 74
    const/high16 v0, 0x1a000000

    iput v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mColor4:I

    .line 75
    return-void
.end method

.method private drawCircle(Landroid/graphics/Canvas;FFIF)V
    .locals 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "cx"    # F
    .param p3, "cy"    # F
    .param p4, "color"    # I
    .param p5, "pct"    # F

    .line 255
    iget-object v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p4}, Landroid/graphics/Paint;->setColor(I)V

    .line 256
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 257
    invoke-virtual {p1, p2, p3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 258
    sget-object v0, Landroid/support/v4/widget/SwipeProgressBar;->INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-interface {v0, p5}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v0

    .line 259
    .local v0, "radiusScale":F
    invoke-virtual {p1, v0, v0}, Landroid/graphics/Canvas;->scale(FF)V

    .line 260
    iget-object v1, p0, Landroid/support/v4/widget/SwipeProgressBar;->mPaint:Landroid/graphics/Paint;

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v2, p2, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 261
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 262
    return-void
.end method

.method private drawTrigger(Landroid/graphics/Canvas;II)V
    .locals 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "cx"    # I
    .param p3, "cy"    # I

    .line 241
    iget-object v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Landroid/support/v4/widget/SwipeProgressBar;->mColor1:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 242
    int-to-float v0, p2

    int-to-float v1, p3

    int-to-float v2, p2

    iget v3, p0, Landroid/support/v4/widget/SwipeProgressBar;->mTriggerPercentage:F

    mul-float v2, v2, v3

    iget-object v3, p0, Landroid/support/v4/widget/SwipeProgressBar;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 243
    return-void
.end method


# virtual methods
.method draw(Landroid/graphics/Canvas;)V
    .locals 30
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 137
    move-object/from16 v6, p0

    move-object/from16 v7, p1

    iget-object v0, v6, Landroid/support/v4/widget/SwipeProgressBar;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v8

    .line 138
    .local v8, "width":I
    iget-object v0, v6, Landroid/support/v4/widget/SwipeProgressBar;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v9

    .line 139
    .local v9, "height":I
    div-int/lit8 v10, v8, 0x2

    .line 140
    .local v10, "cx":I
    div-int/lit8 v11, v9, 0x2

    .line 141
    .local v11, "cy":I
    const/4 v0, 0x0

    .line 142
    .local v0, "drawTriggerWhileFinishing":Z
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    move-result v12

    .line 143
    .local v12, "restoreCount":I
    iget-object v1, v6, Landroid/support/v4/widget/SwipeProgressBar;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v7, v1}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    .line 145
    iget-boolean v1, v6, Landroid/support/v4/widget/SwipeProgressBar;->mRunning:Z

    const-wide/16 v2, 0x0

    const/4 v13, 0x0

    if-nez v1, :cond_1

    iget-wide v4, v6, Landroid/support/v4/widget/SwipeProgressBar;->mFinishTime:J

    cmp-long v1, v4, v2

    if-lez v1, :cond_0

    goto :goto_0

    .line 233
    :cond_0
    iget v1, v6, Landroid/support/v4/widget/SwipeProgressBar;->mTriggerPercentage:F

    cmpl-float v2, v1, v13

    if-lez v2, :cond_e

    float-to-double v1, v1

    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    cmpg-double v5, v1, v3

    if-gtz v5, :cond_e

    .line 234
    invoke-direct {v6, v7, v10, v11}, Landroid/support/v4/widget/SwipeProgressBar;->drawTrigger(Landroid/graphics/Canvas;II)V

    goto/16 :goto_3

    .line 146
    :cond_1
    :goto_0
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v14

    .line 147
    .local v14, "now":J
    iget-wide v4, v6, Landroid/support/v4/widget/SwipeProgressBar;->mStartTime:J

    sub-long v16, v14, v4

    const-wide/16 v18, 0x7d0

    rem-long v2, v16, v18

    .line 148
    .local v2, "elapsed":J
    sub-long v4, v14, v4

    div-long v16, v4, v18

    .line 149
    .local v16, "iterations":J
    long-to-float v1, v2

    const/high16 v4, 0x41a00000    # 20.0f

    div-float v18, v1, v4

    .line 153
    .local v18, "rawProgress":F
    iget-boolean v1, v6, Landroid/support/v4/widget/SwipeProgressBar;->mRunning:Z

    const/high16 v19, 0x42c80000    # 100.0f

    if-nez v1, :cond_3

    .line 156
    iget-wide v4, v6, Landroid/support/v4/widget/SwipeProgressBar;->mFinishTime:J

    sub-long v22, v14, v4

    const-wide/16 v24, 0x3e8

    cmp-long v1, v22, v24

    if-ltz v1, :cond_2

    .line 157
    const-wide/16 v4, 0x0

    iput-wide v4, v6, Landroid/support/v4/widget/SwipeProgressBar;->mFinishTime:J

    .line 158
    return-void

    .line 164
    :cond_2
    sub-long v4, v14, v4

    rem-long v4, v4, v24

    .line 165
    .local v4, "finishElapsed":J
    long-to-float v1, v4

    const/high16 v22, 0x41200000    # 10.0f

    div-float v1, v1, v22

    .line 166
    .local v1, "finishProgress":F
    div-float v13, v1, v19

    .line 168
    .local v13, "pct":F
    move/from16 v23, v0

    .end local v0    # "drawTriggerWhileFinishing":Z
    .local v23, "drawTriggerWhileFinishing":Z
    div-int/lit8 v0, v8, 0x2

    int-to-float v0, v0

    move/from16 v24, v1

    .end local v1    # "finishProgress":F
    .local v24, "finishProgress":F
    sget-object v1, Landroid/support/v4/widget/SwipeProgressBar;->INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-interface {v1, v13}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v1

    mul-float v0, v0, v1

    .line 169
    .local v0, "clearRadius":F
    iget-object v1, v6, Landroid/support/v4/widget/SwipeProgressBar;->mClipRect:Landroid/graphics/RectF;

    move-wide/from16 v25, v2

    .end local v2    # "elapsed":J
    .local v25, "elapsed":J
    int-to-float v2, v10

    sub-float/2addr v2, v0

    int-to-float v3, v10

    add-float/2addr v3, v0

    move/from16 v27, v0

    .end local v0    # "clearRadius":F
    .local v27, "clearRadius":F
    int-to-float v0, v9

    move-wide/from16 v28, v4

    const/4 v4, 0x0

    .end local v4    # "finishElapsed":J
    .local v28, "finishElapsed":J
    invoke-virtual {v1, v2, v4, v3, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 170
    iget-object v0, v6, Landroid/support/v4/widget/SwipeProgressBar;->mClipRect:Landroid/graphics/RectF;

    const/4 v1, 0x0

    invoke-virtual {v7, v0, v1, v1}, Landroid/graphics/Canvas;->saveLayerAlpha(Landroid/graphics/RectF;II)I

    .line 175
    const/4 v0, 0x1

    move/from16 v23, v0

    .end local v23    # "drawTriggerWhileFinishing":Z
    .local v0, "drawTriggerWhileFinishing":Z
    goto :goto_1

    .line 153
    .end local v13    # "pct":F
    .end local v24    # "finishProgress":F
    .end local v25    # "elapsed":J
    .end local v27    # "clearRadius":F
    .end local v28    # "finishElapsed":J
    .restart local v2    # "elapsed":J
    :cond_3
    move/from16 v23, v0

    move-wide/from16 v25, v2

    .line 179
    .end local v0    # "drawTriggerWhileFinishing":Z
    .end local v2    # "elapsed":J
    .restart local v23    # "drawTriggerWhileFinishing":Z
    .restart local v25    # "elapsed":J
    :goto_1
    const/high16 v13, 0x42960000    # 75.0f

    const/high16 v24, 0x42480000    # 50.0f

    const/high16 v27, 0x41c80000    # 25.0f

    const-wide/16 v0, 0x0

    cmp-long v2, v16, v0

    if-nez v2, :cond_4

    .line 180
    iget v0, v6, Landroid/support/v4/widget/SwipeProgressBar;->mColor1:I

    invoke-virtual {v7, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    goto :goto_2

    .line 182
    :cond_4
    const/4 v0, 0x0

    cmpl-float v1, v18, v0

    if-ltz v1, :cond_5

    cmpg-float v0, v18, v27

    if-gez v0, :cond_5

    .line 183
    iget v0, v6, Landroid/support/v4/widget/SwipeProgressBar;->mColor4:I

    invoke-virtual {v7, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    goto :goto_2

    .line 184
    :cond_5
    cmpl-float v0, v18, v27

    if-ltz v0, :cond_6

    cmpg-float v0, v18, v24

    if-gez v0, :cond_6

    .line 185
    iget v0, v6, Landroid/support/v4/widget/SwipeProgressBar;->mColor1:I

    invoke-virtual {v7, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    goto :goto_2

    .line 186
    :cond_6
    cmpl-float v0, v18, v24

    if-ltz v0, :cond_7

    cmpg-float v0, v18, v13

    if-gez v0, :cond_7

    .line 187
    iget v0, v6, Landroid/support/v4/widget/SwipeProgressBar;->mColor2:I

    invoke-virtual {v7, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    goto :goto_2

    .line 189
    :cond_7
    iget v0, v6, Landroid/support/v4/widget/SwipeProgressBar;->mColor3:I

    invoke-virtual {v7, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 199
    :goto_2
    const/high16 v20, 0x40000000    # 2.0f

    const/4 v0, 0x0

    cmpl-float v1, v18, v0

    if-ltz v1, :cond_8

    cmpg-float v0, v18, v27

    if-gtz v0, :cond_8

    .line 200
    add-float v0, v18, v27

    mul-float v0, v0, v20

    div-float v21, v0, v19

    .line 201
    .local v21, "pct":F
    int-to-float v2, v10

    int-to-float v3, v11

    iget v4, v6, Landroid/support/v4/widget/SwipeProgressBar;->mColor1:I

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v5, v21

    invoke-direct/range {v0 .. v5}, Landroid/support/v4/widget/SwipeProgressBar;->drawCircle(Landroid/graphics/Canvas;FFIF)V

    .line 203
    .end local v21    # "pct":F
    :cond_8
    const/4 v0, 0x0

    cmpl-float v1, v18, v0

    if-ltz v1, :cond_9

    cmpg-float v0, v18, v24

    if-gtz v0, :cond_9

    .line 204
    mul-float v0, v18, v20

    div-float v21, v0, v19

    .line 205
    .restart local v21    # "pct":F
    int-to-float v2, v10

    int-to-float v3, v11

    iget v4, v6, Landroid/support/v4/widget/SwipeProgressBar;->mColor2:I

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v5, v21

    invoke-direct/range {v0 .. v5}, Landroid/support/v4/widget/SwipeProgressBar;->drawCircle(Landroid/graphics/Canvas;FFIF)V

    .line 207
    .end local v21    # "pct":F
    :cond_9
    cmpl-float v0, v18, v27

    if-ltz v0, :cond_a

    cmpg-float v0, v18, v13

    if-gtz v0, :cond_a

    .line 208
    sub-float v0, v18, v27

    mul-float v0, v0, v20

    div-float v21, v0, v19

    .line 209
    .restart local v21    # "pct":F
    int-to-float v2, v10

    int-to-float v3, v11

    iget v4, v6, Landroid/support/v4/widget/SwipeProgressBar;->mColor3:I

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v5, v21

    invoke-direct/range {v0 .. v5}, Landroid/support/v4/widget/SwipeProgressBar;->drawCircle(Landroid/graphics/Canvas;FFIF)V

    .line 211
    .end local v21    # "pct":F
    :cond_a
    cmpl-float v0, v18, v24

    if-ltz v0, :cond_b

    cmpg-float v0, v18, v19

    if-gtz v0, :cond_b

    .line 212
    sub-float v0, v18, v24

    mul-float v0, v0, v20

    div-float v21, v0, v19

    .line 213
    .restart local v21    # "pct":F
    int-to-float v2, v10

    int-to-float v3, v11

    iget v4, v6, Landroid/support/v4/widget/SwipeProgressBar;->mColor4:I

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v5, v21

    invoke-direct/range {v0 .. v5}, Landroid/support/v4/widget/SwipeProgressBar;->drawCircle(Landroid/graphics/Canvas;FFIF)V

    .line 215
    .end local v21    # "pct":F
    :cond_b
    cmpl-float v0, v18, v13

    if-ltz v0, :cond_c

    cmpg-float v0, v18, v19

    if-gtz v0, :cond_c

    .line 216
    sub-float v0, v18, v13

    mul-float v0, v0, v20

    div-float v13, v0, v19

    .line 217
    .restart local v13    # "pct":F
    int-to-float v2, v10

    int-to-float v3, v11

    iget v4, v6, Landroid/support/v4/widget/SwipeProgressBar;->mColor1:I

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v5, v13

    invoke-direct/range {v0 .. v5}, Landroid/support/v4/widget/SwipeProgressBar;->drawCircle(Landroid/graphics/Canvas;FFIF)V

    .line 219
    .end local v13    # "pct":F
    :cond_c
    iget v0, v6, Landroid/support/v4/widget/SwipeProgressBar;->mTriggerPercentage:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_d

    if-eqz v23, :cond_d

    .line 224
    invoke-virtual {v7, v12}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 225
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    .line 226
    .end local v12    # "restoreCount":I
    .local v0, "restoreCount":I
    iget-object v1, v6, Landroid/support/v4/widget/SwipeProgressBar;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v7, v1}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    .line 227
    invoke-direct {v6, v7, v10, v11}, Landroid/support/v4/widget/SwipeProgressBar;->drawTrigger(Landroid/graphics/Canvas;II)V

    move v12, v0

    .line 230
    .end local v0    # "restoreCount":I
    .restart local v12    # "restoreCount":I
    :cond_d
    iget-object v0, v6, Landroid/support/v4/widget/SwipeProgressBar;->mParent:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 231
    .end local v14    # "now":J
    .end local v16    # "iterations":J
    .end local v18    # "rawProgress":F
    .end local v25    # "elapsed":J
    move/from16 v0, v23

    .line 237
    .end local v23    # "drawTriggerWhileFinishing":Z
    .local v0, "drawTriggerWhileFinishing":Z
    :cond_e
    :goto_3
    invoke-virtual {v7, v12}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 238
    return-void
.end method

.method isRunning()Z
    .locals 5

    .line 133
    iget-boolean v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mRunning:Z

    if-nez v0, :cond_1

    iget-wide v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mFinishTime:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

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

.method setBounds(IIII)V
    .locals 1
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .line 268
    iget-object v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mBounds:Landroid/graphics/Rect;

    iput p1, v0, Landroid/graphics/Rect;->left:I

    .line 269
    iput p2, v0, Landroid/graphics/Rect;->top:I

    .line 270
    iput p3, v0, Landroid/graphics/Rect;->right:I

    .line 271
    iput p4, v0, Landroid/graphics/Rect;->bottom:I

    .line 272
    return-void
.end method

.method setColorScheme(IIII)V
    .locals 0
    .param p1, "color1"    # I
    .param p2, "color2"    # I
    .param p3, "color3"    # I
    .param p4, "color4"    # I

    .line 88
    iput p1, p0, Landroid/support/v4/widget/SwipeProgressBar;->mColor1:I

    .line 89
    iput p2, p0, Landroid/support/v4/widget/SwipeProgressBar;->mColor2:I

    .line 90
    iput p3, p0, Landroid/support/v4/widget/SwipeProgressBar;->mColor3:I

    .line 91
    iput p4, p0, Landroid/support/v4/widget/SwipeProgressBar;->mColor4:I

    .line 92
    return-void
.end method

.method setTriggerPercentage(F)V
    .locals 2
    .param p1, "triggerPercentage"    # F

    .line 100
    iput p1, p0, Landroid/support/v4/widget/SwipeProgressBar;->mTriggerPercentage:F

    .line 101
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mStartTime:J

    .line 102
    iget-object v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mParent:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 103
    return-void
.end method

.method start()V
    .locals 2

    .line 109
    iget-boolean v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mRunning:Z

    if-nez v0, :cond_0

    .line 110
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mTriggerPercentage:F

    .line 111
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mStartTime:J

    .line 112
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mRunning:Z

    .line 113
    iget-object v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mParent:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->postInvalidate()V

    .line 115
    :cond_0
    return-void
.end method

.method stop()V
    .locals 2

    .line 121
    iget-boolean v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mRunning:Z

    if-eqz v0, :cond_0

    .line 122
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mTriggerPercentage:F

    .line 123
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mFinishTime:J

    .line 124
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mRunning:Z

    .line 125
    iget-object v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mParent:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->postInvalidate()V

    .line 127
    :cond_0
    return-void
.end method
