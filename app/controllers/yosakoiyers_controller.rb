class YosakoiyersController < ApplicationController
  
  before_action :authenticate_yosakoiyer, {only: [:index,:show, :edit, :update]}
  before_action :forbid_login_yosakoiyer,{only: [:new, :create, :login_form, :login]}
  before_action :ensure_corrent_yosakoiyer,{only:[:edit,:update]}
  
  def ensure_corrent_yosakoiyer
    if @current_yosakoiyer.id != params[:id].to_i
      flash[:notice] = "権限がないゾ"
      redirect_to("/posts/index")
    end
  end
  
  def index
    @yosakoiyers = Yosakoiyer.all
  end
  
  def show
    @yosakoiyer = Yosakoiyer.find_by(id: params[:id])
  end
  
  def new
    @yosakoiyer = Yosakoiyer.new
  end
  
  def create
    @yosakoiyer = Yosakoiyer.new(
      yosaname: params[:yosaname], 
      mail: params[:mail],
      password: params[:password],
      image_name: "IMG_4022.jpg"
      )
    if @yosakoiyer.save
    session[:yosakoiyer_id]=@yosakoiyer.id
    flash[:notice] = "おめでとう！"    
    redirect_to("/yosakoiyers/#{@yosakoiyer.id}")
  else
    render("yosakoiyers/new")
    end
  end
  
  def edit
    @yosakoiyer = Yosakoiyer.find_by(id: params[:id])
  end
  
  def update
    @yosakoiyer = Yosakoiyer.find_by(id: params[:id])
    @yosakoiyer.yosaname = params[:yosaname]
    @yosakoiyer.mail = params[:mail]
    if params[:image]
      @yosakoiyer.image_name = "#{@yosakoiyer.id}.jpg"
      image = params[:image]
      File.binwrite("public/yosakoiyer_images/#{@yosakoiyer.image_name}",image.read)
    end
    if @yosakoiyer.save
      flash[:notice] = "変更したよ"
      redirect_to("/yosakoiyers/#{@yosakoiyer.id}")
      else
        render("yosakoiyers/edit")
    end
  end
  
  def login_form
  end
  
  def login
    @yosakoiyer = Yosakoiyer.find_by(mail: params[:mail],
                                    password: params[:password])
    if @yosakoiyer
      session[:yosakoiyer_id] = @yosakoiyer.id
      flash[:notice] = "ログイン成功"
      redirect_to("/posts/index")
    else
      @error_message = "出直した方がいいゾ"
      @mail = params[:mail]
      @password = params[:password]
      render("yosakoiyers/login_form")
    end
  end
  
  def logout
    session[:yosakoiyer_id] = nil
    flash[:notice] = "ロギアウト"
    redirect_to("/login")
  end
  
  def ines
    @yosakoiyer=Yosakoiyer.find_by(id: params[:id])
    @ine = Ine.where(yosakoiyer_id: @yosakoiyer.id)
  end
  
end
