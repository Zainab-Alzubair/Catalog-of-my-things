require_relative 'classes/title'

class book < Item
  attr_accessor :title, :author, :pages, :cover_state

  def initialize(title, author, pages, cover_state)
    @title = title
    @author = author
    @pages = pages
    @cover_state = cover_state
  end 

  def can_be_archived?
    if @cover_state == "bad"
      return true
    else
      return super
    end
  end

  def save
    File.open('books.json', 'a') do |file|
        file.puts JSON.generate(self.to_h)
    end
  end

  def to_h
    {
        title: @title,
        author: @author,
        pages: @pages,
        cover_state: @cover_state
    }
  end

  def self.all
    books = []
    File.open('books.json', 'r') do |file|
        file.each_line do |line|
            book_data = JSON.parse(line, symbolize_names: true)
            books << self.new(book_data[:title], book_data[:author], book_data[:pages], book_data[:cover_state])
        end
    end
    books
  end
end

    