.class public Landroid/support/v4/content/ContextCompat;
.super Ljava/lang/Object;
.source "ContextCompat.java"


# static fields
.field private static final DIR_ANDROID:Ljava/lang/String; = "Android"

.field private static final DIR_CACHE:Ljava/lang/String; = "cache"

.field private static final DIR_DATA:Ljava/lang/String; = "data"

.field private static final DIR_FILES:Ljava/lang/String; = "files"

.field private static final DIR_OBB:Ljava/lang/String; = "obb"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static varargs buildPath(Ljava/io/File;[Ljava/lang/String;)Ljava/io/File;
    .locals 6
    .param p0, "base"    # Ljava/io/File;
    .param p1, "segments"    # [Ljava/lang/String;

    .line 290
    move-object v0, p0

    .line 291
    .local v0, "cur":Ljava/io/File;
    move-object v1, p1

    .local v1, "arr$":[Ljava/lang/String;
    array-length v2, v1

    .local v2, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, v1, v3

    .line 292
    .local v4, "segment":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 293
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object v0, v5

    goto :goto_1

    .line 294
    :cond_0
    if-eqz v4, :cond_1

    .line 295
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v0, v5

    .line 291
    .end local v4    # "segment":Ljava/lang/String;
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 298
    .end local v1    # "arr$":[Ljava/lang/String;
    .end local v2    # "len$":I
    .end local v3    # "i$":I
    :cond_2
    return-object v0
.end method

.method public static getExternalCacheDirs(Landroid/content/Context;)[Ljava/io/File;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;

    .line 274
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 275
    .local v0, "version":I
    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    .line 276
    invoke-static {p0}, Landroid/support/v4/content/ContextCompatKitKat;->getExternalCacheDirs(Landroid/content/Context;)[Ljava/io/File;

    move-result-object v1

    return-object v1

    .line 279
    :cond_0
    const/16 v1, 0x8

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-lt v0, v1, :cond_1

    .line 280
    invoke-static {p0}, Landroid/support/v4/content/ContextCompatFroyo;->getExternalCacheDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v1

    .local v1, "single":Ljava/io/File;
    goto :goto_0

    .line 282
    .end local v1    # "single":Ljava/io/File;
    :cond_1
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/String;

    const-string v5, "Android"

    aput-object v5, v4, v3

    const-string v5, "data"

    aput-object v5, v4, v2

    const/4 v5, 0x2

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x3

    const-string v6, "cache"

    aput-object v6, v4, v5

    invoke-static {v1, v4}, Landroid/support/v4/content/ContextCompat;->buildPath(Ljava/io/File;[Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 285
    .restart local v1    # "single":Ljava/io/File;
    :goto_0
    new-array v2, v2, [Ljava/io/File;

    aput-object v1, v2, v3

    return-object v2
.end method

.method public static getExternalFilesDirs(Landroid/content/Context;Ljava/lang/String;)[Ljava/io/File;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "type"    # Ljava/lang/String;

    .line 214
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 215
    .local v0, "version":I
    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    .line 216
    invoke-static {p0, p1}, Landroid/support/v4/content/ContextCompatKitKat;->getExternalFilesDirs(Landroid/content/Context;Ljava/lang/String;)[Ljava/io/File;

    move-result-object v1

    return-object v1

    .line 219
    :cond_0
    const/16 v1, 0x8

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-lt v0, v1, :cond_1

    .line 220
    invoke-static {p0, p1}, Landroid/support/v4/content/ContextCompatFroyo;->getExternalFilesDir(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .local v1, "single":Ljava/io/File;
    goto :goto_0

    .line 222
    .end local v1    # "single":Ljava/io/File;
    :cond_1
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/String;

    const-string v5, "Android"

    aput-object v5, v4, v3

    const-string v5, "data"

    aput-object v5, v4, v2

    const/4 v5, 0x2

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x3

    const-string v6, "files"

    aput-object v6, v4, v5

    const/4 v5, 0x4

    aput-object p1, v4, v5

    invoke-static {v1, v4}, Landroid/support/v4/content/ContextCompat;->buildPath(Ljava/io/File;[Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 225
    .restart local v1    # "single":Ljava/io/File;
    :goto_0
    new-array v2, v2, [Ljava/io/File;

    aput-object v1, v2, v3

    return-object v2
.end method

.method public static getObbDirs(Landroid/content/Context;)[Ljava/io/File;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;

    .line 154
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 155
    .local v0, "version":I
    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    .line 156
    invoke-static {p0}, Landroid/support/v4/content/ContextCompatKitKat;->getObbDirs(Landroid/content/Context;)[Ljava/io/File;

    move-result-object v1

    return-object v1

    .line 159
    :cond_0
    const/16 v1, 0xb

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-lt v0, v1, :cond_1

    .line 160
    invoke-static {p0}, Landroid/support/v4/content/ContextCompatHoneycomb;->getObbDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v1

    .local v1, "single":Ljava/io/File;
    goto :goto_0

    .line 162
    .end local v1    # "single":Ljava/io/File;
    :cond_1
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/String;

    const-string v5, "Android"

    aput-object v5, v4, v3

    const-string v5, "obb"

    aput-object v5, v4, v2

    const/4 v5, 0x2

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v1, v4}, Landroid/support/v4/content/ContextCompat;->buildPath(Ljava/io/File;[Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 165
    .restart local v1    # "single":Ljava/io/File;
    :goto_0
    new-array v2, v2, [Ljava/io/File;

    aput-object v1, v2, v3

    return-object v2
.end method

.method public static startActivities(Landroid/content/Context;[Landroid/content/Intent;)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "intents"    # [Landroid/content/Intent;

    .line 67
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/support/v4/content/ContextCompat;->startActivities(Landroid/content/Context;[Landroid/content/Intent;Landroid/os/Bundle;)Z

    move-result v0

    return v0
.end method

.method public static startActivities(Landroid/content/Context;[Landroid/content/Intent;Landroid/os/Bundle;)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "intents"    # [Landroid/content/Intent;
    .param p2, "options"    # Landroid/os/Bundle;

    .line 99
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 100
    .local v0, "version":I
    const/4 v1, 0x1

    const/16 v2, 0x10

    if-lt v0, v2, :cond_0

    .line 101
    invoke-static {p0, p1, p2}, Landroid/support/v4/content/ContextCompatJellybean;->startActivities(Landroid/content/Context;[Landroid/content/Intent;Landroid/os/Bundle;)V

    .line 102
    return v1

    .line 103
    :cond_0
    const/16 v2, 0xb

    if-lt v0, v2, :cond_1

    .line 104
    invoke-static {p0, p1}, Landroid/support/v4/content/ContextCompatHoneycomb;->startActivities(Landroid/content/Context;[Landroid/content/Intent;)V

    .line 105
    return v1

    .line 107
    :cond_1
    const/4 v1, 0x0

    return v1
.end method
