class Wmit::Event < ActiveRecord::Base
  belongs_to :place, class_name: 'Wmit::Place'
  attr_accessible :description, :scheduled_at, :title, :url
  attr_writer :new_place_name
  before_save :create_if_new_place, if: :new_place_name?

  scope :feed,   -> { where(state: :approved).where('scheduled_at >= ?', Date.today.to_time).order('scheduled_at ASC') }
  scope :online, -> { where(state: :approved).order('scheduled_at DESC') }

  def new_place_name=(place_name)
    @new_place_name = place_name
    if @new_place_name.present?
      self.place = nil
      self.state = 'unapproved'
    end
  end
  def new_place_name?
    @new_place_name.present?
  end

  state_machine initial: :approved do
    state :approved
    state :unapproved
  end

  def create_if_new_place
    self.place = Wmit::Place.new title: @new_place_name
    self.state = 'unapproved'
  end
end
