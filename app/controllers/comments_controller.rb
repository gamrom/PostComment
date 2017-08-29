class CommentsController < ApplicationController
  before_action :find_post
	def create
		@post.comments.create(comment_param)
		redirect_to post_path(@post)
  end

  def destroy
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
  end

	private
	def comment_param
		params.require(:comment).permit(:content)
	end
	def find_post
		@post = Post.find(params[:post_id])
	end
end
