class Wmit::Place < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :title
end
