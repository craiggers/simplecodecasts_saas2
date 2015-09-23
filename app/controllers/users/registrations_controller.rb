class Users::RegistrationsController < Devise::RegistrationsController
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
end