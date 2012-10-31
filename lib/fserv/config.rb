module Fserv
  class Config

    attr_accessor :host
    attr_accessor :port

    attr_accessor :client_name
    attr_accessor :client_token

    attr_accessor :public_host
    attr_accessor :public_port

    attr_accessor :public_ssl

    def initialize
      self.host = "localhost"
      self.port = 4000
    end

    def server_address
      "http://#{self.host}#{self.port.nil? ? "" : ":#{self.port}"}"
    end

    def build_address(method)
      "#{server_address}/#{method}/"
    end

    def http_form
      self.public_ssl.eql?(true) ? "https" : "http"
    end

    def public_address
      "#{self.http_form}://#{self.public_host || self.host}#{(self.public_port || self.port).nil? ? "" : ":#{(self.public_port || self.port)}"}"
    end

    def build_public_address(method)
      "#{public_address}/#{method}/"
    end
  end
end