class Order < ApplicationRecord
  belongs_to :user
  belongs_to :purchase
  belongs_to :review_order
end
