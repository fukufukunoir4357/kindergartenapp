require 'csv'
class PaymentsController < ApplicationController
  #注文確定情報の記録、出力用
  
  def index
      @payments = Payment.all
      # respond_to do |format|
      #   format.csv do
      #send_data render_to_string, filename: "(注文情報).csv", type: :csv
      #   end
      # end
  end
  
 
  
  
  def create
      @user_buys = Buy.where(user_id: current_user.id)
      @pictures = current_user.pictures
      @pictures.zip(@user_buys) do |pic, user_buy|
        @payment = Payment.new
        @payment.image_name = user_buy.picture.image_file_name
        @payment.picture_id = pic.id
        @payment.user_id = current_user.id
        @payment.howmany = Buy.where(user_id: current_user.id, picture_id: pic.id).count
        @payment.price = Buy.where(user_id: current_user.id, picture_id: pic.id).count*108
        @payment.save!
      end
      redirect_to buys_thanks_path
  end
  
  def destroy
      @payment = Payment.find_by(user_id: params[:user_id])
      @payment.destroy
  end
  

end
