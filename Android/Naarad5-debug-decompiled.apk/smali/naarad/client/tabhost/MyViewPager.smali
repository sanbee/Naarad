.class public Lnaarad/client/tabhost/MyViewPager;
.super Landroid/support/v4/view/ViewPager;
.source "MyViewPager.java"


# instance fields
.field private enabled:Z

.field private myApp:Lnaarad/client/tabhost/NaaradApp;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 27
    invoke-direct {p0, p1}, Landroid/support/v4/view/ViewPager;-><init>(Landroid/content/Context;)V

    .line 29
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lnaarad/client/tabhost/NaaradApp;

    iput-object v0, p0, Lnaarad/client/tabhost/MyViewPager;->myApp:Lnaarad/client/tabhost/NaaradApp;

    .line 30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnaarad/client/tabhost/MyViewPager;->enabled:Z

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 17
    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 18
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lnaarad/client/tabhost/NaaradApp;

    iput-object v0, p0, Lnaarad/client/tabhost/MyViewPager;->myApp:Lnaarad/client/tabhost/NaaradApp;

    .line 19
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnaarad/client/tabhost/MyViewPager;->enabled:Z

    .line 22
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lnaarad/client/tabhost/MyViewPager;->setOffscreenPageLimit(I)V

    .line 23
    return-void
.end method


# virtual methods
.method public enableSwipe(Z)V
    .locals 0
    .param p1, "enable"    # Z

    .line 35
    iput-boolean p1, p0, Lnaarad/client/tabhost/MyViewPager;->enabled:Z

    .line 36
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 56
    iget-object v0, p0, Lnaarad/client/tabhost/MyViewPager;->myApp:Lnaarad/client/tabhost/NaaradApp;

    invoke-virtual {v0}, Lnaarad/client/tabhost/NaaradApp;->getSwipeState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 57
    invoke-super {p0, p1}, Landroid/support/v4/view/ViewPager;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 59
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 42
    iget-object v0, p0, Lnaarad/client/tabhost/MyViewPager;->myApp:Lnaarad/client/tabhost/NaaradApp;

    invoke-virtual {v0}, Lnaarad/client/tabhost/NaaradApp;->getSwipeState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 43
    invoke-super {p0, p1}, Landroid/support/v4/view/ViewPager;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 45
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setPagingEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .line 64
    iput-boolean p1, p0, Lnaarad/client/tabhost/MyViewPager;->enabled:Z

    .line 65
    return-void
.end method
