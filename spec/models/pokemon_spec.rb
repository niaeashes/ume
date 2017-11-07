require 'rails_helper'

RSpec.describe Pokemon, type: :model do

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
      subject { build :pokemon, basename: "A"*1 }
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

    context "without name" do
      subject { build :pokemon, name: nil }
      it { is_expected.not_to be_valid }
    end

    context "without type1" do
      subject { build :pokemon, type1: nil }
      it { is_expected.not_to be_valid }
    end

    context "without type2" do
      subject { build :pokemon, type2: nil }
      it { is_expected.to be_valid }
    end

    context "with type2" do
      subject { build :pokemon, type2: "Water" }
      it { is_expected.to be_valid }
    end

    context "with incorrect type as type1" do
      subject { build :pokemon, type1: "Bot" }
      it { is_expected.not_to be_valid }
    end

    context "with incorrect type as type2" do
      subject { build :pokemon, type2: "Bot" }
      it { is_expected.not_to be_valid }
    end

    context "with 5 skills" do
      subject { build :pokemon, skills: build_list(:skill, 5) }
      it { is_expected.not_to be_valid }
    end

    context "with 4 skills" do
      subject { build :pokemon, skills: build_list(:skill, 4) }
      it { is_expected.to be_valid }
    end

    context "with 0 skills" do
      subject { build :pokemon, skills: [] }
      it { is_expected.not_to be_valid }
    end

  end

  describe "#typeN=" do # N = 1 or 2

    context "when provide as Japanese name" do
      before { subject.type1 = "ひこう" }
      it { expect(subject.type1).to eq "Flying" }
    end

    context "when provide as Japanese name with invalid kana" do
      before { subject.type1 = "どらごん" }
      it { expect(subject.type1).to eq "Dragon" }
    end

  end

  describe "association: has many Skill" do
    let(:skill) { build :skill }
    subject { build :pokemon, skills: [skill] }
    it { is_expected.to be_valid }
  end

end
