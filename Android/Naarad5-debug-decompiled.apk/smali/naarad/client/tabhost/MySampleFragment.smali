.class public Lnaarad/client/tabhost/MySampleFragment;
.super Landroid/support/v4/app/Fragment;
.source "MySampleFragment.java"


# static fields
.field private static mView:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    return-void
.end method

.method public static final newInstance(Ljava/lang/String;)Lnaarad/client/tabhost/MySampleFragment;
    .locals 3
    .param p0, "sampleText"    # Ljava/lang/String;

    .line 15
    new-instance v0, Lnaarad/client/tabhost/MySampleFragment;

    invoke-direct {v0}, Lnaarad/client/tabhost/MySampleFragment;-><init>()V

    .line 17
    .local v0, "f":Lnaarad/client/tabhost/MySampleFragment;
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 18
    .local v1, "b":Landroid/os/Bundle;
    const-string v2, "bString"

    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    invoke-virtual {v0, v1}, Lnaarad/client/tabhost/MySampleFragment;->setArguments(Landroid/os/Bundle;)V

    .line 21
    return-object v0
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 28
    const v0, 0x7f050002

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    sput-object v0, Lnaarad/client/tabhost/MySampleFragment;->mView:Landroid/view/View;

    .line 30
    invoke-virtual {p0}, Lnaarad/client/tabhost/MySampleFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "bString"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 32
    .local v0, "sampleText":Ljava/lang/String;
    sget-object v1, Lnaarad/client/tabhost/MySampleFragment;->mView:Landroid/view/View;

    .line 33
    const v2, 0x7f030017

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 34
    .local v1, "txtSampleText":Landroid/widget/TextView;
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    sget-object v2, Lnaarad/client/tabhost/MySampleFragment;->mView:Landroid/view/View;

    return-object v2
.end method
