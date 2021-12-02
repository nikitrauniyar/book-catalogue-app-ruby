class CategoriesController < ApplicationController
  def list
    @categories=Category.all
  end
  def new
    @category=Category.new
  end
  def show
    @category=Category.find(params[:id])
  end
  def create
    @category=Category.new(category_params)
    if @category.save
      redirect_to :controller => 'admins', :action => 'index'
    else
      @categories=Category.all
      render :action => 'new'
    end
  end
  def category_params
    params.require(:category).permit(:name)
  end
  def edit
    @category=Category.find(params[:id])
    @categories= Category.all
  end
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to :controller => 'admins', :action => 'index'
    else
      @categories = Category.all
      render :action => 'edit'
    end
  end
  def destroy
    Category.find(params[:id]).destroy
    redirect_to :controller => 'admins', :action => 'index'
  end
end
