module Guesser
  class Player
    attr_reader :name
    attr_accessor :number_to_guess, :points

    def initialize(name)
      @points = 0
      @name = name
    end

    def guess
      $stdin.gets.to_i
    end

    def guessed?
      guess == number_to_guess
    end

    def guessed!
      self.number_to_guess = nil # Player guessed this number, a new one would be needed
      self.points += 1
    end

    def generate_secret_number_for!(output)
      output.puts "Preparing a number to guess..."
      self.number_to_guess = rand(1)
    end

    def won?(game)
      points >= 1
    end
  end
end
