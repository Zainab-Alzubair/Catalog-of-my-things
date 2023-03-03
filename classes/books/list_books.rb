require_relative '../input'
require_relative './book'
require_relative '../labels/list_label'
require_relative '../labels/label'
require_relative '../years'
require 'time'
require 'json'

class ListBooks
  include Years
  include ListLabel

  def initialize
    file_path = File.join('./classes/storage', 'books.json')
    File.write(file_path, '[]') unless File.exist?(file_path)
    file_content = File.read(file_path)
    @books = file_content.empty? ? [] : JSON.parse(file_content)
  rescue StandardError => e
    puts "Error: #{e.message} while loading books from file #{file_path}"
    @books = []
  end

  def add_book
    puts 'Please enter the publisher name?'
    publisher = gets.chomp

    puts 'Please enter the cover state of the book?'
    cover_state = gets.chomp

    puts 'Please enter the title of the book?'
    title = gets.chomp

    puts 'Please enter color for the book?'
    color = gets.chomp

    puts 'Please enter publish date?'
    publish_date = gets.chomp
    count = years_vs_today(publish_date)
    archived = count > 10

    @books << Book.new(publish_date, archived, publisher, cover_state).to_json
    label = Label.new(title, color)
    add_label(label)
    to_file
    puts 'Book created successfully'
  end

  def list_all_books
    if @books.empty?
      puts 'No books found. Please add some books to the list.'
    else
      @books.each_with_index do |book, index|
        print "#{index}) publish_date: #{book['publish_date']},"
        puts "archived: #{book['archived']}, publisher : #{book['publisher']}, cover_state: #{book['cover_state']}"
      end
    end
    nil
  end

  def to_file
    json_data = JSON.pretty_generate(@books)
    File.write(File.join('./classes/storage', 'books.json'), json_data)
  end
end
