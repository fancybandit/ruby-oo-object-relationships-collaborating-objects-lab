
class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        self.name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(artist_name)
        match = self.all.detect {|artist| artist.name == artist_name}
        !match ? Artist.new(artist_name) : match
    end

    def print_songs
        songs = Song.all.select do |song|
            song.artist == self
        end
        songs.each do |song|
            puts song.name
        end
    end
end

