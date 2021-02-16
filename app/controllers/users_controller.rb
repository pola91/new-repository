class UsersController < ApplicationController
  before_action :set_user, only: :archive_user
  def index
    render jsonapi: User.all.kept
  end

  def archive_user
    @user.update(archiver_id: current_user.id, discarded_at: Time.now) unless @user.discarded?
    render jsonapi: @user
  end 

  def unarchive_user
    @user.update(archiver_id: current_user.id, discarded_at: nil) if @user.discarded?
    render jsonapi: @user
  end 

  private

  def set_user
    @user = User.find_by_id(params[:user_id])
  end
end
