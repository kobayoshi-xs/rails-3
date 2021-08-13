class ItemsController < ApplicationController
  before_action :search

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params.require(:item).permit(:roomname, :introduction, :cost, :address, :image, :user_id))
    if @item.save
      flash[:notice] = "ルームの新規登録をしました"
      redirect_to bases_path
    else
      redirect_to bases_user_register_path
    end
  end

  def search
    @q = Item.ransack(params[:q])
    @results = @q.result(distinct: true)
  end

  def show
  end

  def edit
  end

  def update
    @user = current_user
    @items = Item.find(params[:id])
    if current_user == @user
      if @items.update(params.require(:item).permit(:roomname, :introduction, :cost, :address, :image, :user_id))
        flash[:notice]="登録ルームの更新しました"
        redirect_to bases_user_profile_path
      else
        redirect_to edit_basis_path
      end
    else
      redirect_to "bases"
    end
  end

  def destroy
  end
end
