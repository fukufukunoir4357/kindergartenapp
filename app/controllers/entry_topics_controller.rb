class EntryTopicsController < ApplicationController
  def index
      @entry_topics = EntryTopic.all
  end

  def new
      @entry_topic = EntryTopic.new
  end
  
  def create
      @entry_topic = EntryTopic.new(entry_params)
      if @entry_topic.save
      redirect_to entry_topics_index_path
      else
      flash.now[:danger] = '投稿失敗しました'
      render :new
      end
  end
  
  def edit
      @entry_topic = EntryTopic.find(params[:id])
  end
  
  def update
      @entry_topic = EntryTopic.find(params[:id])
      @entry_topic.update(entry_params)
      redirect_to entry_topics_index_path
  end
  
  def destroy
      @entry_topic = EntryTopic.find(params[:id])
      @entry_topic.destroy
      flash.now[:success] = '記事を削除しました'
      redirect_to entry_topics_index_path
  end

private

  def entry_params
    params.require(:entry_topic).permit(:term, :reception_day, :information)
  end
      
end
