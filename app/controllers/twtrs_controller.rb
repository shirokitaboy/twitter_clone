class TwtrsController < ApplicationController
  before_action :set_twtr, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
  @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to twtrs_path, notice: "ブログを作成しました！"
    else
      render 'new'
    end
  end

  def show
    #@tweet = Tweet.find(params[:id])
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
  end

end

private
  def tweet_params
    params.require(:tweet).permit(:content)
  end

  def set_twtr
    @tweet = Tweet.find(params[:id])
  end
