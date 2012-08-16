# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wmit_event, class: 'Wmit::Event' do
    title         "MyString"
    scheduled_at  "2012-08-02 09:14:16"
    association :place, factory: :wmit_place, state: 'approved'
    description   "MyText"
    url           "MyString"
  end
end
