class Category < ActiveRecord::Migration
  def change
  	create_table :categories do |t|
  		t.string :name, null: false, default: ""
  		t.integer :parent_id, index: true, default: 0
  	end

  	add_index :categories, :name, unique: true	
  end
end
