class CartItem < ApplicationRecord
    belongs_to :customer
    belongs_to :item
    def calculate(user)
    total_price = 0
    user.cart_items.each do |cart_item|
    total_price += cart_item.item.price * cart_item.amount
    end
    return (total_price * 1.1).floor
    end
    
end
