class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :roomname
      t.string :introduction
      t.integer :cost
      t.string :address
      t.string :image

      t.timestamps
    end
  end
end
