class UsersController < ApplicationController
  def show
    @nickname =  current_user.nickname
    @alltweets = Tweet.all.order("id DESC").page(params[:page]).per(13)
  end
end
