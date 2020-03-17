class PrivateTopicsController < ApplicationController
  
#在園児向けお知らせ用 、loginせずに直接URLにアクセスした場合はroot_pathに飛ばす
before_action :if_not_login_user
  
  def index   #お知らせ一覧取得
    @private_topics = PrivateTopic.all
  end

  def new     #投稿画面表示
    @private_topics = PrivateTopic.all 
    @private_topic = PrivateTopic.new
  end
  
  def show
    @private_topic = PrivateTopic.find(params[:id])
  end
  
  def create  #お知らせ新規投稿
    @private_topic = PrivateTopic.new(topic_params)
    
    if @private_topic.save
      redirect_to private_topics_index_path
    else
      flash.now[:danger] = '投稿失敗しました'
    end
  end
  
  
  def edit
    @private_topic = PrivateTopic.find(params[:id])
  end
  
  def update
    @private_topic = PrivateTopic.find(params[:id])
    @private_topic.update(topic_params)
    redirect_to private_topics_show_path(@private_topic.id)
    
  end
  
  def destroy
    @private_topic = PrivateTopic.find(params[:id])
    @private_topic.destroy
    flash[:notice] = "お知らせ記事を削除しました"
    redirect_to private_topics_index_path
  end
  
private

  def topic_params  #とりあえずタイトルと本文だけ、後ほどファイルアップロードできるようにする
    params.require(:private_topic).permit(:title, :content)
  end
  
  
end
