require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name="")
    self.name = name
  end

  def self.create
    curr_song = self.new
    curr_song.save
    curr_song
  end

  def self.new_by_name(name)
    curr_song = self.new(name)
    curr_song
  end

  def self.create_by_name(name)
    curr_song = self.new(name)
    curr_song.save
    curr_song
  end

  def self.find_by_name(name)
    self.all.detect do |person|
      person.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name).class == Song
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    artist = filename.split(/(?: - )|(?:.mp3)/)[0]
    song = filename.split(/(?: - )|(?:.mp3)/)[1]
    curr_song = self.new_by_name(song)
    curr_song.artist_name = artist
    curr_song
  end

  def self.create_from_filename(filename)
    artist = filename.split(/(?: - )|(?:.mp3)/)[0]
    song = filename.split(/(?: - )|(?:.mp3)/)[1]
    curr_song = self.find_or_create_by_name(song)
    curr_song.artist_name = artist
    curr_song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end
end

# pry.start
