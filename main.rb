require_relative './app'

def run
  puts "\n"
  print "⭐️ Welcome to the Catalog of my Things! ⭐️ \n\n"
  loop do
    puts "\n"
    puts "🔸Please choose an option by entering a number: \n
    1 - List all books
    2 - List all music albums
    3 - List of games
    4 - List all genres (e.g 'Comedy', 'Thriller')
    5 - List all labels (e.g. 'Gift', 'New')
    6 - List all authors (e.g. 'Stephen King')
    7 - Add a book
    8 - Add a music album
    9 - Add a game
   10 - Exit"
    option = gets.chomp.to_i
    break if option == 10

    options(option)
  end
end

def options(option)
  system('clear')

  case option
  when 1..6
    list_all_items(option)
  when 7..9
    add_items(option)
  else
    invalid_option
  end
end

def invalid_option()
  puts 'Invalid option. Please press any key to continue...'
end

def list_all_items(option)
  app = App.new

  case option
  when 1
    app.books.list_all_books
  when 2
    app.musics.list_all_music_albums
  when 3
    app.games.list_all_games
  when 4
    app.musics.list_all_genres
  when 5
    app.list_labels
  when 6
    app.list_authors
  end
  print "\nPress Any Key to Continue..."
end

def add_items(option)
  app = App.new

  case option
  when 7
    app.books.add_book
  when 8
    app.musics.add_music_album
  when 9
    app.games.add_game
  end
end

run
