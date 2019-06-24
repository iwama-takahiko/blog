class PostsController < ApplicationController
    before_action :move_to_index, except: :index
    def index
        @posts = Post.includes(:user).page(params[:page]).per(5).order("created_at DESC")
    end
    def new
        @posts=Post.new
    end

    def create
     @posts=Post.new(text: post_params[:text], user_id: current_user.id)
     binding.pry
     if @posts.save
      redirect_to :action => 'index'
     else
      render :action => 'new' 
    end
  end

    def destroy
        post=Post.find(params[:id])
        if post.user_id == current_user.id
          post.destroy
          redirect_to :action => 'index'
        end
      end
  
      def edit
        @post=Post.find(params[:id])
  
      end
  
      def update
        @post=Post.find(params[:id])
        if @post.user_id == current_user.id
          @post.update(post_params)
        end
      end
      
      def show
        @posts=Post.find(params[:id])
      end

    private
    def post_params
      params.require(:post).permit(:text)
    end

    def move_to_index
      redirect_to action: "index" unless user_signed_in?
    end
  end
