class Product < ApplicationRecord
  belongs_to :category
  validates :title, :price, presence: true
  validates :price, :discount, :on_hand, numericality: { greater_than_or_equal_to: 0, allow_blank: true }
  validates :sku, presence: true, uniqueness: { case_sensitive: false }
  auto_strip_attributes :title, :sku, squish: true
  mount_uploader :product_image, ImageUploader
  enum product_loaded: ["M", "I" ]
  enum status: ["Public", "Hidden"]
end
