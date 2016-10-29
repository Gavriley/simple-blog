class Category < ActiveRecord::Base
	has_and_belongs_to_many :posts
	belongs_to :user

	def all_posts
		Post.joins(:categories).where(['categories.id = %d OR parent_id = %d', id, id]).distinct.order(created_at: :desc) 
	end	
end	