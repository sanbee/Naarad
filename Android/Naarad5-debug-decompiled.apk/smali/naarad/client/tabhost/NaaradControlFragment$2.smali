.class Lnaarad/client/tabhost/NaaradControlFragment$2;
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

    .line 347
    iput-object p1, p0, Lnaarad/client/tabhost/NaaradControlFragment$2;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 6
    .param p1, "e"    # Landroid/view/MotionEvent;

    .line 373
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$2;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    const-string v1, "DnD activated"

    const/16 v2, 0x35

    invoke-virtual {v0, v1, v2}, Lnaarad/client/tabhost/NaaradControlFragment;->toast(Ljava/lang/String;I)V

    .line 374
    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onLongPress(Landroid/view/MotionEvent;)V

    .line 375
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$2;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lnaarad/client/tabhost/NaaradDnDParameters;->touchFlag_p:Z

    .line 377
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$2;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradDnDParameters;->selected_item:Landroid/view/View;

    check-cast v0, Landroid/widget/ImageView;

    const/16 v2, 0x64

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setAlpha(I)V

    .line 379
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$2;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradDnDParameters;->selected_item:Landroid/view/View;

    const v3, -0xff0100

    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 380
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$2;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradDnDParameters;->selected_item:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 387
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$2;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradControlFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lnaarad/client/tabhost/NaaradApp;->setSwipeState(Z)V

    .line 397
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$2;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    float-to-int v3, v3

    iput v3, v0, Lnaarad/client/tabhost/NaaradDnDParameters;->longPress_x:I

    .line 398
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$2;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    float-to-int v3, v3

    iput v3, v0, Lnaarad/client/tabhost/NaaradDnDParameters;->longPress_y:I

    .line 400
    const/4 v0, 0x2

    new-array v0, v0, [I

    .line 401
    .local v0, "loc":[I
    iget-object v3, p0, Lnaarad/client/tabhost/NaaradControlFragment$2;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    iget-object v3, v3, Lnaarad/client/tabhost/NaaradControlFragment;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    iget-object v3, v3, Lnaarad/client/tabhost/NaaradDnDParameters;->selected_item:Landroid/view/View;

    invoke-virtual {v3, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 402
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "On screen (x,y): "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v2, v0, v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v1, v0, v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lnaarad/client/tabhost/NaaradControlFragment$2;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    iget-object v1, v1, Lnaarad/client/tabhost/NaaradControlFragment;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    iget-object v1, v1, Lnaarad/client/tabhost/NaaradDnDParameters;->selected_item:Landroid/view/View;

    .line 404
    invoke-virtual {v1}, Landroid/view/View;->getRight()I

    move-result v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lnaarad/client/tabhost/NaaradControlFragment$2;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    iget-object v1, v1, Lnaarad/client/tabhost/NaaradControlFragment;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    iget-object v1, v1, Lnaarad/client/tabhost/NaaradDnDParameters;->selected_item:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lnaarad/client/tabhost/NaaradControlFragment$2;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    iget-object v1, v1, Lnaarad/client/tabhost/NaaradControlFragment;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    iget v1, v1, Lnaarad/client/tabhost/NaaradDnDParameters;->longPress_x:I

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lnaarad/client/tabhost/NaaradControlFragment$2;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    iget-object v1, v1, Lnaarad/client/tabhost/NaaradControlFragment;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    iget v1, v1, Lnaarad/client/tabhost/NaaradDnDParameters;->longPress_y:I

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 402
    invoke-virtual {v3, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 408
    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 4
    .param p1, "e"    # Landroid/view/MotionEvent;

    .line 354
    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onSingleTapUp(Landroid/view/MotionEvent;)Z

    .line 356
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$2;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradControlFragment;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradDnDParameters;->selected_item:Landroid/view/View;

    const/high16 v1, 0x7f040000

    invoke-virtual {v0, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 358
    .local v0, "tag":I
    iget-object v1, p0, Lnaarad/client/tabhost/NaaradControlFragment$2;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    invoke-static {v1}, Lnaarad/client/tabhost/NaaradControlFragment;->access$200(Lnaarad/client/tabhost/NaaradControlFragment;)[Landroid/widget/ToggleButton;

    move-result-object v1

    aget-object v1, v1, v0

    invoke-virtual {v1}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v1

    .line 359
    .local v1, "on":Z
    iget-object v2, p0, Lnaarad/client/tabhost/NaaradControlFragment$2;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    iget-object v3, v2, Lnaarad/client/tabhost/NaaradControlFragment;->gDnDParams:Lnaarad/client/tabhost/NaaradDnDParameters;

    iget-object v3, v3, Lnaarad/client/tabhost/NaaradDnDParameters;->selected_item:Landroid/view/View;

    invoke-virtual {v2, v3, v1}, Lnaarad/client/tabhost/NaaradControlFragment;->setBulbBG(Landroid/view/View;Z)V

    .line 360
    iget-object v2, p0, Lnaarad/client/tabhost/NaaradControlFragment$2;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    invoke-static {v2}, Lnaarad/client/tabhost/NaaradControlFragment;->access$200(Lnaarad/client/tabhost/NaaradControlFragment;)[Landroid/widget/ToggleButton;

    move-result-object v2

    aget-object v2, v2, v0

    xor-int/lit8 v3, v1, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 361
    iget-object v2, p0, Lnaarad/client/tabhost/NaaradControlFragment$2;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    invoke-static {v2}, Lnaarad/client/tabhost/NaaradControlFragment;->access$200(Lnaarad/client/tabhost/NaaradControlFragment;)[Landroid/widget/ToggleButton;

    move-result-object v3

    aget-object v3, v3, v0

    invoke-virtual {v2, v3}, Lnaarad/client/tabhost/NaaradControlFragment;->lampHandler0(Landroid/view/View;)V

    .line 362
    const/4 v2, 0x0

    return v2
.end method
