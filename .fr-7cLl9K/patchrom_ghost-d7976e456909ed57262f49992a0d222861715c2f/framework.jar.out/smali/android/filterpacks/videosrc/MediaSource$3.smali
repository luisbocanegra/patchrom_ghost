.class Landroid/filterpacks/videosrc/MediaSource$3;
.super Ljava/lang/Object;
.source "MediaSource.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/filterpacks/videosrc/MediaSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/filterpacks/videosrc/MediaSource;


# direct methods
.method constructor <init>(Landroid/filterpacks/videosrc/MediaSource;)V
    .locals 0
    .param p1, "this$0"    # Landroid/filterpacks/videosrc/MediaSource;

    .prologue
    .line 548
    iput-object p1, p0, Landroid/filterpacks/videosrc/MediaSource$3;->this$0:Landroid/filterpacks/videosrc/MediaSource;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 3
    .param p1, "mp"    # Landroid/media/MediaPlayer;

    .prologue
    .line 550
    iget-object v0, p0, Landroid/filterpacks/videosrc/MediaSource$3;->this$0:Landroid/filterpacks/videosrc/MediaSource;

    invoke-static {v0}, Landroid/filterpacks/videosrc/MediaSource;->-get1(Landroid/filterpacks/videosrc/MediaSource;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "MediaSource"

    const-string/jumbo v1, "MediaPlayer has completed playback"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 551
    :cond_0
    iget-object v1, p0, Landroid/filterpacks/videosrc/MediaSource$3;->this$0:Landroid/filterpacks/videosrc/MediaSource;

    monitor-enter v1

    .line 552
    :try_start_0
    iget-object v0, p0, Landroid/filterpacks/videosrc/MediaSource$3;->this$0:Landroid/filterpacks/videosrc/MediaSource;

    const/4 v2, 0x1

    invoke-static {v0, v2}, Landroid/filterpacks/videosrc/MediaSource;->-set0(Landroid/filterpacks/videosrc/MediaSource;Z)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 549
    return-void

    .line 551
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
