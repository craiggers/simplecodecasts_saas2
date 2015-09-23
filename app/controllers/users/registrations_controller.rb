class Users::RegistrationsController < Devise::RegistrationsController
  # Only when New action (sign up page) occurs, run select_plan function beforehand
  before_filter :select_plan, only: :new
  def create
    # Import all functionality from superclass
    super do |resource|
      if params[:plan]
        # Save value to plan id
        resource.plan_id = params[:plan]
        if resource.plan_id == 2
          resource.save_with_payment
        else
          resource.save
        end
      end
    end
  end
  
  private
    def select_plan
      # Make sure user can't submit a Query String Param value other than 1 or 2
      unless params[:plan] && (params[:plan] == '1' || params[:plan] == '2')
        flash[:notice] = "Please select a membership plan to sign up."
        redirect_to root_url
      end
    end
end