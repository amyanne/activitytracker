class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name
      t.string :grade
      t.string :location
      t.integer :user_id
    end 
  end
end
