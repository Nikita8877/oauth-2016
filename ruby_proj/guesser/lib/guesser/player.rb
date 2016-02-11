module Guesser
  class Player
    attr_reader :name
    attr_accessor :number_to_guess, :points

    def initialize(name)
      @points = 0
      @name = name
    end

    def generate_number_to_guess!(limit)
      self.number_to_guess = rand(limit)
    end
  end
end