class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy, :data]
  before_action :require_user, except: [:index, :show, :data]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def edit

  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to articles_path(@article)
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to articles_path(@article)
    else
      render 'edit'
    end
  end

  def show

  end

  def data
    respond_to do |format|
      format.json {
        render :json => @article.chartFile.to_json
      }
    end
  end

  def destroy
    @article.destroy
    flash[:danger] = "Article was deleted"
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title, :description, :chartFile, :lib)
  end
  def require_same_user
    if current_user != @article.user and !current_user.admin?
      flash[:danger] = "You cannot edit or delete other user's article!"
      redirect_to root_path
    end
  end
end