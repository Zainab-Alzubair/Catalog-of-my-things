require_relative 'classes/title'
require_relative 'classes/games/game_list'
require_relative 'classes/author/author_list'
require_relative 'classes/books/list_books'
require_relative 'classes/labels/list_label'
require_relative 'classes/MusicAlbum/genre_list'
require_relative 'classes/MusicAlbum/music_album'
require_relative 'classes/MusicAlbum/genre'
require_relative 'classes/MusicAlbum/music_list'

class App
  attr_accessor :books, :games, :labels, :authors, :genres, :musics, :genre

  include ListLabel
  include AuthorList
  include GnresList

  def initialize
    @games = GameList.new
    @musics = MusicList.new
    @books = ListBooks.new
  end
end
