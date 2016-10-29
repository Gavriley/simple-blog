class AddThumbnailToPosts < ActiveRecord::Migration
  def up
  	add_attachment :posts, :thumbnail
  end	

  def down
  	remove_attachment :posts, :thumbnail
  end	
end
