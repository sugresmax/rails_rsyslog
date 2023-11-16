class AuthenticatedController < ApplicationController
  before_action :authenticate_user!

  private

  def authenticate_user!
    redirect_to login_path unless current_user
  end
end
