require_relative '../title'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, archived, publisher, cover_state, id = Time.now.to_f.to_s)
    super(publish_date, archived, id)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    return true if super == true || @cover_state == 'bad'

    false
  end

  def to_json(*_args)
    {
      'cover_state' => @cover_state,
      'publisher' => @publisher,
      'publish_date' => @publish_date,
      'archived' => @archived
    }
  end
end
