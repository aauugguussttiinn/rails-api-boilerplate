class Api::V1::UsersController < Api::BaseController

  before_action :find_user, only: %w[show update destroy is_admin]
  before_action :is_admin, only: %i[update destroy]

  def show
    render json: @user
  end

  def index
    render json: User.all
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: {errors: [{"detail":"failed"}]}
    end
  end

  def destroy
    @user.destroy
    render json: [detail:"ok"]
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def is_admin
    if current_user != @user
      render json: {error:"Non autorisé"}
    end
  end

end