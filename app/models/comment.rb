class Comment < ActiveRecord::Base
	after_create :send_favorite_emails

	belongs_to :post
	belongs_to :user

	validates :body, length: { minimum: 5 }
	validates :body, presence: true
	validates :user_id, presence: true

	default_scope { order('updated_at DESC')}

	private

	def send_favorite_emails
		post.favorites.each do |favorite|
			FavoriteMailer.new_comment(favorite.user, post, self).deliver
		end	
	end
end
