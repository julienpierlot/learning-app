class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def new

  end

  def show
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = Topic.new(topic_params)
      if @topic.save
        redirect_to @topic
      else
        render 'new'
      end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    redirect_to topics_path
  end


  private

    def topic_params
      params.require(:topic).permit(:title, :message)
    end



end
