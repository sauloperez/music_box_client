require 'byebug'
require 'socket'
require 'music_box_client/request'
require 'music_box_client/play'
require 'music_box_client/stop'
require 'music_box_client/with_files'

module MusicBox
  class Client
    include WithFiles

    def initialize(host)
      @host = host
    end

    def play(filename)
      puts "Playing #{filename}..."

      request = Request::Play.new(@host, read(filename))
      request.send
    end

    def stop(filename)
      puts "Stoping #{filename}..."

      request = Request::Stop.new(@host, read(filename))
      request.send
    end
  end
end
