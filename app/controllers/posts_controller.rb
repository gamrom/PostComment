class PostsController < ApplicationController
  before_action :find_post, except: [:index, :new, :create]
	def index
		@posts = Post.all
  end

  def show
		@comments = Comment.where(post_id: @post)
  end

  def new
		@post = Post.new
  end

  def create
		Post.create(post_param)
		redirect_to posts_path
  end

  def edit
  end

  def update
		@post.update(post_param)
		redirect_to posts_path
  end

  def destroy
		@post.destroy
		redirect_to posts_path
  end

	private

	def find_post
		@post = Post.find(params[:id])
	end

	def post_param
		params.require(:post).permit(:title, :content)
	end
end
