class Pokemon < ApplicationRecord
  TYPES = %w[
    Normal Fire Fighting Water Flying
    Grass Poison Electric Ground Psychic
    Rock Ice Bug Dragon Ghost
    Dark Steel Fairy
  ]

  has_many :skills

  validates :name, :type1, :basename, presence: true
  validates :basename, length: { in: 2..12 }
  validates :type1, inclusion: { in: TYPES }
  validates :type2, inclusion: { in: TYPES, allow_blank: true }
  validates :speed, numericality: { greater_than: 0, less_than_or_equal_to: 500 }
  validate :validate_skills_count

  TYPE_CONVERTE_SET = {
    "Normal" => ["ノーマル", "のーまる", "普通"],
    "Flying" => ["ひこう", "ヒコウ", "鳥"],
    "Dragon" => ["ドラゴン", "どらごん", "竜"]
  }

  def type1=value
    @_target_patterns ||= TYPE_CONVERTE_SET.values.flatten
    TYPE_CONVERTE_SET.each do |key, list|
      value = key if list.include? value
    end if @_target_patterns.include? value
    super value
  end

  protected

  def validate_skills_count
    errors.add :skills, :invalid unless (1..4).member? self.skills.length
  end
end
