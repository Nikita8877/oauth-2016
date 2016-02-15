module Guesser
  class Game
    attr_reader :output, :options
    attr_accessor :winner, :players

    def initialize(output, argv)
      @output, @players, @options = output, [], GameOptions.new(argv)
    end

    def start!
      welcome
      initialize_players
      play
      show_winner
    end

    private

    def play
      until winner do
        players.each do |player|
          sleep 1
          output.puts "\n=== It's now #{player.name}'s turn."
          player.generate_secret_number_for! output
          output.puts "Enter your guess:"
          if player.guessed?
            output.puts "You've guessed!"
            player.guessed!
          else
            output.puts "Wrong! Try again next end turn!"
          end

          if player.won?(self)
            output.puts 'winner'
            self.winner = player
            break
          end
        end
      end
    end



    def welcome
      output.puts '*' * 50
      output.puts 'Starting the Guesser game!'
      output.puts '*' * 50
    end

    def initialize_players
      output.puts "Starting the game with #{options.players} players(s)..."

      options.players.times do |i|
        output.puts "Enter a name for player #{i + 1}"
        players << Player.new($stdin.gets.strip)
      end
    end

    def show_winner
      output.puts "\n=== We have a winner! ==="
      output.puts "#{winner.name} won the match!"
      output.puts "Thanks for playing and see you again soon!"
    end
  end
end
