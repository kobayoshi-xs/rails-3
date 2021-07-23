class BasesController < ApplicationController
  before_action :authenticate_user!
  #before_action :user_profile, only: [:user_profile]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
  end

  def show　
    @user = current_user
  end

  def update
    @user = current_user
    if current_user == @user
      if @user.update(params.require(:user).permit(:name,:image,:profile))
        flash[:notice]="ユーザーのプロフィールを更新しました"
        render :show
      else
        render :show
      end
    else
      redirect_to "bases"
    end
  end

  def user_profile
    @user = current_user
  end

  def edit
  end

  def destroy
  end
end
