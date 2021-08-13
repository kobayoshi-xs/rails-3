class BasesController < ApplicationController
  before_action :authenticate_user!
  before_action :user_register_show, only: [:show, :update, :user_profile, :user_register]

  def index
    @users = User.all
    @items = Item.all
    @reservations = Reservation.all
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

  def user_register
    @user = current_user
    @item = Item.new
  end

  def user_register_show
    @user = current_user
    @items = @user.items
  end

  def edit
    @user = current_user
    @items = Item.find(params[:id])
  end

  def destroy
    @user = current_user
    @items = Item.find(params[:id])
    @items.destroy
    flash[:notice]="ルーム登録を削除しました"
  end

  def reservation_show
    @user = current_user
    @reservations = @user.reservations
  end
end
