.class Lnaarad/client/tabhost/NaaradControlFragment$1;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "NaaradControlFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnaarad/client/tabhost/NaaradControlFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lnaarad/client/tabhost/NaaradControlFragment;


# direct methods
.method constructor <init>(Lnaarad/client/tabhost/NaaradControlFragment;)V
    .locals 0
    .param p1, "this$0"    # Lnaarad/client/tabhost/NaaradControlFragment;

    .line 284
    iput-object p1, p0, Lnaarad/client/tabhost/NaaradControlFragment$1;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .line 318
    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onLongPress(Landroid/view/MotionEvent;)V

    .line 319
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$1;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    const-string v1, "DnD activated"

    const/16 v2, 0x35

    invoke-virtual {v0, v1, v2}, Lnaarad/client/tabhost/NaaradControlFragment;->toast(Ljava/lang/String;I)V

    .line 321
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$1;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lnaarad/client/tabhost/NaaradDnDParameters;->touchFlag_p:Z

    .line 324
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$1;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradDnDParameters;->selected_item:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/16 v1, 0x50

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 326
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$1;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradControlFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lnaarad/client/tabhost/NaaradApp;->setSwipeState(Z)V

    .line 328
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$1;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    float-to-int v1, v1

    iput v1, v0, Lnaarad/client/tabhost/NaaradDnDParameters;->longPress_x:I

    .line 329
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$1;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    float-to-int v1, v1

    iput v1, v0, Lnaarad/client/tabhost/NaaradDnDParameters;->longPress_y:I

    .line 338
    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 8
    .param p1, "e"    # Landroid/view/MotionEvent;

    .line 287
    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onSingleTapUp(Landroid/view/MotionEvent;)Z

    .line 288
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$1;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    invoke-static {v0}, Lnaarad/client/tabhost/NaaradControlFragment;->access$100(Lnaarad/client/tabhost/NaaradControlFragment;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    invoke-static {v0, v1}, Lnaarad/client/tabhost/NaaradControlFragment;->access$102(Lnaarad/client/tabhost/NaaradControlFragment;Z)Z

    .line 291
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$1;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradDnDParameters;->selected_item:Landroid/view/View;

    const/high16 v1, 0x7f040000

    invoke-virtual {v0, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    .line 292
    .local v0, "tt":F
    iget-object v1, p0, Lnaarad/client/tabhost/NaaradControlFragment$1;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    iget-object v1, v1, Lnaarad/client/tabhost/NaaradControlFragment;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    iget-object v1, v1, Lnaarad/client/tabhost/NaaradDnDParameters;->selected_item:Landroid/view/View;

    const v2, 0x7f040001

    invoke-virtual {v1, v2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 293
    .local v1, "unit":Ljava/lang/String;
    iget-object v3, p0, Lnaarad/client/tabhost/NaaradControlFragment$1;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    iget-object v3, v3, Lnaarad/client/tabhost/NaaradControlFragment;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    iget-object v3, v3, Lnaarad/client/tabhost/NaaradDnDParameters;->selected_item:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 295
    .local v3, "nodeid":I
    const/high16 v4, 0x41100000    # 9.0f

    const/high16 v5, 0x40a00000    # 5.0f

    const/high16 v6, 0x42000000    # 32.0f

    const-string v7, "C"

    if-ne v1, v7, :cond_0

    .line 297
    mul-float v4, v4, v0

    div-float/2addr v4, v5

    add-float/2addr v4, v6

    .line 298
    .end local v0    # "tt":F
    .local v4, "tt":F
    const-string v0, "F"

    .end local v1    # "unit":Ljava/lang/String;
    .local v0, "unit":Ljava/lang/String;
    goto :goto_0

    .line 302
    .end local v4    # "tt":F
    .local v0, "tt":F
    .restart local v1    # "unit":Ljava/lang/String;
    :cond_0
    sub-float v6, v0, v6

    mul-float v6, v6, v5

    div-float v4, v6, v4

    .line 303
    .end local v0    # "tt":F
    .restart local v4    # "tt":F
    const-string v0, "C"

    .line 305
    .end local v1    # "unit":Ljava/lang/String;
    .local v0, "unit":Ljava/lang/String;
    :goto_0
    iget-object v1, p0, Lnaarad/client/tabhost/NaaradControlFragment$1;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    iget-object v1, v1, Lnaarad/client/tabhost/NaaradControlFragment;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    iget-object v1, v1, Lnaarad/client/tabhost/NaaradDnDParameters;->selected_item:Landroid/view/View;

    invoke-virtual {v1, v2, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 311
    iget-object v1, p0, Lnaarad/client/tabhost/NaaradControlFragment$1;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    invoke-virtual {v1, v3, v4}, Lnaarad/client/tabhost/NaaradControlFragment;->setBubbleValue(IF)V

    .line 313
    const/4 v1, 0x0

    return v1
.end method
