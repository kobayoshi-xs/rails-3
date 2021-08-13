# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  #GET /resource/sign_up
  def new
    @user = User.new
  end

  #POST /resource
  def create
    @user = User.new(params.require(:user).permit(:nickname,:email, :password, :password_confirmation))
    if @user.save
      sign_in @user
      redirect_to basis_path(@user.id)
    else
      render :new
    end
  end

  # GET /resource/edit
  def edit
    @user = current_user
  end

  # PUT /resource
  def update
    @user = current_user
    if current_user == @user
      if @user.update(params.require(:user).permit(:email, :password, :password_confirmation, :current_password))
        sign_in(current_user, bypass: true)
        flash[:notice]="ユーザーのパスワードを変更しました"
        redirect_to basis_path(current_user)
      else
        render :edit
      end
    else
      redirect_to "bases"
    end
  end
  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :password_confirmation, :current_password, :roomname, :introduction, :cost, :address])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute, :nickname, :email, :password, :password_confirmation, :current_password, :roomname, :introduction, :cost, :address])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    basis_path(resource)
  end

  # The path used after sign up for inactive accounts.
  #def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  #end
end
