.class Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb;
.super Ljava/lang/Object;
.source "ActionBarDrawerToggleHoneycomb.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ActionBarDrawerToggleHoneycomb"

.field private static final THEME_ATTRS:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 43
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x101030b

    aput v2, v0, v1

    sput-object v0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb;->THEME_ATTRS:[I

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    return-void
.end method

.method public static getThemeUpIndicator(Landroid/app/Activity;)Landroid/graphics/drawable/Drawable;
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;

    .line 92
    sget-object v0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb;->THEME_ATTRS:[I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 93
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 94
    .local v1, "result":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 95
    return-object v1
.end method

.method public static setActionBarDescription(Ljava/lang/Object;Landroid/app/Activity;I)Ljava/lang/Object;
    .locals 6
    .param p0, "info"    # Ljava/lang/Object;
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "contentDescRes"    # I

    .line 71
    if-nez p0, :cond_0

    .line 72
    new-instance v0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;

    invoke-direct {v0, p1}, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;-><init>(Landroid/app/Activity;)V

    move-object p0, v0

    .line 74
    :cond_0
    move-object v0, p0

    check-cast v0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;

    .line 75
    .local v0, "sii":Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;
    iget-object v1, v0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;->setHomeAsUpIndicator:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_2

    .line 77
    :try_start_0
    invoke-virtual {p1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    .line 78
    .local v1, "actionBar":Landroid/app/ActionBar;
    iget-object v2, v0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;->setHomeActionContentDescription:Ljava/lang/reflect/Method;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v2, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x13

    if-gt v2, v3, :cond_1

    .line 82
    invoke-virtual {v1}, Landroid/app/ActionBar;->getSubtitle()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/ActionBar;->setSubtitle(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    .end local v1    # "actionBar":Landroid/app/ActionBar;
    :cond_1
    goto :goto_0

    .line 84
    :catch_0
    move-exception v1

    .line 85
    .local v1, "e":Ljava/lang/Exception;
    const-string v2, "ActionBarDrawerToggleHoneycomb"

    const-string v3, "Couldn\'t set content description via JB-MR2 API"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 88
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_2
    :goto_0
    return-object p0
.end method

.method public static setActionBarUpIndicator(Ljava/lang/Object;Landroid/app/Activity;Landroid/graphics/drawable/Drawable;I)Ljava/lang/Object;
    .locals 7
    .param p0, "info"    # Ljava/lang/Object;
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p3, "contentDescRes"    # I

    .line 49
    if-nez p0, :cond_0

    .line 50
    new-instance v0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;

    invoke-direct {v0, p1}, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;-><init>(Landroid/app/Activity;)V

    move-object p0, v0

    .line 52
    :cond_0
    move-object v0, p0

    check-cast v0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;

    .line 53
    .local v0, "sii":Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;
    iget-object v1, v0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;->setHomeAsUpIndicator:Ljava/lang/reflect/Method;

    const-string v2, "ActionBarDrawerToggleHoneycomb"

    if-eqz v1, :cond_1

    .line 55
    :try_start_0
    invoke-virtual {p1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    .line 56
    .local v1, "actionBar":Landroid/app/ActionBar;
    iget-object v3, v0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;->setHomeAsUpIndicator:Ljava/lang/reflect/Method;

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p2, v5, v6

    invoke-virtual {v3, v1, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    iget-object v3, v0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;->setHomeActionContentDescription:Ljava/lang/reflect/Method;

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {v3, v1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    nop

    .end local v1    # "actionBar":Landroid/app/ActionBar;
    goto :goto_0

    .line 58
    :catch_0
    move-exception v1

    .line 59
    .local v1, "e":Ljava/lang/Exception;
    const-string v3, "Couldn\'t set home-as-up indicator via JB-MR2 API"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 60
    .end local v1    # "e":Ljava/lang/Exception;
    goto :goto_0

    .line 61
    :cond_1
    iget-object v1, v0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;->upIndicatorView:Landroid/widget/ImageView;

    if-eqz v1, :cond_2

    .line 62
    iget-object v1, v0, Landroid/support/v4/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;->upIndicatorView:Landroid/widget/ImageView;

    invoke-virtual {v1, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 64
    :cond_2
    const-string v1, "Couldn\'t set home-as-up indicator"

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    :goto_0
    return-object p0
.end method
