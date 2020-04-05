class ChecksController < ApplicationController
#private_topicsに対する保護者の確認済みチェック機能用

  def index
      @checks = Check.all
  end
  
  
  def create
      @check = Check.new(check_params)
      @check.user_id = current_user.id
      @check.save!
      redirect_back(fallback_location: private_topics_show_path(params[:private_topic_id]))
  end
  
  def destroy
  end
  
private

  def check_params
      params.require(:check).permit(:private_topic_id)
  end
  
end
