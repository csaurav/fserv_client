require File.dirname(__FILE__) + '/spec_helper'

describe Fserv::Client do
  
  describe "with intitializer and live server" do
    before(:each) do
      Fserv.configure do |conf|
        conf.client_name = "spec"
      end
    end

    it "should have a client name of spec" do
      Fserv.config.client_name.should == "spec"
    end

    it "should succeed in uploading" do
      require 'tempfile'

      file = Tempfile.new(Time.now.to_i.to_s)
      file.write("Hello joe!")
      file.rewind

      res = Fserv::Client.upload(file)
      res.success?.should be_true
      res.attachment_token.should_not be_nil
    end

    it "should be capable of returning a attachment token for a uploaded file" do
      require 'tempfile'

      file = Tempfile.new(Time.now.to_i.to_s)
      file.write("Hello mark!")
      file.rewind

      res = Fserv::Client.upload(file)
      res.success?.should be_true
      res.attachment_token.should_not be_nil

      token_res = Fserv::Client.attachment_token(res.attachment_token)
      token_res.success?.should be_true
      token_res.attachment_url.should_not be_nil
    end

    it "should be capable of returning a download from a uploaded file" do
      require 'tempfile'

      contents = "Hello #{Time.now.to_i}"

      file = Tempfile.new(Time.now.to_i.to_s)
      file.write(contents)
      file.rewind

      res = Fserv::Client.upload(file)
      res.success?.should be_true
      res.attachment_token.should_not be_nil

      token_res = Fserv::Client.attachment_token(res.attachment_token)
      token_res.success?.should be_true
      token_res.attachment_url.should_not be_nil

      url = token_res.attachment_url
      data = RestClient.get url

      data.should == contents
    end
  end

end