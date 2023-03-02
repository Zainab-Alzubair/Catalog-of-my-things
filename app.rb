require_relative 'classes/title'
require_relative 'classes/game_list'
require_relative 'classes/author_list'

class App
  attr_accessor :books, :games, :labels, :authors, :genres, :musics

  include AuthorList

  def initialize
    @games = GameList.new
  end
end
