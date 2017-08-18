class CommentsController < ApplicationController
def new
  @comment = Comment.new
end

def create
	@post = Post.find_by_id(:post_id)
	# create comments and save to specific post
 	@comment = Comment.new(comment_params)
  if @comment.save
    redirect_to posts_path(@post)
  else
    redirect_to "/"
  end
end

def show
  @comment = Comment.find_by_id(params[:id])
end

private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end