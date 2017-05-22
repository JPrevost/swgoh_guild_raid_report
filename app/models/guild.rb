require 'open-uri'
# Extracts guild information from swgoh.gg
class Guild
  # return list of player names
  # parse html from roster(guild_url)
  def self.players(guild_url)
    Rails.cache.fetch(guild_url) do
      roster(guild_url).css('table td:first').map do |player|
        [player.css('a').text,
         player.css('a @href').to_s.split('/').last]
      end
    end
  end

  # guild page from swgoh.gg
  # ex: https://swgoh.gg/g/18353/ndtive-wdy-allidnce/
  def self.roster(guild_url)
    return unless guild_url.include?('https://swgoh.gg/g')
    Nokogiri::HTML(open(guild_url))
  end
end
