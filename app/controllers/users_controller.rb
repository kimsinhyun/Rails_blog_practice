class UsersController < ApplicationController
  before_action :set_user

  def profile
    @user.views += 1
    @user.save!
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
