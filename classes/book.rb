require_relative 'title'

class Book < Item
  attr_accessor :title, :author, :publish_date, :cover_state

  def initialize(title, author, publish_date, cover_state)
    super(publish_date, false, nil)
    @title = title
    @author = author
    @cover_state = cover_state
  end

  def can_be_archived?
    return true if @cover_state == 'bad'

    super
  end

  def save
    File.open('books.json', 'a') do |file|
      file.puts JSON.generate(to_h)
    end
  end

  def to_h
    {
      title: @title,
      author: @author,
      publish_date: @publish_date,
      cover_state: @cover_state
    }
  end

  def self.all
    books = []
    File.open('books.json', 'r') do |file|
      file.each_line do |line|
        book_data = JSON.parse(line, symbolize_names: true)
        books << new(book_data[:title], book_data[:author], book_data[:publish_date], book_data[:cover_state])
      end
    end
    books
  end
end
