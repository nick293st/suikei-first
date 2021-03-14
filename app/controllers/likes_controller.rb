class LikesController < ApplicationController
  before_action :require_logged_in

  def create
    waterscape = Waterscape.find(params[:waterscape_id])
    current_user.like(waterscape)
    flash[:success] = 'お気に入り登録しました。'
    redirect_to root_url
  end

  def destroy
    waterscape = Waterscape.find(params[:waterscape_id])
    current_user.unlike(waterscape)
    flash[:success] = 'お気に入り登録を解除しました。'
    redirect_to root_url
  end
end