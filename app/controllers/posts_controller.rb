class PostsController < ApplicationController
	def index	
		@posts = Post.all
	end

  def show
  	@post = Post.find_by_id(params[:id])
  	@user = @post.user
  	@comment = @post.comment
  end

  def new
  end

  def create
 	user = User.find_by_id(session[:user_id])
  post = user.posts.new(post_params)
	  if post.save && user.save
	    redirect_to post_path(post)
	  else
	    redirect_to post_path(new)
	  end
  end

  def edit
  	@post = Post.find_by_id(params[:id])
  end

  def update
  	@post = Post.find_by_id(params[:id])
  	@post.update(post_params)
  	redirect_to post_path(@post)
  end

  def destroy
  end

  private

  def post_params
  	params.require(:post).permit(:title, :content)
  end

end
