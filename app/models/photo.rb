class Photo < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :sale_trade_want 

end
