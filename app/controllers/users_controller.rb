class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show 
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "新規登録に成功しました"
      redirect_to @user
    else
      flash
      render :new
    end
  end


private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end