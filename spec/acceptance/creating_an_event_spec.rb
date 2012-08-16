require File.dirname(__FILE__) + '/acceptance_helper'

feature "Creating an event" do
  let(:place) { FactoryGirl.create(:wmit_place) }

  background do
    place
  end

  scenario "From the home page, any user can click a link to create an event" do
    visit '/'
    click_link I18n.t('events.new.link')
    within '#new_wmit_event' do
      fill_in 'wmit_event[title]', with: 'A new event'
      fill_in 'wmit_event[scheduled_at]', with: (Time.current + 1.day).to_s
      select place.to_s, from: 'wmit_event[place_id]'
      find('input[type=submit]').click
    end
  end
end