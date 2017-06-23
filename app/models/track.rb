class Track < ApplicationRecord
  validates :name, :album_id, presenece: true
  validates :track_style, inclusion: {in: %w(regular bonus), message:"Indicate Track Style"}

  belongs_to :album,
  primary_key: :id,
  foreign_key: :album_id,
  class_name: :Album

end
