.class public Lorg/achartengine/GraphicalView;
.super Landroid/view/View;
.source "GraphicalView.java"


# static fields
.field private static final ZOOM_BUTTONS_COLOR:I


# instance fields
.field private fitZoomImage:Landroid/graphics/Bitmap;

.field private mChart:Lorg/achartengine/chart/AbstractChart;

.field private mDrawn:Z

.field private mFitZoom:Lorg/achartengine/tools/FitZoom;

.field private mHandler:Landroid/os/Handler;

.field private mPaint:Landroid/graphics/Paint;

.field private mRect:Landroid/graphics/Rect;

.field private mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

.field private mTouchHandler:Lorg/achartengine/ITouchHandler;

.field private mZoomIn:Lorg/achartengine/tools/Zoom;

.field private mZoomOut:Lorg/achartengine/tools/Zoom;

.field private mZoomR:Landroid/graphics/RectF;

.field private oldX:F

.field private oldY:F

.field private zoomInImage:Landroid/graphics/Bitmap;

.field private zoomOutImage:Landroid/graphics/Bitmap;

.field private zoomSize:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 66
    const/16 v0, 0x96

    const/16 v1, 0xaf

    invoke-static {v1, v0, v0, v0}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    sput v0, Lorg/achartengine/GraphicalView;->ZOOM_BUTTONS_COLOR:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lorg/achartengine/chart/AbstractChart;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "chart"    # Lorg/achartengine/chart/AbstractChart;

    .line 91
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 52
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lorg/achartengine/GraphicalView;->mRect:Landroid/graphics/Rect;

    .line 56
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomR:Landroid/graphics/RectF;

    .line 64
    const/16 v0, 0x32

    iput v0, p0, Lorg/achartengine/GraphicalView;->zoomSize:I

    .line 74
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lorg/achartengine/GraphicalView;->mPaint:Landroid/graphics/Paint;

    .line 92
    iput-object p2, p0, Lorg/achartengine/GraphicalView;->mChart:Lorg/achartengine/chart/AbstractChart;

    .line 93
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lorg/achartengine/GraphicalView;->mHandler:Landroid/os/Handler;

    .line 94
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mChart:Lorg/achartengine/chart/AbstractChart;

    instance-of v1, v0, Lorg/achartengine/chart/XYChart;

    if-eqz v1, :cond_0

    .line 95
    check-cast v0, Lorg/achartengine/chart/XYChart;

    invoke-virtual {v0}, Lorg/achartengine/chart/XYChart;->getRenderer()Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move-result-object v0

    iput-object v0, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    goto :goto_0

    .line 97
    :cond_0
    check-cast v0, Lorg/achartengine/chart/RoundChart;

    invoke-virtual {v0}, Lorg/achartengine/chart/RoundChart;->getRenderer()Lorg/achartengine/renderer/DefaultRenderer;

    move-result-object v0

    iput-object v0, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    .line 99
    :goto_0
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->isZoomButtonsVisible()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 100
    const-class v0, Lorg/achartengine/GraphicalView;

    const-string v1, "image/zoom_in.png"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lorg/achartengine/GraphicalView;->zoomInImage:Landroid/graphics/Bitmap;

    .line 102
    const-class v0, Lorg/achartengine/GraphicalView;

    const-string v1, "image/zoom_out.png"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lorg/achartengine/GraphicalView;->zoomOutImage:Landroid/graphics/Bitmap;

    .line 104
    const-class v0, Lorg/achartengine/GraphicalView;

    const-string v1, "image/zoom-1.png"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lorg/achartengine/GraphicalView;->fitZoomImage:Landroid/graphics/Bitmap;

    .line 108
    :cond_1
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    instance-of v1, v0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    if-eqz v1, :cond_2

    check-cast v0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getMarginsColor()I

    move-result v0

    if-nez v0, :cond_2

    .line 110
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    check-cast v0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    iget-object v1, p0, Lorg/achartengine/GraphicalView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Landroid/graphics/Paint;->getColor()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setMarginsColor(I)V

    .line 112
    :cond_2
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->isZoomEnabled()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->isZoomButtonsVisible()Z

    move-result v0

    if-nez v0, :cond_4

    :cond_3
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->isExternalZoomEnabled()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 114
    :cond_4
    new-instance v0, Lorg/achartengine/tools/Zoom;

    iget-object v1, p0, Lorg/achartengine/GraphicalView;->mChart:Lorg/achartengine/chart/AbstractChart;

    const/4 v2, 0x1

    iget-object v3, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v3}, Lorg/achartengine/renderer/DefaultRenderer;->getZoomRate()F

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lorg/achartengine/tools/Zoom;-><init>(Lorg/achartengine/chart/AbstractChart;ZF)V

    iput-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomIn:Lorg/achartengine/tools/Zoom;

    .line 115
    new-instance v0, Lorg/achartengine/tools/Zoom;

    iget-object v1, p0, Lorg/achartengine/GraphicalView;->mChart:Lorg/achartengine/chart/AbstractChart;

    const/4 v2, 0x0

    iget-object v3, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v3}, Lorg/achartengine/renderer/DefaultRenderer;->getZoomRate()F

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lorg/achartengine/tools/Zoom;-><init>(Lorg/achartengine/chart/AbstractChart;ZF)V

    iput-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomOut:Lorg/achartengine/tools/Zoom;

    .line 116
    new-instance v0, Lorg/achartengine/tools/FitZoom;

    iget-object v1, p0, Lorg/achartengine/GraphicalView;->mChart:Lorg/achartengine/chart/AbstractChart;

    invoke-direct {v0, v1}, Lorg/achartengine/tools/FitZoom;-><init>(Lorg/achartengine/chart/AbstractChart;)V

    iput-object v0, p0, Lorg/achartengine/GraphicalView;->mFitZoom:Lorg/achartengine/tools/FitZoom;

    .line 118
    :cond_5
    const/4 v0, 0x7

    .line 120
    .local v0, "version":I
    :try_start_0
    sget-object v1, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v1

    .line 123
    goto :goto_1

    .line 121
    :catch_0
    move-exception v1

    .line 124
    :goto_1
    const/4 v1, 0x7

    if-ge v0, v1, :cond_6

    .line 125
    new-instance v1, Lorg/achartengine/TouchHandlerOld;

    iget-object v2, p0, Lorg/achartengine/GraphicalView;->mChart:Lorg/achartengine/chart/AbstractChart;

    invoke-direct {v1, p0, v2}, Lorg/achartengine/TouchHandlerOld;-><init>(Lorg/achartengine/GraphicalView;Lorg/achartengine/chart/AbstractChart;)V

    iput-object v1, p0, Lorg/achartengine/GraphicalView;->mTouchHandler:Lorg/achartengine/ITouchHandler;

    goto :goto_2

    .line 127
    :cond_6
    new-instance v1, Lorg/achartengine/TouchHandler;

    iget-object v2, p0, Lorg/achartengine/GraphicalView;->mChart:Lorg/achartengine/chart/AbstractChart;

    invoke-direct {v1, p0, v2}, Lorg/achartengine/TouchHandler;-><init>(Lorg/achartengine/GraphicalView;Lorg/achartengine/chart/AbstractChart;)V

    iput-object v1, p0, Lorg/achartengine/GraphicalView;->mTouchHandler:Lorg/achartengine/ITouchHandler;

    .line 129
    :goto_2
    return-void
.end method


# virtual methods
.method public addPanListener(Lorg/achartengine/tools/PanListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/achartengine/tools/PanListener;

    .line 264
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mTouchHandler:Lorg/achartengine/ITouchHandler;

    invoke-interface {v0, p1}, Lorg/achartengine/ITouchHandler;->addPanListener(Lorg/achartengine/tools/PanListener;)V

    .line 265
    return-void
.end method

.method public addZoomListener(Lorg/achartengine/tools/ZoomListener;ZZ)V
    .locals 1
    .param p1, "listener"    # Lorg/achartengine/tools/ZoomListener;
    .param p2, "onButtons"    # Z
    .param p3, "onPinch"    # Z

    .line 234
    if-eqz p2, :cond_1

    .line 235
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomIn:Lorg/achartengine/tools/Zoom;

    if-eqz v0, :cond_0

    .line 236
    invoke-virtual {v0, p1}, Lorg/achartengine/tools/Zoom;->addZoomListener(Lorg/achartengine/tools/ZoomListener;)V

    .line 237
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomOut:Lorg/achartengine/tools/Zoom;

    invoke-virtual {v0, p1}, Lorg/achartengine/tools/Zoom;->addZoomListener(Lorg/achartengine/tools/ZoomListener;)V

    .line 239
    :cond_0
    if-eqz p3, :cond_1

    .line 240
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mTouchHandler:Lorg/achartengine/ITouchHandler;

    invoke-interface {v0, p1}, Lorg/achartengine/ITouchHandler;->addZoomListener(Lorg/achartengine/tools/ZoomListener;)V

    .line 243
    :cond_1
    return-void
.end method

.method public getCurrentSeriesAndPoint()Lorg/achartengine/model/SeriesSelection;
    .locals 4

    .line 137
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mChart:Lorg/achartengine/chart/AbstractChart;

    new-instance v1, Lorg/achartengine/model/Point;

    iget v2, p0, Lorg/achartengine/GraphicalView;->oldX:F

    iget v3, p0, Lorg/achartengine/GraphicalView;->oldY:F

    invoke-direct {v1, v2, v3}, Lorg/achartengine/model/Point;-><init>(FF)V

    invoke-virtual {v0, v1}, Lorg/achartengine/chart/AbstractChart;->getSeriesAndPointForScreenCoordinate(Lorg/achartengine/model/Point;)Lorg/achartengine/model/SeriesSelection;

    move-result-object v0

    return-object v0
.end method

.method protected getZoomRectangle()Landroid/graphics/RectF;
    .locals 1

    .line 277
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomR:Landroid/graphics/RectF;

    return-object v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 11
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 156
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 157
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mRect:Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->getClipBounds(Landroid/graphics/Rect;)Z

    .line 158
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 159
    .local v0, "top":I
    iget-object v1, p0, Lorg/achartengine/GraphicalView;->mRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    .line 160
    .local v1, "left":I
    iget-object v2, p0, Lorg/achartengine/GraphicalView;->mRect:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v2

    .line 161
    .local v2, "width":I
    iget-object v3, p0, Lorg/achartengine/GraphicalView;->mRect:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    .line 162
    .local v3, "height":I
    iget-object v4, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/DefaultRenderer;->isInScroll()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 163
    const/4 v0, 0x0

    .line 164
    const/4 v1, 0x0

    .line 165
    invoke-virtual {p0}, Lorg/achartengine/GraphicalView;->getMeasuredWidth()I

    move-result v2

    .line 166
    invoke-virtual {p0}, Lorg/achartengine/GraphicalView;->getMeasuredHeight()I

    move-result v3

    .line 168
    :cond_0
    iget-object v4, p0, Lorg/achartengine/GraphicalView;->mChart:Lorg/achartengine/chart/AbstractChart;

    iget-object v10, p0, Lorg/achartengine/GraphicalView;->mPaint:Landroid/graphics/Paint;

    move-object v5, p1

    move v6, v1

    move v7, v0

    move v8, v2

    move v9, v3

    invoke-virtual/range {v4 .. v10}, Lorg/achartengine/chart/AbstractChart;->draw(Landroid/graphics/Canvas;IIIILandroid/graphics/Paint;)V

    .line 169
    iget-object v4, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    if-eqz v4, :cond_1

    invoke-virtual {v4}, Lorg/achartengine/renderer/DefaultRenderer;->isZoomEnabled()Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/DefaultRenderer;->isZoomButtonsVisible()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 170
    iget-object v4, p0, Lorg/achartengine/GraphicalView;->mPaint:Landroid/graphics/Paint;

    sget v5, Lorg/achartengine/GraphicalView;->ZOOM_BUTTONS_COLOR:I

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 171
    iget v4, p0, Lorg/achartengine/GraphicalView;->zoomSize:I

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v5

    div-int/lit8 v5, v5, 0x7

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    iput v4, p0, Lorg/achartengine/GraphicalView;->zoomSize:I

    .line 172
    iget-object v4, p0, Lorg/achartengine/GraphicalView;->mZoomR:Landroid/graphics/RectF;

    add-int v5, v1, v2

    iget v6, p0, Lorg/achartengine/GraphicalView;->zoomSize:I

    mul-int/lit8 v7, v6, 0x3

    sub-int/2addr v5, v7

    int-to-float v5, v5

    add-int v7, v0, v3

    int-to-float v7, v7

    int-to-float v6, v6

    const v8, 0x3f466666    # 0.775f

    mul-float v6, v6, v8

    sub-float/2addr v7, v6

    add-int v6, v1, v2

    int-to-float v6, v6

    add-int v8, v0, v3

    int-to-float v8, v8

    invoke-virtual {v4, v5, v7, v6, v8}, Landroid/graphics/RectF;->set(FFFF)V

    .line 174
    iget-object v4, p0, Lorg/achartengine/GraphicalView;->mZoomR:Landroid/graphics/RectF;

    iget v5, p0, Lorg/achartengine/GraphicalView;->zoomSize:I

    div-int/lit8 v6, v5, 0x3

    int-to-float v6, v6

    div-int/lit8 v5, v5, 0x3

    int-to-float v5, v5

    iget-object v7, p0, Lorg/achartengine/GraphicalView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v4, v6, v5, v7}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 175
    add-int v4, v0, v3

    int-to-float v4, v4

    iget v5, p0, Lorg/achartengine/GraphicalView;->zoomSize:I

    int-to-float v6, v5

    const/high16 v7, 0x3f200000    # 0.625f

    mul-float v6, v6, v7

    sub-float/2addr v4, v6

    .line 176
    .local v4, "buttonY":F
    iget-object v6, p0, Lorg/achartengine/GraphicalView;->zoomInImage:Landroid/graphics/Bitmap;

    add-int v7, v1, v2

    int-to-float v7, v7

    int-to-float v5, v5

    const/high16 v8, 0x40300000    # 2.75f

    mul-float v5, v5, v8

    sub-float/2addr v7, v5

    const/4 v5, 0x0

    invoke-virtual {p1, v6, v7, v4, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 177
    iget-object v6, p0, Lorg/achartengine/GraphicalView;->zoomOutImage:Landroid/graphics/Bitmap;

    add-int v7, v1, v2

    int-to-float v7, v7

    iget v8, p0, Lorg/achartengine/GraphicalView;->zoomSize:I

    int-to-float v8, v8

    const/high16 v9, 0x3fe00000    # 1.75f

    mul-float v8, v8, v9

    sub-float/2addr v7, v8

    invoke-virtual {p1, v6, v7, v4, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 178
    iget-object v6, p0, Lorg/achartengine/GraphicalView;->fitZoomImage:Landroid/graphics/Bitmap;

    add-int v7, v1, v2

    int-to-float v7, v7

    iget v8, p0, Lorg/achartengine/GraphicalView;->zoomSize:I

    int-to-float v8, v8

    const/high16 v9, 0x3f400000    # 0.75f

    mul-float v8, v8, v9

    sub-float/2addr v7, v8

    invoke-virtual {p1, v6, v7, v4, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 180
    .end local v4    # "buttonY":F
    :cond_1
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/achartengine/GraphicalView;->mDrawn:Z

    .line 181
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 282
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    .line 285
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lorg/achartengine/GraphicalView;->oldX:F

    .line 286
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lorg/achartengine/GraphicalView;->oldY:F

    .line 288
    :cond_0
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    if-eqz v0, :cond_2

    iget-boolean v1, p0, Lorg/achartengine/GraphicalView;->mDrawn:Z

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->isPanEnabled()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->isZoomEnabled()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 289
    :cond_1
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mTouchHandler:Lorg/achartengine/ITouchHandler;

    invoke-interface {v0, p1}, Lorg/achartengine/ITouchHandler;->handleTouch(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 290
    const/4 v0, 0x1

    return v0

    .line 293
    :cond_2
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public removePanListener(Lorg/achartengine/tools/PanListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/achartengine/tools/PanListener;

    .line 273
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mTouchHandler:Lorg/achartengine/ITouchHandler;

    invoke-interface {v0, p1}, Lorg/achartengine/ITouchHandler;->removePanListener(Lorg/achartengine/tools/PanListener;)V

    .line 274
    return-void
.end method

.method public declared-synchronized removeZoomListener(Lorg/achartengine/tools/ZoomListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/achartengine/tools/ZoomListener;

    monitor-enter p0

    .line 251
    :try_start_0
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomIn:Lorg/achartengine/tools/Zoom;

    if-eqz v0, :cond_0

    .line 252
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomIn:Lorg/achartengine/tools/Zoom;

    invoke-virtual {v0, p1}, Lorg/achartengine/tools/Zoom;->removeZoomListener(Lorg/achartengine/tools/ZoomListener;)V

    .line 253
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomOut:Lorg/achartengine/tools/Zoom;

    invoke-virtual {v0, p1}, Lorg/achartengine/tools/Zoom;->removeZoomListener(Lorg/achartengine/tools/ZoomListener;)V

    .line 255
    .end local p0    # "this":Lorg/achartengine/GraphicalView;
    :cond_0
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mTouchHandler:Lorg/achartengine/ITouchHandler;

    invoke-interface {v0, p1}, Lorg/achartengine/ITouchHandler;->removeZoomListener(Lorg/achartengine/tools/ZoomListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 256
    monitor-exit p0

    return-void

    .line 250
    .end local p1    # "listener":Lorg/achartengine/tools/ZoomListener;
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public repaint()V
    .locals 2

    .line 300
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mHandler:Landroid/os/Handler;

    new-instance v1, Lorg/achartengine/GraphicalView$1;

    invoke-direct {v1, p0}, Lorg/achartengine/GraphicalView$1;-><init>(Lorg/achartengine/GraphicalView;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 305
    return-void
.end method

.method public repaint(IIII)V
    .locals 8
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .line 316
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mHandler:Landroid/os/Handler;

    new-instance v7, Lorg/achartengine/GraphicalView$2;

    move-object v1, v7

    move-object v2, p0

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-direct/range {v1 .. v6}, Lorg/achartengine/GraphicalView$2;-><init>(Lorg/achartengine/GraphicalView;IIII)V

    invoke-virtual {v0, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 321
    return-void
.end method

.method public setZoomRate(F)V
    .locals 2
    .param p1, "rate"    # F

    .line 189
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomIn:Lorg/achartengine/tools/Zoom;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lorg/achartengine/GraphicalView;->mZoomOut:Lorg/achartengine/tools/Zoom;

    if-eqz v1, :cond_0

    .line 190
    invoke-virtual {v0, p1}, Lorg/achartengine/tools/Zoom;->setZoomRate(F)V

    .line 191
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomOut:Lorg/achartengine/tools/Zoom;

    invoke-virtual {v0, p1}, Lorg/achartengine/tools/Zoom;->setZoomRate(F)V

    .line 193
    :cond_0
    return-void
.end method

.method public toBitmap()Landroid/graphics/Bitmap;
    .locals 2

    .line 329
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/GraphicalView;->setDrawingCacheEnabled(Z)V

    .line 330
    invoke-virtual {p0}, Lorg/achartengine/GraphicalView;->isDrawingCacheEnabled()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 331
    invoke-virtual {p0, v1}, Lorg/achartengine/GraphicalView;->setDrawingCacheEnabled(Z)V

    .line 333
    :cond_0
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->isApplyBackgroundColor()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 334
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->getBackgroundColor()I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/achartengine/GraphicalView;->setDrawingCacheBackgroundColor(I)V

    .line 336
    :cond_1
    const/high16 v0, 0x100000

    invoke-virtual {p0, v0}, Lorg/achartengine/GraphicalView;->setDrawingCacheQuality(I)V

    .line 337
    invoke-virtual {p0, v1}, Lorg/achartengine/GraphicalView;->getDrawingCache(Z)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public toRealPoint(I)[D
    .locals 3
    .param p1, "scale"    # I

    .line 147
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mChart:Lorg/achartengine/chart/AbstractChart;

    instance-of v1, v0, Lorg/achartengine/chart/XYChart;

    if-eqz v1, :cond_0

    .line 148
    check-cast v0, Lorg/achartengine/chart/XYChart;

    .line 149
    .local v0, "chart":Lorg/achartengine/chart/XYChart;
    iget v1, p0, Lorg/achartengine/GraphicalView;->oldX:F

    iget v2, p0, Lorg/achartengine/GraphicalView;->oldY:F

    invoke-virtual {v0, v1, v2, p1}, Lorg/achartengine/chart/XYChart;->toRealPoint(FFI)[D

    move-result-object v1

    return-object v1

    .line 151
    .end local v0    # "chart":Lorg/achartengine/chart/XYChart;
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public zoomIn()V
    .locals 2

    .line 199
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomIn:Lorg/achartengine/tools/Zoom;

    if-eqz v0, :cond_0

    .line 200
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/achartengine/tools/Zoom;->apply(I)V

    .line 201
    invoke-virtual {p0}, Lorg/achartengine/GraphicalView;->repaint()V

    .line 203
    :cond_0
    return-void
.end method

.method public zoomOut()V
    .locals 2

    .line 209
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomOut:Lorg/achartengine/tools/Zoom;

    if-eqz v0, :cond_0

    .line 210
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/achartengine/tools/Zoom;->apply(I)V

    .line 211
    invoke-virtual {p0}, Lorg/achartengine/GraphicalView;->repaint()V

    .line 213
    :cond_0
    return-void
.end method

.method public zoomReset()V
    .locals 1

    .line 221
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mFitZoom:Lorg/achartengine/tools/FitZoom;

    if-eqz v0, :cond_0

    .line 222
    invoke-virtual {v0}, Lorg/achartengine/tools/FitZoom;->apply()V

    .line 223
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomIn:Lorg/achartengine/tools/Zoom;

    invoke-virtual {v0}, Lorg/achartengine/tools/Zoom;->notifyZoomResetListeners()V

    .line 224
    invoke-virtual {p0}, Lorg/achartengine/GraphicalView;->repaint()V

    .line 226
    :cond_0
    return-void
.end method
