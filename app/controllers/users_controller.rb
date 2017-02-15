class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user.add_view
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = user_params[:password]
    if @user.save!
      flash[:notice] = "Welcome to the site!"
      redirect_to users_path
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def login
    @user = User.find_by_name(params[:name])
    if @user.password == params[:password]
      session[:user_id] = @user.id
    else
      redirect_to users_path
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
