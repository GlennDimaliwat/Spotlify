class Song < ApplicationRecord
  belongs_to :artist
  has_many :play_count
  scope :top10, ->{
    select("songs.id, songs.name, artist_id, count(play_counts.id) AS play_count").
    joins(:play_count).
    joins(:artist).
    group("songs.id").
    order("play_count DESC").
    limit(10)
  }

  validates :name, presence: true
  validates :duration, numericality: { greater_than: 0 }
end
