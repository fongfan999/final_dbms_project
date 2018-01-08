class Admin::UsersController < ApplicationController
  before_action :set_user, except: :index
  def index
    @users = User.all
  end

  def show
    @tickets = @user.tickets.page(params[:page])
  end

  def destroy
    @user.destroy
    flash[:notice] = "Destroyed!"
    redirect_to admin_users_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
