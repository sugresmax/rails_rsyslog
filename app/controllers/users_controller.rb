class UsersController < AuthenticatedController
  before_action :set_user
  def show; end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: t('.update_successful')
    else
      render 'show', status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :password_challenge)
          .with_defaults(password_challenge: '')
  end
end
