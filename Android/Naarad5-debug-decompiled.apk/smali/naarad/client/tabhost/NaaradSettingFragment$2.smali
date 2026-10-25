.class Lnaarad/client/tabhost/NaaradSettingFragment$2;
.super Ljava/lang/Object;
.source "NaaradSettingFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnaarad/client/tabhost/NaaradSettingFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lnaarad/client/tabhost/NaaradSettingFragment;


# direct methods
.method constructor <init>(Lnaarad/client/tabhost/NaaradSettingFragment;)V
    .locals 0
    .param p1, "this$0"    # Lnaarad/client/tabhost/NaaradSettingFragment;

    .line 205
    iput-object p1, p0, Lnaarad/client/tabhost/NaaradSettingFragment$2;->this$0:Lnaarad/client/tabhost/NaaradSettingFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 208
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment$2;->this$0:Lnaarad/client/tabhost/NaaradSettingFragment;

    move-object v1, p1

    check-cast v1, Landroid/widget/CheckBox;

    invoke-virtual {v0, v1}, Lnaarad/client/tabhost/NaaradSettingFragment;->wakeLockClick(Landroid/widget/CheckBox;)V

    .line 209
    return-void
.end method
