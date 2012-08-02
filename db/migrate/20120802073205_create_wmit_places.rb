class CreateWmitPlaces < ActiveRecord::Migration
  def change
    create_table :wmit_places do |t|
      t.string :title
      t.string :address
      t.double :latitude
      t.double :longitude

      t.timestamps
    end
  end
end
