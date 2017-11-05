FactoryBot.define do

  factory :skill do
    association :pokemon, factory: :pokemon, strategy: :create
  end

end
