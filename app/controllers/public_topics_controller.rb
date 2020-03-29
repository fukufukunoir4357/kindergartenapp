class PublicTopicsController < ApplicationController
#一般公開向けお知らせ用  
  
  def index
    @public_topics = PublicTopic.all.order(created_at: :desc)
  end

  def new
    @public_topics = PublicTopic.all.order(created_at: :desc)
    @public_topic = PublicTopic.new
  end

  
  def create
    @public_topic = PublicTopic.new(topic_params)
    
    if @public_topic.save
       redirect_to public_topics_index_path
    else
       flash.now[:danger] = '投稿失敗しました'
    end
  end
  

  def edit
    @public_topic = PublicTopic.find(params[:id])
  end
  
  def update
    @public_topic = PublicTopic.find(params[:id])
    @public_topic.update(topic_params)
    redirect_to public_topics_index_path(@public_topic.id)
  end
  
  def destroy
    @public_topic = PublicTopic.find(params[:id])
    @public_topic.destroy
    flash[:notice] = 'お知らせ記事を削除しました'
    redirect_to public_topics_index_path
  end
  
private

  def topic_params
    params.require(:public_topic).permit(:title, :content)
  end
  
end
