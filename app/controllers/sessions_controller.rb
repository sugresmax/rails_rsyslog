class SessionsController < ApplicationController
  def new
    redirect_to root_path if session[:user_id]
    @user = User.new
  end

  def create
    return unless params[:session]

    if user_authenticated?
      session[:user_id] = @user.id
      redirect_to root_path, notice: t('shared.logged_in')
    else
      redirect_to login_path, alert: t('shared.login_error')
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to login_path, notice: t('shared.successfully_logged_out')
  end

  def user_authenticated?
    @user = User.find_by name: params[:session][:name]
    @user.present? && @user.authenticate(params[:session][:password])
  end
end
