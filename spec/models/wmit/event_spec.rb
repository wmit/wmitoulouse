require 'spec_helper'

describe Wmit::Event do
  describe '#valid?' do
    it("default factory is valid") { FactoryGirl.build(:wmit_event).should be_valid }
  end

  describe '#new_place_name=' do
    subject { FactoryGirl.build(:wmit_event) }
    before { subject.new_place_name = new_place_name }
    context "when nil" do
      let(:new_place_name) { nil }
      its(:place) { should_not be_nil }
    end
    context "when string" do
      let(:new_place_name) { 'A place name' }
      its(:place) { should be_nil }
    end
  end
  describe '#save' do
    subject { FactoryGirl.create(:wmit_event, new_place_name: new_place_name) }
    context "when placename is set" do
      let(:new_place_name) { 'A new place' }
      it "creates a new place" do
        expect {
          subject
        }.to change(Wmit::Place, :count).by(1)
      end
      it "has a place with the new place name as title" do
        subject.place.title.should eql 'A new place'
      end
      it "has an unapproved place" do
        subject.place.should be_unapproved
      end
      it { should be_unapproved }
    end
    context "when placename is not set" do
      let(:new_place_name) { nil }
      it { should be_approved }
      its(:place) { should eql be_approved }
    end
  end

end