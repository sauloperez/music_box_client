require 'socket'

module MusicBox
  class Client
    PORT = 4481
    HOST = '127.0.0.1'

    def play(filename)
      file = File.open(filename)
      puts 'Sending data...'
      request "PLAY #{file.read}"
    end

    def stop(filename)
      request 'STOP'
    end

    private

    def request(data)
      client = TCPSocket.new(HOST, PORT)
      client.write(data)
      client.close_write
      client.read
    end
  end
end
