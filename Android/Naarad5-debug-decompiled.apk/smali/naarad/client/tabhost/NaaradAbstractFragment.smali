.class public abstract Lnaarad/client/tabhost/NaaradAbstractFragment;
.super Landroid/support/v4/app/Fragment;
.source "NaaradAbstractFragment.java"


# static fields
.field public static mActivity:Landroid/app/Activity;


# instance fields
.field public nodeID2Ndx:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private prefs:Landroid/content/SharedPreferences;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 33
    const/4 v0, 0x0

    sput-object v0, Lnaarad/client/tabhost/NaaradAbstractFragment;->mActivity:Landroid/app/Activity;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method public getDefaultPort()I
    .locals 2

    .line 38
    const-string v0, "serverPort"

    const/16 v1, 0x4d2

    invoke-virtual {p0, v0, v1}, Lnaarad/client/tabhost/NaaradAbstractFragment;->getPreference(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getDefaultServer()Ljava/lang/String;
    .locals 2

    .line 43
    const-string v0, "serverName"

    const-string v1, "naaradhost"

    invoke-virtual {p0, v0, v1}, Lnaarad/client/tabhost/NaaradAbstractFragment;->getPreference(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getKeysAsArray(Ljava/util/HashMap;)[I
    .locals 7
    .param p1, "myMap"    # Ljava/util/HashMap;

    .line 48
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 49
    .local v0, "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v1

    new-array v1, v1, [I

    .line 50
    .local v1, "array":[I
    const/4 v2, 0x0

    .line 51
    .local v2, "index":I
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    .local v4, "element":Ljava/lang/Integer;
    add-int/lit8 v5, v2, 0x1

    .end local v2    # "index":I
    .local v5, "index":I
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v6

    aput v6, v1, v2

    move v2, v5

    .end local v4    # "element":Ljava/lang/Integer;
    goto :goto_0

    .line 52
    .end local v5    # "index":I
    .restart local v2    # "index":I
    :cond_0
    return-object v1
.end method

.method public getNodeID2NdxMap()Ljava/util/HashMap;
    .locals 3

    .line 57
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lnaarad/client/tabhost/NaaradAbstractFragment;->nodeID2Ndx:Ljava/util/HashMap;

    .line 58
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradAbstractFragment;->nodeID2Ndx:Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradAbstractFragment;->nodeID2Ndx:Ljava/util/HashMap;

    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradAbstractFragment;->nodeID2Ndx:Ljava/util/HashMap;

    return-object v0
.end method

.method public getPreference(Ljava/lang/String;I)I
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defValue"    # I

    .line 120
    sget-object v0, Lnaarad/client/tabhost/NaaradAbstractFragment;->mActivity:Landroid/app/Activity;

    const-string v1, "nSettings"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lnaarad/client/tabhost/NaaradAbstractFragment;->prefs:Landroid/content/SharedPreferences;

    .line 121
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradAbstractFragment;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getPreference(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defValue"    # Ljava/lang/String;

    .line 125
    sget-object v0, Lnaarad/client/tabhost/NaaradAbstractFragment;->mActivity:Landroid/app/Activity;

    const-string v1, "nSettings"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lnaarad/client/tabhost/NaaradAbstractFragment;->prefs:Landroid/content/SharedPreferences;

    .line 126
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradAbstractFragment;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getServerName()Ljava/lang/String;
    .locals 3

    .line 139
    sget-object v0, Lnaarad/client/tabhost/NaaradAbstractFragment;->mActivity:Landroid/app/Activity;

    const-string v1, "nSettings"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lnaarad/client/tabhost/NaaradAbstractFragment;->prefs:Landroid/content/SharedPreferences;

    .line 140
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradAbstractFragment;->prefs:Landroid/content/SharedPreferences;

    invoke-virtual {p0}, Lnaarad/client/tabhost/NaaradAbstractFragment;->getDefaultServer()Ljava/lang/String;

    move-result-object v1

    const-string v2, "serverName"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getServerPort()I
    .locals 3

    .line 155
    sget-object v0, Lnaarad/client/tabhost/NaaradAbstractFragment;->mActivity:Landroid/app/Activity;

    const-string v1, "nSettings"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lnaarad/client/tabhost/NaaradAbstractFragment;->prefs:Landroid/content/SharedPreferences;

    .line 156
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradAbstractFragment;->prefs:Landroid/content/SharedPreferences;

    invoke-virtual {p0}, Lnaarad/client/tabhost/NaaradAbstractFragment;->getDefaultPort()I

    move-result v1

    const-string v2, "serverPort"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public isWifiConnected()Z
    .locals 3

    .line 207
    invoke-virtual {p0}, Lnaarad/client/tabhost/NaaradAbstractFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 208
    .local v0, "connManager":Landroid/net/ConnectivityManager;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v1

    .line 210
    .local v1, "mWifi":Landroid/net/NetworkInfo;
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v2

    return v2
.end method

.method public mapNodeID2Ndx(I)I
    .locals 2
    .param p1, "nodeid"    # I

    .line 82
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 83
    :cond_0
    const/4 v1, 0x3

    if-ne p1, v1, :cond_1

    return v0

    .line 84
    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method public mkMessage(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "message"    # Ljava/lang/String;

    .line 165
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 168
    .local v0, "n":Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    .line 169
    .local v1, "lenStr":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/2addr v2, v3

    add-int/lit8 v2, v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 170
    .local v2, "totalLen":Ljava/lang/Integer;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    .line 171
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 173
    .local v3, "msg":Ljava/lang/String;
    return-object v3
.end method

.method public naaradReader(Ljava/io/BufferedReader;)Ljava/lang/String;
    .locals 8
    .param p1, "socReader"    # Ljava/io/BufferedReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 215
    const/4 v0, 0x0

    .line 218
    .local v0, "charsRead":I
    const-string v1, ""

    .line 226
    .local v1, "message":Ljava/lang/String;
    :goto_0
    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {p1}, Ljava/io/BufferedReader;->read()I

    move-result v3

    int-to-char v3, v3

    move v4, v3

    .local v4, "oneChar":C
    const/4 v5, -0x1

    if-eq v3, v5, :cond_1

    const/16 v3, 0x400

    if-ge v0, v3, :cond_1

    .line 229
    const/16 v3, 0x20

    if-ne v4, v3, :cond_0

    if-lez v0, :cond_0

    .line 230
    goto :goto_1

    .line 233
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    move-object v1, v2

    .line 234
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 242
    :cond_1
    :goto_1
    :try_start_1
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 248
    .local v3, "msgLen":I
    nop

    .line 253
    :try_start_2
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    move-object v1, v6

    .line 254
    :goto_2
    invoke-virtual {p1}, Ljava/io/BufferedReader;->read()I

    move-result v6

    int-to-char v6, v6

    move v4, v6

    const/16 v7, 0x7d

    if-eq v6, v5, :cond_2

    if-ge v0, v3, :cond_2

    .line 259
    if-eq v4, v7, :cond_2

    .line 261
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    move-object v1, v6

    .line 262
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 266
    :cond_2
    if-ne v4, v7, :cond_3

    .line 267
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object v1, v2

    .line 271
    return-object v1

    .line 266
    :cond_3
    new-instance v5, Lorg/json/JSONException;

    const-string v6, "End \"}\" not found"

    invoke-direct {v5, v6}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    .end local v0    # "charsRead":I
    .end local v1    # "message":Ljava/lang/String;
    .end local p1    # "socReader":Ljava/io/BufferedReader;
    throw v5

    .line 244
    .end local v3    # "msgLen":I
    .restart local v0    # "charsRead":I
    .restart local v1    # "message":Ljava/lang/String;
    .restart local p1    # "socReader":Ljava/io/BufferedReader;
    :catch_0
    move-exception v3

    .line 246
    .local v3, "nfe":Ljava/lang/NumberFormatException;
    sget-object v5, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v6, "Error in converting message length to integer"

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    .line 247
    return-object v2

    .line 279
    .end local v3    # "nfe":Ljava/lang/NumberFormatException;
    .end local v4    # "oneChar":C
    :catch_1
    move-exception v3

    .line 282
    .local v3, "e":Lorg/json/JSONException;
    sget-object v4, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v3}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 283
    invoke-virtual {v3}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x50

    invoke-virtual {p0, v4, v5}, Lnaarad/client/tabhost/NaaradAbstractFragment;->uiToast(Ljava/lang/String;I)V

    .line 284
    return-object v2
.end method

.method public naaradSocket(Ljava/lang/String;I)Ljava/net/Socket;
    .locals 2
    .param p1, "hostName"    # Ljava/lang/String;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .line 295
    new-instance v0, Ljava/net/Socket;

    invoke-direct {v0, p1, p2}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    .line 305
    .local v0, "clientSoc":Ljava/net/Socket;
    invoke-virtual {v0}, Ljava/net/Socket;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 306
    return-object v0

    .line 308
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public naaradWriter(Ljava/io/PrintWriter;Ljava/lang/String;)V
    .locals 1
    .param p1, "socWriter"    # Ljava/io/PrintWriter;
    .param p2, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .line 290
    invoke-virtual {p0, p2}, Lnaarad/client/tabhost/NaaradAbstractFragment;->mkMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/PrintWriter;->flush()V

    .line 291
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;

    .line 71
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onAttach(Landroid/app/Activity;)V

    .line 72
    sget-object v0, Lnaarad/client/tabhost/NaaradAbstractFragment;->mActivity:Landroid/app/Activity;

    if-nez v0, :cond_0

    .line 73
    sput-object p1, Lnaarad/client/tabhost/NaaradAbstractFragment;->mActivity:Landroid/app/Activity;

    .line 75
    :cond_0
    sget-object v0, Lnaarad/client/tabhost/NaaradAbstractFragment;->mActivity:Landroid/app/Activity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 77
    invoke-virtual {p0}, Lnaarad/client/tabhost/NaaradAbstractFragment;->getNodeID2NdxMap()Ljava/util/HashMap;

    .line 78
    return-void
.end method

.method public recreateView(Landroid/view/View;)Z
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .line 89
    if-eqz p1, :cond_0

    .line 96
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 97
    const/4 v0, 0x1

    return v0

    .line 99
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setPreference(Ljava/lang/String;I)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # I

    .line 112
    sget-object v0, Lnaarad/client/tabhost/NaaradAbstractFragment;->mActivity:Landroid/app/Activity;

    const-string v1, "nSettings"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lnaarad/client/tabhost/NaaradAbstractFragment;->prefs:Landroid/content/SharedPreferences;

    .line 113
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradAbstractFragment;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 114
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 116
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 117
    return-void
.end method

.method public setPreference(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 104
    sget-object v0, Lnaarad/client/tabhost/NaaradAbstractFragment;->mActivity:Landroid/app/Activity;

    const-string v1, "nSettings"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lnaarad/client/tabhost/NaaradAbstractFragment;->prefs:Landroid/content/SharedPreferences;

    .line 105
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradAbstractFragment;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 106
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 108
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 109
    return-void
.end method

.method public setServerName(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 130
    const-string v0, "serverName"

    invoke-virtual {p0, v0, p1}, Lnaarad/client/tabhost/NaaradAbstractFragment;->setPreference(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    return-void
.end method

.method public setServerPort(I)V
    .locals 1
    .param p1, "port"    # I

    .line 146
    const-string v0, "serverPort"

    invoke-virtual {p0, v0, p1}, Lnaarad/client/tabhost/NaaradAbstractFragment;->setPreference(Ljava/lang/String;I)V

    .line 152
    return-void
.end method

.method public toast(Ljava/lang/String;I)V
    .locals 2
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "gravity"    # I

    .line 181
    sget-object v0, Lnaarad/client/tabhost/NaaradAbstractFragment;->mActivity:Landroid/app/Activity;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 183
    .local v0, "mToast":Landroid/widget/Toast;
    invoke-virtual {v0, p2, v1, v1}, Landroid/widget/Toast;->setGravity(III)V

    .line 184
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 185
    return-void
.end method

.method public uiToast(Ljava/lang/String;I)V
    .locals 2
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "gravity"    # I

    .line 202
    sget-object v0, Lnaarad/client/tabhost/NaaradAbstractFragment;->mActivity:Landroid/app/Activity;

    new-instance v1, Lnaarad/client/tabhost/NaaradAbstractFragment$1ToastOnUIThread;

    invoke-direct {v1, p0, p1, p2}, Lnaarad/client/tabhost/NaaradAbstractFragment$1ToastOnUIThread;-><init>(Lnaarad/client/tabhost/NaaradAbstractFragment;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 203
    return-void
.end method
