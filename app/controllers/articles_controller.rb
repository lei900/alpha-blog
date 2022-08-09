class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :require_login, except: %i[show index]
  before_action :require_same_user, only: %i[edit update destroy]

    def show; end

    def index
        @articles = Article.all.includes(:user).order(created_at: :desc).page(params[:page])
    end

    def new
        @article = Article.new
    end

    def create
        @article = current_user.articles.new(article_params)
        if @article.save
          flash[:success] = "Article was created successfully."
          redirect_to @article
        else
          render :new
        end
    end

    def edit; end

    def update
      if @article.update(article_params)
        flash[:success] = "Article was updated successfully."
        redirect_to @article
      else
        render :edit
      end
    end

    def destroy
      @article.destroy!
      flash[:success] = "Article was deleted successfully."
      redirect_to articles_path
    end

    private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end

    def require_same_user
      if current_user != @article.user && !current_user.admin?
        flash[:danger] = "You can only edit or delete your own article."
        redirect_to @article
      end
    end
end
