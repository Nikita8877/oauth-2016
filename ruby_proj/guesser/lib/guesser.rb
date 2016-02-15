require 'slop'

require 'guesser/game_options'
require 'guesser/game'
require 'guesser/player'

module Guesser
  class << self
    def load_defaults!
      const_set(:CONFIG, {limit: 3, points: 3, players: 2})
    end
  end

  load_defaults!
end
