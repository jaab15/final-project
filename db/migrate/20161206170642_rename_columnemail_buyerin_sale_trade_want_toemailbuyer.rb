class RenameColumnemailBuyerinSaleTradeWantToemailbuyer < ActiveRecord::Migration[5.0]
  def change
    rename_column :sale_trade_wants, :emailBuyer, :emailbuyer
    rename_column :sale_trade_wants, :idBuyer, :buyer_id
  end
end
