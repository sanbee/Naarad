.class Landroid/support/v4/print/PrintHelperKitkat;
.super Ljava/lang/Object;
.source "PrintHelperKitkat.java"


# static fields
.field public static final COLOR_MODE_COLOR:I = 0x2

.field public static final COLOR_MODE_MONOCHROME:I = 0x1

.field private static final LOG_TAG:Ljava/lang/String; = "PrintHelperKitkat"

.field private static final MAX_PRINT_SIZE:I = 0xdac

.field public static final ORIENTATION_LANDSCAPE:I = 0x1

.field public static final ORIENTATION_PORTRAIT:I = 0x2

.field public static final SCALE_MODE_FILL:I = 0x2

.field public static final SCALE_MODE_FIT:I = 0x1


# instance fields
.field mColorMode:I

.field final mContext:Landroid/content/Context;

.field mDecodeOptions:Landroid/graphics/BitmapFactory$Options;

.field private final mLock:Ljava/lang/Object;

.field mOrientation:I

.field mScaleMode:I


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/print/PrintHelperKitkat;->mDecodeOptions:Landroid/graphics/BitmapFactory$Options;

    .line 52
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroid/support/v4/print/PrintHelperKitkat;->mLock:Ljava/lang/Object;

    .line 81
    const/4 v0, 0x2

    iput v0, p0, Landroid/support/v4/print/PrintHelperKitkat;->mScaleMode:I

    .line 83
    iput v0, p0, Landroid/support/v4/print/PrintHelperKitkat;->mColorMode:I

    .line 85
    const/4 v0, 0x1

    iput v0, p0, Landroid/support/v4/print/PrintHelperKitkat;->mOrientation:I

    .line 88
    iput-object p1, p0, Landroid/support/v4/print/PrintHelperKitkat;->mContext:Landroid/content/Context;

    .line 89
    return-void
.end method

.method static synthetic access$000(Landroid/support/v4/print/PrintHelperKitkat;IILandroid/graphics/RectF;I)Landroid/graphics/Matrix;
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/print/PrintHelperKitkat;
    .param p1, "x1"    # I
    .param p2, "x2"    # I
    .param p3, "x3"    # Landroid/graphics/RectF;
    .param p4, "x4"    # I

    .line 46
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/support/v4/print/PrintHelperKitkat;->getMatrix(IILandroid/graphics/RectF;I)Landroid/graphics/Matrix;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Landroid/support/v4/print/PrintHelperKitkat;Landroid/net/Uri;I)Landroid/graphics/Bitmap;
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/print/PrintHelperKitkat;
    .param p1, "x1"    # Landroid/net/Uri;
    .param p2, "x2"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 46
    invoke-direct {p0, p1, p2}, Landroid/support/v4/print/PrintHelperKitkat;->loadConstrainedBitmap(Landroid/net/Uri;I)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Landroid/support/v4/print/PrintHelperKitkat;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/print/PrintHelperKitkat;

    .line 46
    iget-object v0, p0, Landroid/support/v4/print/PrintHelperKitkat;->mLock:Ljava/lang/Object;

    return-object v0
.end method

.method private getMatrix(IILandroid/graphics/RectF;I)Landroid/graphics/Matrix;
    .locals 6
    .param p1, "imageWidth"    # I
    .param p2, "imageHeight"    # I
    .param p3, "content"    # Landroid/graphics/RectF;
    .param p4, "fittingMode"    # I

    .line 257
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 260
    .local v0, "matrix":Landroid/graphics/Matrix;
    invoke-virtual {p3}, Landroid/graphics/RectF;->width()F

    move-result v1

    int-to-float v2, p1

    div-float/2addr v1, v2

    .line 261
    .local v1, "scale":F
    const/4 v2, 0x2

    if-ne p4, v2, :cond_0

    .line 262
    invoke-virtual {p3}, Landroid/graphics/RectF;->height()F

    move-result v2

    int-to-float v3, p2

    div-float/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    goto :goto_0

    .line 264
    :cond_0
    invoke-virtual {p3}, Landroid/graphics/RectF;->height()F

    move-result v2

    int-to-float v3, p2

    div-float/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 266
    :goto_0
    invoke-virtual {v0, v1, v1}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 269
    invoke-virtual {p3}, Landroid/graphics/RectF;->width()F

    move-result v2

    int-to-float v3, p1

    mul-float v3, v3, v1

    sub-float/2addr v2, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    .line 271
    .local v2, "translateX":F
    invoke-virtual {p3}, Landroid/graphics/RectF;->height()F

    move-result v4

    int-to-float v5, p2

    mul-float v5, v5, v1

    sub-float/2addr v4, v5

    div-float/2addr v4, v3

    .line 273
    .local v4, "translateY":F
    invoke-virtual {v0, v2, v4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 274
    return-object v0
.end method

.method private loadBitmap(Landroid/net/Uri;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .locals 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "o"    # Landroid/graphics/BitmapFactory$Options;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 507
    const-string v0, "close fail "

    const-string v1, "PrintHelperKitkat"

    if-eqz p1, :cond_2

    iget-object v2, p0, Landroid/support/v4/print/PrintHelperKitkat;->mContext:Landroid/content/Context;

    if-eqz v2, :cond_2

    .line 510
    const/4 v3, 0x0

    .line 512
    .local v3, "is":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    move-object v3, v2

    .line 513
    const/4 v2, 0x0

    invoke-static {v3, v2, p2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 515
    if-eqz v3, :cond_0

    .line 517
    :try_start_1
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 520
    goto :goto_0

    .line 518
    :catch_0
    move-exception v4

    .line 519
    .local v4, "t":Ljava/io/IOException;
    invoke-static {v1, v0, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 520
    .end local v4    # "t":Ljava/io/IOException;
    :cond_0
    :goto_0
    return-object v2

    .line 515
    :catchall_0
    move-exception v2

    if-eqz v3, :cond_1

    .line 517
    :try_start_2
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 520
    goto :goto_1

    .line 518
    :catch_1
    move-exception v4

    .line 519
    .restart local v4    # "t":Ljava/io/IOException;
    invoke-static {v1, v0, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 520
    .end local v4    # "t":Ljava/io/IOException;
    :cond_1
    :goto_1
    throw v2

    .line 508
    .end local v3    # "is":Ljava/io/InputStream;
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "bad argument to loadBitmap"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private loadConstrainedBitmap(Landroid/net/Uri;I)Landroid/graphics/Bitmap;
    .locals 10
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "maxSideLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 457
    if-lez p2, :cond_5

    if-eqz p1, :cond_5

    iget-object v0, p0, Landroid/support/v4/print/PrintHelperKitkat;->mContext:Landroid/content/Context;

    if-eqz v0, :cond_5

    .line 461
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 462
    .local v0, "opt":Landroid/graphics/BitmapFactory$Options;
    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 463
    invoke-direct {p0, p1, v0}, Landroid/support/v4/print/PrintHelperKitkat;->loadBitmap(Landroid/net/Uri;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 465
    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 466
    .local v2, "w":I
    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 469
    .local v3, "h":I
    const/4 v4, 0x0

    if-lez v2, :cond_4

    if-gtz v3, :cond_0

    goto :goto_2

    .line 474
    :cond_0
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 476
    .local v5, "imageSide":I
    const/4 v6, 0x1

    .line 477
    .local v6, "sampleSize":I
    :goto_0
    if-le v5, p2, :cond_1

    .line 478
    ushr-int/lit8 v5, v5, 0x1

    .line 479
    shl-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 483
    :cond_1
    if-lez v6, :cond_3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v7

    div-int/2addr v7, v6

    if-gtz v7, :cond_2

    goto :goto_1

    .line 486
    :cond_2
    const/4 v7, 0x0

    .line 487
    .local v7, "decodeOptions":Landroid/graphics/BitmapFactory$Options;
    iget-object v8, p0, Landroid/support/v4/print/PrintHelperKitkat;->mLock:Ljava/lang/Object;

    monitor-enter v8

    .line 488
    :try_start_0
    new-instance v9, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v9}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    iput-object v9, p0, Landroid/support/v4/print/PrintHelperKitkat;->mDecodeOptions:Landroid/graphics/BitmapFactory$Options;

    .line 489
    iget-object v9, p0, Landroid/support/v4/print/PrintHelperKitkat;->mDecodeOptions:Landroid/graphics/BitmapFactory$Options;

    iput-boolean v1, v9, Landroid/graphics/BitmapFactory$Options;->inMutable:Z

    .line 490
    iget-object v1, p0, Landroid/support/v4/print/PrintHelperKitkat;->mDecodeOptions:Landroid/graphics/BitmapFactory$Options;

    iput v6, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 491
    iget-object v1, p0, Landroid/support/v4/print/PrintHelperKitkat;->mDecodeOptions:Landroid/graphics/BitmapFactory$Options;

    move-object v7, v1

    .line 492
    monitor-exit v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 494
    :try_start_1
    invoke-direct {p0, p1, v7}, Landroid/support/v4/print/PrintHelperKitkat;->loadBitmap(Landroid/net/Uri;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 496
    iget-object v8, p0, Landroid/support/v4/print/PrintHelperKitkat;->mLock:Ljava/lang/Object;

    monitor-enter v8

    .line 497
    :try_start_2
    iput-object v4, p0, Landroid/support/v4/print/PrintHelperKitkat;->mDecodeOptions:Landroid/graphics/BitmapFactory$Options;

    .line 498
    monitor-exit v8

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    .line 496
    :catchall_1
    move-exception v1

    iget-object v9, p0, Landroid/support/v4/print/PrintHelperKitkat;->mLock:Ljava/lang/Object;

    monitor-enter v9

    .line 497
    :try_start_3
    iput-object v4, p0, Landroid/support/v4/print/PrintHelperKitkat;->mDecodeOptions:Landroid/graphics/BitmapFactory$Options;

    .line 498
    monitor-exit v9
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v1

    :catchall_2
    move-exception v1

    :try_start_4
    monitor-exit v9
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw v1

    .line 492
    :catchall_3
    move-exception v1

    :try_start_5
    monitor-exit v8
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    throw v1

    .line 484
    .end local v7    # "decodeOptions":Landroid/graphics/BitmapFactory$Options;
    :cond_3
    :goto_1
    return-object v4

    .line 470
    .end local v5    # "imageSide":I
    .end local v6    # "sampleSize":I
    :cond_4
    :goto_2
    return-object v4

    .line 458
    .end local v0    # "opt":Landroid/graphics/BitmapFactory$Options;
    .end local v2    # "w":I
    .end local v3    # "h":I
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "bad argument to getScaledBitmap"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_4

    :goto_3
    throw v0

    :goto_4
    goto :goto_3
.end method


# virtual methods
.method public getColorMode()I
    .locals 1

    .line 154
    iget v0, p0, Landroid/support/v4/print/PrintHelperKitkat;->mColorMode:I

    return v0
.end method

.method public getOrientation()I
    .locals 1

    .line 144
    iget v0, p0, Landroid/support/v4/print/PrintHelperKitkat;->mOrientation:I

    return v0
.end method

.method public getScaleMode()I
    .locals 1

    .line 112
    iget v0, p0, Landroid/support/v4/print/PrintHelperKitkat;->mScaleMode:I

    return v0
.end method

.method public printBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 5
    .param p1, "jobName"    # Ljava/lang/String;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;

    .line 164
    if-nez p2, :cond_0

    .line 165
    return-void

    .line 167
    :cond_0
    iget v0, p0, Landroid/support/v4/print/PrintHelperKitkat;->mScaleMode:I

    .line 168
    .local v0, "fittingMode":I
    iget-object v1, p0, Landroid/support/v4/print/PrintHelperKitkat;->mContext:Landroid/content/Context;

    const-string v2, "print"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/print/PrintManager;

    .line 169
    .local v1, "printManager":Landroid/print/PrintManager;
    sget-object v2, Landroid/print/PrintAttributes$MediaSize;->UNKNOWN_PORTRAIT:Landroid/print/PrintAttributes$MediaSize;

    .line 170
    .local v2, "mediaSize":Landroid/print/PrintAttributes$MediaSize;
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    if-le v3, v4, :cond_1

    .line 171
    sget-object v2, Landroid/print/PrintAttributes$MediaSize;->UNKNOWN_LANDSCAPE:Landroid/print/PrintAttributes$MediaSize;

    .line 173
    :cond_1
    new-instance v3, Landroid/print/PrintAttributes$Builder;

    invoke-direct {v3}, Landroid/print/PrintAttributes$Builder;-><init>()V

    invoke-virtual {v3, v2}, Landroid/print/PrintAttributes$Builder;->setMediaSize(Landroid/print/PrintAttributes$MediaSize;)Landroid/print/PrintAttributes$Builder;

    move-result-object v3

    iget v4, p0, Landroid/support/v4/print/PrintHelperKitkat;->mColorMode:I

    invoke-virtual {v3, v4}, Landroid/print/PrintAttributes$Builder;->setColorMode(I)Landroid/print/PrintAttributes$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/print/PrintAttributes$Builder;->build()Landroid/print/PrintAttributes;

    move-result-object v3

    .line 178
    .local v3, "attr":Landroid/print/PrintAttributes;
    new-instance v4, Landroid/support/v4/print/PrintHelperKitkat$1;

    invoke-direct {v4, p0, p1, p2, v0}, Landroid/support/v4/print/PrintHelperKitkat$1;-><init>(Landroid/support/v4/print/PrintHelperKitkat;Ljava/lang/String;Landroid/graphics/Bitmap;I)V

    invoke-virtual {v1, p1, v4, v3}, Landroid/print/PrintManager;->print(Ljava/lang/String;Landroid/print/PrintDocumentAdapter;Landroid/print/PrintAttributes;)Landroid/print/PrintJob;

    .line 245
    return-void
.end method

.method public printBitmap(Ljava/lang/String;Landroid/net/Uri;)V
    .locals 6
    .param p1, "jobName"    # Ljava/lang/String;
    .param p2, "imageFile"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 287
    iget v0, p0, Landroid/support/v4/print/PrintHelperKitkat;->mScaleMode:I

    .line 289
    .local v0, "fittingMode":I
    new-instance v1, Landroid/support/v4/print/PrintHelperKitkat$2;

    invoke-direct {v1, p0, p1, p2, v0}, Landroid/support/v4/print/PrintHelperKitkat$2;-><init>(Landroid/support/v4/print/PrintHelperKitkat;Ljava/lang/String;Landroid/net/Uri;I)V

    .line 434
    .local v1, "printDocumentAdapter":Landroid/print/PrintDocumentAdapter;
    iget-object v2, p0, Landroid/support/v4/print/PrintHelperKitkat;->mContext:Landroid/content/Context;

    const-string v3, "print"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/print/PrintManager;

    .line 435
    .local v2, "printManager":Landroid/print/PrintManager;
    new-instance v3, Landroid/print/PrintAttributes$Builder;

    invoke-direct {v3}, Landroid/print/PrintAttributes$Builder;-><init>()V

    .line 436
    .local v3, "builder":Landroid/print/PrintAttributes$Builder;
    iget v4, p0, Landroid/support/v4/print/PrintHelperKitkat;->mColorMode:I

    invoke-virtual {v3, v4}, Landroid/print/PrintAttributes$Builder;->setColorMode(I)Landroid/print/PrintAttributes$Builder;

    .line 438
    iget v4, p0, Landroid/support/v4/print/PrintHelperKitkat;->mOrientation:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_0

    .line 439
    sget-object v4, Landroid/print/PrintAttributes$MediaSize;->UNKNOWN_LANDSCAPE:Landroid/print/PrintAttributes$MediaSize;

    invoke-virtual {v3, v4}, Landroid/print/PrintAttributes$Builder;->setMediaSize(Landroid/print/PrintAttributes$MediaSize;)Landroid/print/PrintAttributes$Builder;

    goto :goto_0

    .line 440
    :cond_0
    const/4 v5, 0x2

    if-ne v4, v5, :cond_1

    .line 441
    sget-object v4, Landroid/print/PrintAttributes$MediaSize;->UNKNOWN_PORTRAIT:Landroid/print/PrintAttributes$MediaSize;

    invoke-virtual {v3, v4}, Landroid/print/PrintAttributes$Builder;->setMediaSize(Landroid/print/PrintAttributes$MediaSize;)Landroid/print/PrintAttributes$Builder;

    .line 443
    :cond_1
    :goto_0
    invoke-virtual {v3}, Landroid/print/PrintAttributes$Builder;->build()Landroid/print/PrintAttributes;

    move-result-object v4

    .line 445
    .local v4, "attr":Landroid/print/PrintAttributes;
    invoke-virtual {v2, p1, v1, v4}, Landroid/print/PrintManager;->print(Ljava/lang/String;Landroid/print/PrintDocumentAdapter;Landroid/print/PrintAttributes;)Landroid/print/PrintJob;

    .line 446
    return-void
.end method

.method public setColorMode(I)V
    .locals 0
    .param p1, "colorMode"    # I

    .line 124
    iput p1, p0, Landroid/support/v4/print/PrintHelperKitkat;->mColorMode:I

    .line 125
    return-void
.end method

.method public setOrientation(I)V
    .locals 0
    .param p1, "orientation"    # I

    .line 134
    iput p1, p0, Landroid/support/v4/print/PrintHelperKitkat;->mOrientation:I

    .line 135
    return-void
.end method

.method public setScaleMode(I)V
    .locals 0
    .param p1, "scaleMode"    # I

    .line 102
    iput p1, p0, Landroid/support/v4/print/PrintHelperKitkat;->mScaleMode:I

    .line 103
    return-void
.end method
