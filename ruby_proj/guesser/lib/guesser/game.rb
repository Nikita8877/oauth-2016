module Guesser
  class Game
    attr_reader :output
    attr_accessor :winner, :players

    def initialize(output)
      @output, @players = output, []
    end

    def start!
      welcome
      initialize_players
      play
    end

    private

    def play
      players.each do |player|
        sleep 1
        output.puts "\n=== It's now #{player.name}'s turn."
        player.generate_secret_number_for player
        output.puts "Enter your guess:"
        if player.guessed?
          puts "right"
        end
      end
    end



    def welcome
      output.puts '*' * 50
      output.puts 'Starting the Guesser game!'
      output.puts '*' * 50
    end

    def initialize_players
      output.puts "Starting the game with #{2} players(s)..."

      2.times do |i|
        output.puts "Enter a name for player #{i + 1}"
        players << Player.new($stdin.gets.strip)
      end
    end
  end
end
