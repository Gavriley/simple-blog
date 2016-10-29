class Post < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.string :title, null: false, default: ""
  		t.text :content, default: ""
  		t.boolean :published, default: false
  		t.belongs_to :user, index: true
  		t.timestamps null: false
  	end	
  end
end
