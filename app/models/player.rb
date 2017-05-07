require 'open-uri'
# Extracts player info from swgoh.gg
class Player
  # array of character_name, gear level, level, stars for all active characters
  def self.toons(player)
    collection(player).css(
      '.collection-char:not(.collection-char-missing)'
    ).map do |character|
      character_info(character)
    end
  end

  # https://swgoh.gg/u/jerrocks/collection/
  def self.collection(player)
    url = "https://swgoh.gg/u/#{player}/collection/"
    Nokogiri::HTML(open(url))
  end

  # array of character_name, gear level, level, stars for a single character
  def self.character_info(character)
    [character.css('img @alt').to_s,
     character.css('.char-portrait-full-gear-level').children.to_s,
     character.css('.char-portrait-full-level').children.to_s,
     character.css('.star:not(.star-inactive)').count]
  end
end
