require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    @@all.find do |song|
      song.name == song_name
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.new_from_filename(file_name)
    parsed_file_name = file_name.split(" - ")
    song_title = parsed_file_name[1].split(".")
    artist_name = parsed_file_name[0]
    song_name = song_title[0]
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file_name)
    parsed_file_name = file_name.split(" - ")
    song_title = parsed_file_name[1].split(".")
    artist_name = parsed_file_name[0]
    song_name = song_title[0]
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end


  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
