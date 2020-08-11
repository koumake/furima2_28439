class Exhibition < ApplicationRecord
  has_many :purchases
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :condition
  belongs_to_active_hash :day
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture

  validates :name, :image, :price, :about, :genre, :condition, :delivery_fee, :prefecture, :days, presence: true
  with_options numericality: { other_than: 1 } do
    validates :genre_id, :condition_id, :delivery_fee_id, :prefecture_id, :days_id
  end
  mount_uploader :img, ImgUploader
end
