require 'rails_helper'

RSpec.describe Pokemon do

  describe "is valid" do

    context "with name" do
      subject { build :pokemon, name: name }
      let(:name) { "mew" }
      it { is_expected.to be_valid }
    end

    context "without name" do
      subject { build :pokemon, name: nil }
      it { is_expected.not_to be_valid }
    end

    context "with basename" do
      subject { build :pokemon, basename: basename }
      let(:basename) { "eevee" }
      it { is_expected.to be_valid }
    end

    context "without basename" do
      subject { build :pokemon, basename: nil }
      it { is_expected.not_to be_valid }
    end

    context "with too short basename" do
      subject { build :pokemon, basename: "A"*2 }
      it { is_expected.not_to be_valid }
    end

    context "with too large basename" do
      subject { build :pokemon, basename: "A"*13 }
      it { is_expected.not_to be_valid }
    end

    [1, 131, 500].each do |value|
      context "with valid speed" do
        subject { build :pokemon, speed: value }
        it { is_expected.to be_valid }
      end
    end

    context "with minus speed" do
      subject { build :pokemon, speed: -10 }
      it { is_expected.not_to be_valid }
    end

    context "with too big speed" do
      subject { build :pokemon, speed: 501 }
      it { is_expected.not_to be_valid }
    end

  end

  describe "#save" do
    context "when be valid" do
      let(:pokemon) { build :pokemon, name: "mew" }
      it { expect { pokemon.save! }.not_to raise_exception }
      it { expect { pokemon.save }.to change { Pokemon.count }.by 1 }
    end
    context "when be invalid" do
      let(:pokemon) { build :pokemon, name: nil }
      it { expect { pokemon.save! }.to raise_exception ActiveRecord::RecordInvalid }
      it { expect { pokemon.save }.not_to change { Pokemon.count } }
    end
  end

end
