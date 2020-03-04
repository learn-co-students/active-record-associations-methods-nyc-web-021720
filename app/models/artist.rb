require "pry"
class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    #return the genre of the artist's first saved song
    self.songs.first.genre #How is this called "genre" and not "genres". Help me understand chainning attributes please. How does pry work in this file?? Is it becuase we are using attributes defined in songs model attribute
     #To run pry, you must migrate file and run learn. Do CRUD methods belong to class file or a run file?
  end

  def song_count
    #return the number of songs associated with the artist
    self.songs.count
  end

  def genre_count
    self.genres.count
    #return the number of genres associated with the artist
  end
end
