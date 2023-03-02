require 'json'

module GnresList
  def add_genre(genre)
    File.new('./classes/storage/genres.json', 'w+') unless File.exist?('./classes/storage/genres.json')
    if File.empty?('./classes/storage/genres.json')
      genres = []
    else
      data = File.read('./classes/storage/genres.json').split
      genres = JSON.parse(data.join)
    end

    genres << ({ id: genre.id, name: genre.name })

    json_data = JSON.pretty_generate(genres)
    File.write(File.join('classes/storage', 'genres.json'), json_data)
  end

  def list_all_genres
    File.new('./classes/storage/genres.json', 'w+') unless File.exist?('./classes/storage/genres.json')

    if File.empty?('./classes/storage/genres.json')
      puts "\n"
      puts 'The genres list is empty, please add some items with genres...'
    else
      data = File.read('./classes/storage/genres.json').split
      genres = JSON.parse(data.join)
      puts "genre's list:\n\n"
      genres.each_with_index do |genre, index|
        print "#{index}) id: #{genre['id']}, name: #{genre['name']} \n\n"
      end
    end
  end
end
