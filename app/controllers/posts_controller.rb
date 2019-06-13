class PostsController < ApplicationController
	before_action :get_post, only: [:update, :show, :edit]

	def index
		@posts = Post.all
	end


	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(post_params)
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  
	  @post.update(post_params)
	#   byebug
	  redirect_to post_path(@post)
	end

	def show
		# byebug
	end


	private 

	def post_params
		return params.require(:post).permit(:title, :description)
	end

	def get_post
		return @post = Post.find(params[:id])
	end
end