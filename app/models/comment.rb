class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :post
end
# create relationships between users/posts and a comment
