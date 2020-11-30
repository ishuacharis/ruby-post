class PostController < ApplicationController

    # /GET all posts
    def index
        @posts = Post.order(id: :desc)
    end
    
    # /GET a form to create a new post
    def new
        @post = Post.new
    end

    # /POST create a new post
    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to action: :index
        else
            render :new
        end
    end

    # /GET show a single post
    def show
        @post = Post.find(params[:id])
    end

    # /GET a form to edit a saved post
    def edit
        @post = Post.find(params[:id])
    end

    # /PATCH OR /PUT save an edited post
    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
            redirect_to(@post)
        else
            render :index
        end
    end

    # /DELETE delete or destroy a saved post
    def destroy
    end


    def post_params
        params.require(:post).permit(:content, :title)
    end

    private :post_params

end
