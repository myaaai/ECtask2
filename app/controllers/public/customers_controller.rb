class Public::CustomersController < ApplicationController
    
 before_action :authenticate_customer!
    
def show
    @customer = current_customer
end

def edit
    @customer = current_customer
end

def update
    @customer = current_customer
    if @customer.update(customer_params)
        redirect_to customers_path
    else
        redirect_to edit_customers_path
    end
end

def withdraw
    @customer = current_customer
    
end

def destroy
    customer = Customer.find(params[:id])
    customer.update(is_deleted: true)
    flash[:success] = "アカウントを削除しました"
    redirect_to root_path

end

def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :telephone_number, :postal_code, :address)
end



end
