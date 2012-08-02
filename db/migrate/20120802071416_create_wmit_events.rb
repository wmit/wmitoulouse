class CreateWmitEvents < ActiveRecord::Migration
  def change
    create_table :wmit_events do |t|
      t.string :title
      t.datetime :scheduled_at
      t.references :place
      t.text :description
      t.string :url

      t.timestamps
    end
    add_index :wmit_events, :place_id
  end
end
