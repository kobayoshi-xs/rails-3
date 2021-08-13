class AddItemsToReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :roomname, :string
    add_column :reservations, :introduction, :string
    add_column :reservations, :cost, :integer
    add_column :reservations, :address, :string
    add_column :reservations, :image, :string
  end
end
