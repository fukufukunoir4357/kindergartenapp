class BuysController < ApplicationController
#写真購入用中間テーブル

  def create
    
      @article = Article.find(params[:article_id])
      @buy = current_user.buys.create(picture_id: params[:picture_id])
      redirect_back(fallback_location: article_path(@article))
  end
  
  def destroy
      @buy = Buy.find_by(picture_id: params[:picture_id], user_id: current_user.id)
      @buy.destroy
      redirect_back(fallback_location: article_path(:article_id))
  end
  
end
