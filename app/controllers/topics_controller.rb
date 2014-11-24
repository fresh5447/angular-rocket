class TopicsController < ApplicationController
  def index
  	@topics = Topic.paginate(page: params[:page], per_page: 10)
  	authorize @topics
  end

  def new
  	@topic = Topic.new
  	authorize @topic
  end

  def show
  	@topic = Topic.find(params[:id])
  	@posts = @topic.posts.paginate(page: params[:page], per_page: 10)
  	authorize @topic
  end

  def edit
  	@topic = Topic.find(params[:id])
  	authorize @topic
  end

  def create
  	@topic = Topic.new(params.require(:topic).permit(:name, :description, :public))
  	authorize @topic
  	if @topic.save
  		flash[:notice] = "Your topic was saved successfully"
  		redirect_to @topic
  	else
  		flash[:error] = "There was a problem saving your Topic"
  		render :new
  	end
  end

end
