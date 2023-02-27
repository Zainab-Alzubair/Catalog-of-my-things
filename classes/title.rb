require 'date'

class Item
  attr_accessor :archive, :publish_date
  attr_reader :label, :author, :genre, :source

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archive = false
  end

  def can_be_archived?
    (DateTime.now.year - DateTime.parse(@publish_date).year).to_f > 10
  end
end
