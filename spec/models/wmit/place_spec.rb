require 'spec_helper'

describe Wmit::Place do
  describe '#valid?' do
    it("default factory is valid") { FactoryGirl.build(:wmit_place).should be_valid }
  end
end
