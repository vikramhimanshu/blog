class PostsController < ApplicationController
	def index
		@posts = Post.all
	end
	
	def show
		@post = Post.find(params[:id])
	end
	
	def new
	 @post = Post.new
	end
	
	def create
	
		def post_params
		  	allow = [:title, :content]
  			params.require(:post).permit(allow)
    end
		
		@post = Post.new(post_params)
	
		 if @post.save
	 		redirect_to posts_path, :notice => "Your post was saved"
		 else
		 	render "new"
		 end
	end
	
	def edit
    @post = Post.find(params[:id])
	end
	
	def update
    @post = Post.find(params[:id])

    def post_params
      allow = [:title, :content]
      params.require(:post).permit(allow)
    end

    if @post.update_attributes(post_params)
      redirect_to posts_path, :notice => "Your Post has been updated"
    else
      render "edit"
    end
	end
	
	def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, :notice => "Your Post has been deleted"
	end
end
