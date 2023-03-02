require 'time'

module Years
  def years_vs_today(last_played_at)
    now = Time.now
    played = Date.strptime(last_played_at, '%Y-%m-%d').to_s
    date = Time.parse(played)
    (now - date) / 60 / 60 / 24 / 365
  end
end
