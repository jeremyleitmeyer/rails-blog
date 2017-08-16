class CommentsController < ApplicationController
  def new

  end

  def create
  	user = User.find_by_id(session[:user_id])
  	comment = user.posts.comments.new(params[:comment])
	  if comment.save && user.save
	    redirect_to post_path(post)
	  else
	    redirect_to post_path(new)
	  end
  end

  def edit

  end

  def update

  end

  def destroy

  end

end
