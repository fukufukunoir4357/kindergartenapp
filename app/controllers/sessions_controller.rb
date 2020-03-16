class SessionsController < ApplicationController
  
  
  def new
  end
  
  
  
  def create
    
    user = User.find_by(name: params[:session][:name])
      if user && user.authenticate(params[:session][:password]) && user.admin?
        log_in user
        redirect_to admin_admin_menue_index_path
      elsif user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to private_topics_index_path
      else
        flash.now[:danger] = 'ユーザー名またはパスワードが一致しません'
        render 'new'
      end
  end
  
  
  
  def destroy
     log_out
     redirect_to root_path
  end
  
  
  
end
