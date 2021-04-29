require 'pry'

class Song
    attr_accessor :name
    attr_reader :artist 

    @@all = []

    def initialize(name)
        @name = name
        @@all << self 
    end

    def artist=(artist)
        @artist = artist 
    end

    def self.all
        @@all
    end

    def artist_name=(new_artist)
        if !Artist.all.find {|artist| artist.name == new_artist}
            self.artist = Artist.new(new_artist)
            #binding.pry
        else
            self.artist = Artist.all.find{|artist| artist.name == new_artist}
        end 
        #binding.pry
    end



    def self.new_by_filename(file_name)
        new_song = self.new(file_name.split(" - ")[1])
        new_song.artist = Artist.new((file_name.split(" - ")[0]))
        new_song         
    end

end

