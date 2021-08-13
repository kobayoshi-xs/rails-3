class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :item

  mount_uploader :image, ImageUploader

  def total_price_element
    count * ((end_date - start_date)/86400).to_int
  end
end
