.class Lnaarad/client/tabhost/NaaradAbstractFragment$1ToastOnUIThread;
.super Ljava/lang/Object;
.source "NaaradAbstractFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnaarad/client/tabhost/NaaradAbstractFragment;->uiToast(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ToastOnUIThread"
.end annotation


# instance fields
.field final synthetic this$0:Lnaarad/client/tabhost/NaaradAbstractFragment;

.field thisGravity:I

.field thisText:Ljava/lang/String;


# direct methods
.method constructor <init>(Lnaarad/client/tabhost/NaaradAbstractFragment;Ljava/lang/String;I)V
    .locals 0
    .param p1, "this$0"    # Lnaarad/client/tabhost/NaaradAbstractFragment;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "gravity"    # I

    .line 198
    iput-object p1, p0, Lnaarad/client/tabhost/NaaradAbstractFragment$1ToastOnUIThread;->this$0:Lnaarad/client/tabhost/NaaradAbstractFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lnaarad/client/tabhost/NaaradAbstractFragment$1ToastOnUIThread;->thisText:Ljava/lang/String;

    iput p3, p0, Lnaarad/client/tabhost/NaaradAbstractFragment$1ToastOnUIThread;->thisGravity:I

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 199
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradAbstractFragment$1ToastOnUIThread;->this$0:Lnaarad/client/tabhost/NaaradAbstractFragment;

    iget-object v1, p0, Lnaarad/client/tabhost/NaaradAbstractFragment$1ToastOnUIThread;->thisText:Ljava/lang/String;

    iget v2, p0, Lnaarad/client/tabhost/NaaradAbstractFragment$1ToastOnUIThread;->thisGravity:I

    invoke-virtual {v0, v1, v2}, Lnaarad/client/tabhost/NaaradAbstractFragment;->toast(Ljava/lang/String;I)V

    return-void
.end method
