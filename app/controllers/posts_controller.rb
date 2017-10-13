class PostsController < ApplicationController
  
  before_action :authenticate_yosakoiyer
  before_action :ensure_correct_yosakoiyer,{only:[:edit,:update,:destroy]}
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @yosakoiyer = @post.yosakoiyer
    @ines = Ine.where(post_id: @post.id).count
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(boyaki: params[:boyaki],
                    yosakoiyer_id: @current_yosakoiyer.id
                    )
    if
    @post.save
    flash[:notice] = "ぼやいたゾ"
    redirect_to("/posts/index")
    else
    render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.boyaki = params[:boyaki]
    if @post.save
      flash[:notice] = "つぶやいたゾ"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    if
    @post.save
    flash[:notice] = "削除したぞ"
    redirect_to("/posts/index")
    end
  end
  
  def ensure_correct_yosakoiyer
    @post = Post.find_by(id: params[:id])
    if @current_yosakoiyer.id != @post.yosakoiyer_id
      flash[:notice] ="権限がありません"
      redirect_to("/posts/index")
    end
  end
  
end
