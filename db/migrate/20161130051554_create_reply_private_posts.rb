class CreateReplyPrivatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :reply_private_posts do |t|

      t.timestamps
    end
  end
end
