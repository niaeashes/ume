require 'rails_helper'

RSpec.describe Skill, type: :model do

  describe "validates" do

    context "without pokemon" do
      subject { build :skill, pokemon: nil }
      it { is_expected.not_to be_valid }
    end

  end

  describe "association: belongs to Pokemon" do
    let(:pokemon) { create :pokemon }
    subject { build :skill, pokemon: pokemon }
    it { is_expected.to be_valid }
  end

end
