class AddTopicRefToPost < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :topic, foreign_key: true
  end
end
