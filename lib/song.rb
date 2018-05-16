require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    # binding.pry
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    all << song
    song
  end

  def self.find_by_name(name)
    all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    all.sort_by do |song|
      song.name
    end
  end


  def self.new_from_filename(filename)
    artist_name, song_name = filename.split(" - ")
    song_name.slice!(".mp3")
    song = new_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    artist_name, song_name = filename.split("-")
    song_name.slice!(".mp3")
    song_name.lstrip!
    artist_name.rstrip!
    song = create_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end

Song.create_from_filename("Thundercat - For Love I Come.mp3")
