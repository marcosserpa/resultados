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
    @user = User.find_or_initialize_by(token: user_params[:token])

    if @user.new_record?
      @user.email = user_params[:email]
      @user.name = user_params[:name]
    end

    if !@user.new_record? || @user.save
      previous = !@user.pages.blank? ? @user.pages.last.page : ''
      pages = params[:user][:pages]
      number_of_records = pages.size / 4

      (0..(number_of_records - 1)).each do |index|
        @user.pages.create(url: pages["input_#{ index }_url"], date_time: pages["input_#{ index }_dateTime"], page: pages["input_#{ index }_page"]) unless previous == pages["input_#{ index }_page"]

        previous = pages["input_#{ index }_page"]
      end

      session[:token] = @user.token
    end

    respond_to do |format|
      if @user.errors.blank?
        format.html { redirect_to statics_thanks_path }
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
    params.require(:user).permit(:name, :email, :token, :pages)
  end
end
