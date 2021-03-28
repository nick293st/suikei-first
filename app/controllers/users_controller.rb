class UsersController < ApplicationController
  before_action :require_logged_in, only: [:index, :show]
  before_action :correct_user_changes_user, only: [:edit, :update, :destroy]
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_waterscapes = @user.waterscapes.page(params[:page]).per(12)
    @likers = @user.liker.page(params[:page]).per(12)
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] ='ユーザを登録しました'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザ登録に失敗しました'
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] ='ユーザ情報を編集しました'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザ情報の編集に失敗しました'
      render :edit
    end
  end
  
  def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:success] = "ユーザアカウントを削除しました"
      redirect_to root_url
  end
  
  def likers
    @user = User.find(params[:id])
    @likers = @user.liker
    counts(@user)
  end
  
  def likeds
    @user = User.find(params[:id])
    @liked = @user.liked
    counts(@user)
  end

  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user_changes_user
    @user = User.find(params[:id])
    unless @user == current_user
        redirect_to root_url
    end
  end
  
end
