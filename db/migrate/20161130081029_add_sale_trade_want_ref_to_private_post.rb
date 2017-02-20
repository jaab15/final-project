class AddSaleTradeWantRefToPrivatePost < ActiveRecord::Migration[5.0]
  def change
    add_reference :private_posts, :sale_trade_want, foreign_key: true
  end
end
