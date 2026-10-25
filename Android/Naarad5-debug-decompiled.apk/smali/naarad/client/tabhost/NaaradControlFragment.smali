.class public Lnaarad/client/tabhost/NaaradControlFragment;
.super Lnaarad/client/tabhost/NaaradAbstractFragment;
.source "NaaradControlFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnaarad/client/tabhost/NaaradControlFragment$SendMessage;
    }
.end annotation


# static fields
.field private static mView:Landroid/view/View;


# instance fields
.field private final ALL_WELL:Ljava/lang/String;

.field bubbleGestureListener:Landroid/view/GestureDetector$SimpleOnGestureListener;

.field private bulb0:Landroid/widget/ImageView;

.field private bulb1:Landroid/widget/ImageView;

.field private bulb2:Landroid/widget/ImageView;

.field private bulbArr:[Landroid/widget/ImageView;

.field private client:Ljava/net/Socket;

.field private currentToggleButton:Landroid/widget/ToggleButton;

.field private gBubbleGestureListener:Landroid/view/GestureDetector;

.field private gBubbleOnTouchListener:Landroid/view/View$OnTouchListener;

.field public gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

.field private gGestureDetector:Landroid/view/GestureDetector;

.field private gLampHandler:Landroid/view/View$OnClickListener;

.field private gOnTouchListener:Landroid/view/View$OnTouchListener;

.field private iv:Landroid/widget/ImageView;

.field private lamp0:Landroid/widget/ToggleButton;

.field private lamp1:Landroid/widget/ToggleButton;

.field private lamp2:Landroid/widget/ToggleButton;

.field private lampArr:[Landroid/widget/ToggleButton;

.field private mActivity0:Landroid/app/Activity;

.field private messsage:Ljava/lang/String;

.field public myApp:Lnaarad/client/tabhost/NaaradApp;

.field myGestureListener:Landroid/view/GestureDetector$SimpleOnGestureListener;

.field private printwriter:Ljava/io/PrintWriter;

.field private serverName:Ljava/lang/String;

.field private serverPort:I

.field private tempBubbleArr:[Landroid/widget/TextView;

.field private tempInDegC:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 44
    invoke-direct {p0}, Lnaarad/client/tabhost/NaaradAbstractFragment;-><init>()V

    .line 57
    const/16 v0, 0x4d2

    iput v0, p0, Lnaarad/client/tabhost/NaaradControlFragment;->serverPort:I

    .line 58
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnaarad/client/tabhost/NaaradControlFragment;->tempInDegC:Z

    .line 59
    const-string v0, "All well"

    iput-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment;->ALL_WELL:Ljava/lang/String;

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment;->mActivity0:Landroid/app/Activity;

    .line 282
    new-instance v0, Lnaarad/client/tabhost/NaaradControlFragment$1;

    invoke-direct {v0, p0}, Lnaarad/client/tabhost/NaaradControlFragment$1;-><init>(Lnaarad/client/tabhost/NaaradControlFragment;)V

    iput-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment;->bubbleGestureListener:Landroid/view/GestureDetector$SimpleOnGestureListener;

    .line 345
    new-instance v0, Lnaarad/client/tabhost/NaaradControlFragment$2;

    invoke-direct {v0, p0}, Lnaarad/client/tabhost/NaaradControlFragment$2;-><init>(Lnaarad/client/tabhost/NaaradControlFragment;)V

    iput-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment;->myGestureListener:Landroid/view/GestureDetector$SimpleOnGestureListener;

    return-void
.end method

.method static synthetic access$100(Lnaarad/client/tabhost/NaaradControlFragment;)Z
    .locals 1
    .param p0, "x0"    # Lnaarad/client/tabhost/NaaradControlFragment;

    .line 44
    iget-boolean v0, p0, Lnaarad/client/tabhost/NaaradControlFragment;->tempInDegC:Z

    return v0
.end method

.method static synthetic access$102(Lnaarad/client/tabhost/NaaradControlFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lnaarad/client/tabhost/NaaradControlFragment;
    .param p1, "x1"    # Z

    .line 44
    iput-boolean p1, p0, Lnaarad/client/tabhost/NaaradControlFragment;->tempInDegC:Z

    return p1
.end method

.method static synthetic access$200(Lnaarad/client/tabhost/NaaradControlFragment;)[Landroid/widget/ToggleButton;
    .locals 1
    .param p0, "x0"    # Lnaarad/client/tabhost/NaaradControlFragment;

    .line 44
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment;->lampArr:[Landroid/widget/ToggleButton;

    return-object v0
.end method

.method static synthetic access$300(Lnaarad/client/tabhost/NaaradControlFragment;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lnaarad/client/tabhost/NaaradControlFragment;

    .line 44
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment;->messsage:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lnaarad/client/tabhost/NaaradControlFragment;)Landroid/widget/ToggleButton;
    .locals 1
    .param p0, "x0"    # Lnaarad/client/tabhost/NaaradControlFragment;

    .line 44
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment;->currentToggleButton:Landroid/widget/ToggleButton;

    return-object v0
.end method

.method static synthetic access$500(Lnaarad/client/tabhost/NaaradControlFragment;)[Landroid/widget/ImageView;
    .locals 1
    .param p0, "x0"    # Lnaarad/client/tabhost/NaaradControlFragment;

    .line 44
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment;->bulbArr:[Landroid/widget/ImageView;

    return-object v0
.end method

.method private installHandlers(Landroid/view/View$OnClickListener;Landroid/view/View$OnTouchListener;[Landroid/widget/ToggleButton;[Landroid/widget/ImageView;)V
    .locals 4
    .param p1, "lampHandler"    # Landroid/view/View$OnClickListener;
    .param p2, "onTouchListener"    # Landroid/view/View$OnTouchListener;
    .param p3, "lampArr"    # [Landroid/widget/ToggleButton;
    .param p4, "bulbArr"    # [Landroid/widget/ImageView;

    .line 457
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p3

    if-ge v0, v1, :cond_0

    .line 459
    aget-object v1, p3, v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setTag(Ljava/lang/Object;)V

    .line 460
    aget-object v1, p3, v0

    invoke-virtual {v1, p1}, Landroid/widget/ToggleButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 461
    aget-object v1, p3, v0

    invoke-virtual {p0, v1}, Lnaarad/client/tabhost/NaaradControlFragment;->setLampBG(Landroid/view/View;)Z

    .line 457
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 466
    .end local v0    # "i":I
    :cond_0
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_1
    array-length v1, p4

    if-ge v0, v1, :cond_1

    .line 476
    aget-object v1, p4, v0

    const/high16 v2, 0x7f040000

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V

    .line 477
    aget-object v1, p4, v0

    const v2, 0x7f040001

    const-string v3, "0"

    invoke-virtual {v1, v2, v3}, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V

    .line 478
    aget-object v1, p4, v0

    invoke-virtual {v1, p2}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 466
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 481
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method private makeHandlers(Landroid/app/Activity;)V
    .locals 16
    .param p1, "activity"    # Landroid/app/Activity;

    .line 420
    move-object/from16 v0, p0

    new-instance v1, Lnaarad/client/tabhost/NaaradControlFragment$3;

    invoke-direct {v1, v0}, Lnaarad/client/tabhost/NaaradControlFragment$3;-><init>(Lnaarad/client/tabhost/NaaradControlFragment;)V

    iput-object v1, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gLampHandler:Landroid/view/View$OnClickListener;

    .line 439
    new-instance v1, Landroid/view/GestureDetector;

    iget-object v2, v0, Lnaarad/client/tabhost/NaaradControlFragment;->mActivity0:Landroid/app/Activity;

    iget-object v3, v0, Lnaarad/client/tabhost/NaaradControlFragment;->myGestureListener:Landroid/view/GestureDetector$SimpleOnGestureListener;

    invoke-direct {v1, v2, v3}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v1, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gGestureDetector:Landroid/view/GestureDetector;

    .line 440
    new-instance v1, Lnaarad/client/tabhost/NaaradDnDOnTouchListener;

    iget-object v5, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gGestureDetector:Landroid/view/GestureDetector;

    iget-object v6, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    iget-object v7, v0, Lnaarad/client/tabhost/NaaradControlFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v13

    const/16 v10, 0x14

    const/16 v11, 0x14

    move-object v4, v1

    move-object v8, v13

    move-object v9, v13

    invoke-direct/range {v4 .. v11}, Lnaarad/client/tabhost/NaaradDnDOnTouchListener;-><init>(Landroid/view/GestureDetector;Lnaarad/client/tabhost/NaaradDnDParameters;Lnaarad/client/tabhost/NaaradApp;Ljava/lang/Float;Ljava/lang/Float;II)V

    iput-object v1, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gOnTouchListener:Landroid/view/View$OnTouchListener;

    .line 444
    new-instance v1, Landroid/view/GestureDetector;

    iget-object v2, v0, Lnaarad/client/tabhost/NaaradControlFragment;->mActivity0:Landroid/app/Activity;

    iget-object v3, v0, Lnaarad/client/tabhost/NaaradControlFragment;->bubbleGestureListener:Landroid/view/GestureDetector$SimpleOnGestureListener;

    invoke-direct {v1, v2, v3}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v1, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gBubbleGestureListener:Landroid/view/GestureDetector;

    .line 445
    new-instance v1, Lnaarad/client/tabhost/NaaradDnDOnTouchListener;

    iget-object v9, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gBubbleGestureListener:Landroid/view/GestureDetector;

    iget-object v10, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    iget-object v11, v0, Lnaarad/client/tabhost/NaaradControlFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    const/16 v14, 0x2d

    const/16 v15, 0x19

    move-object v8, v1

    move-object v12, v13

    invoke-direct/range {v8 .. v15}, Lnaarad/client/tabhost/NaaradDnDOnTouchListener;-><init>(Landroid/view/GestureDetector;Lnaarad/client/tabhost/NaaradDnDParameters;Lnaarad/client/tabhost/NaaradApp;Ljava/lang/Float;Ljava/lang/Float;II)V

    iput-object v1, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gBubbleOnTouchListener:Landroid/view/View$OnTouchListener;

    .line 446
    return-void
.end method

.method public static final newInstance(Ljava/lang/String;)Lnaarad/client/tabhost/NaaradControlFragment;
    .locals 3
    .param p0, "sampleText"    # Ljava/lang/String;

    .line 115
    new-instance v0, Lnaarad/client/tabhost/NaaradControlFragment;

    invoke-direct {v0}, Lnaarad/client/tabhost/NaaradControlFragment;-><init>()V

    .line 117
    .local v0, "f":Lnaarad/client/tabhost/NaaradControlFragment;
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 118
    .local v1, "b":Landroid/os/Bundle;
    const-string v2, "bString"

    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    invoke-virtual {v0, v1}, Lnaarad/client/tabhost/NaaradControlFragment;->setArguments(Landroid/os/Bundle;)V

    .line 121
    return-object v0
.end method

.method private resizeView(Landroid/view/View;Landroid/view/MotionEvent;II)V
    .locals 16
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;
    .param p3, "xSizeDP"    # I
    .param p4, "ySizeDP"    # I

    .line 80
    move-object/from16 v0, p0

    const/4 v1, 0x0

    .local v1, "oX":I
    const/4 v2, 0x0

    .line 82
    .local v2, "oY":I
    move/from16 v3, p3

    int-to-float v4, v3

    iget-object v5, v0, Lnaarad/client/tabhost/NaaradControlFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    iget v5, v5, Lnaarad/client/tabhost/NaaradApp;->densityDpi:F

    mul-float v4, v4, v5

    float-to-double v4, v4

    const-wide/high16 v6, 0x4064000000000000L    # 160.0

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v4, v6

    double-to-int v4, v4

    .line 83
    .local v4, "xsdp":I
    move/from16 v5, p4

    int-to-float v8, v5

    iget-object v9, v0, Lnaarad/client/tabhost/NaaradControlFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    iget v9, v9, Lnaarad/client/tabhost/NaaradApp;->densityDpi:F

    mul-float v8, v8, v9

    float-to-double v8, v8

    invoke-static {v8, v9}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v8, v6

    double-to-int v6, v8

    .line 85
    .local v6, "ysdp":I
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    float-to-int v7, v7

    .line 86
    .local v7, "pX":I
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getY()F

    move-result v8

    float-to-int v8, v8

    .line 88
    .local v8, "pY":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getHeight()I

    move-result v9

    mul-int/lit8 v9, v9, 0x2

    .line 89
    .end local v1    # "oX":I
    .local v9, "oX":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getWidth()I

    move-result v1

    .line 90
    .end local v2    # "oY":I
    .local v1, "oY":I
    mul-int/lit8 v2, v4, 0x2

    .line 91
    .end local v9    # "oX":I
    .local v2, "oX":I
    move v1, v6

    .line 92
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getRight()I

    move-result v9

    .line 93
    .local v9, "iX":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTop()I

    move-result v10

    .line 94
    .local v10, "iY":I
    sub-int v11, v7, v2

    add-int/2addr v11, v9

    .line 95
    .local v11, "x":I
    sub-int v12, v8, v1

    add-int/2addr v12, v10

    .line 99
    .local v12, "y":I
    new-instance v13, Landroid/widget/RelativeLayout$LayoutParams;

    new-instance v14, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v15, -0x2

    invoke-direct {v14, v15, v15}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    invoke-direct {v13, v14}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 105
    .local v13, "lp":Landroid/widget/RelativeLayout$LayoutParams;
    const/4 v14, 0x0

    invoke-virtual {v13, v11, v12, v14, v14}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 106
    iput v4, v13, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 107
    iput v6, v13, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 108
    move-object/from16 v14, p1

    invoke-virtual {v14, v13}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 109
    return-void
.end method


# virtual methods
.method public lampHandler0(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .line 250
    invoke-virtual {p0}, Lnaarad/client/tabhost/NaaradControlFragment;->getServerName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment;->serverName:Ljava/lang/String;

    .line 251
    invoke-virtual {p0}, Lnaarad/client/tabhost/NaaradControlFragment;->getServerPort()I

    move-result v0

    iput v0, p0, Lnaarad/client/tabhost/NaaradControlFragment;->serverPort:I

    .line 252
    move-object v0, p1

    check-cast v0, Landroid/widget/ToggleButton;

    check-cast v0, Landroid/widget/ToggleButton;

    iput-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment;->currentToggleButton:Landroid/widget/ToggleButton;

    .line 255
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 256
    .local v0, "tag":I
    invoke-virtual {p0, p1}, Lnaarad/client/tabhost/NaaradControlFragment;->setLampBG(Landroid/view/View;)Z

    move-result v1

    .line 257
    .local v1, "on":Z
    iget-object v2, p0, Lnaarad/client/tabhost/NaaradControlFragment;->bulbArr:[Landroid/widget/ImageView;

    aget-object v2, v2, v0

    xor-int/lit8 v3, v1, 0x1

    invoke-virtual {p0, v2, v3}, Lnaarad/client/tabhost/NaaradControlFragment;->setBulbBG(Landroid/view/View;Z)V

    .line 258
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "tell "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lnaarad/client/tabhost/NaaradControlFragment;->messsage:Ljava/lang/String;

    .line 260
    if-eqz v1, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lnaarad/client/tabhost/NaaradControlFragment;->messsage:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "1"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lnaarad/client/tabhost/NaaradControlFragment;->messsage:Ljava/lang/String;

    goto :goto_0

    .line 261
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lnaarad/client/tabhost/NaaradControlFragment;->messsage:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "0"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lnaarad/client/tabhost/NaaradControlFragment;->messsage:Ljava/lang/String;

    .line 265
    :goto_0
    new-instance v2, Lnaarad/client/tabhost/NaaradControlFragment$SendMessage;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lnaarad/client/tabhost/NaaradControlFragment$SendMessage;-><init>(Lnaarad/client/tabhost/NaaradControlFragment;Lnaarad/client/tabhost/NaaradControlFragment$1;)V

    .line 266
    .local v2, "sendMessageTask":Lnaarad/client/tabhost/NaaradControlFragment$SendMessage;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Void;

    invoke-virtual {v2, v3}, Lnaarad/client/tabhost/NaaradControlFragment$SendMessage;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 267
    return-void
.end method

.method public makeSensorIcons(Landroid/view/View;)V
    .locals 29
    .param p1, "thisView"    # Landroid/view/View;

    .line 491
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {p0 .. p0}, Lnaarad/client/tabhost/NaaradControlFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    iput-object v2, v0, Lnaarad/client/tabhost/NaaradControlFragment;->mActivity0:Landroid/app/Activity;

    .line 492
    const/4 v2, 0x3

    new-array v3, v2, [Landroid/widget/ToggleButton;

    iput-object v3, v0, Lnaarad/client/tabhost/NaaradControlFragment;->lampArr:[Landroid/widget/ToggleButton;

    .line 493
    new-array v2, v2, [Landroid/widget/ImageView;

    iput-object v2, v0, Lnaarad/client/tabhost/NaaradControlFragment;->bulbArr:[Landroid/widget/ImageView;

    .line 495
    iget-object v2, v0, Lnaarad/client/tabhost/NaaradControlFragment;->nodeID2Ndx:Ljava/util/HashMap;

    invoke-virtual {v0, v2}, Lnaarad/client/tabhost/NaaradControlFragment;->getKeysAsArray(Ljava/util/HashMap;)[I

    move-result-object v2

    .line 499
    .local v2, "keys":[I
    iget-object v3, v0, Lnaarad/client/tabhost/NaaradControlFragment;->nodeID2Ndx:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->size()I

    move-result v3

    .line 501
    .local v3, "nBubbles":I
    new-array v4, v3, [Landroid/widget/TextView;

    iput-object v4, v0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    .line 503
    iget-object v4, v0, Lnaarad/client/tabhost/NaaradControlFragment;->lampArr:[Landroid/widget/ToggleButton;

    const v5, 0x7f030009

    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ToggleButton;

    iput-object v5, v0, Lnaarad/client/tabhost/NaaradControlFragment;->lamp0:Landroid/widget/ToggleButton;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    .line 504
    iget-object v4, v0, Lnaarad/client/tabhost/NaaradControlFragment;->lampArr:[Landroid/widget/ToggleButton;

    const v5, 0x7f03000a

    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ToggleButton;

    iput-object v5, v0, Lnaarad/client/tabhost/NaaradControlFragment;->lamp1:Landroid/widget/ToggleButton;

    const/4 v7, 0x1

    aput-object v5, v4, v7

    .line 505
    iget-object v4, v0, Lnaarad/client/tabhost/NaaradControlFragment;->lampArr:[Landroid/widget/ToggleButton;

    const v5, 0x7f03000b

    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ToggleButton;

    iput-object v5, v0, Lnaarad/client/tabhost/NaaradControlFragment;->lamp2:Landroid/widget/ToggleButton;

    const/4 v8, 0x2

    aput-object v5, v4, v8

    .line 506
    iget-object v4, v0, Lnaarad/client/tabhost/NaaradControlFragment;->bulbArr:[Landroid/widget/ImageView;

    const v5, 0x7f030006

    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iput-object v5, v0, Lnaarad/client/tabhost/NaaradControlFragment;->bulb0:Landroid/widget/ImageView;

    aput-object v5, v4, v6

    .line 507
    iget-object v4, v0, Lnaarad/client/tabhost/NaaradControlFragment;->bulbArr:[Landroid/widget/ImageView;

    const v5, 0x7f030007

    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iput-object v5, v0, Lnaarad/client/tabhost/NaaradControlFragment;->bulb1:Landroid/widget/ImageView;

    aput-object v5, v4, v7

    .line 510
    iget-object v4, v0, Lnaarad/client/tabhost/NaaradControlFragment;->bulbArr:[Landroid/widget/ImageView;

    const v5, 0x7f030008

    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iput-object v5, v0, Lnaarad/client/tabhost/NaaradControlFragment;->bulb2:Landroid/widget/ImageView;

    aput-object v5, v4, v8

    .line 512
    iget-object v4, v0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    const v5, 0x7f030015

    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    aput-object v5, v4, v6

    .line 513
    iget-object v4, v0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    const v5, 0x7f030016

    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    aput-object v5, v4, v7

    .line 515
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    iget-object v5, v0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    array-length v8, v5

    if-ge v4, v8, :cond_0

    .line 517
    aget-object v5, v5, v4

    const/high16 v8, 0x41400000    # 12.0f

    invoke-virtual {v5, v7, v8}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 518
    iget-object v5, v0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    aget-object v5, v5, v4

    const v8, 0x7f040001

    const-string v9, "C"

    invoke-virtual {v5, v8, v9}, Landroid/widget/TextView;->setTag(ILjava/lang/Object;)V

    .line 520
    iget-object v5, v0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    aget-object v5, v5, v4

    aget v8, v2, v4

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 523
    iget-object v5, v0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    aget-object v5, v5, v4

    const-string v8, "white"

    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 515
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 539
    .end local v4    # "i":I
    :cond_0
    const/4 v4, -0x2

    .local v4, "x":I
    const/4 v5, -0x2

    .local v5, "y":I
    const/16 v8, 0x2b

    .local v8, "xMargin":I
    const/16 v9, 0x12

    .line 540
    .local v9, "yMargin":I
    iget-object v10, v0, Lnaarad/client/tabhost/NaaradControlFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    const/16 v11, 0x14

    invoke-virtual {v10, v11}, Lnaarad/client/tabhost/NaaradApp;->dpToPixel(I)I

    move-result v10

    move/from16 v17, v10

    .local v17, "oY":I
    move/from16 v16, v10

    .line 542
    .local v16, "oX":I
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_1
    iget-object v11, v0, Lnaarad/client/tabhost/NaaradControlFragment;->bulbArr:[Landroid/widget/ImageView;

    array-length v11, v11

    const-string v12, "%d"

    const-string v14, " "

    if-ge v10, v11, :cond_2

    .line 547
    sget-object v11, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Scale = "

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v13, v0, Lnaarad/client/tabhost/NaaradControlFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    iget-object v13, v13, Lnaarad/client/tabhost/NaaradApp;->metrics:Landroid/util/DisplayMetrics;

    iget v13, v13, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v13}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 549
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "bulbX"

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-array v13, v7, [Ljava/lang/Object;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v6

    invoke-static {v12, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v13, -0x1

    invoke-virtual {v0, v11, v13}, Lnaarad/client/tabhost/NaaradControlFragment;->getPreference(Ljava/lang/String;I)I

    move-result v4

    .line 550
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "bulbY"

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-array v13, v7, [Ljava/lang/Object;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v6

    invoke-static {v12, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, -0x1

    invoke-virtual {v0, v11, v12}, Lnaarad/client/tabhost/NaaradControlFragment;->getPreference(Ljava/lang/String;I)I

    move-result v5

    .line 551
    sget-object v11, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "bulb"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 552
    const/4 v11, -0x1

    if-eq v4, v11, :cond_1

    if-eq v5, v11, :cond_1

    .line 558
    sget-object v11, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v13, v0, Lnaarad/client/tabhost/NaaradControlFragment;->bulbArr:[Landroid/widget/ImageView;

    aget-object v13, v13, v10

    .line 559
    invoke-virtual {v13}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v13

    check-cast v13, Landroid/view/View;

    invoke-virtual {v13}, Landroid/view/View;->getLeft()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v13, v0, Lnaarad/client/tabhost/NaaradControlFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    iget v13, v13, Lnaarad/client/tabhost/NaaradApp;->densityDpi:F

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 558
    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 567
    iget-object v12, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    iget-object v11, v0, Lnaarad/client/tabhost/NaaradControlFragment;->bulbArr:[Landroid/widget/ImageView;

    aget-object v13, v11, v10

    sub-int v14, v4, v8

    sub-int v15, v5, v9

    const/high16 v18, 0x3f800000    # 1.0f

    const/high16 v19, 0x3f800000    # 1.0f

    invoke-virtual/range {v12 .. v19}, Lnaarad/client/tabhost/NaaradDnDParameters;->moveView(Landroid/view/View;IIIIFF)V

    .line 542
    :cond_1
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_1

    .line 571
    .end local v10    # "i":I
    :cond_2
    int-to-float v10, v8

    iget-object v11, v0, Lnaarad/client/tabhost/NaaradControlFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    iget v11, v11, Lnaarad/client/tabhost/NaaradApp;->densityDpi:F

    mul-float v10, v10, v11

    float-to-int v8, v10

    .line 572
    const/4 v10, 0x0

    .restart local v10    # "i":I
    :goto_2
    iget-object v11, v0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    array-length v13, v11

    if-ge v10, v13, :cond_4

    .line 574
    aget-object v11, v11, v10

    invoke-virtual {v11, v6, v6}, Landroid/widget/TextView;->measure(II)V

    .line 575
    iget-object v11, v0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    aget-object v11, v11, v10

    invoke-virtual {v11}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v11

    .line 576
    .local v11, "width":I
    iget-object v13, v0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    aget-object v13, v13, v10

    invoke-virtual {v13}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v13

    .line 577
    .local v13, "height":I
    iget-object v15, v0, Lnaarad/client/tabhost/NaaradControlFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    const/16 v6, 0x2d

    invoke-virtual {v15, v6}, Lnaarad/client/tabhost/NaaradApp;->dpToPixel(I)I

    move-result v6

    .line 578
    .end local v11    # "width":I
    .local v6, "width":I
    iget-object v11, v0, Lnaarad/client/tabhost/NaaradControlFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    const/16 v15, 0x19

    invoke-virtual {v11, v15}, Lnaarad/client/tabhost/NaaradApp;->dpToPixel(I)I

    move-result v11

    .line 579
    .end local v13    # "height":I
    .local v11, "height":I
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "bubbleX"

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-array v15, v7, [Ljava/lang/Object;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    const/16 v19, 0x0

    aput-object v20, v15, v19

    invoke-static {v12, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v15, -0x1

    invoke-virtual {v0, v13, v15}, Lnaarad/client/tabhost/NaaradControlFragment;->getPreference(Ljava/lang/String;I)I

    move-result v4

    .line 580
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "bubbleY"

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-array v15, v7, [Ljava/lang/Object;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    const/16 v19, 0x0

    aput-object v20, v15, v19

    invoke-static {v12, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v15, -0x1

    invoke-virtual {v0, v13, v15}, Lnaarad/client/tabhost/NaaradControlFragment;->getPreference(Ljava/lang/String;I)I

    move-result v5

    .line 582
    iget-object v13, v0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    aget-object v13, v13, v10

    invoke-virtual {v13}, Landroid/widget/TextView;->getTotalPaddingRight()I

    move-result v13

    add-int/2addr v13, v7

    iget-object v15, v0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    aget-object v15, v15, v10

    invoke-virtual {v15}, Landroid/widget/TextView;->getTotalPaddingLeft()I

    move-result v15

    add-int/2addr v13, v15

    .line 583
    .local v13, "xPadding":I
    iget-object v15, v0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    aget-object v15, v15, v10

    invoke-virtual {v15}, Landroid/widget/TextView;->getTotalPaddingTop()I

    move-result v15

    add-int/2addr v15, v7

    iget-object v7, v0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    aget-object v7, v7, v10

    invoke-virtual {v7}, Landroid/widget/TextView;->getTotalPaddingBottom()I

    move-result v7

    add-int/2addr v15, v7

    .line 584
    .local v15, "yPadding":I
    sget-object v7, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v28, v2

    .end local v2    # "keys":[I
    .local v28, "keys":[I
    const-string v2, "bubble"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    aget-object v2, v2, v10

    .line 585
    invoke-virtual {v2}, Landroid/widget/TextView;->getTotalPaddingRight()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    aget-object v2, v2, v10

    .line 586
    invoke-virtual {v2}, Landroid/widget/TextView;->getTotalPaddingLeft()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    aget-object v2, v2, v10

    .line 587
    invoke-virtual {v2}, Landroid/widget/TextView;->getTotalPaddingTop()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    aget-object v2, v2, v10

    .line 588
    invoke-virtual {v2}, Landroid/widget/TextView;->getTotalPaddingBottom()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    aget-object v2, v2, v10

    .line 589
    invoke-virtual {v2}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v0, Lnaarad/client/tabhost/NaaradControlFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    iget v2, v2, Lnaarad/client/tabhost/NaaradApp;->densityDpi:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 584
    invoke-virtual {v7, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 593
    const/4 v1, -0x1

    if-eq v4, v1, :cond_3

    if-eq v5, v1, :cond_3

    .line 594
    iget-object v2, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    iget-object v7, v0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    aget-object v21, v7, v10

    sub-int v7, v4, v8

    sub-int v22, v7, v13

    sub-int v23, v5, v9

    const/high16 v26, 0x3f800000    # 1.0f

    const/high16 v27, 0x3f800000    # 1.0f

    move-object/from16 v20, v2

    move/from16 v24, v6

    move/from16 v25, v11

    invoke-virtual/range {v20 .. v27}, Lnaarad/client/tabhost/NaaradDnDParameters;->moveView(Landroid/view/View;IIIIFF)V

    .line 572
    .end local v6    # "width":I
    .end local v11    # "height":I
    .end local v13    # "xPadding":I
    .end local v15    # "yPadding":I
    :cond_3
    add-int/lit8 v10, v10, 0x1

    move-object/from16 v1, p1

    move-object/from16 v2, v28

    const/4 v6, 0x0

    const/4 v7, 0x1

    goto/16 :goto_2

    .end local v28    # "keys":[I
    .restart local v2    # "keys":[I
    :cond_4
    move-object/from16 v28, v2

    .line 602
    .end local v2    # "keys":[I
    .end local v10    # "i":I
    .restart local v28    # "keys":[I
    iget-object v1, v0, Lnaarad/client/tabhost/NaaradControlFragment;->mActivity0:Landroid/app/Activity;

    invoke-direct {v0, v1}, Lnaarad/client/tabhost/NaaradControlFragment;->makeHandlers(Landroid/app/Activity;)V

    .line 606
    iget-object v1, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gLampHandler:Landroid/view/View$OnClickListener;

    iget-object v2, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gOnTouchListener:Landroid/view/View$OnTouchListener;

    iget-object v6, v0, Lnaarad/client/tabhost/NaaradControlFragment;->lampArr:[Landroid/widget/ToggleButton;

    iget-object v7, v0, Lnaarad/client/tabhost/NaaradControlFragment;->bulbArr:[Landroid/widget/ImageView;

    invoke-direct {v0, v1, v2, v6, v7}, Lnaarad/client/tabhost/NaaradControlFragment;->installHandlers(Landroid/view/View$OnClickListener;Landroid/view/View$OnTouchListener;[Landroid/widget/ToggleButton;[Landroid/widget/ImageView;)V

    .line 607
    iget-object v1, v0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    iget-object v2, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gBubbleOnTouchListener:Landroid/view/View$OnTouchListener;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 608
    iget-object v1, v0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    const/4 v2, 0x1

    aget-object v1, v1, v2

    iget-object v2, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gBubbleOnTouchListener:Landroid/view/View$OnTouchListener;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 609
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 616
    invoke-super {p0, p1, p2, p3}, Lnaarad/client/tabhost/NaaradAbstractFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    .line 617
    invoke-virtual {p0}, Lnaarad/client/tabhost/NaaradControlFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lnaarad/client/tabhost/NaaradApp;

    iput-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    .line 620
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lnaarad/client/tabhost/NaaradControlFragment;->setRetainInstance(Z)V

    .line 621
    invoke-virtual {p0}, Lnaarad/client/tabhost/NaaradControlFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iput-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment;->mActivity0:Landroid/app/Activity;

    .line 622
    new-instance v0, Lnaarad/client/tabhost/NaaradDnDParameters;

    invoke-direct {v0}, Lnaarad/client/tabhost/NaaradDnDParameters;-><init>()V

    iput-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    .line 624
    sget-object v0, Lnaarad/client/tabhost/NaaradControlFragment;->mView:Landroid/view/View;

    invoke-virtual {p0, v0}, Lnaarad/client/tabhost/NaaradControlFragment;->recreateView(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lnaarad/client/tabhost/NaaradControlFragment;->mView:Landroid/view/View;

    return-object v0

    .line 626
    :cond_0
    const v0, 0x7f050005

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    sput-object v0, Lnaarad/client/tabhost/NaaradControlFragment;->mView:Landroid/view/View;

    .line 627
    sget-object v0, Lnaarad/client/tabhost/NaaradControlFragment;->mView:Landroid/view/View;

    invoke-virtual {p0, v0}, Lnaarad/client/tabhost/NaaradControlFragment;->makeSensorIcons(Landroid/view/View;)V

    .line 660
    sget-object v0, Lnaarad/client/tabhost/NaaradControlFragment;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 662
    sget-object v0, Lnaarad/client/tabhost/NaaradControlFragment;->mView:Landroid/view/View;

    return-object v0
.end method

.method public onPause()V
    .locals 11

    .line 678
    invoke-super {p0}, Lnaarad/client/tabhost/NaaradAbstractFragment;->onPause()V

    .line 679
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lnaarad/client/tabhost/NaaradControlFragment;->setRetainInstance(Z)V

    .line 680
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v2, "From NCF::onPause"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 681
    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    .local v1, "xf":D
    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    .line 682
    .local v3, "yf":D
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    iget-object v6, p0, Lnaarad/client/tabhost/NaaradControlFragment;->lampArr:[Landroid/widget/ToggleButton;

    array-length v6, v6

    const/4 v7, 0x0

    const-string v8, "%d"

    if-ge v5, v6, :cond_0

    .line 684
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "bulbX"

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-array v9, v0, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v7

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v9, p0, Lnaarad/client/tabhost/NaaradControlFragment;->bulbArr:[Landroid/widget/ImageView;

    aget-object v9, v9, v5

    invoke-virtual {v9}, Landroid/widget/ImageView;->getRight()I

    move-result v9

    int-to-double v9, v9

    invoke-static {v9, v10}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v9, v9, v1

    double-to-int v9, v9

    invoke-virtual {p0, v6, v9}, Lnaarad/client/tabhost/NaaradControlFragment;->setPreference(Ljava/lang/String;I)V

    .line 685
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "bulbY"

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-array v9, v0, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v7

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lnaarad/client/tabhost/NaaradControlFragment;->bulbArr:[Landroid/widget/ImageView;

    aget-object v7, v7, v5

    invoke-virtual {v7}, Landroid/widget/ImageView;->getTop()I

    move-result v7

    int-to-double v7, v7

    invoke-static {v7, v8}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v7, v7, v3

    double-to-int v7, v7

    invoke-virtual {p0, v6, v7}, Lnaarad/client/tabhost/NaaradControlFragment;->setPreference(Ljava/lang/String;I)V

    .line 682
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 687
    .end local v5    # "i":I
    :cond_0
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_1
    iget-object v6, p0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    array-length v6, v6

    if-ge v5, v6, :cond_1

    .line 689
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "bubbleX"

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-array v9, v0, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v7

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v9, p0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    aget-object v9, v9, v5

    invoke-virtual {v9}, Landroid/widget/TextView;->getRight()I

    move-result v9

    invoke-virtual {p0, v6, v9}, Lnaarad/client/tabhost/NaaradControlFragment;->setPreference(Ljava/lang/String;I)V

    .line 690
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "bubbleY"

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-array v9, v0, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v7

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v9, p0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    aget-object v9, v9, v5

    invoke-virtual {v9}, Landroid/widget/TextView;->getTop()I

    move-result v9

    invoke-virtual {p0, v6, v9}, Lnaarad/client/tabhost/NaaradControlFragment;->setPreference(Ljava/lang/String;I)V

    .line 687
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 693
    .end local v5    # "i":I
    :cond_1
    return-void
.end method

.method public onResume()V
    .locals 4

    .line 666
    invoke-super {p0}, Lnaarad/client/tabhost/NaaradAbstractFragment;->onResume()V

    .line 667
    sget-object v0, Lnaarad/client/tabhost/NaaradControlFragment;->mView:Landroid/view/View;

    invoke-virtual {p0, v0}, Lnaarad/client/tabhost/NaaradControlFragment;->makeSensorIcons(Landroid/view/View;)V

    .line 668
    sget-object v0, Lnaarad/client/tabhost/NaaradControlFragment;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 669
    .local v0, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Offsets: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 672
    invoke-virtual {p0}, Lnaarad/client/tabhost/NaaradControlFragment;->getRetainInstance()Z

    .line 673
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v2, "From NCF::onResume"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 675
    return-void
.end method

.method public sendCommand(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "cmd"    # Ljava/lang/String;

    .line 701
    const-string v0, "\nCheck settings"

    const-string v1, ":"

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 705
    :cond_0
    new-instance v2, Ljava/net/Socket;

    iget-object v3, p0, Lnaarad/client/tabhost/NaaradControlFragment;->serverName:Ljava/lang/String;

    iget v4, p0, Lnaarad/client/tabhost/NaaradControlFragment;->serverPort:I

    invoke-direct {v2, v3, v4}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    iput-object v2, p0, Lnaarad/client/tabhost/NaaradControlFragment;->client:Ljava/net/Socket;

    .line 706
    new-instance v2, Ljava/io/PrintWriter;

    iget-object v3, p0, Lnaarad/client/tabhost/NaaradControlFragment;->client:Ljava/net/Socket;

    invoke-virtual {v3}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    const/4 v4, 0x1

    invoke-direct {v2, v3, v4}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;Z)V

    iput-object v2, p0, Lnaarad/client/tabhost/NaaradControlFragment;->printwriter:Ljava/io/PrintWriter;

    .line 708
    iget-object v2, p0, Lnaarad/client/tabhost/NaaradControlFragment;->printwriter:Ljava/io/PrintWriter;

    const-string v3, "open"

    invoke-virtual {p0, v3}, Lnaarad/client/tabhost/NaaradControlFragment;->mkMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 709
    iget-object v2, p0, Lnaarad/client/tabhost/NaaradControlFragment;->printwriter:Ljava/io/PrintWriter;

    invoke-virtual {v2}, Ljava/io/PrintWriter;->flush()V

    .line 710
    const-wide/16 v2, 0x1f4

    invoke-static {v2, v3}, Landroid/os/SystemClock;->sleep(J)V

    .line 712
    iget-object v4, p0, Lnaarad/client/tabhost/NaaradControlFragment;->printwriter:Ljava/io/PrintWriter;

    invoke-virtual {p0, p1}, Lnaarad/client/tabhost/NaaradControlFragment;->mkMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 714
    iget-object v4, p0, Lnaarad/client/tabhost/NaaradControlFragment;->printwriter:Ljava/io/PrintWriter;

    invoke-virtual {v4}, Ljava/io/PrintWriter;->flush()V

    .line 715
    invoke-static {v2, v3}, Landroid/os/SystemClock;->sleep(J)V

    .line 717
    iget-object v2, p0, Lnaarad/client/tabhost/NaaradControlFragment;->printwriter:Ljava/io/PrintWriter;

    const-string v3, "done"

    invoke-virtual {p0, v3}, Lnaarad/client/tabhost/NaaradControlFragment;->mkMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 718
    iget-object v2, p0, Lnaarad/client/tabhost/NaaradControlFragment;->printwriter:Ljava/io/PrintWriter;

    invoke-virtual {v2}, Ljava/io/PrintWriter;->flush()V

    .line 721
    iget-object v2, p0, Lnaarad/client/tabhost/NaaradControlFragment;->printwriter:Ljava/io/PrintWriter;

    invoke-virtual {v2}, Ljava/io/PrintWriter;->close()V

    .line 722
    iget-object v2, p0, Lnaarad/client/tabhost/NaaradControlFragment;->client:Ljava/net/Socket;

    invoke-virtual {v2}, Ljava/net/Socket;->close()V
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 736
    nop

    .line 737
    const-string v0, "All well"

    return-object v0

    .line 732
    :catch_0
    move-exception v2

    .line 734
    .local v2, "e":Ljava/io/IOException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error connecting to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lnaarad/client/tabhost/NaaradControlFragment;->serverName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lnaarad/client/tabhost/NaaradControlFragment;->serverPort:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 735
    .local v0, "msg":Ljava/lang/String;
    return-object v0

    .line 725
    .end local v0    # "msg":Ljava/lang/String;
    .end local v2    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v2

    .line 727
    .local v2, "e":Ljava/net/UnknownHostException;
    const-string v3, ""

    .line 728
    .local v3, "msg":Ljava/lang/String;
    invoke-virtual {p0}, Lnaarad/client/tabhost/NaaradControlFragment;->isWifiConnected()Z

    move-result v4

    if-nez v4, :cond_1

    const-string v3, "Wifi is not connected.\n"

    .line 729
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "Unknown host: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lnaarad/client/tabhost/NaaradControlFragment;->serverName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lnaarad/client/tabhost/NaaradControlFragment;->serverPort:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 730
    .end local v3    # "msg":Ljava/lang/String;
    .restart local v0    # "msg":Ljava/lang/String;
    return-object v0
.end method

.method public setBubbleValue(IF)V
    .locals 6
    .param p1, "nodeid"    # I
    .param p2, "temp"    # F

    .line 190
    invoke-virtual {p0, p1}, Lnaarad/client/tabhost/NaaradControlFragment;->mapNodeID2Ndx(I)I

    move-result v0

    .line 195
    .local v0, "bubbleID":I
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "%.2f"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 196
    .local v1, "text":Ljava/lang/String;
    iget-object v2, p0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    aget-object v2, v2, v0

    const v3, 0x7f040001

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->getTag(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 197
    .local v2, "unit":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 199
    iget-object v3, p0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    aget-object v3, v3, v0

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    const/high16 v5, 0x7f040000

    invoke-virtual {v3, v5, v4}, Landroid/widget/TextView;->setTag(ILjava/lang/Object;)V

    .line 204
    new-instance v3, Lnaarad/client/tabhost/NaaradControlFragment$1myRunnable;

    iget-object v4, p0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    aget-object v4, v4, v0

    invoke-direct {v3, p0, v4, v1}, Lnaarad/client/tabhost/NaaradControlFragment$1myRunnable;-><init>(Lnaarad/client/tabhost/NaaradControlFragment;Landroid/widget/TextView;Ljava/lang/String;)V

    .line 206
    .local v3, "setTVText":Lnaarad/client/tabhost/NaaradControlFragment$1myRunnable;
    iget-object v4, p0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    aget-object v4, v4, v0

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->post(Ljava/lang/Runnable;)Z

    .line 207
    return-void
.end method

.method public setBulbBG(Landroid/view/View;Z)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "on"    # Z

    .line 213
    if-eqz p2, :cond_0

    .line 215
    move-object v0, p1

    check-cast v0, Landroid/widget/ImageView;

    check-cast v0, Landroid/widget/ImageView;

    iget-object v1, p0, Lnaarad/client/tabhost/NaaradControlFragment;->mActivity0:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020002

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 219
    :cond_0
    move-object v0, p1

    check-cast v0, Landroid/widget/ImageView;

    check-cast v0, Landroid/widget/ImageView;

    iget-object v1, p0, Lnaarad/client/tabhost/NaaradControlFragment;->mActivity0:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020004

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 222
    :goto_0
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 226
    return-void
.end method

.method public setLampBG(Landroid/view/View;)Z
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .line 232
    move-object v0, p1

    check-cast v0, Landroid/widget/ToggleButton;

    invoke-virtual {v0}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v0

    .line 233
    .local v0, "on":Z
    if-eqz v0, :cond_0

    .line 236
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    const/16 v2, 0xff

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    goto :goto_0

    .line 241
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    const/16 v2, 0x80

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 243
    :goto_0
    return v0
.end method

.method public setSensorValues(Ljava/lang/String;)Landroid/widget/TextView;
    .locals 7
    .param p1, "jsonStr"    # Ljava/lang/String;

    .line 133
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 134
    .local v0, "json":Lorg/json/JSONObject;
    const-string v1, "degc"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v1

    double-to-float v1, v1

    .line 138
    .local v1, "temp":F
    const-string v2, "node_id"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    .line 139
    .local v2, "nodeid":I
    invoke-virtual {p0, v2}, Lnaarad/client/tabhost/NaaradControlFragment;->mapNodeID2Ndx(I)I

    move-result v3

    .line 144
    .local v3, "bubbleID":I
    iget-object v4, p0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    aget-object v4, v4, v3

    const v5, 0x7f040001

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->getTag(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 145
    .local v4, "unit":Ljava/lang/String;
    const-string v5, "F"

    if-ne v4, v5, :cond_0

    const/high16 v5, 0x41100000    # 9.0f

    mul-float v5, v5, v1

    const/high16 v6, 0x40a00000    # 5.0f

    div-float/2addr v5, v6

    const/high16 v6, 0x42000000    # 32.0f

    add-float v1, v5, v6

    .line 147
    :cond_0
    invoke-virtual {p0, v2, v1}, Lnaarad/client/tabhost/NaaradControlFragment;->setBubbleValue(IF)V

    .line 148
    iget-object v5, p0, Lnaarad/client/tabhost/NaaradControlFragment;->tempBubbleArr:[Landroid/widget/TextView;

    aget-object v5, v5, v3
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v5

    .line 150
    .end local v0    # "json":Lorg/json/JSONObject;
    .end local v1    # "temp":F
    .end local v2    # "nodeid":I
    .end local v3    # "bubbleID":I
    .end local v4    # "unit":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 153
    .local v0, "e":Lorg/json/JSONException;
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 155
    .end local v0    # "e":Lorg/json/JSONException;
    const/4 v0, 0x0

    return-object v0
.end method
