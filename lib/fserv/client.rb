module Fserv
  module Client
    TIMEOUT = 900000

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

    def self.remove_file(token, additional_options = {})
      client = additional_options[:client_name] || Fserv.config.client_name

      raise Fserv::Exceptions::ClientNameRequired.new("Client not specified") if (client.nil? || client.empty?)

      delete("remove_file/#{client}/#{token}")
      
    end
    
    def self.post(method, args = {}, headers = {})
      RestClient::Request.execute(method: :post, url: Fserv.config.build_address(method), payload: args, headers: headers, timeout: TIMEOUT, open_timeout: TIMEOUT)
    end

    def self.get(method, args = {}, headers = {})
      RestClient::Request.execute(method: :get, url: Fserv.config.build_address(method), payload: args, headers: headers, timeout: TIMEOUT, open_timeout: TIMEOUT)
    end
    
    def self.delete(method, args = {}, headers = {})
      RestClient::Request.execute(method: :delete, url: Fserv.config.build_address(method), payload: args, headers: headers, timeout: TIMEOUT, open_timeout: TIMEOUT)
    end
  end
end