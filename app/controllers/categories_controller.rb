class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update]
  before_action :require_admin, except: [:index, :show]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category was successfully created."
      redirect_to articles_path
    else
      render :new
    end
  end

  def index
    @categories = Category.all.page(params[:page])
  end

  def show; end

  def update
    if @category.update(category_params)
      flash[:success] = "Category was updated successfully."
      redirect_to articles_path
    else
      render :edit
    end  
end

  def edit; end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:danger] = "Only admins can perform that action"
      redirect_to categories_path
    end
  end
end
