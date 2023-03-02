require_relative 'title'

class Book < Item
  attr_accessor :title, :author, :publish_date, :cover_state

  def initialize(title, author, publish_date, cover_state)
    super(publish_date)
    @title = title
    @author = author
    @publish_date = publish_date
    @cover_state = cover_state
  end

  def can_be_archived?
    return true if @cover_state == 'bad'

    super
  end
end
