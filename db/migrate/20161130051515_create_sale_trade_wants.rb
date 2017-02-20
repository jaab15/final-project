class CreateSaleTradeWants < ActiveRecord::Migration[5.0]
  def change
    create_table :sale_trade_wants do |t|
      t.string :type
      t.string :title
      t.string :description
      t.string :n
      t.boolean :active
      t.string :emailBuyer
      t.string :idBuyer
      t.string :feedback

      t.timestamps
    end
  end
end
