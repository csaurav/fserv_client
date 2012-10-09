# fserv_client

A client to the Fserv attachment server

## Configuration

By default fserv_client will connect to a server on localhost:4000, with the public address being the same.
No client name is specified by default, and if not specified in the configuration block it must be specified in server requests

```ruby
Fserv.configure do |conf|
  conf.host = "some_host_name"
  conf.port = 4000

  conf.client_name = "red_rooster"

  conf.public_host = "attachments.corpgovrisk.net"
  conf.public_post = 80
end
```

## Requests

Requests can be called on Fserv::Client.**request_name**

If no client_name is provide either in the configuration block or via additional_options, then a Fserv::Exceptions::ClientNameRequired exception will be thrown

### additional_options

To override the client name, pass the following in as a additional_options argument

```ruby
{:client_name => "chicken_treat"}
```

### upload(opened_file, additional_options = {})

Returns a Fserv::Response::UploadResponse

```ruby
response = Fserv::Client.upload(File.open("/Users/callumj/Temp/AXwGVXD7qEQ.mp4"), :client_name => "chicken_treat")

response.success?
response.attachment_token
```

### attachment_token(token, additional_options = {})

Returns a Fserv::Response::AttachmentTokenResponse

```ruby
response = Fserv::Client.attachment_token("sdhaidh33423//weq23yewad", :client_name => "chicken_treat")

response.success?
response.attachment_url
```