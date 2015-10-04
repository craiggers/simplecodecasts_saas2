class UsersController < ApplicationController
  # Before any Action, user must be authenticated (exist/signed in).
  before_action :authenticate_user!
  
  def index
    # Find all Users in database.
    @users = User.all
  end
  
  def show
    # Find User in database by their ID.
    @user = User.find( params[:id] )
  end
end