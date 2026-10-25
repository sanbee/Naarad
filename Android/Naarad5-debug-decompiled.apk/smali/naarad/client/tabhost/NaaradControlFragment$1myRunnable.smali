.class Lnaarad/client/tabhost/NaaradControlFragment$1myRunnable;
.super Ljava/lang/Object;
.source "NaaradControlFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnaarad/client/tabhost/NaaradControlFragment;->setBubbleValue(IF)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "myRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lnaarad/client/tabhost/NaaradControlFragment;

.field thisID:I

.field thisTV:Landroid/widget/TextView;

.field thisText:Ljava/lang/String;

.field tmp:Landroid/text/Spanned;


# direct methods
.method constructor <init>(Lnaarad/client/tabhost/NaaradControlFragment;Landroid/widget/TextView;Landroid/text/Spanned;)V
    .locals 1
    .param p1, "this$0"    # Lnaarad/client/tabhost/NaaradControlFragment;
    .param p2, "tv"    # Landroid/widget/TextView;
    .param p3, "text"    # Landroid/text/Spanned;

    .line 174
    iput-object p1, p0, Lnaarad/client/tabhost/NaaradControlFragment$1myRunnable;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 161
    const/4 v0, 0x0

    iput v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$1myRunnable;->thisID:I

    .line 175
    iput-object p2, p0, Lnaarad/client/tabhost/NaaradControlFragment$1myRunnable;->thisTV:Landroid/widget/TextView;

    .line 176
    iput-object p3, p0, Lnaarad/client/tabhost/NaaradControlFragment$1myRunnable;->tmp:Landroid/text/Spanned;

    .line 177
    return-void
.end method

.method constructor <init>(Lnaarad/client/tabhost/NaaradControlFragment;Landroid/widget/TextView;Ljava/lang/String;)V
    .locals 2
    .param p1, "this$0"    # Lnaarad/client/tabhost/NaaradControlFragment;
    .param p2, "tv"    # Landroid/widget/TextView;
    .param p3, "text"    # Ljava/lang/String;

    .line 169
    iput-object p1, p0, Lnaarad/client/tabhost/NaaradControlFragment$1myRunnable;->this$0:Lnaarad/client/tabhost/NaaradControlFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 161
    const/4 v0, 0x0

    iput v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$1myRunnable;->thisID:I

    .line 170
    iput-object p2, p0, Lnaarad/client/tabhost/NaaradControlFragment$1myRunnable;->thisTV:Landroid/widget/TextView;

    iput-object p3, p0, Lnaarad/client/tabhost/NaaradControlFragment$1myRunnable;->thisText:Ljava/lang/String;

    .line 171
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<p><b>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lnaarad/client/tabhost/NaaradControlFragment$1myRunnable;->thisText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "</b><font size =\"50\" color=\"#0066FF\"></font></p>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    iput-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$1myRunnable;->tmp:Landroid/text/Spanned;

    .line 172
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 185
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$1myRunnable;->thisTV:Landroid/widget/TextView;

    iget-object v1, p0, Lnaarad/client/tabhost/NaaradControlFragment$1myRunnable;->tmp:Landroid/text/Spanned;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 186
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$1myRunnable;->thisTV:Landroid/widget/TextView;

    const/4 v1, 0x1

    const/high16 v2, 0x41400000    # 12.0f

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 187
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradControlFragment$1myRunnable;->thisTV:Landroid/widget/TextView;

    const-string v1, "white"

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 188
    return-void
.end method
