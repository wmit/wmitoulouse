class Wmit::Event < ActiveRecord::Base
  belongs_to :place
  attr_accessible :description, :scheduled_at, :title, :url
end
