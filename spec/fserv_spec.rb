require File.dirname(__FILE__) + '/spec_helper'

describe Fserv do
  
  describe "as standard" do
    before(:each) do
      Fserv.config = Fserv::Config.new
    end

    it "should not have a default client name" do
      Fserv.config.client_name.should be_nil
    end

    it "should fallback to host and port if no public host/port are defined" do
      Fserv.config.server_address.should == Fserv.config.public_address
    end

    it "should not allow client requests without a client_name" do
      lambda{ Fserv::Client.attachment_token("spec")}.should raise_error(Fserv::Exceptions::ClientNameRequired, /Client name not specified/)
    end

    it "should accept a standard config" do
      Fserv.configure do |conf|
        conf.host = "apple.com"
        conf.port = 1337

        conf.client_name = "mark"

        conf.public_host = "public.apple.com"
        conf.public_port = 1234
      end

      Fserv.config.server_address.should == "http://apple.com:1337"
      Fserv.config.public_address.should == "http://public.apple.com:1234"

      Fserv.config.client_name.should == "mark"
    end

    it "should fall back to server address if no public host is specified" do
      Fserv.configure do |conf|
        conf.host = "apple.com"
        conf.port = 1337

        conf.client_name = "mark"
      end

      Fserv.config.server_address.should == "http://apple.com:1337"
      Fserv.config.public_address.should == "http://apple.com:1337"
    end

    it "should omit a public port if no public port is specified" do
      Fserv.configure do |conf|
        conf.host = "apple.com"
        conf.port = 1337

        conf.public_host = "public.apple.com"

        conf.client_name = "mark"
      end

      Fserv.config.server_address.should == "http://apple.com:1337"
      Fserv.config.public_address.should == "http://public.apple.com"
    end

    it "should support SSL address in public" do
      Fserv.configure do |conf|
        conf.host = "apple.com"
        conf.port = 1337

        conf.public_host = "public.apple.com"
        conf.public_ssl = true

        conf.client_name = "mark"
      end

      Fserv.config.server_address.should == "http://apple.com:1337"
      Fserv.config.public_address.should == "https://public.apple.com"
    end
  end

end