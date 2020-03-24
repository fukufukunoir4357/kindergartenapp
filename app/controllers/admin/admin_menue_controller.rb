class Admin::AdminMenueController < ApplicationController
  #管理者でなければルートに弾く 
 before_action :if_not_admin
  
  #管理者TOPメニュー表示
  def index
  end
  
  #ユーザー管理メニュー表示
  def user_edit
  end
  
  #ユーザー一覧・検索ページ
  def users_index
      @users = User.all
  end
  
  #ユーザー一括登録画面表示
  def import_form
  end
  
  #ユーザー検索
  def search
      @searched_users = User.search(params[:search])
  end   
  
  #写真管理メニュー表示
  def article_menue
  end

  
  
  
private

  def if_not_admin
      redirect_to root_path unless current_user.admin?
  end
  
end
