class Artist < ActiveRecord::Base
has_many :songs
has_many :genres, through: :songs


  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    name = slug.gsub('-',' ')
    found_artist = all.select {|artist| artist.name.downcase == name }
    found_artist[0]
    #binding.pry
  end

end
