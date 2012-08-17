require 'spec_helper'

describe Wmit::EventsController do

  describe "GET 'index'" do
    let(:events) { ['an', 'event', 'list'] }
    before { Wmit::Event.stub feed: events }
    subject { get :index }
    it { should be_success }
    it "assigns the events feed to the view" do
      subject; assigns[:events].should eql events
    end
  end

  describe "GET 'show' and GET 'edit'" do
    let(:event) { FactoryGirl.build_stubbed :wmit_event }
    [:edit, :show].each do |action|
      before { Wmit::Event.stub_chain(:online, :find).with("123").and_return event }
      subject { get action, id: "123" }
      it { should be_success }
      it "assigns event to the view" do
        subject; assigns[:event].should eql event
      end
    end
  end

  describe "POST 'create'" do
    let(:some_params) { {'some' => 'params'} }
    let(:event) { FactoryGirl.build_stubbed :wmit_event }
    before do
      event.stub(save: success?, to_param: 123)
      Wmit::Event.stub(:new).with(some_params).and_return event
    end
    subject { post :create, wmit_event: some_params }
    context "With valid attributes" do
      let(:success?) { true }
      it { should redirect_to event }
    end
    context "With invalid attributes" do
      let(:success?) { false }
      it { should render_template 'new' }
    end
  end

  describe "GET 'new'" do
    subject { get :new }
    it { should be_success }
    it "assigns a new event to the view" do
      subject; assigns[:event].should be_a_new_record
    end
  end

  describe "PUT 'update'" do
    let(:event) { FactoryGirl.build_stubbed :wmit_event }
    let(:some_params) { {'some' => 'params'} }
    before do
      event.stub( to_param: 123 )
      event.stub(:update_attributes).with(some_params).and_return(success?)
      Wmit::Event.stub(:find).with("123").and_return event
    end
    subject { put :update, id: "123", wmit_event: some_params }
    context "With valid attributes" do
      let(:success?) { true }
      it { should redirect_to event }
    end
    context "With invalid attributes" do
      let(:success?) { false }
      it { should render_template 'edit' }
    end
  end

  describe "DELETE 'destroy'" do
    let(:event) { FactoryGirl.build_stubbed :wmit_event }
    let(:some_params) { {'some' => 'params'} }
    before do
      event.stub( to_param: 123 )
      Wmit::Event.stub(:find).with("123").and_return event
    end
    subject { delete :destroy, id: "123" }
    it "destroys item and redirects to index" do
      event.should_receive(:destroy)
      subject.should redirect_to wmit_events_path
    end
  end

end
