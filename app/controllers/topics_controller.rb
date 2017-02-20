class TopicsController < ApplicationController
  before_action :authenticate_user, except: [:index]

  def index
    if params[:search]
       @found_in_Topics = Topic.search_in_topics(params[:search]).page(params[:page])
    end
  end

  def new
      @topic = Topic.new
  end

  def create
      require_topic

      @topic = Topic.new(@topic_params)
      @topic.user_id = current_user.id
      @topic.category_id = params[:category_id]

      @topic.owner = current_user.id
      @topic.enable = true

      if  @topic.save
#         refresh the page to see the new post
          redirect_to root_path
      else
          alert 'something got wrong, the message have not been saved!'
      end
  end


private

    def require_topic
        @topic_params = params.require(:topic).permit(
                                                    :title,
                                                    :description
                                                    )
    end

    def authorize_access
        unless can? :manage, @topic
          redirect_to root_path, alert: 'access denied you have to be sign in!'
        end
    end

end
