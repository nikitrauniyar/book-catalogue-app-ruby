class AdminsController < ApplicationController
  public
  def index
    @books=Book.all
    @categories=Category.all
    @is_logged=true
  end
  def show
    @admin=Admin.new
  end
  def auth
    @username=params[:username].to_s
    @password=params[:password].to_s
    @admin=Admin.find_by(username: @username)
    @is_logged=false
    if @admin.blank?
      render 'admins/error'
    else
      if @password==@admin.password
        @is_logged=true
        @books=Book.all
        @categories=Category.all
        redirect_to :action =>  'index'
      else
        render 'admins/error'
      end
    end
  end
end

