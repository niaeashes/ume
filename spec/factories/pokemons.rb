FactoryBot.define do

  factory :pokemon do
    name "Mew"
    basename "Mew"
    type1 "Psychic"
    type2 nil
    speed 131

    transient do
      skills nil
    end

    after(:build) do |pokemon, evaluator|
      if evaluator.skills.nil?
        pokemon.skills << build(:skill)
      else
        pokemon.skills = evaluator.skills
      end
    end
  end

end
