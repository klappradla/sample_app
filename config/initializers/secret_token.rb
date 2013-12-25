# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
SampleApp::Application.config.secret_key_base = '2d2213e8d5536af3a2d336551f2493e201661a709590d4486b5723e65f31037e6671eeedac102794e6ab1b75ac54dcf32a5bc853e65a0bf08a481d31c3dc447a'

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret');
  if File.exist?(token_file)
    
    #Use existing token
    File.read(token_file).chomp
  else
    #Generate new token and store it in token_file
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

SampleApp::Application.config.secret_key_base = secure_token