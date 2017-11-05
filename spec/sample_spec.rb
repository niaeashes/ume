require 'rails_helper'

class Sample
  def sample?
    true
  end
end

RSpec.describe Sample do

  describe "simple new instance" do
    subject { described_class.new }
    it { is_expected.to be_sample }
  end

end
