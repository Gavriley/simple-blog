class Post < ActiveRecord::Base
	has_attached_file :thumbnail, styles: { :large => '300x300>', :medium => '200x200>', :small => '150x150>' }
	validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\z/
	validates :title, length: { maximum: 70, message: "Завеликий заголовок(максимум 70 символів)" }, 
		presence: { message: "Заповніть поле заголовок"  }
		
	scope :latest, -> { order(created_at: :desc).includes(:user) }
	belongs_to :user
	has_and_belongs_to_many :categories

	def self.search(query)
		joins(:user).
			where("LOWER(posts.title) LIKE LOWER(?) OR LOWER(posts.content) LIKE LOWER(?) OR LOWER(users.login) LIKE LOWER(?)", "%#{query}%", "%#{query}%", "%#{query}%")
	end	

	def has_categories?
		categories.exists?
	end	
end	