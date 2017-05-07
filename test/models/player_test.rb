require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  def test_toons
    VCR.use_cassette('player_toons') do
      toons = Player.toons('jerrocks')
      assert_equal(toons.count, 95)
      assert_equal(toons.first, ['Emperor Palpatine', 'XI', '85', 7])
    end
  end
end
