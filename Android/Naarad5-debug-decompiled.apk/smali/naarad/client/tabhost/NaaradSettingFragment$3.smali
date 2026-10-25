.class Lnaarad/client/tabhost/NaaradSettingFragment$3;
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

    .line 214
    iput-object p1, p0, Lnaarad/client/tabhost/NaaradSettingFragment$3;->this$0:Lnaarad/client/tabhost/NaaradSettingFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .line 217
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment$3;->this$0:Lnaarad/client/tabhost/NaaradSettingFragment;

    invoke-virtual {v0}, Lnaarad/client/tabhost/NaaradSettingFragment;->getDefaultPort()I

    move-result v1

    invoke-static {v0, v1}, Lnaarad/client/tabhost/NaaradSettingFragment;->access$002(Lnaarad/client/tabhost/NaaradSettingFragment;I)I

    .line 218
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment$3;->this$0:Lnaarad/client/tabhost/NaaradSettingFragment;

    invoke-static {v0}, Lnaarad/client/tabhost/NaaradSettingFragment;->access$200(Lnaarad/client/tabhost/NaaradSettingFragment;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lnaarad/client/tabhost/NaaradSettingFragment;->access$102(Lnaarad/client/tabhost/NaaradSettingFragment;Ljava/lang/String;)Ljava/lang/String;

    .line 221
    :try_start_0
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment$3;->this$0:Lnaarad/client/tabhost/NaaradSettingFragment;

    iget-object v1, p0, Lnaarad/client/tabhost/NaaradSettingFragment$3;->this$0:Lnaarad/client/tabhost/NaaradSettingFragment;

    invoke-static {v1}, Lnaarad/client/tabhost/NaaradSettingFragment;->access$300(Lnaarad/client/tabhost/NaaradSettingFragment;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v0, v1}, Lnaarad/client/tabhost/NaaradSettingFragment;->access$002(Lnaarad/client/tabhost/NaaradSettingFragment;I)I

    .line 222
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment$3;->this$0:Lnaarad/client/tabhost/NaaradSettingFragment;

    invoke-static {v0}, Lnaarad/client/tabhost/NaaradSettingFragment;->access$000(Lnaarad/client/tabhost/NaaradSettingFragment;)I

    move-result v0

    if-lez v0, :cond_0

    .line 225
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment$3;->this$0:Lnaarad/client/tabhost/NaaradSettingFragment;

    invoke-static {v0}, Lnaarad/client/tabhost/NaaradSettingFragment;->access$400(Lnaarad/client/tabhost/NaaradSettingFragment;)Landroid/widget/Button;

    move-result-object v0

    const v1, -0xff0100

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V

    .line 233
    goto :goto_0

    .line 223
    :cond_0
    new-instance v0, Ljava/lang/NumberFormatException;

    const-string v1, "Port number < 0"

    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    .end local p1    # "v":Landroid/view/View;
    throw v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 227
    .restart local p1    # "v":Landroid/view/View;
    :catch_0
    move-exception v0

    .line 229
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Wrong Port number: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 230
    .local v1, "msg":Ljava/lang/String;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v2, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 231
    iget-object v2, p0, Lnaarad/client/tabhost/NaaradSettingFragment$3;->this$0:Lnaarad/client/tabhost/NaaradSettingFragment;

    invoke-virtual {v2}, Lnaarad/client/tabhost/NaaradSettingFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 232
    iget-object v2, p0, Lnaarad/client/tabhost/NaaradSettingFragment$3;->this$0:Lnaarad/client/tabhost/NaaradSettingFragment;

    invoke-static {v2}, Lnaarad/client/tabhost/NaaradSettingFragment;->access$400(Lnaarad/client/tabhost/NaaradSettingFragment;)Landroid/widget/Button;

    move-result-object v2

    const/high16 v3, -0x10000

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setTextColor(I)V

    .line 235
    .end local v0    # "nfe":Ljava/lang/NumberFormatException;
    .end local v1    # "msg":Ljava/lang/String;
    :goto_0
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment$3;->this$0:Lnaarad/client/tabhost/NaaradSettingFragment;

    invoke-static {v0}, Lnaarad/client/tabhost/NaaradSettingFragment;->access$100(Lnaarad/client/tabhost/NaaradSettingFragment;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "serverName"

    invoke-virtual {v0, v2, v1}, Lnaarad/client/tabhost/NaaradSettingFragment;->setPreference(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment$3;->this$0:Lnaarad/client/tabhost/NaaradSettingFragment;

    invoke-static {v0}, Lnaarad/client/tabhost/NaaradSettingFragment;->access$000(Lnaarad/client/tabhost/NaaradSettingFragment;)I

    move-result v1

    const-string v2, "serverPort"

    invoke-virtual {v0, v2, v1}, Lnaarad/client/tabhost/NaaradSettingFragment;->setPreference(Ljava/lang/String;I)V

    .line 240
    return-void
.end method
