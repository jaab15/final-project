class AddTopicToSaleTradeWant < ActiveRecord::Migration[5.0]
  def change
    add_reference :sale_trade_wants, :topic, foreign_key: true
  end
end
