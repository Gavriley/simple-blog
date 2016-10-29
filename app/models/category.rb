class Category < ActiveRecord::Base
	has_and_belongs_to_many :posts
	belongs_to :parent, class_name: "Category", foreign_key: :parent_id
	has_many :children, class_name: "Category", foreign_key: :parent_id

	scope :parent_categories, -> { where(parent_id: 0) }

	# def all_posts
	# 	children.inject(posts.clone) { |cat_posts, child| cat_posts.append(child.posts.map { |post| post }) }
	# end	

	def all_posts
		Post.joins(:categories).where(['categories.id = %d OR parent_id = %d', id, id]).distinct.order(created_at: :desc) 
	end	

	def has_children?
		children.exists?
	end	

	def has_posts?
		posts.exists?
	end	
end	