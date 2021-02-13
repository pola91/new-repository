class UsersController < ApplicationController
  before_action :set_user, only: :archive_user
  def index
    render jsonapi: User.all.kept
  end

  def archive_user
    @user.update(archiver_id: current_user.id, discarded_at: Time.now)
    render jsonapi: User.all.kept
  end 

  private

  def set_user
    @user = User.kept.find_by_id(params[:user_id])
  end
end
