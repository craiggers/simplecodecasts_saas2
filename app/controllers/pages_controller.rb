class PagesController < ApplicationController
    def home
        # Define instance variables assigned to Database tables
        # Find method "plucks out" Plan with particular ID
        @basic_plan = Plan.find(1)
        @pro_plan = Plan.find(2)
    end
    
    def about
    end
end
