.class Landroid/support/v4/app/NotificationCompat$NotificationCompatImplJellybean;
.super Ljava/lang/Object;
.source "NotificationCompat.java"

# interfaces
.implements Landroid/support/v4/app/NotificationCompat$NotificationCompatImpl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/app/NotificationCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "NotificationCompatImplJellybean"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build(Landroid/support/v4/app/NotificationCompat$Builder;)Landroid/app/Notification;
    .locals 27
    .param p1, "b"    # Landroid/support/v4/app/NotificationCompat$Builder;

    .line 132
    move-object/from16 v0, p1

    new-instance v18, Landroid/support/v4/app/NotificationCompatJellybean;

    move-object/from16 v1, v18

    iget-object v2, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mContext:Landroid/content/Context;

    iget-object v3, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iget-object v4, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mContentTitle:Ljava/lang/CharSequence;

    iget-object v5, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mContentText:Ljava/lang/CharSequence;

    iget-object v6, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mContentInfo:Ljava/lang/CharSequence;

    iget-object v7, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mTickerView:Landroid/widget/RemoteViews;

    iget v8, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mNumber:I

    iget-object v9, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mContentIntent:Landroid/app/PendingIntent;

    iget-object v10, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mFullScreenIntent:Landroid/app/PendingIntent;

    iget-object v11, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mLargeIcon:Landroid/graphics/Bitmap;

    iget v12, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mProgressMax:I

    iget v13, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mProgress:I

    iget-boolean v14, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mProgressIndeterminate:Z

    iget-boolean v15, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mUseChronometer:Z

    move-object/from16 v19, v1

    iget v1, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mPriority:I

    move/from16 v16, v1

    iget-object v1, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mSubText:Ljava/lang/CharSequence;

    move-object/from16 v17, v1

    move-object/from16 v1, v19

    invoke-direct/range {v1 .. v17}, Landroid/support/v4/app/NotificationCompatJellybean;-><init>(Landroid/content/Context;Landroid/app/Notification;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/widget/RemoteViews;ILandroid/app/PendingIntent;Landroid/app/PendingIntent;Landroid/graphics/Bitmap;IIZZILjava/lang/CharSequence;)V

    move-object/from16 v1, v18

    .line 137
    .local v1, "jbBuilder":Landroid/support/v4/app/NotificationCompatJellybean;
    iget-object v2, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mActions:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v4/app/NotificationCompat$Action;

    .line 138
    .local v3, "action":Landroid/support/v4/app/NotificationCompat$Action;
    iget v4, v3, Landroid/support/v4/app/NotificationCompat$Action;->icon:I

    iget-object v5, v3, Landroid/support/v4/app/NotificationCompat$Action;->title:Ljava/lang/CharSequence;

    iget-object v6, v3, Landroid/support/v4/app/NotificationCompat$Action;->actionIntent:Landroid/app/PendingIntent;

    invoke-virtual {v1, v4, v5, v6}, Landroid/support/v4/app/NotificationCompatJellybean;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .end local v3    # "action":Landroid/support/v4/app/NotificationCompat$Action;
    goto :goto_0

    .line 140
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_0
    iget-object v2, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mStyle:Landroid/support/v4/app/NotificationCompat$Style;

    if-eqz v2, :cond_3

    .line 141
    iget-object v2, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mStyle:Landroid/support/v4/app/NotificationCompat$Style;

    instance-of v2, v2, Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    if-eqz v2, :cond_1

    .line 142
    iget-object v2, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mStyle:Landroid/support/v4/app/NotificationCompat$Style;

    check-cast v2, Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    .line 143
    .local v2, "style":Landroid/support/v4/app/NotificationCompat$BigTextStyle;
    iget-object v3, v2, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->mBigContentTitle:Ljava/lang/CharSequence;

    iget-boolean v4, v2, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->mSummaryTextSet:Z

    iget-object v5, v2, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->mSummaryText:Ljava/lang/CharSequence;

    iget-object v6, v2, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->mBigText:Ljava/lang/CharSequence;

    invoke-virtual {v1, v3, v4, v5, v6}, Landroid/support/v4/app/NotificationCompatJellybean;->addBigTextStyle(Ljava/lang/CharSequence;ZLjava/lang/CharSequence;Ljava/lang/CharSequence;)V

    .line 147
    .end local v2    # "style":Landroid/support/v4/app/NotificationCompat$BigTextStyle;
    goto :goto_1

    :cond_1
    iget-object v2, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mStyle:Landroid/support/v4/app/NotificationCompat$Style;

    instance-of v2, v2, Landroid/support/v4/app/NotificationCompat$InboxStyle;

    if-eqz v2, :cond_2

    .line 148
    iget-object v2, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mStyle:Landroid/support/v4/app/NotificationCompat$Style;

    check-cast v2, Landroid/support/v4/app/NotificationCompat$InboxStyle;

    .line 149
    .local v2, "style":Landroid/support/v4/app/NotificationCompat$InboxStyle;
    iget-object v3, v2, Landroid/support/v4/app/NotificationCompat$InboxStyle;->mBigContentTitle:Ljava/lang/CharSequence;

    iget-boolean v4, v2, Landroid/support/v4/app/NotificationCompat$InboxStyle;->mSummaryTextSet:Z

    iget-object v5, v2, Landroid/support/v4/app/NotificationCompat$InboxStyle;->mSummaryText:Ljava/lang/CharSequence;

    iget-object v6, v2, Landroid/support/v4/app/NotificationCompat$InboxStyle;->mTexts:Ljava/util/ArrayList;

    invoke-virtual {v1, v3, v4, v5, v6}, Landroid/support/v4/app/NotificationCompatJellybean;->addInboxStyle(Ljava/lang/CharSequence;ZLjava/lang/CharSequence;Ljava/util/ArrayList;)V

    .end local v2    # "style":Landroid/support/v4/app/NotificationCompat$InboxStyle;
    goto :goto_1

    .line 153
    :cond_2
    iget-object v2, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mStyle:Landroid/support/v4/app/NotificationCompat$Style;

    instance-of v2, v2, Landroid/support/v4/app/NotificationCompat$BigPictureStyle;

    if-eqz v2, :cond_3

    .line 154
    iget-object v2, v0, Landroid/support/v4/app/NotificationCompat$Builder;->mStyle:Landroid/support/v4/app/NotificationCompat$Style;

    check-cast v2, Landroid/support/v4/app/NotificationCompat$BigPictureStyle;

    .line 155
    .local v2, "style":Landroid/support/v4/app/NotificationCompat$BigPictureStyle;
    iget-object v3, v2, Landroid/support/v4/app/NotificationCompat$BigPictureStyle;->mBigContentTitle:Ljava/lang/CharSequence;

    iget-boolean v4, v2, Landroid/support/v4/app/NotificationCompat$BigPictureStyle;->mSummaryTextSet:Z

    iget-object v5, v2, Landroid/support/v4/app/NotificationCompat$BigPictureStyle;->mSummaryText:Ljava/lang/CharSequence;

    iget-object v6, v2, Landroid/support/v4/app/NotificationCompat$BigPictureStyle;->mPicture:Landroid/graphics/Bitmap;

    iget-object v7, v2, Landroid/support/v4/app/NotificationCompat$BigPictureStyle;->mBigLargeIcon:Landroid/graphics/Bitmap;

    iget-boolean v8, v2, Landroid/support/v4/app/NotificationCompat$BigPictureStyle;->mBigLargeIconSet:Z

    move-object/from16 v20, v1

    move-object/from16 v21, v3

    move/from16 v22, v4

    move-object/from16 v23, v5

    move-object/from16 v24, v6

    move-object/from16 v25, v7

    move/from16 v26, v8

    invoke-virtual/range {v20 .. v26}, Landroid/support/v4/app/NotificationCompatJellybean;->addBigPictureStyle(Ljava/lang/CharSequence;ZLjava/lang/CharSequence;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Z)V

    nop

    .line 163
    .end local v2    # "style":Landroid/support/v4/app/NotificationCompat$BigPictureStyle;
    :cond_3
    :goto_1
    invoke-virtual {v1}, Landroid/support/v4/app/NotificationCompatJellybean;->build()Landroid/app/Notification;

    move-result-object v2

    return-object v2
.end method
