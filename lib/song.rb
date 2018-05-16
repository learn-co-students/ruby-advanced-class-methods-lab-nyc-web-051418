require 'Pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = new
    # song = self.new
    song.save
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name) #this one should not come from create to avoid saving
    song = create
    # song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = new_by_name(name)
    # song = self.new_by_name(name)
    song
  end

  def self.find_by_name(name)
    all.detect { |song_instance| song_instance.name == name }
    # self.all.detect {|song_instance| song_instance.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name).nil? ? create_by_name(name) : find_by_name(name)
    # self.find_by_name(name) == nil ? self.create_by_name(name) : self.find_by_name(name)
  end

  def self.alphabetical
    all.sort_by(&:name)
    # all.sort_by {|instance_song| instance_song.name}
  end

  def self.new_from_filename(song_mp3)
    song_name = song_mp3.split(' - ')[1].split('.')[0]
    artist_name = song_mp3.split(' - ')[0]
    song = create_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(song_mp3)
    new_from_filename(song_mp3)
  end

  def self.destroy_all
    @@all.clear
  end
end
