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
    @user = User.create(user_params)

    previous = ''
    number_of_records = params[:user][:pages].size / 4
    pages = params[:user][:pages]

    (0..(number_of_records - 1)).each do |index|
    # params[:user][:pages].each_with_index.map do |page, index|
      # @user.pages.create(url: page["input_#{ index }_url"], date_time: page["input_#{ index }_dateTime"], page: page["input_#{ index }_page"]) unless previous == page["input_#{ index }_page"]
      @user.pages.create(url: pages["input_#{ index }_url"], date_time: pages["input_#{ index }_dateTime"], page: pages["input_#{ index }_page"]) unless previous == pages["input_#{ index }_page"]

      previous = pages["input_#{ index }_page"]
    end

    @pages = Page.create(user_params[:pages])

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
    params.require(:user).permit(:name, :email, :token, :pages)
  end
end
