class Contact < ActiveRecord::Base
    # Active record validations
    validates :name, presence: true
    validates :email, presence: true
end