.class Lnaarad/client/tabhost/MainActivity$mRunnable;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnaarad/client/tabhost/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "mRunnable"
.end annotation


# instance fields
.field theColor:I

.field theText:Ljava/lang/String;

.field final synthetic this$0:Lnaarad/client/tabhost/MainActivity;


# direct methods
.method constructor <init>(Lnaarad/client/tabhost/MainActivity;)V
    .locals 1
    .param p1, "this$0"    # Lnaarad/client/tabhost/MainActivity;

    .line 41
    iput-object p1, p0, Lnaarad/client/tabhost/MainActivity$mRunnable;->this$0:Lnaarad/client/tabhost/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const/4 v0, 0x0

    iput-object v0, p0, Lnaarad/client/tabhost/MainActivity$mRunnable;->theText:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 50
    iget-object v0, p0, Lnaarad/client/tabhost/MainActivity$mRunnable;->this$0:Lnaarad/client/tabhost/MainActivity;

    invoke-static {v0}, Lnaarad/client/tabhost/MainActivity;->access$000(Lnaarad/client/tabhost/MainActivity;)Landroid/widget/TextView;

    move-result-object v0

    iget v1, p0, Lnaarad/client/tabhost/MainActivity$mRunnable;->theColor:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Lnaarad/client/tabhost/MainActivity$mRunnable;->this$0:Lnaarad/client/tabhost/MainActivity;

    invoke-static {v0}, Lnaarad/client/tabhost/MainActivity;->access$100(Lnaarad/client/tabhost/MainActivity;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lnaarad/client/tabhost/MainActivity$mRunnable;->theText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setText(Ljava/lang/String;I)V
    .locals 0
    .param p1, "thisText"    # Ljava/lang/String;
    .param p2, "thisColor"    # I

    .line 47
    iput-object p1, p0, Lnaarad/client/tabhost/MainActivity$mRunnable;->theText:Ljava/lang/String;

    iput p2, p0, Lnaarad/client/tabhost/MainActivity$mRunnable;->theColor:I

    return-void
.end method
