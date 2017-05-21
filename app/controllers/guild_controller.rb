class GuildController < ApplicationController
  def index
    guild = Guild.players('https://swgoh.gg/g/18353/ndtive-wdy-allidnce/')
    @haat = haat_roster_check(guild)
  end

  def haat_roster_check(guild)
    roster_check = []
    guild.each do |player|
      toons = Player.toons(player)
      roster_check << [player, Haat.new.teams(toons)]
    end
    roster_check
  end

  def show
    @player = Player.toons(params[:player])
    @haat = Haat.new.teams(@player)
  end
end
