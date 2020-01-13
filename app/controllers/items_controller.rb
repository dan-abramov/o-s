class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.create(item_params)

    if @item.save
      redirect_to @item
    else
      flash[:notice] = 'Товар не был создан'
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to @item
    else
      flash[:notice] = 'Товар не может быть обновлен'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy!
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :body, :category_id)
  end
end
