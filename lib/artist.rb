require 'pry'


class Artist
    attr_accessor :name

    @@all 

    def initialize(name)
        @name = name
        @@all << self
    end
    
    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        if self.all.find {|artist| artist.name == name}
            self.all.find {|artist| artist.name == name}
        else
            Artist.new(name)
        end
    end

    def print_songs
        Song.all.select {|song| song.artist == self}.each{|song| puts song.name}
    end
end

