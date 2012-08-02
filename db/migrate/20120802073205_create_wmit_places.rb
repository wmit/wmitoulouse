class CreateWmitPlaces < ActiveRecord::Migration
  def change
    create_table :wmit_places do |t|
      t.string :title
      t.string :address
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
