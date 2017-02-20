class RenameColumntypeSaleTradeWanttotypeStw < ActiveRecord::Migration[5.0]
  def change
    rename_column :sale_trade_wants, :type, :type_stw
  end
end
