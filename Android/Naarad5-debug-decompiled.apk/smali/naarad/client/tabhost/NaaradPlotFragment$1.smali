.class Lnaarad/client/tabhost/NaaradPlotFragment$1;
.super Ljava/lang/Object;
.source "NaaradPlotFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnaarad/client/tabhost/NaaradPlotFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lnaarad/client/tabhost/NaaradPlotFragment;


# direct methods
.method constructor <init>(Lnaarad/client/tabhost/NaaradPlotFragment;)V
    .locals 0
    .param p1, "this$0"    # Lnaarad/client/tabhost/NaaradPlotFragment;

    .line 212
    iput-object p1, p0, Lnaarad/client/tabhost/NaaradPlotFragment$1;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .line 215
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradPlotFragment$1;->this$0:Lnaarad/client/tabhost/NaaradPlotFragment;

    invoke-virtual {v0}, Lnaarad/client/tabhost/NaaradPlotFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    .line 216
    .local v0, "transaction":Landroid/support/v4/app/FragmentTransaction;
    const-string v1, "Naarad Control Fragment"

    invoke-static {v1}, Lnaarad/client/tabhost/NaaradControlFragment;->newInstance(Ljava/lang/String;)Lnaarad/client/tabhost/NaaradControlFragment;

    move-result-object v1

    .line 223
    .local v1, "f1":Landroid/support/v4/app/Fragment;
    move-object v2, p1

    check-cast v2, Landroid/widget/ToggleButton;

    invoke-virtual {v2}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v2

    .line 225
    .local v2, "on":Z
    if-eqz v2, :cond_0

    .line 226
    const v3, 0x7f030010

    invoke-virtual {v0, v3, v1}, Landroid/support/v4/app/FragmentTransaction;->add(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    goto :goto_0

    .line 229
    :cond_0
    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentTransaction;->hide(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 231
    :goto_0
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 246
    return-void
.end method
