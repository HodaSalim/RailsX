class UsersController < ApplicationController
  # Ensures users are signed in before accessing certain actions
  before_action :authenticate_user!, only: [ :index, :edit, :update, :destroy, :following, :followers ]
  before_action :correct_user, only: [ :edit, :update ]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
      Rails.logger.debug "Params: #{params.inspect}"

    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url, status: :see_other
  end

  def following
    @title = "Following"
    @user = current_user
    @users = @user.following.paginate(page: params[:page])
    render "show_follow", status: :unprocessable_entity
  end

  def followers
    @title = "Followers"
    @user = current_user
    @users = @user.followers.paginate(page: params[:page])
    render "show_follow", status: :unprocessable_entity
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # Before filters

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url, status: :see_other) unless @user == current_user
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url, status: :see_other) unless current_user.admin?
    end
end

