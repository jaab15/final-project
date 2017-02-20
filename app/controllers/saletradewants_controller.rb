class SaletradewantsController < ApplicationController
  before_action :authenticate_user, except: [:index]

  def index
      @saletradewants = SaleTradeWant.where("topic_id = ?", params[:topic_id]
                         ).joins("INNER JOIN users ON sale_trade_wants.user_id = users.id"
                                ).order(id: :asc).page(params[:page])

      @users = User.find_by_sql( "select U.id,
                                         U.username,
                                         U.created_at
                                    from users as U,
                                         sale_trade_wants as S
                                   where (U.id = S.user_id)
                                order by S.id asc
                                   limit 25 "
                               )
  end

  def create
      require_saletradewants
      find_topic
      byebug
      @saletradewants = SaleTradeWant.new(@saletradewants_params)
      @saletradewants.user = current_user
      @saletradewants.topic = @topic
      byebug
      if  @saletradewants.save
          redirect_to root_path
      else
          flash.now[:alert] = 'something got wrong the saletradewants have not been saved!'
          # render :new
      end
  end


  private

    def find_topic
        @topic = Topic.find params[:topic_id]
    end

    def require_saletradewants
        @saletradewants_params = params.require(:sale_trade_want).permit(
                                                                        :type_stw,
                                                                        :title,
                                                                        :description,
                                                                        # :active,
                                                                        # :emailbuyer,
                                                                        # :buyer_id,
                                                                        # :feedback,
                                                                        :user_id,
                                                                        :topic_id
                                                                       )
    end
end
