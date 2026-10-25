.class Landroid/support/v4/view/ViewCompatICS;
.super Ljava/lang/Object;
.source "ViewCompatICS.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static canScrollHorizontally(Landroid/view/View;I)Z
    .locals 1
    .param p0, "v"    # Landroid/view/View;
    .param p1, "direction"    # I

    .line 30
    invoke-virtual {p0, p1}, Landroid/view/View;->canScrollHorizontally(I)Z

    move-result v0

    return v0
.end method

.method public static canScrollVertically(Landroid/view/View;I)Z
    .locals 1
    .param p0, "v"    # Landroid/view/View;
    .param p1, "direction"    # I

    .line 34
    invoke-virtual {p0, p1}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v0

    return v0
.end method

.method public static onInitializeAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 0
    .param p0, "v"    # Landroid/view/View;
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .line 46
    invoke-virtual {p0, p1}, Landroid/view/View;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 47
    return-void
.end method

.method public static onInitializeAccessibilityNodeInfo(Landroid/view/View;Ljava/lang/Object;)V
    .locals 1
    .param p0, "v"    # Landroid/view/View;
    .param p1, "info"    # Ljava/lang/Object;

    .line 50
    move-object v0, p1

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-virtual {p0, v0}, Landroid/view/View;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 51
    return-void
.end method

.method public static onPopulateAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 0
    .param p0, "v"    # Landroid/view/View;
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .line 42
    invoke-virtual {p0, p1}, Landroid/view/View;->onPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 43
    return-void
.end method

.method public static setAccessibilityDelegate(Landroid/view/View;Ljava/lang/Object;)V
    .locals 1
    .param p0, "v"    # Landroid/view/View;
    .param p1, "delegate"    # Ljava/lang/Object;

    .line 38
    move-object v0, p1

    check-cast v0, Landroid/view/View$AccessibilityDelegate;

    invoke-virtual {p0, v0}, Landroid/view/View;->setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V

    .line 39
    return-void
.end method
