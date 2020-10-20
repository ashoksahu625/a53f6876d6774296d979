class Api::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  
  def index
    @users = User.find_all
    render json: {users: @users}
  end

  
  def show
    render json: {user: @user}
  end

  
  def create
    @user = User.new(user_params)
    @user._id = User.last.try(:id).to_s.to_i + 1
    if @user.save
      render json: {user: @user}
    else
      render json:{ errors: @user.errors, status: :unprocessable_entity }
    end
  end

  def update
    if @user.update(user_params)
      render json: {status: :ok, location: @user }
    else
      render json:{ errors: @user.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    if @user.destroy
      render json: {status: :ok, location: @user }
    else
      render json:{ errors: @user.errors, status: :unprocessable_entity }
    end
  end

  def typeahead
    data = User.find_data(params)
    render json: {data: data}
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:firstName, :lastName, :email)
    end
end
