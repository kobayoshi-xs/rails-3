class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = Item.all
    @reservation = Reservation.all
  end

  def new
    @user = current_user
    @items = Item.find(params[:item_id])
    @reservation = Reservation.new
  end

  def create
    @items = Item.find(params[:item_id])
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "予約を確定しました"
      render :reservation_params_complete
    else
      render :new
    end
  end

  def show
  end

  def reservation_params_cfm
    @items = Item.find(params[:item_id])
    @reservation = Reservation.new(reservation_params)
  end

  def reservation_params_back
    @items = Item.find(params[:item_id])
    @reservation = Reservation.new(reservation_params)
    render :new
  end

  def reservation_params_complete
    @reservation = Reservation.find(:item_id)
  end

  def update
  end

  def edit

  end

  def destroy
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :count, :total_price, :item_id, :user_id, :roomname, :address, :introduction, :cost)
  end
end
