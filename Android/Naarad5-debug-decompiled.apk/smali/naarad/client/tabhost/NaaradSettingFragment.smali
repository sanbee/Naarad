.class public Lnaarad/client/tabhost/NaaradSettingFragment;
.super Lnaarad/client/tabhost/NaaradAbstractFragment;
.source "NaaradSettingFragment.java"


# static fields
.field private static mView:Landroid/view/View;


# instance fields
.field private gServerName:Ljava/lang/String;

.field private gServerPort:I

.field private gWakeLockControl:I

.field private gWifiControl:I

.field private message:Ljava/lang/String;

.field public myApp:Lnaarad/client/tabhost/NaaradApp;

.field private printwriter:Ljava/io/PrintWriter;

.field private serverNameField:Landroid/widget/EditText;

.field private serverPortField:Landroid/widget/EditText;

.field private setButton:Landroid/widget/Button;

.field private wakeButton:Landroid/widget/CheckBox;

.field private wifiControl:Landroid/widget/CheckBox;

.field private wifiTurnedOnByMe:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 35
    invoke-direct {p0}, Lnaarad/client/tabhost/NaaradAbstractFragment;-><init>()V

    .line 47
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->wifiTurnedOnByMe:Z

    .line 48
    iput v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->gWifiControl:I

    iput v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->gWakeLockControl:I

    return-void
.end method

.method static synthetic access$000(Lnaarad/client/tabhost/NaaradSettingFragment;)I
    .locals 1
    .param p0, "x0"    # Lnaarad/client/tabhost/NaaradSettingFragment;

    .line 35
    iget v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->gServerPort:I

    return v0
.end method

.method static synthetic access$002(Lnaarad/client/tabhost/NaaradSettingFragment;I)I
    .locals 0
    .param p0, "x0"    # Lnaarad/client/tabhost/NaaradSettingFragment;
    .param p1, "x1"    # I

    .line 35
    iput p1, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->gServerPort:I

    return p1
.end method

.method static synthetic access$100(Lnaarad/client/tabhost/NaaradSettingFragment;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lnaarad/client/tabhost/NaaradSettingFragment;

    .line 35
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->gServerName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$102(Lnaarad/client/tabhost/NaaradSettingFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lnaarad/client/tabhost/NaaradSettingFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .line 35
    iput-object p1, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->gServerName:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Lnaarad/client/tabhost/NaaradSettingFragment;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lnaarad/client/tabhost/NaaradSettingFragment;

    .line 35
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->serverNameField:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$300(Lnaarad/client/tabhost/NaaradSettingFragment;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lnaarad/client/tabhost/NaaradSettingFragment;

    .line 35
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->serverPortField:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$400(Lnaarad/client/tabhost/NaaradSettingFragment;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lnaarad/client/tabhost/NaaradSettingFragment;

    .line 35
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->setButton:Landroid/widget/Button;

    return-object v0
.end method

.method public static final newInstanceNSF(Ljava/lang/String;)Lnaarad/client/tabhost/NaaradSettingFragment;
    .locals 3
    .param p0, "sampleText"    # Ljava/lang/String;

    .line 76
    new-instance v0, Lnaarad/client/tabhost/NaaradSettingFragment;

    invoke-direct {v0}, Lnaarad/client/tabhost/NaaradSettingFragment;-><init>()V

    .line 78
    .local v0, "f":Lnaarad/client/tabhost/NaaradSettingFragment;
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 79
    .local v1, "b":Landroid/os/Bundle;
    const-string v2, "bString"

    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    invoke-virtual {v0, v1}, Lnaarad/client/tabhost/NaaradSettingFragment;->setArguments(Landroid/os/Bundle;)V

    .line 82
    return-object v0
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .line 153
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lnaarad/client/tabhost/NaaradSettingFragment;->setRetainInstance(Z)V

    .line 154
    invoke-virtual {p0}, Lnaarad/client/tabhost/NaaradSettingFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lnaarad/client/tabhost/NaaradApp;

    iput-object v1, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    .line 155
    iget-object v1, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    invoke-virtual {v1}, Lnaarad/client/tabhost/NaaradApp;->makeLocks()V

    .line 166
    sget-object v1, Lnaarad/client/tabhost/NaaradSettingFragment;->mView:Landroid/view/View;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 167
    const v1, 0x7f050007

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    sput-object v1, Lnaarad/client/tabhost/NaaradSettingFragment;->mView:Landroid/view/View;

    goto :goto_0

    .line 170
    :cond_0
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    sget-object v3, Lnaarad/client/tabhost/NaaradSettingFragment;->mView:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 172
    :goto_0
    sget-object v1, Lnaarad/client/tabhost/NaaradSettingFragment;->mView:Landroid/view/View;

    const v3, 0x7f030012

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->serverNameField:Landroid/widget/EditText;

    .line 173
    sget-object v1, Lnaarad/client/tabhost/NaaradSettingFragment;->mView:Landroid/view/View;

    const v3, 0x7f030013

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->serverPortField:Landroid/widget/EditText;

    .line 174
    iget-object v1, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->serverPortField:Landroid/widget/EditText;

    invoke-virtual {p0}, Lnaarad/client/tabhost/NaaradSettingFragment;->getDefaultPort()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 175
    iget-object v1, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->serverNameField:Landroid/widget/EditText;

    invoke-virtual {p0}, Lnaarad/client/tabhost/NaaradSettingFragment;->getDefaultServer()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 177
    sget-object v1, Lnaarad/client/tabhost/NaaradSettingFragment;->mView:Landroid/view/View;

    const v3, 0x7f030014

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->setButton:Landroid/widget/Button;

    .line 179
    sget-object v1, Lnaarad/client/tabhost/NaaradSettingFragment;->mView:Landroid/view/View;

    const v3, 0x7f03001a

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    iput-object v1, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->wifiControl:Landroid/widget/CheckBox;

    .line 180
    sget-object v1, Lnaarad/client/tabhost/NaaradSettingFragment;->mView:Landroid/view/View;

    const v3, 0x7f030019

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    iput-object v1, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->wakeButton:Landroid/widget/CheckBox;

    .line 181
    iget-object v1, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->wakeButton:Landroid/widget/CheckBox;

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 183
    const-string v1, "wifiControl"

    invoke-virtual {p0, v1, v2}, Lnaarad/client/tabhost/NaaradSettingFragment;->getPreference(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->gWifiControl:I

    if-ne v1, v0, :cond_1

    .line 185
    iget-object v1, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->wifiControl:Landroid/widget/CheckBox;

    invoke-virtual {v1, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 186
    iget-object v1, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->wifiControl:Landroid/widget/CheckBox;

    invoke-virtual {p0, v1}, Lnaarad/client/tabhost/NaaradSettingFragment;->wifiControlClick(Landroid/widget/CheckBox;)V

    .line 188
    :cond_1
    iget-object v1, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->wifiControl:Landroid/widget/CheckBox;

    new-instance v3, Lnaarad/client/tabhost/NaaradSettingFragment$1;

    invoke-direct {v3, p0}, Lnaarad/client/tabhost/NaaradSettingFragment$1;-><init>(Lnaarad/client/tabhost/NaaradSettingFragment;)V

    invoke-virtual {v1, v3}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 198
    const-string v1, "wakeControl"

    invoke-virtual {p0, v1, v2}, Lnaarad/client/tabhost/NaaradSettingFragment;->getPreference(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->gWakeLockControl:I

    if-ne v1, v0, :cond_2

    .line 200
    iget-object v1, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->wakeButton:Landroid/widget/CheckBox;

    invoke-virtual {v1, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 201
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->wakeButton:Landroid/widget/CheckBox;

    invoke-virtual {p0, v0}, Lnaarad/client/tabhost/NaaradSettingFragment;->wakeLockClick(Landroid/widget/CheckBox;)V

    .line 204
    :cond_2
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->wakeButton:Landroid/widget/CheckBox;

    new-instance v1, Lnaarad/client/tabhost/NaaradSettingFragment$2;

    invoke-direct {v1, p0}, Lnaarad/client/tabhost/NaaradSettingFragment$2;-><init>(Lnaarad/client/tabhost/NaaradSettingFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 213
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->setButton:Landroid/widget/Button;

    new-instance v1, Lnaarad/client/tabhost/NaaradSettingFragment$3;

    invoke-direct {v1, p0}, Lnaarad/client/tabhost/NaaradSettingFragment$3;-><init>(Lnaarad/client/tabhost/NaaradSettingFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 242
    sget-object v0, Lnaarad/client/tabhost/NaaradSettingFragment;->mView:Landroid/view/View;

    return-object v0
.end method

.method public onPause()V
    .locals 4

    .line 56
    invoke-super {p0}, Lnaarad/client/tabhost/NaaradAbstractFragment;->onPause()V

    .line 57
    const/4 v0, 0x0

    .line 60
    .local v0, "giveMsg":Z
    const/16 v1, 0x50

    if-eqz v0, :cond_0

    const-string v2, "Wake and Wifi locks released."

    invoke-virtual {p0, v2, v1}, Lnaarad/client/tabhost/NaaradSettingFragment;->toast(Ljava/lang/String;I)V

    .line 61
    :cond_0
    iget-object v2, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->gServerName:Ljava/lang/String;

    const-string v3, "serverName"

    invoke-virtual {p0, v3, v2}, Lnaarad/client/tabhost/NaaradSettingFragment;->setPreference(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    iget v2, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->gServerPort:I

    const-string v3, "gServerPort"

    invoke-virtual {p0, v3, v2}, Lnaarad/client/tabhost/NaaradSettingFragment;->setPreference(Ljava/lang/String;I)V

    .line 63
    iget v2, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->gWifiControl:I

    const-string v3, "wifiControl"

    invoke-virtual {p0, v3, v2}, Lnaarad/client/tabhost/NaaradSettingFragment;->setPreference(Ljava/lang/String;I)V

    .line 64
    iget v2, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->gWakeLockControl:I

    const-string v3, "wakeControl"

    invoke-virtual {p0, v3, v2}, Lnaarad/client/tabhost/NaaradSettingFragment;->setPreference(Ljava/lang/String;I)V

    .line 65
    iget-boolean v2, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->wifiTurnedOnByMe:Z

    if-eqz v2, :cond_1

    .line 67
    iget-object v2, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lnaarad/client/tabhost/NaaradApp;->setWifiState(Z)V

    .line 68
    const-string v2, "Turning off wifi..."

    invoke-virtual {p0, v2, v1}, Lnaarad/client/tabhost/NaaradSettingFragment;->toast(Ljava/lang/String;I)V

    .line 70
    :cond_1
    return-void
.end method

.method public wakeLockClick(Landroid/widget/CheckBox;)V
    .locals 3
    .param p1, "v"    # Landroid/widget/CheckBox;

    .line 122
    invoke-virtual {p0}, Lnaarad/client/tabhost/NaaradSettingFragment;->isWifiConnected()Z

    move-result v0

    const/16 v1, 0x50

    const/4 v2, 0x0

    if-eqz v0, :cond_5

    .line 124
    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 126
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradApp;->myWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradApp;->myWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 127
    :cond_0
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradApp;->myWifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->isHeld()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradApp;->myWifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->acquire()V

    .line 128
    :cond_1
    const-string v0, "Wake and Wifi locks set."

    invoke-virtual {p0, v0, v1}, Lnaarad/client/tabhost/NaaradSettingFragment;->toast(Ljava/lang/String;I)V

    .line 129
    const/4 v0, 0x1

    iput v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->gWakeLockControl:I

    goto :goto_0

    .line 134
    :cond_2
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradApp;->myWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradApp;->myWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 135
    :cond_3
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradApp;->myWifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    iget-object v0, v0, Lnaarad/client/tabhost/NaaradApp;->myWifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->release()V

    .line 136
    :cond_4
    iput v2, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->gWakeLockControl:I

    goto :goto_0

    .line 142
    :cond_5
    invoke-virtual {p1, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 143
    iput v2, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->gWakeLockControl:I

    .line 144
    const-string v0, "Wifi not connected.\nWake and Wifi locks not set."

    invoke-virtual {p0, v0, v1}, Lnaarad/client/tabhost/NaaradSettingFragment;->toast(Ljava/lang/String;I)V

    .line 146
    :goto_0
    return-void
.end method

.method public wifiControlClick(Landroid/widget/CheckBox;)V
    .locals 4
    .param p1, "v"    # Landroid/widget/CheckBox;

    .line 89
    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    const/16 v1, 0x50

    if-eqz v0, :cond_1

    .line 91
    invoke-virtual {p0}, Lnaarad/client/tabhost/NaaradSettingFragment;->isWifiConnected()Z

    move-result v0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    .line 93
    iput-boolean v2, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->wifiTurnedOnByMe:Z

    .line 94
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    invoke-virtual {v0, v2}, Lnaarad/client/tabhost/NaaradApp;->setWifiState(Z)V

    .line 96
    const-string v0, "Turning wifi on..."

    invoke-virtual {p0, v0, v1}, Lnaarad/client/tabhost/NaaradSettingFragment;->toast(Ljava/lang/String;I)V

    .line 98
    new-instance v0, Lnaarad/client/tabhost/NaaradWifiBroadcastReceiver;

    invoke-direct {v0}, Lnaarad/client/tabhost/NaaradWifiBroadcastReceiver;-><init>()V

    .line 100
    .local v0, "nWifiReceiver":Lnaarad/client/tabhost/NaaradWifiBroadcastReceiver;
    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 101
    .local v1, "filters":Landroid/content/IntentFilter;
    const-string v3, "android.net.wifi.WIFI_STATE_CHANGED"

    invoke-virtual {v1, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 106
    .end local v0    # "nWifiReceiver":Lnaarad/client/tabhost/NaaradWifiBroadcastReceiver;
    .end local v1    # "filters":Landroid/content/IntentFilter;
    :cond_0
    iput v2, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->gWifiControl:I

    goto :goto_0

    .line 110
    :cond_1
    invoke-virtual {p0}, Lnaarad/client/tabhost/NaaradSettingFragment;->isWifiConnected()Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->wifiTurnedOnByMe:Z

    if-eqz v0, :cond_2

    .line 111
    iget-object v0, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->myApp:Lnaarad/client/tabhost/NaaradApp;

    invoke-virtual {v0, v2}, Lnaarad/client/tabhost/NaaradApp;->setWifiState(Z)V

    .line 112
    :cond_2
    const-string v0, "Turning wifi off..."

    invoke-virtual {p0, v0, v1}, Lnaarad/client/tabhost/NaaradSettingFragment;->toast(Ljava/lang/String;I)V

    .line 113
    iput v2, p0, Lnaarad/client/tabhost/NaaradSettingFragment;->gWifiControl:I

    .line 116
    :goto_0
    return-void
.end method
