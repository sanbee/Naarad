.class Lnaarad/client/tabhost/NaaradControlFragment$3;
.super Ljava/lang/Object;
.source "NaaradControlFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnaarad/client/tabhost/NaaradControlFragment;->makeHandlers(Landroid/app/Activity;)V
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

    .line 421
    iput-object p1, p0, Lnaarad/client/tabhost/NaaradControlFragment$3;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .line 424
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$3;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    invoke-virtual {v0, p1}, Lnaarad/client/tabhost/NaaradControlFragment;->lampHandler0(Landroid/view/View;)V

    .line 425
    return-void
.end method
