class User::ContactsController < ApplicationController
  
  def new
      @contact = Contact.new
  end
  
  def create
      @contact = Contact.new(contact_params)
      if @contact.save
         redirect_to root_path
      else
         @contacts = Contact.all
         render :new
      end
      flash[:success] = 'お問い合わせを送信しました'
  end
  
private
  
  def contact_params
    params.permit(:email, :content)
  end
    
end
