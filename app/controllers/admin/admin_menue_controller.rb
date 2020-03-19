class Admin::AdminMenueController < ApplicationController
  
 before_action :if_not_admin
  
  #管理者TOPメニュー表示
  def index
  end
  
  #ユーザー管理メニュー表示
  def user_edit
  end
  
  
  
  
  
  
  
  
private

  def if_not_admin
      redirect_to root_path unless current_user.admin?
  end
  
end
