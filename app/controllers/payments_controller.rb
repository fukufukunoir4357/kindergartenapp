class PaymentsController < ApplicationController
  #注文確定情報の記録、出力用
  
  def create
      @payment = Payment.new(payment_params)
      params[:picture_ids]
      
  end
  
  def destroy
  end
  
private

  def payment_params
      params.require(:payment).permit(:picture_ids[])
  
  
end
