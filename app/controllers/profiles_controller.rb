class ProfilesController < ApplicationController
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
  
  private
    def profile_params
      # Whitelist all data entered into our form fields.
      params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
    end
end