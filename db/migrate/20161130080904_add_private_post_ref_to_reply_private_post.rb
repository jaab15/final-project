class AddPrivatePostRefToReplyPrivatePost < ActiveRecord::Migration[5.0]
  def change
    add_reference :reply_private_posts, :private_post, foreign_key: true
  end
end
