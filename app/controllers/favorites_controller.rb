class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(tweet_id: params[:tweet_id])
    redirect_to twtrs_url, notice: "ブログをお気に入り登録しました"
    #redirect_to twtrs_url
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to twtrs_url, notice: "ブログをお気に入り解除しました"
  end
  def show
    @user = User.find(session[:user_id])
  end

end
