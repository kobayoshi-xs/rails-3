class AddAreaidToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :area, :integer
  end
end
