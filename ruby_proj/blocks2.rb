module Connecter
  def self.connect(host)
    puts 'connecting'
    # connect

    begin
      yield if block_given?
    rescue
      warn 'something has happened...'
    else
      puts 'everything is okay!'
    ensure
      puts 'other operation'
      puts 'disconnect'
    end
    # disc
  end
end

Connecter.connect('localhost') do
  puts 'write'
  puts 'close file'
  #sdfsdfsfsd
  #...
end