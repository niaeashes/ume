require 'rails_helper'

RSpec.describe Pokemon do

  describe "is valid" do
    let(:pokemon) { Pokemon.new name: name }
    subject { pokemon }

    context "with name" do
      let(:name) { "mew" }
      it { is_expected.to be_valid }
      it { expect(pokemon.name).to eq name }
    end

    context "without name" do
      let(:name) { nil }
      it { is_expected.not_to be_valid }
    end

  end

  describe "#save" do
    context "when be valid" do
      let(:pokemon) { Pokemon.new name: "mew" }
      it { expect { pokemon.save! }.not_to raise_exception }
      it { expect { pokemon.save }.to change { Pokemon.count }.by 1 }
    end
    context "when be invalid" do
      let(:pokemon) { Pokemon.new name: nil }
      it { expect { pokemon.save! }.to raise_exception ActiveRecord::RecordInvalid }
      it { expect { pokemon.save }.not_to change { Pokemon.count } }
    end
  end

end
