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

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title)
    self.all.detect {|song| song.name == title}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end

  def self.new_from_filename(file_name)
    file_array = file_name.split(" - ")
    name = file_array[0]
    title = file_array[1].gsub(".mp3", "")

    song = self.new
    song.name = title
    song.artist_name = name
    song
  end

  def self.create_from_filename(file_name)
    file_array = file_name.split(" - ")
    name = file_array[0]
    title = file_array[1].gsub(".mp3", "")

    song = self.create
    song.name = title
    song.artist_name = name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
