class Album < ApplicationRecord
  validates :name, :band_id, presence: true
  validates :recording_style, inclusion: {in: %w(studio live), message:"Indicate Album Recording Style"}

  belongs_to :band,
  primary_key: :id,
  foreign_key: :band_id,
  class_name: :Band

  has_many :tracks,
  primary_key: :id,
  foreign_key: :album_id,
  class_name: :Track
end
