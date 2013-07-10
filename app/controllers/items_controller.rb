class ItemsController < ApplicationController
  def index
    @items = Item.all
    @uniques = @items.uniq{ |item| item.name }
    @unique_count = @items.group_by{|item| item.name }.map{ |k, v| [k, v.count] }
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.where(:name => @item.name)
    @review = Review.new
    @user = current_user
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[:item])

    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(params[:item])
      redirect_to items_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to items_path
  end
end
