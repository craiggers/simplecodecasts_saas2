class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.decimal :price
      # Create "generated at" and "update" columns
      t.timestamps
    end
  end
end
