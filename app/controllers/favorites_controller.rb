class FavoritesController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		favorite = current_user.favorites.build(post: @post)
		# authorize @favorite
		if favorite.save
			flash[:notice] = "post was favorited"
			redirect_to [@post.topic, @post]
		else
			flash[:error] = "there was an error, try again"
			redirect_to @post
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		favorite = current_user.favorites.build(post: @post)
		# authorize @favorite
		if favorite.destroy
			flash[:notice] = "successfully unfavorited"
			redirect_to [@post.topic, @post]
		else
			flash[:alert] = "unable to unfavorite, try again."
			redirect_to @post
		end
	end
end
