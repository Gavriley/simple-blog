class Category < ActiveRecord::Migration
  def change
  	create_table :categories do |t|
  		t.string :name, null: false, default: ""
  		t.belongs_to :user, index: true
  	end

  	add_index :categories, :name, unique: true	
  end
end
