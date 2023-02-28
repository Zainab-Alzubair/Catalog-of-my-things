require_relative 'classes/title'

class App
  def initialize
    @items = []
  end

  def run
    loop do
      show_menu
      choice = gets.chomp.to_i
      case choice
      when 1
        create_item
      when 2
        archive_item
      when 3
        list_items
      when 4
        exit
      else
        puts 'Invalid choice, please try again'
      end
    end
  end

  private

  def show_menu
    puts 'What would you like to do?'
    puts '1.  Create a new item'
    puts '2.  Archive an item'
    puts '3.  List all items'
    puts '4.  List all books'
    puts '5.  List all music albums'
    puts '6.  List all movies'
    puts '7.  List of games'
    puts '8.  List all genres'
    puts '9.  List all labels'
    puts '10. List all authors'
    puts '11. List all sources'
    puts '12. Add a book'
    puts '13. Add a music album'
    puts '14. Add a movie'
    puts '14. Add a game'
    puts '4.  Exit'
  end

  def create_item
    puts 'Enter the item title:'
    title = gets.chomp
    puts 'Enter the item description:'
    description = gets.chomp
    puts 'Enter the item published year (YYYY):'
    published_year = gets.chomp.to_i
    puts 'Enter the item category:'
    category = gets.chomp
    item = Item.new(title, description, Time.new(published_year), category)
    @items << item
    puts 'Item created successfully!'
  end

  def archive_item
    puts 'Enter the index of the item you want to archive:'
    index = gets.chomp.to_i - 1
    item = @items[index]
    if item.nil?
      puts 'Item not found'
      return
    end
    if item.can_be_archived?
      item.move_to_archive
      puts 'Item archived successfully!'
    else
      puts 'Item cannot be archived'
    end
  end

  def list_items
    @items.each_with_index do |item, index|
      puts "##{index + 1} #{item.title} (#{item.archived ? 'Archived' : 'Active'})"
    end
  end
end

app = App.new
app.run
