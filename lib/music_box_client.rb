require 'socket'

module MusicBox
  class Client
    PORT = 4481
    HOST = '127.0.0.1'

    def initialize
      @socket = Socket.new(:INET, :STREAM)
      @remote_addr = Socket.pack_sockaddr_in(PORT, HOST)
    end

    def play(filename)
      @socket.connect(@remote_addr)
      file = File.open(filename)
      puts 'Sending data...'
      @socket.puts file.read
    end
  end
end
