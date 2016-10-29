class Role < ActiveRecord::Migration
  def change
  	create_table :roles do |t|
  		t.string :name, null: false, default: ""
  		t.string :title, default: ""
  	end	
  end
end
