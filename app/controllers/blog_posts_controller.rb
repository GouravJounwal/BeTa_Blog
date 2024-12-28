
class BlogPostsController < ApplicationController

    #allow_unauthenticated_access only: %i[ index show ]
    before_action :authenticate_user!, except: [:index, :show]

    before_action :set_blog_post, except: [:index, :new, :create] #only: [:show, :edit, :update, :destroy]
    def index
        @blog_post = BlogPost.all
    end
    def show
       # @blog_post = BlogPost.find(params[:id]) #The show method's @book = Book.find(params[:id]) line tells Rails to find only the bolgpost that has the id defined in params[:id].
                                                #The params object is a container that enables you to pass values between method calls.
                                            
                                            
        rescue ActiveRecord::RecordNotFound
        redirect_to root_path  #if the record is not found, redirect to the root path which is index now
    end
    def new
        @blog_post = BlogPost.new
    end
    def create
        @blog_post = BlogPost.new(blog_post_params)
        if @blog_post.save
            redirect_to blog_post_path(@blog_post)
        else
            render :new , status: :unprocessable_entity
        end

    end
    def edit 
       #@blog_post = BlogPost.find(params[:id])
    end
    def update
       # @blog_post = BlogPost.find(params[:id])
        if @blog_post.update(blog_post_params)
            redirect_to blog_post_path(@blog_post)
        else
            render :edit , status: :unprocessable_entity
        end
    end
    def destroy
       # @blog_post = BlogPost.find(params[:id])
        @blog_post.destroy
        redirect_to root_path
    end

    private
    def blog_post_params
        params.require(:blog_post).permit(:title, :body)
    end

    def set_blog_post
        @blog_post = BlogPost.find(params[:id])
    end
    
end