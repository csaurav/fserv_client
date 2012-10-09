module Fserv
  module Response
    class AttachmentTokenResponse < BaseResponse

      def attachment_url
        Fserv.config.build_public_address "download/#{body["client_name"]}/#{body["attachment_token"]}"
      end

      def success?
        body["status"].eql?(true)
      end
    end
  end
end