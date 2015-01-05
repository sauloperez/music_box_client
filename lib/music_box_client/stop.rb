module MusicBox
  module Request

    class Stop < Base
      def initialize(host, payload)
        payload = "STOP #{payload}"
        super(host, payload)
      end
    end
  end
end
