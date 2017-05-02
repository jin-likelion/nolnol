class HomeController < ApplicationController
  def index
    unless user_signed_in?
  	      redirect_to '/login'
  	end
  end
end
