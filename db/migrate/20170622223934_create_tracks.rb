class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.text :lyrics
      t.string :track_style
      t.timestamps
    end
  end
end
