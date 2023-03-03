require_relative './music_album'
require_relative './genre'
require_relative './genre_list'
require 'json'
require_relative './color'

class MusicList
  include GnresList
  include Years
  include ColorTerminal
  def initialize
    file_path = File.join('./classes/storage', 'musics.json')
    File.write(file_path, '[]') unless File.exist?(file_path)
    file_content = File.read(file_path)
    @musics = file_content.empty? ? [] : JSON.parse(file_content)
  rescue StandardError => e
    puts red "Error: #{e.message} while loading Music Albums from file #{file_path}"
    @musics = []
  end

  def get_user_string(msg)
    print(msg)
    gets.chomp
  end

  def add_music_album
    puts red 'Please Enter music album genre Name?'
    genre_name = gets.chomp

    puts red 'Enter published date(yyyy-mm-dd):'
    publish_date = gets.chomp

    on_spotify = get_user_string(red('Is music album avaliable on spotify (yes/no): '))
    on_spotify = on_spotify.downcase
    archived = true
    case on_spotify
    when 'yes'
      @album = MusicAlbum.new(on_spotify, publish_date, archived)
    when 'no'
      @album = MusicAlbum.new(on_spotify, publish_date, archived = false)
    end
    genre = Genre.new(genre_name)
    music_album = MusicAlbum.new(on_spotify, publish_date, archived)
    music_album.genre = genre_name
    @musics << music_album.to_json
    add_genre(genre)
    to_file
    puts ''
    puts green 'Music Album created successfully 🎼'
    puts ''
  end

  def list_all_music_albums
    if @musics.empty?
      puts yellow 'No musics found. Please add some music to the list.'
    else
      @musics.each_with_index do |music, index|
        puts "#{yellow index}) 📀 id : #{blue music['id']}, publish_date: #{blue music['publish_date']}, On Spotify: #{blue music['on_spotify']}, Archived: #{blue music['archived']}, Genre_name: #{blue music['genre_name']}"
      end
    end
    nil
  end

  def to_file
    json_data = JSON.pretty_generate(@musics)
    File.write(File.join('./classes/storage', 'musics.json'), json_data)
  end
end
