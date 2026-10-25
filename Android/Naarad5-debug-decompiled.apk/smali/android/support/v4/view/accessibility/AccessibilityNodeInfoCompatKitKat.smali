.class Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompatKitKat;
.super Ljava/lang/Object;
.source "AccessibilityNodeInfoCompatKitKat.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getLiveRegion(Ljava/lang/Object;)I
    .locals 1
    .param p0, "info"    # Ljava/lang/Object;

    .line 26
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getLiveRegion()I

    move-result v0

    return v0
.end method

.method public static setLiveRegion(Ljava/lang/Object;I)V
    .locals 1
    .param p0, "info"    # Ljava/lang/Object;
    .param p1, "mode"    # I

    .line 30
    move-object v0, p0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {v0, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setLiveRegion(I)V

    .line 31
    return-void
.end method
