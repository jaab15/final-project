class CategoriesController < ApplicationController
  before_action :authenticate_user, except: [:index]

  def index
  end

  def new
      @category = Category.new
  end

  def create
      require_category

      @category = Category.new(@category_params)

      if  @category.save
#         refresh the page to see the new post
          redirect_to root_path
      else
          alert 'something got wrong the category have not been saved!'
      end
  end


  private

    def require_category
        @category_params = params.require(:category).permit(
                                                    :title,
                                                    :description
                                                    )
    end

    def authorize_access
        unless can? :manage, @category
          redirect_to root_path, alert: 'access denied you have to be sign in!'
        end
    end

end
