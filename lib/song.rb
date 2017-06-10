class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize(name)
  #   @name = name
  # end

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
    # song.save
    # song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song

  end

  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.select do |nam|
      name == nam.name
    end.first
  end

  def self.find_or_create_by_name(input)
    if self.name.include?(input)
      find_by_name(input)
    else
      create_by_name(input)
    end
  end

  def self.alphabetical
    result = self.all.sort_by! {|x| x.name}
  end

  def self.new_from_filename(input)
    formated_input = input.sub!(".mp3", "").split(" - ")
    new_song = new_by_name(formated_input[1])
    new_song.artist_name = formated_input[0]
    new_song
  end

  def self.create_from_filename(input)
    formated_input = input.sub!(".mp3", "").split(" - ")
    new_song = new_by_name(formated_input[1])
    new_song.artist_name = formated_input[0]
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all.clear
  end


end
