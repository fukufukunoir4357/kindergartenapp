class PrivateTopicsController < ApplicationController
  
#在園児向けお知らせ用  
  
  
  def index   #お知らせ一覧取得
    @private_topics = PrivateTopic.all
  end

  def new     #投稿画面表示
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
  end
  
  def destroy
  end
  
private

  def topic_params  #とりあえずタイトルと本文だけ、後ほどファイルアップロードできるようにする
    params.require(:private_topic).permit(:title, :content)
  end
  
end
