class Wmit::Place < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :title

  state_machine initial: :unapproved do
    state :approved
    state :unapproved
  end

  def to_s
    title
  end
end
