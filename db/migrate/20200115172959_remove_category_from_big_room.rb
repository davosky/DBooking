class RemoveCategoryFromBigRoom < ActiveRecord::Migration[5.2]
  def change
    remove_column :big_rooms, :category, :string
  end
end
