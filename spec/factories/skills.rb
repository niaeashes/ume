FactoryBot.define do

  factory :skill do
    trait :with_pokemon do
      association :pokemon, factory: :pokemon, strategy: :create
    end
  end

end
