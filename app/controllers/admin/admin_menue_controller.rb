class Admin::AdminMenueController < ApplicationController
  
 before_action :if_not_admin
  
  
  def index
  end
  
  def user_edit
  end
  
  
  
  
  
  
private

  def if_not_admin
      redirect_to root_path unless current_user.admin?
  end
  
end
