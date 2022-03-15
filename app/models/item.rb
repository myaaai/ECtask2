class Item < ApplicationRecord
    belongs_to :genre
    has_many :orderd_items
    has_one_attached :image
end
