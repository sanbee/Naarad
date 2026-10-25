.class public Lnaarad/client/tabhost/NaaradWifiBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "NaaradWifiBroadcastReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .line 14
    const-string v0, "connectivity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 15
    .local v0, "connManager":Landroid/net/ConnectivityManager;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v1

    .line 17
    .local v1, "mWifi":Landroid/net/NetworkInfo;
    const/4 v2, 0x0

    .line 18
    .local v2, "tries":I
    :goto_0
    const/16 v3, 0xa

    const/4 v4, 0x0

    if-ge v2, v3, :cond_1

    .line 20
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 22
    const-string v3, "Checking Wifi..."

    invoke-static {p1, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 23
    goto :goto_1

    .line 27
    :cond_0
    const-wide/16 v3, 0xa

    invoke-static {v3, v4}, Landroid/os/SystemClock;->sleep(J)V

    .line 28
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 31
    :cond_1
    :goto_1
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v3

    if-nez v3, :cond_2

    .line 32
    const-string v3, "Wifi yet not connected..."

    invoke-static {p1, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 84
    :cond_2
    return-void
.end method
