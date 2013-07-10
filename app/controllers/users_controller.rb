class UsersController < ApplicationController

  skip_before_filter :require_authentication, :only => [:new, :create]
  skip_before_filter :require_admin_authentication, :only => [:new, :create, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  def add_to_shopping_cart
    @user = current_user
    @item = Item.find(params[:item_id])

    @item.user_id = @user.id
    @item.save

    redirect_to user_path(@user.id)
  end

end




