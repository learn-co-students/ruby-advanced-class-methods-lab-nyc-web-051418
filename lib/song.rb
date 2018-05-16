require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
     song = Song.new
     song.save
     song
  end

  def self.new_by_name (name)
      song = self.new
      song.name = name
      song
  end

  def self.create_by_name (name)
      song = self.create
      song.name = name
      song
  end

  def self.find_by_name (name)
      @@all.find {|thing| thing.name == name}
  end

  def self.find_or_create_by_name (name)

      if self.find_by_name (name)
        self.find_by_name (name)
      else
        self.create_by_name (name)
      end
  end

  def self.alphabetical
    Song.all.sort_by {|x| x.name}
  end

  def self.new_from_filename (filename)
      artist_and_song = filename.chomp('.mp3')
      song_name = artist_and_song.split('-')[0].strip
      artist_name = artist_and_song.split('-')[1].strip

      song = self.new
      song.name = song_name
      song.artist = artist_name
      song
  end

end
