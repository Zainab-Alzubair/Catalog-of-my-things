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
end

    