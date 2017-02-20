class AddUserRefToPrivatePost < ActiveRecord::Migration[5.0]
  def change
    add_reference :private_posts, :user, foreign_key: true
  end
end
