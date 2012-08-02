class Wmit::Event < ActiveRecord::Base
  belongs_to :place, class_name: 'Wmit::Place'
  attr_accessible :description, :scheduled_at, :title, :url
end
