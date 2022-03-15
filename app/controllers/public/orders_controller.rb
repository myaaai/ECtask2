class Public::OrdersController < ApplicationController
    
 def new
    @order = Order.new
    @orders = current_customer.orders.all
    @customer = Customer.find(current_customer.id)

 end

 def confirm
    @cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    @order.postage = 800
    @order.method_payment = params[:order][:method_payment]
    
    if params[:order][:address_number] == "0"
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.last_name+current_customer.first_name
      @order.shipping_address = current_customer.address
    elsif params[:order][:address_number] == "1"
      @shipping_address = ShippingAddress.find(params[:order][:regestrated_address])
      @order.postal_code = @shipping_address.postal_code
      @order.name = @shipping_address.name
      @order.shipping_address = @shipping_address.address
    elsif params[:order][:address_number] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.name = params[:order][:name]
      @order.shipping_address = params[:order][:shipping_address]
      
    end
   
   @sum = calculate(current_customer)
    

 end

 def complete

 end

 def create
    @customer = Customer.find(current_customer.id)
    @order = current_customer.orders.new(order_params)
    @order.postage = 800
    @order.save
    current_customer.cart_items.each do |cart_item|
        p cart_item
        ordered_item = OrderedItem.new(
            item_id: cart_item.item_id, amount: cart_item.amount, order_id: @order.id,
            customer_id: current_customer.id, production_status: "着手不可" , tax_price: cart_item.item.price)
        ordered_item.save
        
    end
    @order.customer.cart_items.destroy_all
    redirect_to complete_path

    
 end

 def index
    @orders = current_customer.orders.all
   
 end

 def show
    @cart_items = current_customer.cart_items.all
    @order = Order.find(params[:id])
    @sum = calculate(current_customer)
    @ordered_items = @order.ordered_items
  
    
    

 end

private

 def order_params
    params.require(:order).permit(:method_payment, :name, :postal_code, :shipping_address, :amount_claimed, :order_statuses)
 end
 
 def calculate(user)
    total_price = 0
    user.cart_items.each do |cart_item|
    total_price += cart_item.item.price * cart_item.amount
    end
    return (total_price * 1.1).floor
 end
 
end
