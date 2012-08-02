# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wmit_place, :class => 'Wmit::Place' do
    title "MyString"
    address "MyString"
    latitude ""
    longitude ""
  end
end
