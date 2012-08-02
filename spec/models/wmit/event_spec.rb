require 'spec_helper'

describe Wmit::Event do
  describe '#valid?' do
    it("default factory is valid") { FactoryGirl.build(:wmit_event).should be_valid }
  end


end
