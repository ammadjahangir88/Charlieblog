class ArticlesController < ApplicationController
  
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    flash[:notice] ="You are not allowd"
    redirect_back(fallback_location: root_path)

  end
  def create
    @article = Article.new(article_params)
    @article.group=Group.find(params[:group_id])
    @article.user= current_user
        respond_to do |format|
        if @article.save
            format.html { redirect_to user_group_article_path(current_user,@article.group,@article), notice: "Atricle was successfully created." }  
          else
            format.html { render :new, status: :unprocessable_entity }
          end       
        end 
  end
  def index

    @articles=Article.all


  end

  def new
    @group = Group.find(params[:group_id])
    @article = Article.new
  end

  def edit
    @article= Article.find(params[:id])
        
  end

  def update
    @article= Article.find(params[:id])
     
      respond_to do |format|
          if @article.update(article_params)
              format.html { redirect_to user_article_path(current_user,@article), notice: "Atricle was successfully Updated." }  
            else
              format.html { render :new, status: :unprocessable_entity }
            end       
          end 
  end
 



 
  def destroy
  
    @article= Article.find(params[:id])
    @article.destroy
    flash[:notice]="Article was successfully deleted"
    redirect_to user_group_articles_path
  end

  def show
    @article= Article.find(params[:id])
  end
  private
  def article_params
    params.require(:article).permit(:title,:description, :image)
end
end
