class Order < ApplicationRecord
    
  has_many :ordered_items, dependent: :destroy
  belongs_to :customer
  
  enum method_payment: { credit_card: 0, transfer: 1 }

end
