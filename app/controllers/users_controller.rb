class UsersController < ApplicationController
  def show
    # Find User in database by their ID.
    @user = User.find( params[:id] )
  end
end