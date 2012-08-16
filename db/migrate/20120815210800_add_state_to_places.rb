class AddStateToPlaces < ActiveRecord::Migration
  def change
    add_column :wmit_places, :state, :string
    add_column :wmit_events, :state, :string
  end
end
