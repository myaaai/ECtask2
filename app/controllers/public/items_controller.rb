class Public::ItemsController < ApplicationController
    
def index
    @genres = Genre.where(is_active: true)
    @items = Item.joins(:genre).where(is_active: true)
    @index = "商品"
end

def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.where(is_active: true)
end


end

private

  def item_params
    params.require(:item).permit(:name, :price, :introduction, :image_id, :is_active, :genre_id)
  end