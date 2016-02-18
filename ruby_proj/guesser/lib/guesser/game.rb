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
      print_winner_to_file
    end

    private

    def play
      until winner do
        players.each do |player|
          sleep 1
          output.puts "\n=== It's now #{player.name}'s turn."
          player.generate_secret_number_for! output
          player.waiting_times << measure_time do
            output.puts "Enter your guess:"
            if player.guessed?
              output.puts "You've guessed!"
              player.guessed!
            else
              output.puts "Wrong! Try again next end turn!"
            end
          end

          if player.won?(self)
            output.puts 'winner'
            self.winner = player
            break
          end
        end

        show_players_statistics
      end
    end

    def show_players_statistics
      players.each { |player| output.puts player.show_player_statistics }
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

    def measure_time
      if block_given?
        time_before = Time.now
        yield
        waited_for = Time.now - time_before
        output.puts "You were thinking for #{waited_for}s"
        waited_for
      end
    end

    def print_winner_to_file
      writer = FileManager::Writer.new('game-')
      writer << ["Player #{winner.name} won at #{Time.now}\n", winner.show_player_statistics]
    end
  end
end
