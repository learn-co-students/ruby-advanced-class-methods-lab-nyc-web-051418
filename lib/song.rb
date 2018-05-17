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
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if !song
      song = self.create_by_name(name)
    end
    song
  end

  def self.alphabetical
    self.all.sort_by! {|x| x.name}
    self.all
  end

  def self.new_from_filename(filename)
    ar = filename.split(" - ")
    song = self.new_by_name(ar[1][0,ar[1].length-4])
    song.artist_name = ar[0]
    song
  end

  def self.create_from_filename(filename)
    ar = filename.split(" - ")
    song = self.create_by_name(ar[1][0,ar[1].length-4])
    song.artist_name = ar[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
