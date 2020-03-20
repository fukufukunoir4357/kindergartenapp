class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
      @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
  end


  
  #ユーザー一括登録処理
  def import
      User.import(params[:file])
      flash.now[:success] = '登録成功しました。ユーザー一覧でご確認ください'
      redirect_to admin_admin_menue_user_edit_path
  end
  
  
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
      @user.destroy
      redirect_to admin_admin_menue_users_index_path, notice: 'User was successfully destroyed.'
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
        @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation, :email, :firstchild, :secondchild, :thirdchild)
    end
    
    def update_params
        params.require(:user).permit(:name, :firstchild, :secondchild, :thirdchild, :email)
    end
    
end
