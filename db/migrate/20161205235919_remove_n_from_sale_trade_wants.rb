class RemoveNFromSaleTradeWants < ActiveRecord::Migration[5.0]
  def change
    remove_column :sale_trade_wants, :n, :string
  end
end
