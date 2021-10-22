class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @user = User.create(user_params)
    respond_to do |format|
      if @user.save
        format.js
      else
        format.js { render action: 'new' }
      end
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.js
      else
        format.js { render action: 'edit' }
      end
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
