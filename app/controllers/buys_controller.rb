class BuysController < ApplicationController
#写真購入用中間テーブル

  #写真注文数増
  def create
    
      @article = Article.find(params[:article_id])
      @buy = current_user.buys.create(picture_id: params[:picture_id])
      redirect_back(fallback_location: article_path(@article))
  end
  
  #写真注文数減
  def destroy
      @buy = Buy.find_by(picture_id: params[:picture_id], user_id: current_user.id)
      @buy.destroy
      redirect_back(fallback_location: article_path(:article_id))
  end
  
  #オーダー確認画面での注文数増
  def increase
      @buy = current_user.buys.create(picture_id: params[:picture_id])
      redirect_back(fallback_location: buys_order_path(current_user))
  end
  
  #オーダー確認画面での注文数減
  def decrease
      @buy = Buy.find_by(picture_id: params[:picture_id], user_id: current_user.id)
      @buy.destroy
      redirect_back(fallback_location: buys_order_path(current_user))
  end
  
  #オーダー確認画面表示
  def order
      @pictures = current_user.pictures
      @user = current_user
      
  end
  
  #注文確定後のありがとうページ表示
  def thanks
  end
end
