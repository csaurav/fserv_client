module Fserv
  module Response
    class UploadResponse < BaseResponse

      def attachment_token
        body["attachment_token"]
      end

      def success?
        body["status"].eql?(true)
      end
    end
  end
end