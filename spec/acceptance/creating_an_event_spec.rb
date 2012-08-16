require File.dirname(__FILE__) + '/acceptance_helper'

feature "Creating an event" do
  let(:place) { FactoryGirl.create(:wmit_place) }

  background do
    place
  end

  scenario "From the home page, any user can click a link to create an event" do
    visit '/'
    click_link I18n.t('events.new.link')
    within '#new_event_form' do
      fill_in 'event[title]', with: 'A new event'
      fill_in 'event[scheduled_at]', with: (Time.current + 1.day).to_s
      choose place.to_s from: 'event[place_id]'
      click_submit
    end
  end
end