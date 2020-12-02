class PostController < ApplicationController

    # /GET all posts
    def index
        if current_user
            @posts = User.find_by(id: current_user.id).posts.order(id: :desc)
        else        
            @posts  = Post.order(id: :desc).take(1)
        end
    end
    
    # /GET a form to create a new post
    def new
        @post = Post.new
    end

    # /POST create a new post
    def create
        #Post.new(post_params,)
        @post = current_user.posts.create(post_params)
        
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

    # allowed or whitelisted params
    def post_params
        params.require(:post).permit(:content, :title)
    end

    private :post_params

end
