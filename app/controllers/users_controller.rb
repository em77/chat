class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]

  attr_accessor :user
  helper_method :user

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if user.save
        format.html { redirect_to root_path, notice:
          "#{user.name} was created" }
      else
        format.html { render :new }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
