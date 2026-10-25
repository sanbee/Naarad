.class Lnaarad/client/tabhost/NaaradControlFragment$SendMessage;
.super Landroid/os/AsyncTask;
.source "NaaradControlFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnaarad/client/tabhost/NaaradControlFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SendMessage"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lnaarad/client/tabhost/NaaradControlFragment;


# direct methods
.method private constructor <init>(Lnaarad/client/tabhost/NaaradControlFragment;)V
    .locals 0

    .line 742
    iput-object p1, p0, Lnaarad/client/tabhost/NaaradControlFragment$SendMessage;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lnaarad/client/tabhost/NaaradControlFragment;Lnaarad/client/tabhost/NaaradControlFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lnaarad/client/tabhost/NaaradControlFragment;
    .param p2, "x1"    # Lnaarad/client/tabhost/NaaradControlFragment$1;

    .line 742
    invoke-direct {p0, p1}, Lnaarad/client/tabhost/NaaradControlFragment$SendMessage;-><init>(Lnaarad/client/tabhost/NaaradControlFragment;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 742
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lnaarad/client/tabhost/NaaradControlFragment$SendMessage;->doInBackground([Ljava/lang/Void;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/String;
    .locals 2
    .param p1, "params"    # [Ljava/lang/Void;

    .line 750
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$SendMessage;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    invoke-static {v0}, Lnaarad/client/tabhost/NaaradControlFragment;->access$300(Lnaarad/client/tabhost/NaaradControlFragment;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnaarad/client/tabhost/NaaradControlFragment;->sendCommand(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 742
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lnaarad/client/tabhost/NaaradControlFragment$SendMessage;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 4
    .param p1, "result"    # Ljava/lang/String;

    .line 754
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 755
    const-string v0, "All well"

    if-eq p1, v0, :cond_0

    .line 758
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$SendMessage;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    const/16 v1, 0x35

    invoke-virtual {v0, p1, v1}, Lnaarad/client/tabhost/NaaradControlFragment;->toast(Ljava/lang/String;I)V

    .line 759
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$SendMessage;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    invoke-static {v0}, Lnaarad/client/tabhost/NaaradControlFragment;->access$400(Lnaarad/client/tabhost/NaaradControlFragment;)Landroid/widget/ToggleButton;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v0

    .line 760
    .local v0, "on":Z
    iget-object v1, p0, Lnaarad/client/tabhost/NaaradControlFragment$SendMessage;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    invoke-static {v1}, Lnaarad/client/tabhost/NaaradControlFragment;->access$400(Lnaarad/client/tabhost/NaaradControlFragment;)Landroid/widget/ToggleButton;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/ToggleButton;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 762
    .local v1, "tag":I
    iget-object v2, p0, Lnaarad/client/tabhost/NaaradControlFragment$SendMessage;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    invoke-static {v2}, Lnaarad/client/tabhost/NaaradControlFragment;->access$400(Lnaarad/client/tabhost/NaaradControlFragment;)Landroid/widget/ToggleButton;

    move-result-object v2

    xor-int/lit8 v3, v0, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 763
    iget-object v2, p0, Lnaarad/client/tabhost/NaaradControlFragment$SendMessage;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    invoke-static {v2}, Lnaarad/client/tabhost/NaaradControlFragment;->access$500(Lnaarad/client/tabhost/NaaradControlFragment;)[Landroid/widget/ImageView;

    move-result-object v3

    aget-object v3, v3, v1

    invoke-virtual {v2, v3, v0}, Lnaarad/client/tabhost/NaaradControlFragment;->setBulbBG(Landroid/view/View;Z)V

    .line 765
    .end local v0    # "on":Z
    .end local v1    # "tag":I
    :cond_0
    return-void
.end method
