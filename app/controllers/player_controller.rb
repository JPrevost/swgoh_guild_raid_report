class PlayerController < ApplicationController
  def index
    @players = Guild.players('https://swgoh.gg/g/18353/ndtive-wdy-allidnce/')
  end

  def show
    @player = Player.toons(params[:player])
    @haat = Haat.new.teams(@player)
  end
end
