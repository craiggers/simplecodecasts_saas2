class ProfilesController < ApplicationController
  def new
    # Form where a user can fill out their own profile.
    # Find out who is logged in using params Hash (dictionary).
    @user = User.find( params[:user_id] )
    # Demo how to access Query String Parameter added to Path.
    @variable = params[:hello]
    #
    @profile = @user.build_profile
  end
end