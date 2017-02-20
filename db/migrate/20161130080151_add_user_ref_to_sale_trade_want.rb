class AddUserRefToSaleTradeWant < ActiveRecord::Migration[5.0]
  def change
    add_reference :sale_trade_wants, :user, foreign_key: true
  end
end
