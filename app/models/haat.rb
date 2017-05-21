# Determine roster readiness
class Haat
  TEAMS = {
    # p1: {
    #   tenacity_jedi: ['Aayla Secura', 'Jedi Knight Anakin',
    #                   'Ima-Gun Di', 'Qui-Gon Jinn', 'Ahsoka Tano'],
    #   counter_jedi: ['Ima-Gun Di', 'Aayla Secura', 'Jedi Knight Anakin',
    #                  'Ahsoka Tano', 'Grand Master Yoda'],
    #   zylo: ['Kylo Ren (z)'],
    #   nihilus: ['Darth Nihilus', 'Barris Offee', 'Darth Maul',
    #             'Savage Opress', 'Count Dooku']
    # },
    # p2: {
    #   droids: ['HK-47', 'IG-88', 'IG-86', 'Jawa Engineer', 'Chief Nebit'],
    #   standard_rebels: ['Wedge Antilles', 'Biggs Darklighter',
    #                     'Lando Calrissian', 'Admiral Ackbar', 'Princess Leia'],
    #   elder_zader: ['Darth Vader', 'Darth Sidious', 'Tusken Shaman',
    #                 'Ewok Elder', 'Captain Phasma'],
    #   viva_la_resistance: ['Finn', 'Rey', 'Poe Dameron', 'Resistance Pilot',
    #                        'Resistance Trooper'],
    #   the_fourth_order: [],
    #   scavenger_zody: []
    # },
    p3: {
      chirpatine: ['Chief Chirpa', 'Emperor Palpatine',
                   'Stormtrooper Han', 'Sun Fac', 'Royal Guard'],
      tiepatine: ['Emperor Palpatine', 'TIE Fighter Pilot',
                  'Stormtrooper Han', 'Sun Fac', 'Royal Guard'],
      rogue1: ['Jyn Erso (z)', 'Cassian Andor', 'Baze Malbus',
               'Chirrut Îmwe', 'Bistan'],
      darth_teebo: ['Teebo', 'Jyn Erso', 'Baze Malbus', 'Chirrut Îmwe',
                    'Darth Nihilus']
    }
  }.freeze

  def teams(toons)
    stuff = {}
    TEAMS.each do |phase|
      stuff[phase[0]] = {}
      phase[1].each do |team|
        stuff[phase[0]][team[0]] = team_check(team, toons)
      end
    end
    Rails.logger.debug(stuff)
    stuff
  end

  def team_check(team, toons)
    team[1].each.map do |t|
      toons.select { |toon| toon[0] == t.gsub(' (z)', '') }.flatten
    end
  end

  def toon_names(toons)
    toons.map { |toon| toon[0] }
  end
end
