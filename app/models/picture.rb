class Picture < ApplicationRecord

  validates :name, :description, :price, presence: true

  validates :price, numericality: { only_integer: true }

  validates :title, length: {minimum: 3, maximum: 20 }

  validates :url, uniqueness: true
end
