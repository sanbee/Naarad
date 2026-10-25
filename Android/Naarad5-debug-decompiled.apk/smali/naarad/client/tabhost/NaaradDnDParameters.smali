.class public Lnaarad/client/tabhost/NaaradDnDParameters;
.super Ljava/lang/Object;
.source "NaaradDnDParameters.java"


# instance fields
.field public longPress_x:I

.field public longPress_y:I

.field public selected_item:Landroid/view/View;

.field public touchFlag_p:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnaarad/client/tabhost/NaaradDnDParameters;->touchFlag_p:Z

    return-void
.end method


# virtual methods
.method public moveView(Landroid/view/View;IIIIFF)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "w"    # I
    .param p5, "h"    # I
    .param p6, "wFudge"    # F
    .param p7, "hFudge"    # F

    .line 22
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    new-instance v1, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 25
    .local v0, "lp":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 26
    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 27
    const/4 v1, 0x0

    invoke-virtual {v0, p2, p3, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 29
    if-lez p5, :cond_0

    int-to-float v1, p5

    mul-float v1, v1, p7

    float-to-int v1, v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 30
    :cond_0
    if-lez p4, :cond_1

    int-to-float v1, p4

    mul-float v1, v1, p6

    float-to-int v1, v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 32
    :cond_1
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 33
    return-void
.end method
