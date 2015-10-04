class UsersController < ApplicationController
  # Before any Action, user must be authenticated (exist/signed in)
  before_action :authenticate_user!
  
  def index
  end
  
  def show
    # Find User in database by their ID.
    @user = User.find( params[:id] )
  end
end