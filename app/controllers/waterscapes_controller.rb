class WaterscapesController < ApplicationController
    before_action :require_logged_in, only: [:new, :create]
    before_action :correct_user, only: [:edit, :update, :destroy]
    
    def index
        @waterscapes = Waterscape.all.page(params[:page]).per(24)
    end
    
    def show
        @waterscape = Waterscape.find(params[:id])
    end
    
    def new
        @waterscape = current_user.waterscapes.new
    end
    
    def create
        @waterscape = current_user.waterscapes.new(waterscape_params)
        if @waterscape.save
            flash[:success] = "投稿に成功しました"
            redirect_to root_url
        else
            flash.now[:danger] = "投稿に失敗しました"
            render :new
        end
    end
    
    def edit
        @waterscape = Waterscape.find(params[:id])
    end
    
    def update
        @waterscape = Waterscape.find(params[:id])
        if @waterscape.update(waterscape_params)
            flash[:success]= "編集されました"
            redirect_to @waterscape
        else
            flash[:danger] = "編集に失敗しました"
            render :edit
        end
    end
    
    def destroy
        @waterscape = Waterscape.find(params[:id])
        @waterscape.destroy#undefined method `destroy' for nil:NilClass
        flash[:success] = "画像を削除しました"
        #redirect_back(fallback_location: root_path)
        redirect_to root_url
    end
    
    private
    
    def waterscape_params
        params.require(:waterscape).permit(:image)
    end
    
    def correct_user
        @waterscape = current_user.waterscapes.find_by(id: params[:id])
        unless @waterscape
            redirect_to root_url
        end
    end
    
end
