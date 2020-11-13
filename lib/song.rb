
class Song

    attr_accessor :name, :artist
    attr_reader :artist_name

    @@all = []

    def initialize(name)
        self.name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song_info = filename.split(" - ")
        song = Song.new(song_info[1])
        song.artist = Artist.find_or_create_by_name(song_info[0])
        song
    end

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
    end
end

