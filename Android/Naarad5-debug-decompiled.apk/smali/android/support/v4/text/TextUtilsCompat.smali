.class public Landroid/support/v4/text/TextUtilsCompat;
.super Ljava/lang/Object;
.source "TextUtilsCompat.java"


# static fields
.field private static ARAB_SCRIPT_SUBTAG:Ljava/lang/String;

.field private static HEBR_SCRIPT_SUBTAG:Ljava/lang/String;

.field public static final ROOT:Ljava/util/Locale;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 111
    new-instance v0, Ljava/util/Locale;

    const-string v1, ""

    invoke-direct {v0, v1, v1}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Landroid/support/v4/text/TextUtilsCompat;->ROOT:Ljava/util/Locale;

    .line 113
    const-string v0, "Arab"

    sput-object v0, Landroid/support/v4/text/TextUtilsCompat;->ARAB_SCRIPT_SUBTAG:Ljava/lang/String;

    .line 114
    const-string v0, "Hebr"

    sput-object v0, Landroid/support/v4/text/TextUtilsCompat;->HEBR_SCRIPT_SUBTAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getLayoutDirectionFromFirstChar(Ljava/util/Locale;)I
    .locals 4
    .param p0, "locale"    # Ljava/util/Locale;

    .line 100
    invoke-virtual {p0, p0}, Ljava/util/Locale;->getDisplayName(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->getDirectionality(C)B

    move-result v0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_0

    const/4 v3, 0x2

    if-eq v0, v3, :cond_0

    .line 107
    return v1

    .line 103
    :cond_0
    return v2
.end method

.method public static getLayoutDirectionFromLocale(Ljava/util/Locale;)I
    .locals 2
    .param p0, "locale"    # Ljava/util/Locale;

    .line 73
    if-eqz p0, :cond_2

    sget-object v0, Landroid/support/v4/text/TextUtilsCompat;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 74
    invoke-virtual {p0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/text/ICUCompat;->addLikelySubtags(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/text/ICUCompat;->getScript(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 76
    .local v0, "scriptSubtag":Ljava/lang/String;
    if-nez v0, :cond_0

    invoke-static {p0}, Landroid/support/v4/text/TextUtilsCompat;->getLayoutDirectionFromFirstChar(Ljava/util/Locale;)I

    move-result v1

    return v1

    .line 78
    :cond_0
    sget-object v1, Landroid/support/v4/text/TextUtilsCompat;->ARAB_SCRIPT_SUBTAG:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    sget-object v1, Landroid/support/v4/text/TextUtilsCompat;->HEBR_SCRIPT_SUBTAG:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 80
    :cond_1
    const/4 v1, 0x1

    return v1

    .line 84
    .end local v0    # "scriptSubtag":Ljava/lang/String;
    :cond_2
    const/4 v0, 0x0

    return v0
.end method

.method public static htmlEncode(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "s"    # Ljava/lang/String;

    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_5

    .line 34
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 35
    .local v2, "c":C
    const/16 v3, 0x22

    if-eq v2, v3, :cond_4

    const/16 v3, 0x3c

    if-eq v2, v3, :cond_3

    const/16 v3, 0x3e

    if-eq v2, v3, :cond_2

    const/16 v3, 0x26

    if-eq v2, v3, :cond_1

    const/16 v3, 0x27

    if-eq v2, v3, :cond_0

    .line 56
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 50
    :cond_0
    const-string v3, "&#39;"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    goto :goto_1

    .line 43
    :cond_1
    const-string v3, "&amp;"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    goto :goto_1

    .line 40
    :cond_2
    const-string v3, "&gt;"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    goto :goto_1

    .line 37
    :cond_3
    const-string v3, "&lt;"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    goto :goto_1

    .line 53
    :cond_4
    const-string v3, "&quot;"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    nop

    .line 33
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 59
    .end local v1    # "i":I
    .end local v2    # "c":C
    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
