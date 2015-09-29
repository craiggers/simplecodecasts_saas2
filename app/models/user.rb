class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Active Record Associations
  belongs_to :plan
  # Every User has one Profile
  has_one :profile
  # Use hidden field/Stripe card token to help create Stripe customer
  attr_accessor :stripe_card_token
  
  def save_with_payment
    if valid?
      # Use Stripe gem to send info to Stripe (create/charge customer), returns id
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
      self.stripe_customer_token = customer.id
      # Save the user
      save!
    end
  end
end
