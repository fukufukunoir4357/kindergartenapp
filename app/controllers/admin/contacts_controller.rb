class Admin::ContactsController < ApplicationController
  
  def index
      @contacts = Contact.page(params[:page]).order(created_at: :desc).per(16)
  end

  def edit
      @contact = Contact.find(params[:id])
  end
  
  def update
      contact = Contact.find(params[:id])
      contact.update(contact_params)
      ContactMailer.send_when_admin_reply(contact).deliver_now
      redirect_to :index
  end
  
  def destroy
      contact = Contact.find(params[:id])
      contact.destroy
      @contacts = Contact.page(params[:page]).order(created_at: :desc).per(16)
      render :index
  end
  
private

  def contact_params
      params.require(:contact).permit(:content, :reply)
  end
  
end
