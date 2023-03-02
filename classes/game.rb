require_relative './title'
require_relative './years'

class Game < Item
  include Years

  attr_reader :last_played_at, :multiplayer, :id

  def initialize(multiplayer, last_played_at, publish_date, archived, id = Time.now.to_f.to_s)
    super(publish_date, archived, id)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  def can_be_archived?
    return true if super == true && years_vs_today(last_played_at) > 2
  end

  def to_json(*_args)
    {
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at,
      'publish_date' => @publish_date,
      'archived' => @archived
    }
  end
end
