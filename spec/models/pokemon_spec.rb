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

end
