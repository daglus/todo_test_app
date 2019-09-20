class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to :tasks
    end
  end
end
