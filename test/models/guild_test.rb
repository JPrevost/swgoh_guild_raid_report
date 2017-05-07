require 'test_helper'

class GuildTest < ActiveSupport::TestCase
  def test_rosters
    VCR.use_cassette('guild_roster') do
      g = Guild.players('https://swgoh.gg/g/18353/ndtive-wdy-allidnce/')
      assert_equal(g.count, 35)
      assert(g.include?('jerrocks'))
    end
  end
end
