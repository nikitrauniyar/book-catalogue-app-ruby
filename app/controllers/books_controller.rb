class BooksController < ApplicationController
  def list
    @books=Book.all
    @categories=Category.all
  end
  def show
    @book=Book.find(params[:id])
    @category=Category.find(@book.category_id)
    if params[:logged]=="true"
      @is_logged=true
    else
      @is_logged=false
    end
  end
  def new
    @book=Book.new
    @categories=Category.all
  end
  def book_params
    params.require(:book).permit(:title, :category_id, :author, :published_date, :price, :description)
  end
  def create
    @book=Book.new(book_params)
    if @book.save
      redirect_to :controller => 'admins', :action => 'index'
    else
      @categories=Category.all
      render :action => 'new'
    end
  end
  def edit
    @book = Book.find(params[:id])
    @categories = Category.all
  end
  def update
    @book = Book.find(params[:id])
    @is_logged=true
    if @book.update(book_params)
      redirect_to :controller => 'admins', :action => 'index'
    else
      @categories = Category.all
      render :action => 'edit'
    end
  end
  def destroy
    Book.find(params[:id]).destroy
    redirect_to :controller => 'admins', :action => 'index'
  end
  def show_categories
    @categories = Category.find(params[:id])
  end
  def search
    if params[:logged][0]=='true'
      @is_logged=true
    else
      @is_logged=false
    end
    @category_id=params[:category][:category_id]
    @books=Book.where(category_id: @category_id)
  end
end
