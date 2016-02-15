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

    def guess
      $stdin.gets.to_i
    end

    def guessed?
      guess == number_to_guess
    end

    def generate_secret_number_for(player)
      puts "Preparing a number to guess..."
      generate_number_to_guess!(5)
    end
  end
end
