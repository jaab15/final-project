class HomeController < ApplicationController
  def index
    cookies[:last_visited] = Time.now
  end

  def contact
  end

  def contact_submit
    @name = params[:full_name]
  end

end
