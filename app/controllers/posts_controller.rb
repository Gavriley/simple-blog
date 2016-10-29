class PostsController < ApplicationController
	before_action :check_for_query, only: :index
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	load_and_authorize_resource
	rescue_from ActiveRecord::RecordNotFound, with: -> { redirect_to root_path, notice: "Такої записі не існує." } 

	def index
		# current_user.update_attribute :admin, true
		# File.open('/home/darkness/insilico/log.txt', 'w') { |f| f << Post.page(2).map { |p| p.title }.join("\n") }
		@posts = Post.latest.page(params[:page])   
	end
	
	def personal
		@posts = current_user.posts.latest.page(params[:page])  
	end	

	def search
		@search = params[:query]
		@posts = Post.search(params[:query]).latest.page(params[:page])
	end	

	def show

	end

	def new
		@post = Post.new
	end

	def edit
		
	end

	def create
		@post = current_user.posts.new(create_params)

		if @post.save
			redirect_to @post, notice: "Запис успішно добавлена"
		else
			render :new
		end		
	end

	def update

		if @post.update(update_params)
			@post.thumbnail.try(:destroy) if params[:delete_image]

			redirect_to @post, notice: "Запис успішно обновлена"
		else
			render :edit
		end	
	end

	def destroy
		@post.destroy
		redirect_to personal_posts_path, notice: "Запис успішно видалена" 
	end

	private
		def set_post
			@post = Post.includes(:categories).find(params[:id])
		end	

		def create_params
			params.require(:post).permit(:title, :content, :thumbnail, { category_ids: [] })
		end

		def update_params
			params.require(:post).permit(:title, :content, :thumbnail, :created_at, :delete_image, { category_ids: [] })
		end
		
		def check_for_query
	    redirect_to search_posts_path(query: params[:query]) if params[:query].present?
	  end
end	