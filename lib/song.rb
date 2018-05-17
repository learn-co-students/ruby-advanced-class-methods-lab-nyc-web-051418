require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    @name = name
    @artist_name = artist_name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    song
    # binding.pry
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
    # binding.pry
  end

  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    @@all << song  
    song
  end

  def self.find_by_name(song_name)
    @@all.find do |song|
      song_name == song.name
      # binding.pry
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name (song_name)
      self.find_by_name (song_name)
    else
      self.create_by_name (song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
    # binding.pry
  end

  def self.new_from_filename(filename)
    filename = filename.gsub(".mp3", "")
    data = filename.split(" - ")
    song = Song.new
    song.artist_name = data[0]
    song.name = data[1]
    song
  end

  def self.create_from_filename (filename)
    filename = filename.gsub(".mp3", "")
    data = filename.split(" - ")
    song = Song.new
    song.artist_name = data[0]
    song.name = data[1]
    @@all << song 
    song
  end

  def self.destroy_all
    @@all = []
  end

end

# binding.pry