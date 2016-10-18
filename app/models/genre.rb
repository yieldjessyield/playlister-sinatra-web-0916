class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    name = slug.gsub('-',' ')
    found_genre = all.select {|genre| genre.name.downcase == name }
    found_genre[0]
    #binding.pry
  end

end
