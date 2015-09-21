class AddPlanToUser < ActiveRecord::Migration
  def change
    # Add "Plan ID" column with integer value to Users database
    add_column :users, :plan_id, :integer
  end
end
