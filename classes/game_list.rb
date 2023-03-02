require_relative './game'
require_relative './author'
require_relative './author_list'
require_relative './years'
require 'json'
require_relative './input'

class GameList
  include Input
  include AuthorList
  include Years

  def initialize
    file_path = File.join('./classes/storage', 'games.json')
    File.write(file_path, '[]') unless File.exist?(file_path)
    file_content = File.read(file_path)
    @games = file_content.empty? ? [] : JSON.parse(file_content)
  rescue StandardError => e
    puts "Error: #{e.message} while loading games from file #{file_path}"
    @games = []
  end

  def add_game
    puts 'Please enter Author First Name?'
    author_first_name = gets.chomp

    puts 'Please enter Author Last Name?'
    author_last_name = gets.chomp

    puts 'Please enter publish date?'
    publish_date = gets.chomp

    multiplayer = y_n { 'Is multiplayer? [Y/N]' }

    puts 'When was last played?'
    last_played_at = gets.chomp

    count = years_vs_today(last_played_at)
    archived = count > 2

    @games << Game.new(multiplayer, last_played_at, publish_date, archived).to_json
    author = Author.new(author_first_name, author_last_name)
    add_author(author)
    to_file
    puts 'Game created successfully'
  end

  def list_all_games
    if @games.empty?
      puts 'No games found. Please add some games to the list.'
    else
      @games.each_with_index do |game, index|
        print "#{index}) publish_date: #{game['publish_date']}, archived: #{game['archived']},"
        puts "last_played_at : #{game['last_played_at']}, multiplayer: #{game['multiplayer']}"
      end
    end
    nil
  end

  def to_file
    json_data = JSON.pretty_generate(@games)
    File.write(File.join('./classes/storage', 'games.json'), json_data)
  end
end
