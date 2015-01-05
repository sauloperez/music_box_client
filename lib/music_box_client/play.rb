module MusicBox
  module Request

    class Play < Base
      def initialize(host, payload)
        payload = "PLAY #{payload}"
        super(host, payload)
      end
    end
  end
end
