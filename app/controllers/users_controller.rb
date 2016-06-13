class UsersController < ApplicationController
  before_action :set_user, only: :show

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    binding.pry
    @user = User.create(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to statics_thanks_path, clear_storage: "localStorage.clear();" }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :token)
  end
end
