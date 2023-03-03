require_relative 'classes/title'
require_relative 'classes/game_list'
require_relative 'classes/author_list'
require_relative 'classes/MusicAlbum/genre_list'
require_relative 'classes/MusicAlbum/music_album'
require_relative 'classes/MusicAlbum/genre'
require_relative 'classes/MusicAlbum/music_list'

class App
  attr_accessor :books, :games, :labels, :authors, :genres, :musics, :genre

  include AuthorList
  include GnresList

  def initialize
    @games = GameList.new
    @musics = MusicList.new
  end
end
