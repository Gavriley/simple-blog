class CategoriesController < ApplicationController
	before_action :set_category, only: [:show, :edit]
	# rescue_from Exception, with: -> { redirect_to root_path, notice: "Такої категорії не існує." } 

	def show
		File.open('/home/darkness/insilico/log.txt', 'w') { |f| f << Post.joins(:categories).where('category_id = 4 OR parent_id = 4').map { |post| post.id }.join("\n") }
		@posts = @category.all_posts.page(params[:page]) 
	end	

	def new 
		@title = "Нова категорія"
		@category = Category.new
	end
	
	def edit
		@title = "Редагувати категорію"
	end

	def create

	end	

	private
		def set_category
			@category = Category.find(params[:id])
		end	

		def category_params
			params.require(:category).permit(:name)
		end	
end	