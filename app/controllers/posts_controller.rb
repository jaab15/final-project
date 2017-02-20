class PostsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  before_action :authorize_access, only: [:edit, :update]

  def new
      @post = Post.new
  end

  def create
    require_post

    @post = Post.new(@post_params)
    @post.user = current_user
    @post.topic_id = params[:topic_id]
    @post.replyto = "" if Post.count == 0

    if  @post.save
#       refresh the page to see the new post
        redirect_to :back
    else
        alert 'something got wrong, the post have not been saved!'
    end
  end

  def edit
  end

  def index
      if params[:search]
         @post = Topic.search_in_topics(params[:search]).page(params[:page])
      else
         @posts = Post.where(topic_id: params[:topic_id]
                            ).joins("INNER JOIN users ON posts.user_id = users.id"
                                   ).order(id: :asc).page(params[:page])

         @users = User.find_by_sql( "select U.id,
                                            U.username,
                                            U.created_at
                                       from users  as U,
                                            posts  as P,
                                            topics as T
                                      where  U.id = P.user_id
                                        and  T.id = P.topic_id
                                        and  T.id = #{params[:topic_id]}
                                   order by P.id asc
                                      limit 25 "
                                   )
      end
  end

  private

  def require_post
      @post_params = params.require(:post).permit(
                                                      :body,
                                                      :replyto
                        )
  end

  def authorize_access
      unless can? :manage, @post
        redirect_to root_path, alert: 'access denied'
      end
  end

end
