class Pokemon < ApplicationRecord
  TYPES = %w[
    Normal Fire Fighting Water Flying
    Grass Poison Electric Ground Psychic
    Rock Ice Bug Dragon Ghost
    Dark Steel Fairy
  ]

  has_many :skills

  validates :name, :type1, presence: true
  validates :type1, inclusion: { in: TYPES }
  validates :type2, inclusion: { in: TYPES, allow_blank: true }
  validates :skills_count, numericality: { maximum: 4 }

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

  def skills_count
    puts self.skills.length
    self.skills.length
  end
end
