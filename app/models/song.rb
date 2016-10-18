class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    name = slug.gsub('-',' ')
    found_song = all.select {|song| song.name.downcase == name }
    found_song[0]
    #binding.pry
  end


end
