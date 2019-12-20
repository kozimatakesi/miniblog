class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.all.order("id DESC").page(params[:page]).per(10)
    #@tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end
  
  def new
  end
  
  def create
    @oppo = User.find(params[:opponent])
    @curr = current_user
    @curr.update(game_count: @curr.game_count.to_i + 1)
    @oppo.update(game_count: @oppo.game_count.to_i + 1)
    my_expectation = 1 / (1 + (10 ** ((@oppo.raiting - @curr.raiting) / 400 ) ))
    oppo_expectation = 1 - my_expectation.to_f
    krate = 16    
    
    if params[:winer] == @curr.nickname
      @curr.update(raiting: @curr.raiting + krate * ( 1 - my_expectation), win_count: @curr.win_count + 1)
      @oppo.update(raiting: @oppo.raiting + krate * ( 0 - oppo_expectation))
      @win = @curr.nickname
      #@oppo.update(raiting: @oppo.raiting.to_i - 5)
      #@curr.update(raiting: @curr.raiting.to_i + 5, win_count: @curr.win_count.to_i + 1)
    else
      @curr.update(raiting: @curr.raiting + krate * ( 0 - my_expectation))
      @oppo.update(raiting: @oppo.raiting + krate * ( 1 - oppo_expectation), win_count: @oppo.win_count + 1)
      @win = @oppo.nickname
      #@curr.update(raiting: @curr.raiting.to_i - 5)
      #@oppo.update(raiting: @oppo.raiting.to_i + 5, win_count: @oppo.win_count.to_i + 1)
    end
    @opponame = @oppo.nickname
    Tweet.create(name: current_user.nickname ,user_id: current_user.id ,winer: tweet_params[:winer] ,opponent: @opponame)
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end
  
  def battle
    @users = User.all
  end
  
  private
  def tweet_params
    params.permit(:text,:winer,:opponent)
  end

end
