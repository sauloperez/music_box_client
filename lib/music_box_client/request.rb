module MusicBox
  module Request
    class Base
      PORT = 4481

      attr_reader :host, :payload

      def initialize(host, payload)
        @connection = TCPSocket.new(host, PORT)
        @payload = payload
        build_content_length
      end

      def send
        @connection.write(@content_length)
        @connection.write(@payload)
      end

      protected

      def build_content_length
        @content_length = [payload.size].pack('i')
      end
    end
  end
end
