class RenameColumnemailBuyerinPrivatePostToemailbuyer < ActiveRecord::Migration[5.0]
  def change
    rename_column :private_posts, :emailBuyer, :emailbuyer
  end
end
