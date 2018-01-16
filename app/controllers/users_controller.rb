class UsersController < ApplicationController
  :set_user, only: [:show]
  before_action :authenticate_user!

  def show; end

  def set_user
    @user = User.find(params[:id])
  end

end
