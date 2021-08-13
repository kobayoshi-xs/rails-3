class RenameAreaColumnToItems < ActiveRecord::Migration[6.1]
  def change
    rename_column :items, :area, :area_id
  end
end
