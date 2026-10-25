.class public Lnaarad/client/tabhost/NaaradApp;
.super Landroid/app/Application;
.source "NaaradApp.java"


# instance fields
.field public densityDpi:F

.field public metrics:Landroid/util/DisplayMetrics;

.field public myWakeLock:Landroid/os/PowerManager$WakeLock;

.field public myWifiLock:Landroid/net/wifi/WifiManager$WifiLock;

.field public myWifiManager:Landroid/net/wifi/WifiManager;

.field public swipeEnabled:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 12
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    .line 14
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnaarad/client/tabhost/NaaradApp;->swipeEnabled:Z

    .line 16
    const/4 v0, 0x0

    iput-object v0, p0, Lnaarad/client/tabhost/NaaradApp;->myWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 17
    iput-object v0, p0, Lnaarad/client/tabhost/NaaradApp;->myWifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    .line 18
    iput-object v0, p0, Lnaarad/client/tabhost/NaaradApp;->myWifiManager:Landroid/net/wifi/WifiManager;

    .line 19
    iput-object v0, p0, Lnaarad/client/tabhost/NaaradApp;->metrics:Landroid/util/DisplayMetrics;

    return-void
.end method


# virtual methods
.method public dpToPixel(I)I
    .locals 2
    .param p1, "dp"    # I

    .line 70
    int-to-float v0, p1

    iget v1, p0, Lnaarad/client/tabhost/NaaradApp;->densityDpi:F

    mul-float v0, v0, v1

    float-to-int v0, v0

    return v0
.end method

.method public getSwipeState()Z
    .locals 1

    .line 23
    iget-boolean v0, p0, Lnaarad/client/tabhost/NaaradApp;->swipeEnabled:Z

    return v0
.end method

.method public makeLocks()V
    .locals 4

    .line 39
    const-string v0, "power"

    invoke-virtual {p0, v0}, Lnaarad/client/tabhost/NaaradApp;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    .line 40
    .local v0, "wakeLockPM":Landroid/os/PowerManager;
    const-string v1, "wifi"

    invoke-virtual {p0, v1}, Lnaarad/client/tabhost/NaaradApp;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/wifi/WifiManager;

    iput-object v1, p0, Lnaarad/client/tabhost/NaaradApp;->myWifiManager:Landroid/net/wifi/WifiManager;

    .line 43
    const/4 v1, 0x1

    const-string v2, "MyWakelockTag"

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v2

    iput-object v2, p0, Lnaarad/client/tabhost/NaaradApp;->myWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 44
    iget-object v2, p0, Lnaarad/client/tabhost/NaaradApp;->myWifiManager:Landroid/net/wifi/WifiManager;

    const-string v3, "MyWifiLockTag"

    invoke-virtual {v2, v1, v3}, Landroid/net/wifi/WifiManager;->createWifiLock(ILjava/lang/String;)Landroid/net/wifi/WifiManager$WifiLock;

    move-result-object v1

    iput-object v1, p0, Lnaarad/client/tabhost/NaaradApp;->myWifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    .line 46
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v2, "Making wakelock"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 48
    return-void
.end method

.method public onCreate()V
    .locals 3

    .line 52
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 54
    const-string v0, "window"

    invoke-virtual {p0, v0}, Lnaarad/client/tabhost/NaaradApp;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    .line 55
    .local v0, "mgr":Landroid/view/WindowManager;
    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    iput-object v1, p0, Lnaarad/client/tabhost/NaaradApp;->metrics:Landroid/util/DisplayMetrics;

    .line 56
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    iget-object v2, p0, Lnaarad/client/tabhost/NaaradApp;->metrics:Landroid/util/DisplayMetrics;

    invoke-virtual {v1, v2}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 63
    invoke-virtual {p0}, Lnaarad/client/tabhost/NaaradApp;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    iput v1, p0, Lnaarad/client/tabhost/NaaradApp;->densityDpi:F

    .line 65
    const/4 v1, 0x1

    iput-boolean v1, p0, Lnaarad/client/tabhost/NaaradApp;->swipeEnabled:Z

    .line 66
    invoke-virtual {p0}, Lnaarad/client/tabhost/NaaradApp;->makeLocks()V

    .line 67
    return-void
.end method

.method public setSwipeState(Z)V
    .locals 0
    .param p1, "b"    # Z

    .line 28
    iput-boolean p1, p0, Lnaarad/client/tabhost/NaaradApp;->swipeEnabled:Z

    .line 29
    return-void
.end method

.method public setWifiState(Z)V
    .locals 1
    .param p1, "turnON"    # Z

    .line 33
    const-string v0, "wifi"

    invoke-virtual {p0, v0}, Lnaarad/client/tabhost/NaaradApp;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    iput-object v0, p0, Lnaarad/client/tabhost/NaaradApp;->myWifiManager:Landroid/net/wifi/WifiManager;

    .line 34
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradApp;->myWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0, p1}, Landroid/net/wifi/WifiManager;->setWifiEnabled(Z)Z

    .line 35
    return-void
.end method
