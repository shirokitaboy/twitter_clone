class TwtrsController < ApplicationController
  before_action :set_twtr, only: [:show, :edit, :update, :destroy]
  before_action :login_ck, only: [:new, :edit, :show, :destroy]
  def home
  end

  def index
    @tweets = Tweet.all
  end

  def new
    if params[:back]
      @tweet = Tweet.new(tweet_params)
    else
      @tweet = Tweet.new
    end
  end

  def create
  @tweet = Tweet.new(tweet_params)
  @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to twtrs_path, notice: "ブログを作成しました！"
    else
      render 'new'
    end
  end

  def show
    #@tweet = Tweet.find(params[:id])
    @favorite = current_user.favorites.find_by(tweet_id: @tweet.id)
  end

  def edit
    #@tweet = Tweet.find(params[:id])
  end

  def destroy
    @tweet.destroy
    redirect_to twtrs_path, notice:"ブログを削除しました！"
  end

  def update
    #@tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to twtrs_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end

  def confirm
    @tweet = Tweet.new(tweet_params)
    render :new if @tweet.invalid?
  end

private
  def tweet_params
    params.require(:tweet).permit(:content)
  end

  def set_twtr
    @tweet = Tweet.find(params[:id])
  end

  def login_ck
    unless current_user
      flash[:notice] = '失敗しました'
      render new_session_path
    end
  end
end
