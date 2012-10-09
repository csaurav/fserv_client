module Fserv
  module Response
    class BaseResponse

      attr_accessor :body

      def initialize(contents)
        self.body = JSON.parse(contents)
      end
    end
  end
end