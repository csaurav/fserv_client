module Fserv
  module Client

    def self.upload(file, additional_options = {})
      client = additional_options[:client_name] || Fserv.config.client_name

      raise Fserv::Exceptions::ClientNameRequired.new("Client not specified") if (client.nil? || client.empty?)

      res = post("upload/#{client}", {:attachment => file})
      Fserv::Response::UploadResponse.new(res)
    end

    def self.attachment_token(token, additional_options = {})
      client = additional_options[:client_name] || Fserv.config.client_name

      raise Fserv::Exceptions::ClientNameRequired.new("Client name not specified") if (client.nil? || client.empty?)

      res = get("attachment_token/#{client}/#{token}")
      base = Fserv::Response::AttachmentTokenResponse.new(res)
      base.body["client_name"] = client
      base
    end

    def self.post(method, args = {})
      RestClient.post(Fserv.config.build_address(method), args)
    end

    def self.get(method, args = {})
      RestClient.get(Fserv.config.build_address(method), args)
    end
  end
end