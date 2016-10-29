class Post < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.string :title, null: false, default: ""
  		t.text :content, default: ""
  		t.boolean :published, default: true
  		t.belongs_to :user, index: true
  		t.timestamps null: false
  		t.attachment :thumbnail
  	end	
  end
end
