class AddPostRefToReplyPost < ActiveRecord::Migration[5.0]
  def change
    add_reference :reply_posts, :post, foreign_key: true
  end
end
