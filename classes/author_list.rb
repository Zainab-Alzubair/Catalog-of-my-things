require 'json'

module AuthorList
  def add_author(author)
    File.new('./classes/storage/authors.json', 'w+') unless File.exist?('./classes/storage/authors.json')
    if File.empty?('./classes/storage/authors.json')
      authors = []
    else
      data = File.read('./classes/storage/authors.json').split
      authors = JSON.parse(data.join)
    end

    authors << ({ id: author.id, first_name: author.first_name, last_name: author.last_name })

    json_data = JSON.pretty_generate(authors)
    File.write(File.join('classes/storage', 'authors.json'), json_data)
  end

  def list_authors
    File.new('./classes/storage/authors.json', 'w+') unless File.exist?('./classes/storage/authors.json')

    if File.empty?('./classes/storage/authors.json')
      puts "\n"
      puts 'The authors list is empty, please add some items with authors...'
    else
      data = File.read('./classes/storage/authors.json').split
      authors = JSON.parse(data.join)
      puts "👤 Author's list:\n\n"
      authors.each_with_index do |author, index|
        print "#{index}) First name: #{author['first_name']}, Last name: #{author['last_name']} \n\n"
      end
    end
  end
end
