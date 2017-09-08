class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    if self.all.find { |n| n.name == name} != nil
      # puts "found #{name}"
      self.all.find { |n| n.name == name}
    else
      # puts "adding #{name}"
      artist = Artist.new(name)
      self.all << artist
      return artist
    end
  end

  def add_song(song_name)
    song = Song.new(song_name)
    @songs << song.name
  end

  def save
    @@all << self
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end

end

# class Artist
#   @@all = []
#   attr_accessor :name, :songs
#
#   def initialize(name)
#     @name = name
#     @songs = []
#   end
#
#   def self.all
#     @@all
#   end
#
#   def add_song(song)
#     @songs << song
#   end
#
#   # def self.find_or_create_by_name(name)
#   #   self.find(name) ? self.find(name) : self.create(name)
#   # end
#
#   def self.find(name)
#     self.all.find {|artist| artist.name == name }
#   end
#
#
#   def self.create(name)
#     self.new(name).tap {|artist| artist.save}
#   end
#
#   def save
#     @@all << self
#   end
#
#   def print_songs
#     songs.each {|song| puts song.name}
#   end
# end
