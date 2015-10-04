class ProfilesController < ApplicationController
  # Use Rails and Devise gem functionality to prevent url manipulation
  # Before any Action, user must be authenticated (exist/signed in)
  before_action :authenticate_user!
  # Before any Action, user can only be the current one
  before_action :only_current_user
  
  def new
    # Form where a user can fill out their own profile.
    # Find out who is logged in using params Hash (dictionary).
    @user = User.find( params[:user_id] )
    # Demo how to access Query String Parameter added to Path.
    #@variable = params[:hello]
    #
    @profile = Profile.new
  end
  
  def create
    # Actually save the User's info typed into our form.
    # Find out who is logged in using params Hash (dictionary).
    @user = User.find( params[:user_id] )
    # Pass in all data entered into our form fields.
    @profile = @user.build_profile(profile_params)
    
    if @profile.save
      # Flash message for visual feedback
      flash[:success] = "Profile Updated!"
      # Direct to User's "show" page.
      redirect_to user_path( params[:user_id] )
    else
      # Render the "new" action again.
      render action: :new
    end
    
  end
  
  def edit
    # Identify which user's Form we want to edit
    @user = User.find( params[:user_id] )
    # Load the profile for this user into the Form fields
    @profile = @user.profile
  end
  
  def update
    # Identify which user's Form we want to update
    @user = User.find( params[:user_id] )
    # Assign the User's profile
    @profile = @user.profile
    # Pass in all data entered into our form fields.
    if @profile.update_attributes(profile_params)
      # Flash message for visual feedback
      flash[:success] = "Profile Updated!"
      # Redirect user to their Profile page
      redirect_to user_path( params[:user_id] )
    else
      # Render the "edit" action again.
      render action: :edit
    end
  end
  
  private
    def profile_params
      # Whitelist all data entered into our form fields.
      params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
    end
    
    def only_current_user
      # Identify the user that is logged in
      @user = User.find( params[:user_id] )
      # Redirect user to the home page, unless they are the current user
      redirect_to(root_url) unless @user == current_user
    end
end