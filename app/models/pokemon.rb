class Pokemon < ApplicationRecord
  validates :name, presence: true
  validates :basename, presence: true, length: { within: 3..12 }
  validates :speed, numericality: { greater_than: 0, less_than_or_equal_to: 500 }
end
