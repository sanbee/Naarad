.class Landroid/support/v4/net/ConnectivityManagerCompat$BaseConnectivityManagerCompatImpl;
.super Ljava/lang/Object;
.source "ConnectivityManagerCompat.java"

# interfaces
.implements Landroid/support/v4/net/ConnectivityManagerCompat$ConnectivityManagerCompatImpl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/net/ConnectivityManagerCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "BaseConnectivityManagerCompatImpl"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isActiveNetworkMetered(Landroid/net/ConnectivityManager;)Z
    .locals 3
    .param p1, "cm"    # Landroid/net/ConnectivityManager;

    .line 40
    invoke-virtual {p1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 41
    .local v0, "info":Landroid/net/NetworkInfo;
    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 43
    return v1

    .line 46
    :cond_0
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v2

    .line 47
    .local v2, "type":I
    if-eqz v2, :cond_2

    if-eq v2, v1, :cond_1

    .line 54
    return v1

    .line 51
    :cond_1
    const/4 v1, 0x0

    return v1

    .line 49
    :cond_2
    return v1
.end method
