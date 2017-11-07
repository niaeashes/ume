class Skill < ApplicationRecord
  validates :pokemon, presence: true

  belongs_to :pokemon
end
