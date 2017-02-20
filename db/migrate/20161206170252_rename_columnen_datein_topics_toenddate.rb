class RenameColumnenDateinTopicsToenddate < ActiveRecord::Migration[5.0]
  def change
    rename_column :topics, :endDate, :enddate
  end
end
