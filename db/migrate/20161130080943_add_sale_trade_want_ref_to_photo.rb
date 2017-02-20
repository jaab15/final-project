class AddSaleTradeWantRefToPhoto < ActiveRecord::Migration[5.0]
  def change
    add_reference :photos, :sale_trade_want, foreign_key: true
  end
end
