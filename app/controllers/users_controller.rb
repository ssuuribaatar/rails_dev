
class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    @users = User.all.page(params[:page])
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      bypass_sign_in(@user)
      redirect_to ({ action: :show, id: @user }), notice: 'Амжилттай үүслээ.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      bypass_sign_in(@user)
      redirect_to ({ action: :show, id: @user }), notice: 'Нууц үг амжилттай солигдлоо.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy!
    redirect_to users_path, notice: 'Амжилттай устгалаа.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end