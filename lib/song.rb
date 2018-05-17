require "pry"

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
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(song)
    new_song = self.create
    new_song.name = song
    new_song
  end

  def self.find_by_name(song_name)
    @@all.find do |element|
      element.name == song_name
    end
  end

  def self.find_or_create_by_name(song)
    if self.find_by_name(song)
      return self.find_by_name(song)
    else
      return self.create_by_name(song)
    end
  end

  def self.alphabetical
    @@all.sort do |x, y|
      x.name <=> y.name
      #binding.pry
    end
  end

  def self.new_from_filename(filename)
    song = Song.new
    names = filename.split(/(?:.mp3)|(?: - )/)
    #  ["Thundercat", "For Love I Come"]
    song.artist_name = names[0]
    song.name = names[1]
    song
    #binding.pry
  end

  def self.create_from_filename(filename)
    song = Song.new
    names = filename.split(/[.]|(?: - )/)
    song.artist_name = names[0]
    song.name = names[1]
    @@all << song
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
