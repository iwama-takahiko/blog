class UsersController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :auth_user, only: [:password, :update_password]
    
    def show
        user=User.find(params[:id])
        @nickname=user.nickname
        @posts=user.posts.page(params[:page]).per(5).order("created_at DESC")
    end

end
