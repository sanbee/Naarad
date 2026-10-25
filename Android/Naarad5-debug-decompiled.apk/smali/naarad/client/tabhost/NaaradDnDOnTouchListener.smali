.class public Lnaarad/client/tabhost/NaaradDnDOnTouchListener;
.super Ljava/lang/Object;
.source "NaaradDnDOnTouchListener.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field private gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

.field private gGestureDetector:Landroid/view/GestureDetector;

.field public myApp:Lnaarad/client/tabhost/NaaradApp;

.field private myHeightFudgeFactor:F

.field private mySizeXDP:I

.field private mySizeYDP:I

.field private myWidthFudgeFactor:F


# direct methods
.method public constructor <init>(Landroid/view/GestureDetector;Lnaarad/client/tabhost/NaaradDnDParameters;Lnaarad/client/tabhost/NaaradApp;Ljava/lang/Float;Ljava/lang/Float;II)V
    .locals 1
    .param p1, "thisGestureDetector"    # Landroid/view/GestureDetector;
    .param p2, "thisDnDParams"    # Lnaarad/client/tabhost/NaaradDnDParameters;
    .param p3, "thisApp"    # Lnaarad/client/tabhost/NaaradApp;
    .param p4, "thisWidthFudgeFactor"    # Ljava/lang/Float;
    .param p5, "thisHeightFudgeFactor"    # Ljava/lang/Float;
    .param p6, "sizeXDP"    # I
    .param p7, "sizeYDP"    # I

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lnaarad/client/tabhost/NaaradDnDOnTouchListener;->gGestureDetector:Landroid/view/GestureDetector;

    .line 41
    iput-object p2, p0, Lnaarad/client/tabhost/NaaradDnDOnTouchListener;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    .line 42
    iput-object p3, p0, Lnaarad/client/tabhost/NaaradDnDOnTouchListener;->myApp:Lnaarad/client/tabhost/NaaradApp;

    .line 43
    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iput v0, p0, Lnaarad/client/tabhost/NaaradDnDOnTouchListener;->myWidthFudgeFactor:F

    .line 44
    invoke-virtual {p5}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iput v0, p0, Lnaarad/client/tabhost/NaaradDnDOnTouchListener;->myHeightFudgeFactor:F

    .line 45
    iput p6, p0, Lnaarad/client/tabhost/NaaradDnDOnTouchListener;->mySizeXDP:I

    iput p7, p0, Lnaarad/client/tabhost/NaaradDnDOnTouchListener;->mySizeYDP:I

    .line 47
    return-void
.end method

.method private myOnTouchListener_p(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 6
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .line 151
    const/4 v0, 0x1

    .line 152
    .local v0, "ret":Z
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    .line 154
    .local v1, "act":I
    const/4 v2, 0x2

    if-eq v1, v2, :cond_0

    .line 155
    iget-object v3, p0, Lnaarad/client/tabhost/NaaradDnDOnTouchListener;->gGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v3, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 167
    :cond_0
    iget-object v3, p0, Lnaarad/client/tabhost/NaaradDnDOnTouchListener;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    iput-object p1, v3, Lnaarad/client/tabhost/NaaradDnDParameters;->selected_item:Landroid/view/View;

    .line 169
    const/4 v4, 0x1

    if-eq v1, v4, :cond_2

    if-eq v1, v2, :cond_1

    goto :goto_1

    .line 172
    :cond_1
    iget-boolean v2, v3, Lnaarad/client/tabhost/NaaradDnDParameters;->touchFlag_p:Z

    if-eqz v2, :cond_5

    .line 174
    invoke-virtual {p0, p1, p2, v4}, Lnaarad/client/tabhost/NaaradDnDOnTouchListener;->containerOnTouch(Landroid/view/View;Landroid/view/MotionEvent;Z)Z

    move-result v0

    goto :goto_1

    .line 177
    :cond_2
    const/4 v2, 0x0

    iput-boolean v2, v3, Lnaarad/client/tabhost/NaaradDnDParameters;->touchFlag_p:Z

    .line 179
    instance-of v3, p1, Landroid/widget/ImageView;

    if-eqz v3, :cond_3

    .line 181
    move-object v3, p1

    check-cast v3, Landroid/widget/ImageView;

    const/16 v5, 0xff

    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setAlpha(I)V

    .line 182
    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    goto :goto_0

    .line 184
    :cond_3
    instance-of v2, p1, Landroid/widget/TextView;

    if-eqz v2, :cond_4

    .line 187
    move-object v2, p1

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const/16 v3, 0x64

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 192
    :cond_4
    :goto_0
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Drop pos.: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 198
    iget-object v2, p0, Lnaarad/client/tabhost/NaaradDnDOnTouchListener;->myApp:Lnaarad/client/tabhost/NaaradApp;

    invoke-virtual {v2, v4}, Lnaarad/client/tabhost/NaaradApp;->setSwipeState(Z)V

    .line 201
    :cond_5
    :goto_1
    return v0
.end method


# virtual methods
.method public containerOnTouch(Landroid/view/View;Landroid/view/MotionEvent;Z)Z
    .locals 26
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;
    .param p3, "touchFlag_l"    # Z

    .line 77
    move-object/from16 v0, p0

    const/4 v1, 0x1

    move/from16 v2, p3

    if-ne v2, v1, :cond_1

    if-eqz p1, :cond_1

    .line 80
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v3

    const/4 v4, 0x2

    if-eq v3, v4, :cond_0

    goto/16 :goto_0

    .line 83
    :cond_0
    const/4 v3, 0x0

    .local v3, "oX":I
    const/4 v4, 0x0

    .line 84
    .local v4, "oY":I
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    float-to-int v11, v5

    .line 85
    .local v11, "pX":I
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    float-to-int v12, v5

    .line 89
    .local v12, "pY":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getHeight()I

    move-result v13

    .line 90
    .local v13, "w":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getWidth()I

    move-result v14

    .line 91
    .local v14, "h":I
    iget-object v5, v0, Lnaarad/client/tabhost/NaaradDnDOnTouchListener;->myApp:Lnaarad/client/tabhost/NaaradApp;

    iget v6, v0, Lnaarad/client/tabhost/NaaradDnDOnTouchListener;->mySizeXDP:I

    invoke-virtual {v5, v6}, Lnaarad/client/tabhost/NaaradApp;->dpToPixel(I)I

    move-result v15

    .line 92
    .end local v3    # "oX":I
    .local v15, "oX":I
    iget-object v3, v0, Lnaarad/client/tabhost/NaaradDnDOnTouchListener;->myApp:Lnaarad/client/tabhost/NaaradApp;

    iget v5, v0, Lnaarad/client/tabhost/NaaradDnDOnTouchListener;->mySizeYDP:I

    invoke-virtual {v3, v5}, Lnaarad/client/tabhost/NaaradApp;->dpToPixel(I)I

    move-result v16

    .line 96
    .end local v4    # "oY":I
    .local v16, "oY":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getRight()I

    move-result v17

    .line 97
    .local v17, "iX":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTop()I

    move-result v18

    .line 99
    .local v18, "iY":I
    sub-int v3, v11, v15

    add-int v3, v3, v17

    .line 100
    .local v3, "x":I
    sub-int v4, v12, v16

    add-int v4, v4, v18

    .line 102
    .local v4, "y":I
    mul-int/lit8 v5, v15, 0x2

    sub-int/2addr v5, v11

    .local v5, "dx":I
    sub-int v6, v16, v12

    .line 104
    .local v6, "dy":I
    iget-object v7, v0, Lnaarad/client/tabhost/NaaradDnDOnTouchListener;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    iget v7, v7, Lnaarad/client/tabhost/NaaradDnDParameters;->longPress_x:I

    sub-int v7, v11, v7

    neg-int v10, v7

    .line 105
    .end local v5    # "dx":I
    .local v10, "dx":I
    iget-object v5, v0, Lnaarad/client/tabhost/NaaradDnDOnTouchListener;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    iget v5, v5, Lnaarad/client/tabhost/NaaradDnDParameters;->longPress_y:I

    sub-int v5, v12, v5

    neg-int v9, v5

    .line 106
    .end local v6    # "dy":I
    .local v9, "dy":I
    const/high16 v19, 0x3f480000    # 0.78125f

    .local v19, "scalex":F
    const/high16 v20, 0x3f200000    # 0.625f

    .line 107
    .local v20, "scaley":F
    sub-int v5, v17, v10

    int-to-float v5, v5

    const/high16 v6, 0x42580000    # 54.0f

    mul-float v6, v6, v19

    sub-float/2addr v5, v6

    float-to-int v8, v5

    .end local v3    # "x":I
    .local v8, "x":I
    sub-int v3, v18, v9

    int-to-float v3, v3

    const/high16 v5, 0x41c00000    # 24.0f

    mul-float v5, v5, v20

    sub-float/2addr v3, v5

    float-to-int v7, v3

    .line 116
    .end local v4    # "y":I
    .local v7, "y":I
    iget-object v3, v0, Lnaarad/client/tabhost/NaaradDnDOnTouchListener;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    const/high16 v21, 0x3f800000    # 1.0f

    const/high16 v22, 0x3f800000    # 1.0f

    move-object/from16 v4, p1

    move v5, v8

    move v6, v7

    move/from16 v23, v7

    .end local v7    # "y":I
    .local v23, "y":I
    move v7, v15

    move/from16 v24, v8

    .end local v8    # "x":I
    .local v24, "x":I
    move/from16 v8, v16

    move/from16 v25, v9

    .end local v9    # "dy":I
    .local v25, "dy":I
    move/from16 v9, v21

    move/from16 v21, v10

    .end local v10    # "dx":I
    .local v21, "dx":I
    move/from16 v10, v22

    invoke-virtual/range {v3 .. v10}, Lnaarad/client/tabhost/NaaradDnDParameters;->moveView(Landroid/view/View;IIIIFF)V

    .line 146
    .end local v11    # "pX":I
    .end local v12    # "pY":I
    .end local v13    # "w":I
    .end local v14    # "h":I
    .end local v15    # "oX":I
    .end local v16    # "oY":I
    .end local v17    # "iX":I
    .end local v18    # "iY":I
    .end local v19    # "scalex":F
    .end local v20    # "scaley":F
    .end local v21    # "dx":I
    .end local v23    # "y":I
    .end local v24    # "x":I
    .end local v25    # "dy":I
    :cond_1
    :goto_0
    return v1
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .line 206
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradDnDOnTouchListener;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    iput-object p1, v0, Lnaarad/client/tabhost/NaaradDnDParameters;->selected_item:Landroid/view/View;

    .line 207
    invoke-direct {p0, p1, p2}, Lnaarad/client/tabhost/NaaradDnDOnTouchListener;->myOnTouchListener_p(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method
