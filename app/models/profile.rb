class Profile < ActiveRecord::Base
  # Active Record Association
  # Every Profile belongs to one User
  belongs_to :user
end